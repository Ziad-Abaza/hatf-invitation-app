<?php

namespace App\Http\Resources\UserInvitation;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Invitation\InvitationResource;

class GroupedUserInvitationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // أول دعوة في المجموعة لتستخدم كمصدر للبيانات الأساسية
        $firstInvitation = $this->resource->first();

        return [
            'id'                       => $firstInvitation->user_invitation_id ?? $firstInvitation->id,
            'state'                    => $this->getState(),
            'name'                     => $firstInvitation->name,
            'number_invitees'          => $this->getTotalInvitees(),
            'attendance_number'        => $this->getTotalAttendance(),
            'created_at'               => $firstInvitation->created_at,
            'updated_at'               => $firstInvitation->updated_at,
            'invitation_date'          => $firstInvitation->invitation_date,
            'invitation_time'          => $firstInvitation->invitation_time,
            'image_default'            => optional($firstInvitation->getFirstMedia('default'))->getFullUrl(),
            'image_user_invitation'    => optional($firstInvitation->getFirstMedia('userInvitation'))->getFullUrl(),
            'image_qr'                 => optional($firstInvitation->getFirstMedia('qr'))->getFullUrl(),
            'invitation'               => InvitationResource::make($firstInvitation->invitation),
            'invitedUsers'             => $this->getAllInvitedUsers(),
            'payment_user_invitations' => $this->getPaymentInfo(),
        ];
    }

    /**
     * تحديد حالة الدعوة بناءً على أي دعوة متاحة في المجموعة
     */
    protected function getState()
    {
        return $this->resource->contains('state', \App\Models\UserInvitation::AVAILABLE)
            ? \App\Models\UserInvitation::AVAILABLE
            : \App\Models\UserInvitation::FULL;
    }

    /**
     * جمع عدد المدعوين من جميع الدعوات في المجموعة
     */
    protected function getTotalInvitees()
    {
        return $this->resource->sum('number_invitees');
    }

    /**
     * جمع عدد الحضور من جميع الدعوات في المجموعة
     */
    protected function getTotalAttendance()
    {
        return $this->resource->sum(function ($invitation) {
            return $invitation->invitedUsers
                ->where('status', 1)
                ->count();
        });
    }

    /**
     * جمع جميع المدعوين من كل الدعوات في المجموعة
     */
    protected function getAllInvitedUsers()
    {
        return $this->resource->flatMap(function ($invitation) {
            return $invitation->invitedUsers;
        })->map(function ($user) {
            return [
                'id'                    => $user->id,
                'name'                  => $user->name,
                'phone'                 => $user->phone,
                'code'                  => $user->code,
                'qr'                    => $user->qr,
                'user_invitations_id'   => $user->user_invitations_id,
                'note'                  => $user->note,
                'error_message'         => $user->error_message,
                'created_at'            => $user->created_at,
                'updated_at'            => $user->updated_at,
                'status'                => $this->getInvitationStatus($user),
                'status_ar'             => $this->getStatusAr($user),
                'description_en'        => $this->getDescriptionEn($user),
                'description_ar'        => $this->getDescriptionAr($user),
                'color'                 => $this->getColor($user),
            ];
        });
    }

    /**
     * جمع معلومات الدفع من أول دعوة في المجموعة
     */
    protected function getPaymentInfo()
    {
        $firstPayment = $this->resource->first()?->userPackage?->payment;
        return $firstPayment ? $firstPayment : null;
    }

    /**
     * تحديد حالة الدعوة للمدعو
     */
    private function getInvitationStatus($user)
    {
        if ($user->status == 1) return 'attended';

        if (in_array($user->send_status, ['rejected', 'accepted', 'failed', 'sent'])) {
            return $user->send_status;
        }

        return 'pending';
    }

    /**
     * تحويل الحالة إلى العربية
     */
    private function getStatusAr($user)
    {
        $statusMap = [
            'rejected'  => 'مرفوضة',
            'accepted'  => 'مقبولة',
            'failed'    => 'فشلت',
            'sent'      => 'تم الإرسال',
            'attended'  => 'تم الحضور',
            'pending'   => 'قيد الانتظار',
        ];

        return $statusMap[$this->getInvitationStatus($user)] ?? 'قيد الانتظار';
    }

    /**
     * وصف الحالة بالإنجليزية
     */
    private function getDescriptionEn($user)
    {
        $descriptionMap = [
            'rejected'  => 'The recipient has declined the invitation and will not attend the event.',
            'accepted'  => 'The recipient has accepted the invitation and confirmed their attendance at the event.',
            'failed'    => 'There was an error sending the invitation. Please contact technical support.',
            'sent'      => 'The invitation was sent successfully to the recipient.',
            'attended'  => 'The recipient has attended the event.',
            'pending'   => 'The invitation is still pending and awaiting a response from the recipient.',
        ];

        return $descriptionMap[$this->getInvitationStatus($user)] ?? 'The invitation is pending.';
    }

    /**
     * وصف الحالة بالعربية
     */
    private function getDescriptionAr($user)
    {
        $descriptionMap = [
            'rejected'  => 'قام المستلم بالاعتذار عن حضور الفعالية ولم يتمكن من قبول الدعوة.',
            'accepted'  => 'تم قبول الدعوة من قبل المستلم وأكد حضوره للفعالية.',
            'failed'    => 'تعذر إرسال الدعوة بسبب خطأ يرجى التواصل مع الدعم الفني.',
            'sent'      => 'تم إرسال الدعوة بنجاح إلى المستلم.',
            'attended'  => 'لقد حضر المستلم الفعالية.',
            'pending'   => 'الدعوة في انتظار الرد من قبل المستلم.',
        ];

        return $descriptionMap[$this->getInvitationStatus($user)] ?? 'الدعوة في انتظار الرد.';
    }

    /**
     * لون يمثل الحالة
     */
    private function getColor($user)
    {
        $colorMap = [
            'rejected'  => 'd00202',
            'accepted'  => '28a745',
            'failed'    => 'ffc107',
            'sent'      => '007bff',
            'attended'  => '17a2b8',
            'pending'   => '6c757d',
        ];

        return $colorMap[$this->getInvitationStatus($user)] ?? '6c757d';
    }
}
