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
    ) {}

    public function handle(): void
    {
        $this->invitedUser->loadMissing(['userInvitation.user', 'userInvitation.media']);

        $qr = $this->invitedUser->userInvitation->getFirstMediaUrl('qr');

        $maxRetries = 3;
        $retryCount = 0;
        $sent = false;

        while ($retryCount < $maxRetries && !$sent) {
            $sent = sendWhatsappImage(
                $this->invitedUser->phone,
                $this->imageUrl,
                $this->invitedUser->userInvitation->user->phone?? 'غير متوفر',
                $this->invitedUser->userInvitation->name?? 'غير متوفر',
                $this->invitedUser->name?? 'غير متوفر',
                $this->invitedUser->userInvitation->invitation_date?? 'غير متوفر',
                $this->invitedUser->userInvitation->invitation_time?? 'غير متوفر',
                $qr
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
