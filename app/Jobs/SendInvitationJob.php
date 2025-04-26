<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Models\InvitedUsers;
use Illuminate\Support\Facades\Log;
use App\Services\ImageTemplate;

class SendInvitationJob implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    protected $inviteesData;
    protected $userInvitation;

    public function __construct(array $inviteesData, $userInvitation)
    {
        $this->inviteesData = $inviteesData;
        $this->userInvitation = $userInvitation;
    }

    public function handle()
    {
        foreach ($this->inviteesData as $invitee) {
            try {
                $imageName = ImageTemplate::process($invitee['qr'], $invitee['name'], $this->userInvitation);

                $invitedUser = InvitedUsers::create([
                    'name' => $invitee['name'],
                    'phone' => $invitee['phone'],
                    'code' => $invitee['code'],
                    'qr' => $imageName,
                    'user_invitations_id' => $this->userInvitation->id,
                    'send_status' => 'pending'
                ]);

                $sent = sendWhatsappImage(
                    $invitedUser->phone,
                    $this->userInvitation->getFirstMediaUrl('userInvitation'),
                    $this->userInvitation->user->phone ?? 'غير متوفر',
                    $this->userInvitation->name ?? 'غير متوفر',
                    $this->userInvitation->user->name ?? 'غير متوفر',
                    $this->userInvitation->invitation_date ?? 'غير متوفر',
                    $this->userInvitation->invitation_time ?? 'غير متوفر',
                    $this->userInvitation->getFirstMediaUrl('qr')
                );

                if ($sent) {
                    $invitedUser->update(['send_status' => 'sent']);
                    $this->userInvitation->increment('number_invitees');
                } else {
                    $invitedUser->update([
                        'send_status' => 'failed',
                        'error_message' => 'فشل الإرسال بعد ' . $this->attempts() . ' محاولات'
                    ]);
                }
            } catch (\Exception $e) {
                Log::error('Error in SendInvitationJob:', ['error' => $e->getMessage()]);
            }
        }
    }
}
