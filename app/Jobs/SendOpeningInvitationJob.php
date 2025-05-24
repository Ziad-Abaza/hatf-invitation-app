<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Models\InvitedUsers;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Log;

class SendOpeningInvitationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected int $invitedUserId;
    protected string $imageUrl;

    public function __construct(int $invitedUserId, string $imageUrl)
    {
        $this->invitedUserId = $invitedUserId;
        $this->imageUrl = $imageUrl;
    }

    public function handle(): void
    {
        $invitedUser = InvitedUsers::with(['userInvitation.user', 'userInvitation.media'])->find($this->invitedUserId);

        if (!$invitedUser) {
            Log::error("InvitedUser with ID {$this->invitedUserId} not found.");
            return;
        }

        $qr = $invitedUser->userInvitation->getFirstMediaUrl('qr');

        $maxRetries = 3;
        $retryCount = 0;
        $sent = false;

        while ($retryCount < $maxRetries && !$sent) {
            $sent = sendWhatsappImage(
                $invitedUser->phone,
                $this->imageUrl,
                $invitedUser->userInvitation->user->phone ?? 'غير متوفر',
                $invitedUser->userInvitation->name ?? 'غير متوفر',
                $invitedUser->name ?? 'غير متوفر',
                $invitedUser->userInvitation->invitation_date ?? 'غير متوفر',
                $invitedUser->userInvitation->invitation_time ?? 'غير متوفر',
                $qr
            );

            if (!$sent) {
                $retryCount++;
                sleep(1);
            }
        }

        if ($sent) {
            $invitedUser->update(['send_status' => 'sent']);
        } else {
            $invitedUser->update([
                'send_status' => 'failed',
                'error_message' => "فشل الإرسال بعد {$maxRetries} محاولات"
            ]);
        }
    }
}
