<?php

namespace App\Http\Resources\UserInvitation;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Invitation\InvitationResource;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class UserInvitationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'                       => $this->id,
            'state'                    => $this->state,
            'name'                     => $this->name,
            'number_invitees'          => $this->number_invitees,
            'attendance_number'        => $this->invitedUsers->where('status', 1)->count(),
            'created_at'               => $this->created_at,
            'updated_at'               => $this->updated_at,
            'invitation_date'          => $this->invitation_date,
            'invitation_time'          => $this->invitation_time,
            'image_default'            => optional($this->getFirstMedia('default'))->getFullUrl(),
            'image_user_invitation'    => optional($this->getFirstMedia('userInvitation'))->getFullUrl(),
            'image_qr'                 => optional($this->getFirstMedia('qr'))->getFullUrl(),
            'invitation'               => InvitationResource::make($this->invitation),
            'invitedUsers'             => $this->invitedUsers->map(function ($user) {
                return [
                    'id'                    => $user->id,
                    'name'                  => $user->name,
                    'phone'                 => $user->phone,
                    'code'                  => $user->code,
                    // 'status'                => $user->status,
                    // 'send_status'           => $user->send_status,
                    'qr'                    => $user->qr,
                    'user_invitations_id'   => $user->user_invitations_id,
                    'note'                  => $user->note,
                    'error_message'         => $user->error_message,
                    'created_at'            => $user->created_at,
                    'updated_at'            => $user->updated_at,
                    // إضافة البيانات المطلوبة للمستجيب
                    'status'                => $this->getInvitationStatus($user),
                    'status_ar'             => $this->getStatusAr($user),
                    'description_en'        => $this->getDescriptionEn($user),
                    'description_ar'        => $this->getDescriptionAr($user),
                    'color'                 => $this->getColor($user),
                ];
            }),
            'payment_user_invitations' => $this->userPackage->payment,
        ];
    }

    /**
     * دالة للتحقق من الحالة بناءً على send_status و status
     */
    private function getInvitationStatus($user)
    {
        // تحقق من send_status و status لإرجاع الحالة المناسبة
        if (in_array($user->send_status, ['Rejected', 'Accepted', 'Failed', 'Sent'])) {
            return $user->send_status;
        }

        // إذا كان status 1
        if ($user->status == 1) {
            return 'Attended';
        }

        // في حال لم يتم تلبية الشروط
        return 'Pending';
    }

    /**
     * الترجمة للعربية
     */
    private function getStatusAr($user)
    {
        $statusMap = [
            'Rejected'  => 'مرفوضة',
            'Accepted'  => 'مقبولة',
            'Failed'    => 'فشلت',
            'Sent'      => 'تم الإرسال',
            'Attended'  => 'حضرت',
            'Pending'   => 'قيد الانتظار',
        ];

        return $statusMap[$this->getInvitationStatus($user)] ?? 'قيد الانتظار';
    }

    /**
     * وصف الحالة باللغة الإنجليزية
     */
    private function getDescriptionEn($user)
    {
        $descriptionMap = [
            'Rejected'  => 'The invitation was declined by the recipient.',
            'Accepted'  => 'The invitation was accepted by the recipient.',
            'Failed'    => 'There was an error sending the invitation.',
            'Sent'      => 'The invitation was sent successfully.',
            'Attended'  => 'The recipient has attended the event.',
            'Pending'   => 'The invitation is pending.',
        ];

        return $descriptionMap[$this->getInvitationStatus($user)] ?? 'The invitation is pending.';
    }

    /**
     * وصف الحالة باللغة العربية
     */
    private function getDescriptionAr($user)
    {
        $descriptionMap = [
            'Rejected'  => 'تم رفض الدعوة من قبل المستلم.',
            'Accepted'  => 'تم قبول الدعوة من قبل المستلم.',
            'Failed'    => 'حدث خطأ أثناء إرسال الدعوة.',
            'Sent'      => 'تم إرسال الدعوة بنجاح.',
            'Attended'  => 'حضر المستلم الفعالية.',
            'Pending'   => 'الدعوة في انتظار الرد.',
        ];

        return $descriptionMap[$this->getInvitationStatus($user)] ?? 'الدعوة في انتظار الرد.';
    }

    /**
     * تحديد اللون المخصص للحالة
     */
    private function getColor($user)
    {
        $colorMap = [
            'Rejected'  => 'd00202',  // أحمر
            'Accepted'  => '28a745',  // أخضر
            'Failed'    => 'ffc107',  // أصفر
            'Sent'      => '007bff',  // أزرق
            'Attended'  => '6c757d',  // رمادي
            'Pending'   => '17a2b8',  // أزرق فاتح
        ];

        return $colorMap[$this->getInvitationStatus($user)] ?? '17a2b8';  // اللون الافتراضي للأزرق الفاتح
    }
}
