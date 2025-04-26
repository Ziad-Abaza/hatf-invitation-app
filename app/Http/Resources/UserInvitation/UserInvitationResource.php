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
                    'id' => $user->id,
                    'name' => $user->name,
                    'phone' => $user->phone,
                    'code' => $user->code,
                    'status' => $user->status,
                    // 'send_status' => $user->send_status,
                    'qr' => $user->qr,
                    'user_invitations_id' => $user->user_invitations_id,
                    'note' => $user->note,
                    'error_message' => $user->error_message,
                    'created_at' => $user->created_at,
                    'updated_at' => $user->updated_at,
                ];
            }),
            'payment_user_invitations' => $this->userPackage->payment,
        ];
    }
}

// <?php

// namespace App\Http\Resources\UserInvitation;

// use Illuminate\Http\Resources\Json\JsonResource;
// use Spatie\MediaLibrary\MediaCollections\Models\Media;

// class UserInvitationResource extends JsonResource
// {
//     public function toArray($request): array
//     {
//         return [
//             'id' => $this->id,
//             'state' => $this->state,
//             'name' => $this->name,
//             'number_invitees' => $this->number_invitees,
//             'is_active' => $this->is_active,
//             'invitation_date' => $this->invitation_date,
//             'invitation_time' => $this->invitation_time,
//             'type' => $this->type,
//             'user_id' => $this->user_id,
//             'invitation_id' => $this->invitation_id,
//             'user_package_id' => $this->user_package_id,
//             'created_at' => $this->created_at,
//             'updated_at' => $this->updated_at,

//             // Media Collections
//             'images' => [
//                 'default' => $this->getMedia('default')->map(fn(Media $media) => $media->getFullUrl())->toArray(),
//                 'user_invitation' => $this->getMedia('userInvitation')->map(fn(Media $media) => $media->getFullUrl())->toArray(),
//                 'qr' => $this->getMedia('qr')->map(fn(Media $media) => $media->getFullUrl())->toArray(),
//             ],

//             // Relationships
//             'user' => $this->user,
//             'invitation' => $this->invitation,
//             'invited_users' => $this->invitedUsers,
//             'user_package' => $this->userPackage,
//         ];
//     }
// }
