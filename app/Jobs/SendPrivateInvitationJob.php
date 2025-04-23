<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Models\UserInvitation;
use App\Models\InvitedUsers;
use Illuminate\Support\Facades\Log;
use App\Services\ImageTemplate; // Adjust the namespace if the class exists elsewhere

class SendPrivateInvitationJob implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    protected $userInvitation;
    protected $name;
    protected $phone;
    protected $code;
    protected $qr;

    public function __construct(UserInvitation $userInvitation, $name, $phone, $code, $qr)
    {
        $this->userInvitation = $userInvitation;
        $this->name = $name;
        $this->phone = $phone;
        $this->code = $code;
        $this->qr = $qr;
    }

    public function handle()
    {
        try {
            // معالجة QR
            $imageName = ImageTemplate::process($this->qr, $this->name, $this->userInvitation);

            // إنشاء سجل جديد للمدعو
            $invitedUser = InvitedUsers::create([
                'name' => $this->name,
                'phone' => $this->phone,
                'code' => $this->code,
                'qr' => $imageName,
                'user_invitations_id' => $this->userInvitation->id,
                'send_status' => 'pending'
            ]);

            // إعادة المحاولة لإرسال الرسالة
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
                    Log::info('إعادة محاولة الإرسال:', [
                        'attempt' => $retryCount,
                        'phone' => $invitedUser->phone
                    ]);
                }
            }

            // تحديث حالة الإرسال بناءً على النتيجة
            if ($sent) {
                $invitedUser->update(['send_status' => 'sent']);
                $this->userInvitation->decrement('number_invitees'); // تحديث العدد المتبقي
            } else {
                $invitedUser->update([
                    'send_status' => 'failed',
                    'error_message' => 'فشل الإرسال بعد ' . $maxRetries . ' محاولات'
                ]);
                Log::error('فشل الإرسال النهائي:', [
                    'phone' => $invitedUser->phone,
                    'error' => 'تمت ' . $maxRetries . ' محاولات دون نجاح'
                ]);
            }
        } catch (\Exception $e) {
            Log::error('خطأ أثناء معالجة الدعوة:', ['error' => $e->getMessage()]);
        }
    }
}
