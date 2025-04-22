<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Models\InvitedUsers;
use Illuminate\Support\Facades\Log;

class SendInvitationJob implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    protected $invitedUser;
    protected $mediaUrl;
    protected $userInvitation;

    public function __construct(InvitedUsers $invitedUser, $mediaUrl, $userInvitation)
    {
        $this->invitedUser = $invitedUser;
        $this->mediaUrl = $mediaUrl;
        $this->userInvitation = $userInvitation;
    }

    public function handle()
    {
        try {
            $sent = sendWhatsappImage(
                $this->invitedUser->phone,
                $this->mediaUrl,
                $this->userInvitation->user->phone ?? 'غير متوفر',
                $this->userInvitation->name ?? 'غير متوفر',
                $this->userInvitation->user->name ?? 'غير متوفر',
                $this->userInvitation->invitation_date ?? 'غير متوفر',
                $this->userInvitation->invitation_time ?? 'غير متوفر',
                $this->userInvitation->getFirstMediaUrl('qr')
            );

            if ($sent) {
                $this->invitedUser->update(['send_status' => 'sent']);
                $this->userInvitation->decrement('number_invitees'); 
            } else {
                $this->invitedUser->update([
                    'send_status' => 'failed',
                    'error_message' => 'فشل الإرسال بعد ' . $this->attempts() . ' محاولات'
                ]);
            }
        } catch (\Exception $e) {
            $this->invitedUser->update([
                'send_status' => 'failed',
                'error_message' => $e->getMessage()
            ]);
            Log::error('Error in SendInvitationJob:', ['error' => $e->getMessage()]);
        }
    }
}
