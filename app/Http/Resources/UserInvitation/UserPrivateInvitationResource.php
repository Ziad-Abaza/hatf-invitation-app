<?php

namespace App\Http\Resources\UserInvitation;

use App\Models\User;
use App\Models\UserPackage;
use Illuminate\Http\Request;
use App\Models\UserInvitation;
use App\Services\UserPaymentService;
use App\Models\PaymentUserInvitation;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Invitation\InvitationResource;

class UserPrivateInvitationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {

        $expiration = PaymentUserInvitation::chickExpirartionPrivateInvitation($this->id);

        if ($expiration['status'] == false) {
            return [
                'id'                    => $this->id,
                'invitation'            => InvitationResource::make($this->invitation),
                'expiration'            => $expiration,
                'payment_uuid'            => $this->payment->payment_uuid
            ];
        } else {
            return [
                'id'                    => $this->id,
                'invitation'            => InvitationResource::make($this->invitation),
                'expiration'            => $expiration,
            ];
        }
    }
}
