<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Models\InvitedUsers;
use App\Models\UserInvitation;
use Illuminate\Support\Facades\Log;

class SendInvitationJob implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    protected $invitedUserId;
    protected $userInvitationId;

    public function __construct($invitedUserId, $userInvitationId)
    {
        $this->invitedUserId = $invitedUserId;
        $this->userInvitationId = $userInvitationId;
    }

    public function handle()
    {
        $invitedUser = InvitedUsers::find($this->invitedUserId);
        $userInvitation = UserInvitation::find($this->userInvitationId);

        if (!$invitedUser || !$userInvitation) {
            Log::error('InvitedUser or UserInvitation not found.');
            return;
        }

        try {
            $sent = sendWhatsappImage(
                $invitedUser->phone,
                $userInvitation->getFirstMediaUrl('userInvitation'),
                $userInvitation->user->phone ?? 'غير متوفر',
                $userInvitation->name ?? 'غير متوفر',
                $userInvitation->user->name ?? 'غير متوفر',
                $userInvitation->invitation_date ?? 'غير متوفر',
                $userInvitation->invitation_time ?? 'غير متوفر',
                $userInvitation->getFirstMediaUrl('qr')
            );

            if ($sent) {
                $invitedUser->update(['send_status' => 'sent']);
                $userInvitation->increment('number_invitees');
            } else {
                $invitedUser->update([
                    'send_status' => 'failed',
                    'error_message' => 'فشل الإرسال بعد ' . $this->attempts() . ' محاولات'
                ]);
            }
        } catch (\Exception $e) {
            $invitedUser->update([
                'send_status' => 'failed',
                'error_message' => $e->getMessage()
            ]);
            Log::error('Error in SendInvitationJob:', ['error' => $e->getMessage()]);
        }
    }
}
