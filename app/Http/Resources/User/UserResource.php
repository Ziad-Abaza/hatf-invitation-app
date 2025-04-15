<?php

namespace App\Http\Resources\User;

use App\Models\User;
use Illuminate\Http\Request;
use App\Models\PaymentUserInvitation;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // $paymentUserInvitation = PaymentUserInvitation::where('status', 1)->whereHas('userPackage.userInvitation.user', function ($q) {
        //     $q->where('referral_id', $this->id);
        // })->sum('value');
        
        $paymentUserInvitation = round($this->totalPaymentValue($this->id) ,2 );



        return [
            'id'                        => $this->id,
            'name'                      => $this->name,
            'email'                     => $this->email,
            'password'                  => $this->password,
            'phone'                     => $this->phone,
            'otp'                       => $this->otp,
            'fcm_token'                 => $this->fcm_token,
            'code'                      => $this->code,
            'url'                       => $this->url,
            'wallet'                    => $this->wallet,
            'user_verified'             => $this->user_verified,
            'referral_id'               => $this->referral_id,
            'referral_count'            => User::where('referral_id', $this->id)->count(),
            'referral_count_not_active' => User::where('referral_id', $this->id)->whereNull('user_verified')->count(),
            'user_has_payment'          => User::where('referral_id', $this->id)->has('userInvitations')->count(),
            'sum_referral_payment'      => $paymentUserInvitation,
            'bank_name'                 => $this->bank_name,
            'iban'                      => $this->iban,
            'subscription'              => $this->subscription,
            'created_at'                => $this->created_at,
            'updated_at'                => $this->updated_at,
            'token'                     => $this->when($this->token, $this->token),
        ];
    }
}
