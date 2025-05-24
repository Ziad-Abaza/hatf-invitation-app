<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Models\InvitedUsers;
use Illuminate\Foundation\Bus\Dispatchable;

class SendOpeningInvitationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public function __construct(
        protected InvitedUsers $invitedUser,
        protected string $imageUrl,
        protected string $qr,
    ) {}

    public function handle(): void
    {
        $maxRetries = 3;
        $retryCount = 0;
        $sent = false;

        while ($retryCount < $maxRetries && !$sent) {
            $sent = sendWhatsappImage(
                $this->invitedUser->phone,
                $this->imageUrl,
                $this->invitedUser->userInvitation->user->phone,
                $this->invitedUser->userInvitation->name,
                $this->invitedUser->name,
                $this->invitedUser->userInvitation->invitation_date,
                $this->invitedUser->userInvitation->invitation_time,
                $this->qr
            );

            if (!$sent) {
                $retryCount++;
                sleep(1);
            }
        }

        if ($sent) {
            $this->invitedUser->update(['send_status' => 'sent']);
        } else {
            $this->invitedUser->update([
                'send_status' => 'failed',
                'error_message' => "فشل الإرسال بعد {$maxRetries} محاولات"
            ]);
        }
    }
}
