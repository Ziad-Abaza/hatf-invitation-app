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
        $media = $this->media;
        return [
            'id'                       => $this->id,
            'state'                    => $this->state,
            'name'                     => $this->name,
            'invitation_type'          => $this->invitation?->type,
            'text'                     => $this->text,
            'number_invitees'          => $this->number_invitees,
            'attendance_number'        => $this->invitedUsers->where('status', 1)->count(),
            'created_at'               => $this->created_at,
            'updated_at'               => $this->updated_at,
            'invitation_date'          => $this->invitation_date,
            'invitation_time'          => $this->invitation_time,
            'image_default'            => $this->defaultMedia?->getFullUrl()?? optional($this->getFirstMedia('default'))->getFullUrl(),
            'image_user_invitation'    => $this->userInvitationMedia?->getFullUrl()?? optional($this->getFirstMedia('userInvitation'))->getFullUrl(),
            'image_qr'                 => $this->qrMedia?->getFullUrl() ?? optional($this->getFirstMedia('qr'))->getFullUrl(),
            'invitation'               => InvitationResource::make($this->invitation),
            'invitedUsers'             => $this->invitedUsers->map(function ($user) {
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
            }),
            'payment_user_invitations' => $this->userPackage->payment,
        ];
    }


    /**
     *  function to get the status of the invitation
     */
    private function getInvitationStatus($user)
    {
        // check if the user has attended
        if ($user->status == 1) {
            return 'attended';
        }

        // control the status of the invitation
        if (in_array($user->send_status, ['rejected', 'accepted', 'failed', 'sent'])) {
            return $user->send_status;
        }

        // if the user has not attended and the status is not in the above array, return pending
        return 'pending';
    }

    /**
     * translate status to Arabic
     */
    private function getStatusAr($user)
    {
        $statusMap = [
            'rejected'  => 'اعتُذِر',
            'accepted'  => 'أُكِّد',
            'failed'    => 'فشل',
            'sent'      => 'أُرسلت',
            'attended'  => 'حُضِر',
            'pending'   => 'قيد الانتظار',
        ];

        return $statusMap[$this->getInvitationStatus($user)] ?? 'قيد الانتظار';
    }

    /**
     *  description of the status in English
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
     * description of the status in Arabic
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
     *  function to get the color based on the status
     */
    private function getColor($user)
    {
        $colorMap = [
            'rejected'  => 'd00202',  // red
            'accepted'  => '28a745',  // green
            'failed'    => 'ffc107',  // yellow
            'sent'      => '007bff',  // blue
            'attended'  => '17a2b8',  // cyan
            'pending'   => '6c757d',  // silver
        ];

        return $colorMap[$this->getInvitationStatus($user)] ?? '6c757d';
    }
}
