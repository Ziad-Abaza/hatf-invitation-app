<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\InvitedUsers;
use Illuminate\Support\Facades\Log;
use App\Services\ImageTemplate;

class SendPrivateInvitationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $data;
    protected $userInvitation;

    public function __construct(array $data, $userInvitation)
    {
        $this->data = $data;
        $this->userInvitation = $userInvitation;
    }

    public function handle()
    {
        try {
            // معالجة QR
            $imageName = ImageTemplate::process($this->data['qr'], $this->data['name'], $this->userInvitation);

            // إنشاء دعوة جديدة
            $invitedUser = InvitedUsers::create([
                'name' => $this->data['name'],
                'phone' => $this->data['phone'],
                'code' => $this->data['code'],
                'qr' => $imageName,
                'user_invitations_id' => $this->userInvitation->id,
                'send_status' => 'pending'
            ]);

            // إعادة المحاولة لإرسال الرسالة (3 محاولات كحد أقصى)
            $maxRetries = 3;
            $retryCount = 0;
            $sent = false;

            while ($retryCount < $maxRetries && !$sent) {
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

                if (!$sent) {
                    $retryCount++;
                    sleep(1); // انتظار قبل إعادة المحاولة
                    Log::info('Retrying to send message:', ['attempt' => $retryCount, 'phone' => $invitedUser->phone]);
                }
            }

            // تحديث حالة الإرسال بناءً على النتيجة
            if ($sent) {
                $invitedUser->update(['send_status' => 'sent']);
            } else {
                $invitedUser->update([
                    'send_status' => 'failed',
                    'error_message' => 'Failed after ' . $maxRetries . ' attempts'
                ]);
            }
        } catch (\Exception $e) {
            Log::error('Error in SendPrivateInvitationJob:', ['error' => $e->getMessage()]);
        }
    }
}
