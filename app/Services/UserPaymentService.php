<?php

namespace App\Services;

use App\Models\Invitation;
use App\Models\UserPackage;
use Illuminate\Support\Str;
use App\Models\UserInvitation;
use Illuminate\Support\Facades\Log;
use App\Models\PaymentUserInvitation;

class UserPaymentService
{
    private $MOAZ_PHONE = '966531333006';

    // public function initiatePayment($requestData, $user)
    // {
    //     $cart_id = Str::uuid();
    //     $invitation_id = $requestData['invitation_id'];
    //     $invitation = Invitation::find($invitation_id);
    //     $cart_desc = $invitation->name;
    //     $requestData['user_invitation_id'] = $requestData['user_invitation_id'] ?? null;

    //     $value = $this->calculatePaymentValue($invitation, $user, $requestData['invitation_value']);

    //     $userInvitation = $this->createUserInvitation($requestData, $user, $invitation);

    //     if ($requestData['user_invitation_id']) {
    //         $paymentUserInvitation =  PaymentUserInvitation::where([
    //             'user_invitation_id' => $requestData['user_invitation_id'],
    //             'status'             => 1,
    //         ])->update([
    //             'value'              => $value,
    //             'payment_uuid'       => $cart_id,
    //         ]);
    //     } else {
    //         $paymentUserInvitation = PaymentUserInvitation::create([
    //             'user_invitation_id' => $userInvitation->id,
    //             'value'              => $value,
    //             'payment_uuid'       => $cart_id,
    //         ]);
    //     }

    //     $return_url = route('paymentreturn'); // this route wiil return after done payment
    //     $callback = null; // this action done  after  payment

    //     $pay = Paypage::sendPaymentCode('all')
    //         ->sendTransaction('sale')
    //         ->sendCart($cart_id, $value, $cart_desc)
    //         ->sendHideShipping(true)
    //         ->sendFramed(true)
    //         ->sendCustomerDetails(
    //             null,
    //             $user->email,
    //             $user->phone,
    //             'address',
    //             'Riyadh',
    //             'Riyadh',
    //             'SA',
    //             '12345',
    //             '10.0.0.10'
    //         )
    //         ->sendURLs($return_url, $callback)
    //         ->sendLanguage('ar')
    //         ->create_pay_page();
    //     return [
    //         'pay' => $pay,
    //         'cart_id' => $cart_id,
    //         'userInvitation' => $userInvitation
    //     ];
    // }

    public function initiatePayment($requestData, $user)
    {

        $invitation = Invitation::find($requestData['invitation_id']);

        // Check payment and handle potential errors
        if ($user->phone !== $this->MOAZ_PHONE) {
            // Determine expected price based on invitation type
            $expectedPrice = $invitation->prise * ($requestData['number_invitees'] ?? 1);
            // Check if the total price matches the expected price
            if (intval($requestData['total_price']) !== intval($expectedPrice)) {
                return response()->json([
                    'error' => 'The total price must equal the invitation price based on the invitation type' . ' ' . 'total_price:' . $requestData['total_price'] . ' ' . 'expectedPrice:' . $expectedPrice
                ], 400);
            }
        }

        $paymentUserInvitation = PaymentUserInvitation::create([
            'value'              => $requestData['total_price'],
            'status'              => 0,
            'payment_uuid'       => $requestData['payment_uuid'],
            'id_payment'       => null, // will set after pay in success
        ]);


        $UserPackage = UserPackage::create([
            'payment_user_invitation_id' =>  $paymentUserInvitation->id,
            'invitation_id' => $invitation->id,
        ]);


        $requestData['user_package_id'] = $UserPackage->id;
        $userInvitation = $this->createUserInvitation($requestData, $user, $invitation);

        return [
            'pay' => $paymentUserInvitation,
            'cart_id' => $requestData['payment_uuid'],
            'userInvitation' => $userInvitation
        ];
    }

    public function initiatePaymentP($requestData, $user)
    {

        $invitation = Invitation::find($requestData['invitation_id']);

        // Check payment and handle potential errors
        if ($user->phone !== $this->MOAZ_PHONE) {
            // Determine expected price based on invitation type
            $expectedPrice =  $invitation->prise;
            // Check if the total price matches the expected price
            if (intval($requestData['total_price']) !== intval($expectedPrice)) {
                return response()->json([
                    'error' => 'The total price must equal the invitation price based on the invitation type' . ' ' . 'total_price:' . $requestData['total_price'] . ' ' . 'expectedPrice:' . $expectedPrice
                ], 400);
            }
        }


        $paymentUserInvitation = PaymentUserInvitation::create([
            'value'              => $requestData['total_price'],
            'status'              => 0,
            'payment_uuid'       => $requestData['payment_uuid'],
            'id_payment'       => null, // will set after pay in success
        ]);


        $UserPackage = UserPackage::create([
            'payment_user_invitation_id' =>  $paymentUserInvitation->id,
            'invitation_id' => $invitation->id,

        ]);


        return [
            'pay' => $paymentUserInvitation,
            'cart_id' => $requestData['payment_uuid'],
            'user_package' => $UserPackage
        ];
    }

