<?php

namespace App\Jobs;

use App\Models\InvitedUsers;
use App\Models\UserInvitation;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class BulkSendPrivateInvitationsJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $invitedUserIds;
    protected $userInvitationId;

    public function __construct(array $invitedUserIds, int $userInvitationId)
    {
        $this->invitedUserIds = $invitedUserIds;
        $this->userInvitationId = $userInvitationId;
    }

    public function handle(): void
    {
        $userInvitation = UserInvitation::find($this->userInvitationId);
        if (!$userInvitation) {
            Log::error('UserInvitation not found.');
            return;
        }

        foreach ($this->invitedUserIds as $id) {
            try {
                $invitedUser = InvitedUsers::find($id);
                if (!$invitedUser) continue;

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
                    $userInvitation->decrement('number_invitees');
                } else {
                    $invitedUser->update([
                        'send_status' => 'failed',
                        'error_message' => 'فشل الإرسال'
                    ]);
                }
            } catch (\Exception $e) {
                Log::error('Error sending invitation to user ID: ' . $id, ['error' => $e->getMessage()]);
                InvitedUsers::where('id', $id)->update([
                    'send_status' => 'failed',
                    'error_message' => $e->getMessage()
                ]);
            }
        }
    }
}
