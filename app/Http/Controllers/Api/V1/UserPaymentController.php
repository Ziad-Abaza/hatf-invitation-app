<?php

namespace App\Http\Controllers\Api\V1;

use Carbon\Carbon;
use App\Models\UserPackage;
use App\Models\Invitation;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\UserInvitation;
use App\Models\InvitedUsers;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Services\UserPaymentService;
use App\Models\PaymentUserInvitation;

class UserPaymentController extends Controller
{
    protected $paymentService;

    public function __construct(UserPaymentService $paymentService)
    {
        $this->paymentService = $paymentService;
    }

    public function paymentTest()
    {
        // $pay = $this->paymentService->initiatePayment([
        //     'invitation_id' => 10,
        //     'invitation_value' => 15.5
        // ], auth('api')->user());

        // return $this->handlePaymentResponse($pay);
    }

    // public function payment(Request $request)
    // {
    //     $validated = $request->validate([
    //         'invitation_id'      => 'required|integer|exists:invitations,id',
    //         'name'               => 'nullable|filled|string',
    //         'number_invitees'    => 'required|integer',
    //         'total_price'        => 'required|numeric',
    //         'image'              => 'nullable|filled|file|mimes:png,jpg,pdf',
    //         'invitation_date'    => ['required', 'date', 'after_or_equal:today'],
    //         'invitation_time'    => ['required', 'date_format:H:i'],
    //         'payment_uuid'       => 'required|string|unique:payment_user_invitations,payment_uuid',
    //     ]);

    //     $payment = $this->paymentService->initiatePayment($validated, auth('api')->user());

    //     if (is_array($payment)) {
    //         return $this->handlePaymentResponse($payment['pay'], $payment['cart_id'], $payment['userInvitation']);
    //     }else{
    //         return $payment ;
    //     }
    // }

    public function payment(Request $request)
    {
        // Validate request data
        $validatedData = $request->validate([
            'invitation_id'    => ['required', 'integer', 'exists:invitations,id'],
            'name'             => ['nullable', 'string', 'filled', 'max:255'],
            'number_invitees'  => ['required', 'integer', 'min:1'],
            'total_price'      => ['required', 'numeric'],
            'file'             => ['nullable', 'file', 'mimes:png,jpg,jpeg,pdf'],
            'invitation_date'  => ['required', 'date', 'after_or_equal:today'],
            'invitation_time'  => ['required', 'date_format:H:i'],
            'payment_uuid'     => ['required', 'string', 'unique:payment_user_invitations,payment_uuid'],
        ]);

        // Check if file is uploaded and valid
        if ($request->hasFile('file') && !$request->file('file')->isValid()) {
            return response()->json([
                'message' => 'الملف المرفوع غير صالح.',
                'errors'  => ['file' => 'الملف تالف أو غير مكتمل التحميل.'],
                'success' => false,
            ], 422);
        }

        try {
            // Initiate payment process
            $payment = $this->paymentService->initiatePayment($validatedData, auth('api')->user());

            if (is_array($payment)) {
                return $this->handlePaymentResponse(
                    $payment['pay'],
                    $payment['cart_id'],
                    $payment['userInvitation']
                );
            }

            return $payment;
        } catch (\Exception $e) {
            // Handle unexpected errors
            return response()->json([
                'message' => 'حدث خطأ أثناء معالجة الطلب.',
                'errors'  => [$e->getMessage()],
                'success' => false,
            ], 500);
        }
    }



    // public function paymentP(Request $request)
    // {
    //     $validated = $request->validate([
    //         'invitation_id'      => 'required|integer|exists:invitations,id',
    //         'total_price'        => 'required|numeric',
    //         'payment_uuid'       => 'required|string|unique:payment_user_invitations,payment_uuid',
    //     ]);

    //     $payment = $this->paymentService->initiatePaymentP($validated, auth('api')->user());

    //     if (is_array($payment)) {
    //         return $this->handlePaymentResponseP($payment['pay'], $payment['cart_id'], $payment['user_package']);
    //     }else{
    //         return $payment ;
    //     }
    // }

