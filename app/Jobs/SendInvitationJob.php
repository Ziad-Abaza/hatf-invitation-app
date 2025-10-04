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
            Log::error('InvitedUser or UserInvitation not found.', [
                'invited_user_id' => $this->invitedUserId,
                'user_invitation_id' => $this->userInvitationId
            ]);
            return;
        }

        try {
            Log::info('=============== Preparing to send WhatsApp Image ===============', [
                'invited_user_id' => $invitedUser->id,
                'user_invitation_id' => $userInvitation->id
            ]);

            $imageUrl = $userInvitation->getFirstMediaUrl('userInvitation');

            Log::info('Invitation Parameters', [
                'invited_user_phone' => $invitedUser->phone,
                'invitation_image_url' => $imageUrl,
                'inviter_phone' => $userInvitation->user->phone ?? 'غير متوفر',
                'invitation_name' => $userInvitation->name ?? 'غير متوفر',
                'inviter_name' => $userInvitation->user->name ?? 'غير متوفر',
                'invitation_date' => $userInvitation->invitation_date ?? 'غير متوفر',
                'invitation_time' => $userInvitation->invitation_time ?? 'غير متوفر',
            ]);

            $sent = sendWhatsappImage(
                $invitedUser->phone,
                $imageUrl,
                $userInvitation->user->phone ?? 'غير متوفر',
                $userInvitation->name ?? 'غير متوفر',
                $userInvitation->user->name ?? 'غير متوفر',
                $userInvitation->invitation_date ?? 'غير متوفر',
                $userInvitation->invitation_time ?? 'غير متوفر'
            );

            if ($sent) {
                $invitedUser->update(['send_status' => 'sent']);
                $userInvitation->increment('number_invitees');

                Log::info('Invitation sent successfully', [
                    'invited_user_id' => $invitedUser->id,
                    'user_invitation_id' => $userInvitation->id
                ]);
            } else {
                $invitedUser->update([
                    'send_status' => 'failed',
                    'error_message' => 'Failed after ' . $this->attempts() . ' attempts'
                ]);

                Log::warning('Failed to send invitation', [
                    'invited_user_id' => $invitedUser->id,
                    'user_invitation_id' => $userInvitation->id,
                    'attempts' => $this->attempts()
                ]);
            }
        } catch (\Exception $e) {
            $invitedUser->update([
                'send_status' => 'failed',
                'error_message' => $e->getMessage()
            ]);

            Log::error('Exception occurred in SendInvitationJob', [
                'invited_user_id' => $invitedUser->id,
                'user_invitation_id' => $userInvitation->id,
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
        }
    }
}
