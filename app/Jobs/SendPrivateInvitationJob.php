<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use App\Models\UserInvitation;
use App\Models\InvitedUsers;

class SendPrivateInvitationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $invitedUser;
    protected $userInvitation;

    /**
     * Create a new job instance.
     */
    public function __construct(InvitedUsers $invitedUser, UserInvitation $userInvitation)
    {
        $this->invitedUser = $invitedUser;
        $this->userInvitation = $userInvitation;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        try {
            // set_time_limit(0); // Remove time limit for long-running jobs
            $maxRetries = 3;
            $retryCount = 0;
            $sent = false;

            // Attempt to send the message with retries
            while ($retryCount < $maxRetries && !$sent) {
                $sent = sendWhatsappImage(
                    $this->invitedUser->phone,
                    $this->userInvitation->getFirstMediaUrl('userInvitation'),
                    $this->userInvitation->user->phone ?? 'غير متوفر',
                    $this->userInvitation->name ?? 'غير متوفر',
                    $this->userInvitation->user->name ?? 'غير متوفر',
                    $this->userInvitation->invitation_date ?? 'غير متوفر',
                    $this->userInvitation->invitation_time ?? 'غير متوفر',
                    $this->userInvitation->getFirstMediaUrl('qr')
                );


                if (!$sent) {
                    $retryCount++;
                    sleep(1); // Wait for a second before retrying
                    Log::info('Retry sending message:', [
                        'attempt' => $retryCount,
                        'phone' => $this->invitedUser->phone
                    ]);
                }
            }

            if ($sent) {
                $this->invitedUser->update(['send_status' => 'sent']);
                $this->userInvitation->decrement('number_invitees'); // Decrement the number of invitees
            } else {
                $this->invitedUser->update([
                    'send_status' => 'failed',
                    'error_message' => 'Failed after ' . $maxRetries . ' attempts'
                ]);
            }
        } catch (\Exception $e) {
            Log::error('Error in SendPrivateInvitationJob:', ['error' => $e->getMessage()]);
            $this->invitedUser->update([
                'send_status' => 'failed',
                'error_message' => $e->getMessage()
            ]);
        }
    }
}