    public function checkPayment($requestData, $user, $invitation)
    {

        // Determine expected price based on invitation type
        $expectedPrice = $invitation->max_date === 'unlimited' ? $invitation->prise * ($requestData['number_invitees'] ?? 1) : $invitation->prise;

        // Check if the total price matches the expected price
        if (intval($requestData['total_price']) !== intval($expectedPrice)) {
            return response()->json([
                'error' => 'The total price must equal the invitation price based on the invitation type' . ' ' . 'total_price:' . $requestData['total_price'] . ' ' . 'expectedPrice:' . $expectedPrice
            ], 400);
        }
    }

    public function handleReturn($data)
    {
        try {
            if (!$this->isValidRedirect($data)) {
                return 'failedPayment';
            }

            $respStatus = $data['respStatus'];
            $cart_id = $data['cartId'];

            if ($respStatus === "A") {
                try {
                    $paymentUserInvitation = PaymentUserInvitation::where('payment_uuid', $cart_id)->first();

                    if (!$paymentUserInvitation) {
                        Log::error("Payment User Invitation not found for cart ID: {$cart_id}");
                        return 'failedPayment';
                    }

                    // Update PaymentUserInvitation
                    $paymentUserInvitation->update([
                        'id_payment' => $data['tranRef'],
                        'status'     => 1,
                    ]);
                } catch (\Exception $e) {
                    Log::error("Failed to update PaymentUserInvitation: " . $e->getMessage(), [
                        'cart_id' => $cart_id,
                        'data'    => $data,
                    ]);
                    return 'failedPayment';
                }

                try {
                    // Update UserInvitation
                    UserInvitation::where('id', $paymentUserInvitation->user_invitation_id)->update([
                        'is_active' => 1,
                        'created_at' => now(),
                    ]);
                } catch (\Exception $e) {
                    Log::error("Failed to update UserInvitation status: " . $e->getMessage(), [
                        'user_invitation_id' => $paymentUserInvitation->user_invitation_id,
                    ]);
                    return 'failedPayment';
                }

                return 'successPayment';
            }

            return 'failedPayment';
        } catch (\Exception $e) {
            Log::error("Unexpected error in handleReturn: " . $e->getMessage(), [
                'data' => $data,
            ]);
            return 'failedPayment';
        }
    }


    private function calculatePaymentValue($invitation, $user, $invitationValue)
    {
        if ($user->phone == '966531333006') {
            return 1;
        }

        return $invitation->max_date == "unlimited" ?
            $invitationValue * $invitation->prise :
            $invitation->prise;
    }

    // private function createUserInvitation($data, $user, $invitation)
    // {
    //     return UserInvitation::firstOrCreate([
    //         'id'              => $data['user_invitation_id']
    //     ], [
    //         'state'           => UserInvitation::AVAILABLE,
    //         'name'            => $data['name'],
    //         'number_invitees' => 0,
    //         'user_id'         => $user->id,
    //         'invitation_id'   => $invitation->id,
    //         'invitation_date' => $data['invitation_date'],
    //         'invitation_time' => $data['invitation_time'],
    //     ]);
    // }


    private function createUserInvitation($data, $user, $invitation)
    {

        $userInvitation = UserInvitation::create([
            'state'           => UserInvitation::AVAILABLE,
            'name'            => $data['name'],
            'number_invitees' => $data['number_invitees'],
            'user_id'         => $user->id,
            'invitation_id'   => $invitation->id,
            'invitation_date' => $data['invitation_date'],
            'invitation_time' => $data['invitation_time'],
            'user_package_id' => $data['user_package_id'],
        ]);

        if ($data['file']) {
            $userInvitation->addMedia($data['file'])->toMediaCollection('userInvitation');
        }

        return $userInvitation;
    }

    public function isValidRedirect($postData)
    {
        if (empty($postData) || !array_key_exists('signature', $postData)) {
            return false;
        }

        $serverKey = config('clickpay.server_key');
        $requestSignature = $postData["signature"];
        unset($postData["signature"]);
        ksort($postData);
        $query = http_build_query($postData);

        return $this->isGenuine($query, $requestSignature, $serverKey);
    }

    private function isGenuine($data, $requestSignature, $serverKey)
    {
        $signature = hash_hmac('sha256', $data, $serverKey);
        return hash_equals($signature, $requestSignature);
    }
}
