<?php

namespace App\Services;

use App\Models\Invitation;
use App\Models\InvitedUsers;
use App\Models\UserInvitation;
use App\Models\PaymentUserInvitation;

class UserInvitationService
{
    public function getUserInvitations($userId)
    {
        return UserInvitation::where('user_id', $userId)
            ->with('invitedUsers', 'invitation')
            ->get();
    }

    public function createInvitation($data)
    {
        $invitation = Invitation::find($data['invitation_id']);

        // Validate VIP status
        if ($data['subscription'] !== 'vip' && $invitation->max_date !== 'unlimited') {
            throw new \Exception('غير مصرح بشراء هذه الباقة');
        }

        // Create a new invitation
        $userInvitation = UserInvitation::create([
            'state'                    => UserInvitation::AVAILABLE,
            'number_invitees'          => 0,
            'user_id'                  => $data['user_id'],
            'invitation_id'            => $invitation->getKey(),
            'invitation_date'          => $data['invitation_date'],
            'invitation_time'          => $data['invitation_time'],
        ]);

        if (!empty($data['image'])) {
            $userInvitation->addMedia($data['image'])->toMediaCollection('default');
        }

        PaymentUserInvitation::create([
            'user_invitation_id' => $userInvitation->getKey(),
        ]);

        return $userInvitation;
    }

    public function addInviteUsers($userInvitation, $request)
    {
        // Ensure payment and invitation state
        if ($userInvitation->userPackage->payment->status == 0) {
            throw new \Exception('not payment');
        }
        if ($userInvitation->is_active == 0) {
            throw new \Exception('لم يتم الدفع بعد');
        }

        // Check if max invitations are reached
        $totalAllowedInvitations = $userInvitation->number_invitees;
        $currentInviteCount = InvitedUsers::where("user_invitations_id", $userInvitation->id)->count();

        if ($totalAllowedInvitations <= $currentInviteCount) {
            throw new \Exception("الدعاوى المرسلة تساوى عدد الدعاوى التي تم شرائها");
        }

        // Process each invitee
        foreach ($request->name as $index => $name) {
            $imageName = date('Y-m-d') . '_' . uniqid() . '.' . $request->qr[$index]->extension();
            $request->qr[$index]->storeAs('public/images/qr', $imageName);

            $invitedUsers = InvitedUsers::create([
                'name'                => $name,
                'phone'               => $request->phone[$index],
                'code'                => $request->code[$index],
                'qr'                  => $imageName,
                'user_invitations_id' => $userInvitation->id,
            ]);

            sendWhatsappImage(
                $invitedUsers->phone,
                $userInvitation->getFirstMedia('default')->getPath(),
                $userInvitation->name ?? 'غير متوفر',
                $userInvitation->user->phone ?? 'غير متوفر',
                $userInvitation->user->name ?? 'غير متوفر',
                $userInvitation->invitation_date ?? 'غير متوفر',
                $userInvitation->invitation_time ?? 'غير متوفر'
            );

            sendWhatsappImage(
                $invitedUsers->phone,
                storage_path('app/public/images/qr/' . $imageName),
                $userInvitation->name ?? 'غير متوفر',
                $userInvitation->user->phone ?? 'غير متوفر',
                $userInvitation->user->name ?? 'غير متوفر',
                $userInvitation->invitation_date ?? 'غير متوفر',
                $userInvitation->invitation_time ?? 'غير متوفر'
            );
            // sendWhatsappImage($invitedUsers->phone, $userInvitation->getFirstMedia('default')->getPath());
            // sendWhatsappImage($invitedUsers->phone, storage_path('app/public/images/qr/' . $imageName), 'بطاقة دخول صالحة لمرة واحدة');

            $userInvitation->update(['number_invitees' => $userInvitation->number_invitees + 1]);
            $userInvitation->refresh();
        }

        $userInvitation->clearMediaCollection('default');
        return $userInvitation;
    }
}