    public function paymentP(Request $request)
    {
        // check if the user is authenticated
        $validated = $request->validate([
            'invitation_id'      => 'required|integer|exists:invitations,id',
            'total_price'        => 'required|numeric',
            'payment_uuid'       => 'required|string|unique:payment_user_invitations,payment_uuid',
            'file'              => 'nullable|filled|file|mimes:png,jpg,pdf',
        ]);

        // check if the user is the owner of the package
        if ($request->hasFile('file') && !$request->file('file')->isValid()) {
            return response()->json([
                'message' => 'الملف المرفق غير صالح.',
                'success' => false
            ], 400);
        }

        // check if the user has already paid for this package
        $errors = [];

        if ($validated['total_price'] <= 0) {
            $errors[] = 'السعر الإجمالي يجب أن يكون قيمة موجبة.';
        }

        if ($validated['payment_uuid'] == '') {
            $errors[] = 'UUID الدفع مطلوب.';
        }

        // check if the user has already paid for this package
        if (!empty($errors)) {
            return response()->json([
                'message' => 'فشل التحقق من البيانات.',
                'errors' => $errors
            ], 422);
        }

        // check if the user has already paid for this package
        $payment = $this->paymentService->initiatePaymentP($validated, auth('api')->user());

        // check if the user has already paid for this package
        if (is_array($payment)) {
            return $this->handlePaymentResponseP($payment['pay'], $payment['cart_id'], $payment['user_package']);
        } else {
            return $payment;
        }
    }

    //*response shoud send in success case and in fail case*//
    // {
    //     "data": {
    //         "payment_uuid": "the set id when you generate url payment",
    //         "id_payment": "the id returned from gatpayment after successful payment",
    //         "message": "success",
    //         "status": 200,
    //         "payment_return_response": ""
    //     },
    //     "status": 200
    // }


    // {
    //     "data": {
    //         "payment_uuid": null,
    //         "message": "fail",
    //         "status": 400,
    //         "payment_return_response": ""
    //     },
    //     "status": 400
    // }


    public function returnAction(Request $request)
    {
        // try {
            // Validate request
            $validatedData = $request->validate([
                'data' => 'required|array',
                'data.payment_uuid' => 'required|exists:payment_user_invitations,payment_uuid',
                'data.id_payment' => 'nullable|string',
                'data.message' => 'required|string',
                'data.status' => 'required|integer',
                'data.payment_return_response' => 'nullable|string',
            ]);

            $data = $validatedData['data'];

            // Extract necessary fields
            $payment_uuid = $data['payment_uuid'] ?? null;
            $id_payment = $data['id_payment'] ?? null;
            $message = $data['message'] ?? 'Unknown error';
            $status = $data['status'] ?? 500;
            $payment_return_response = $data['payment_return_response'] ?? '';// for backend debug only

            // Handle success case
            if ($status == 200 && $payment_uuid && $id_payment) {
                $request->validate(['data.id_payment' => 'required|string']);
                $payment=PaymentUserInvitation::where('payment_uuid',$payment_uuid)->first();
                $payment->update([
                    'status'=>1,
                    'id_payment'=>$data['id_payment'],
                    'created_at'=>Carbon::now(),
                    'updated_at'=>Carbon::now(),
                ]);


            //    $userPackage= UserPackage::where('payment_user_invitation_id',$payment->id)->first();
            //    $userPackage = UserPackage::where('payment_user_invitation_id', $payment->id)->first();

            // if($userPackage){
            //     $payment=UserInvitation::where('user_package_id',$userPackage->id)->update([
            //         'is_active'=>1,
            //     ]);
            //    }

               $user = User::where('id', $payment->user_id)->first();

                return response()->json([
                    'data' => [
                        'payment' => PaymentUserInvitation::where('payment_uuid',$payment_uuid)->first()
                    ],
                    'message' => 'تم الدفع بنجاح',
                    'status' => $status,
                    'user' => $user,
                    'payment' => $payment,
                    'user_package' => $userPackage,

                ], 200);
            }
            // Handle failure case
            elseif ($status == 400) {
                $payment=PaymentUserInvitation::where('payment_uuid',$payment_uuid)->first();
                $payment->delete();
                return response()->json([
                    'message' => 'فشل الدفع',
                    'status' => $status,
                ], 400);
            }
        // } catch (\Exception $e) {
        //     Log::error('Payment return action error: ' . $e->getMessage());
        //     return response()->json([
        //         'message' => 'An error occurred while processing your request.',
        //         'status' => 500,
        //     ], 500);
        // }
    }


    private function handlePaymentResponse($payment, $payment_uuid, $userInvitation)
    {
        return response()->json([
            'success' => true,
            'user_invitation' => $userInvitation,
            'payment_uuid' => $payment_uuid,
            'data' => $payment,
            'invitation_date' => request('invitation_date'),
            'invitation_time' => request('invitation_time')
        ], 200); // url
    }

    private function handlePaymentResponseP( $payment, $payment_uuid, $userPackage)
    {
        return response()->json([
            'success' => true,
            'user_package' => $userPackage,
            'payment_uuid' => $payment_uuid,
            'data' => $payment,
            'invitation_date' => request('invitation_date'),
            'invitation_time' => request('invitation_time')
        ], 200); // url
    }
}
