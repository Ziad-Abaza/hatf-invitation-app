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

    public function testPayment(Request $request)
    {
        Log::info("================= Start Test Payment (Fake Payment) =================");
        Log::warning('Processing test payment - THIS IS FOR TESTING PURPOSES ONLY');

        try {
            // التحقق من المستخدم
            $user = auth('api')->user();
            if (!$user) {
                return response()->json(['message' => 'غير مصدق عليه', 'success' => false], 401);
            }

            // التحقق من البيانات المطلوبة
            $validatedData = $request->validate([
                'invitation_id' => ['required', 'integer', 'exists:invitations,id'],
                'name' => ['nullable', 'string', 'filled', 'max:255'],
                'number_invitees' => ['required', 'integer', 'min:1'],
                'total_price' => ['required', 'numeric'],
                'invitation_date' => ['required', 'date'],
                'invitation_time' => ['required', 'date_format:H:i']
            ]);

            // الحصول على أو إنشاء UserPackage
            $invitation = Invitation::find($request->input('invitation_id'));

            // محاولة العثور على UserPackage موجود
            $userPackage = UserPackage::where('user_id', $user->id)
                ->where('invitation_id', $invitation->id)
                ->whereHas('payment', function ($query) {
                    $query->where('status', 1);
                })
                ->first();

            // إذا لم يكن موجودًا، إنشاء واحد جديد
            if (!$userPackage) {
                $userPackage = UserPackage::create([
                    'user_id' => $user->id,
                    'invitation_id' => $invitation->id,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);

                // إنشاء دفع وهمي لربطه بالباقة
                PaymentUserInvitation::create([
                    'user_package_id' => $userPackage->id,
                    'value' => 0,
                    'status' => 1,
                    'payment_uuid' => 'test_payment_' . uniqid(),
                    'payment_method' => 'test_mode'
                ]);
            }

            // إنشاء دعوة مستخدم مع ربط الباقة
            $userInvitation = UserInvitation::create([
                'state' => UserInvitation::AVAILABLE,
                'user_id' => $user->id,
                'invitation_id' => $invitation->id,
                'invitation_date' => $request->input('invitation_date'),
                'invitation_time' => $request->input('invitation_time'),
                'is_active' => 1,
                'number_invitees' => $request->input('number_invitees'),
                'user_package_id' => $userPackage->id // ربط الباقة هنا
            ]);

            // إنشاء دفع افتراضي ناجح
            $payment = PaymentUserInvitation::create([
                'user_invitation_id' => $userInvitation->id,
                'value' => $request->input('total_price', 0),
                'status' => 1,
                'payment_uuid' => 'test_payment_' . uniqid(),
                'id_payment' => 'FAKE_PAYMENT_ID',
                'payment_method' => 'test_mode'
            ]);

            Log::info('تم إنشاء دفع وهمي ناجح', [
                'user_id' => $user->id,
                'payment_uuid' => $payment->payment_uuid
            ]);

            return response()->json([
                'success' => true,
                'message' => 'تم الدفع بنجاح (اختباري)',
                'data' => [
                    'payment' => $payment,
                    'user_invitation' => $userInvitation,
                    'payment_uuid' => $payment->payment_uuid
                ]
            ], 200);
        } catch (\Exception $e) {
            Log::error("Error in testPayment: " . $e->getMessage(), [
                'request_data' => $request->all(),
                'user_id' => auth('api')->id()
            ]);

            return response()->json([
                'message' => 'حدث خطأ أثناء معالجة الطلب.',
                'errors' => [$e->getMessage()],
                'success' => false
            ], 500);
        }
    }

    public function payment(Request $request)
    {
        Log::info("================= Start Payment Request =================");
        Log::info("Request Data: ", $request->all());
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
            'user_invitation_id' => ['nullable', 'integer', 'exists:user_invitations,id'],
            'text'               => ['nullable', 'array'],
            'text.color'         => ['nullable', 'string'],
            'text.size'          => ['nullable', 'integer'],
            'text.font'          => ['nullable', 'string'],
            'text.x'             => ['nullable', 'numeric'],
            'text.y'             => ['nullable', 'numeric'],
        ]);

        // Check if file is uploaded and valid
        if ($request->hasFile('file') && !$request->file('file')->isValid()) {
            return response()->json([
                'message' => 'الملف المرفوع غير صالح.',
                'errors'  => ['file' => 'الملف تالف أو غير مكتمل التحميل.'],
                'success' => false,
            ], 422);
        }

        if (!isset($validatedData['text']) && !empty($validatedData['user_invitation_id'])) {
            $previousInvitation = UserInvitation::find($validatedData['user_invitation_id']);

            if ($previousInvitation && $previousInvitation->text_settings) {
                $validatedData['text'] = $previousInvitation->text_settings;
                Log::info('Text settings inherited from previous invitation:', $validatedData['text']);
            }
        }

        Log::info("Validated Data: ", $validatedData);


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
            Log::error("Payment Error: " . $e->getMessage(), [
                'request_data' => $request->all(),
                'user_id'      => auth('api')->id(),
            ]);
            // Handle unexpected errors
            return response()->json([
                'message' => 'حدث خطأ أثناء معالجة الطلب.',
                'errors'  => [$e->getMessage()],
                'success' => false,
            ], 500);
        }
    }

    public function paymentP(Request $request)
    {
        Log::info("================= Start Payment Request P =================");
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

        Log::info("Validated Data P: ", $validated);

        // check if the user has already paid for this package
        if (!empty($errors)) {
            Log::error("Payment Validation Errors: ", $errors);
            return response()->json([
                'message' => 'فشل التحقق من البيانات.',
                'errors' => $errors
            ], 422);
        }

        // check if the user has already paid for this package
        $payment = $this->paymentService->initiatePaymentP($validated, auth('api')->user());

        Log::info("Payment Response P: ", $payment);
        // check if the user has already paid for this package
        if (is_array($payment)) {
            return $this->handlePaymentResponseP($payment['pay'], $payment['cart_id'], $payment['user_package']);
        } else {
            return $payment;
        }
    }

    public function returnAction(Request $request)
    {
        Log::info("================= Start Return Action =================");
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

            Log::info("Return Action Data: ", $data);

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

                Log::info("Payment Updated: ", $payment->toArray());
            //    $userPackage= UserPackage::where('payment_user_invitation_id',$payment->id)->first();
            $user = User::where('id', $payment->user_id)->first();

            Log::info("User Found: ", $user->toArray());

            $userPackage = UserPackage::where('payment_user_invitation_id', $payment->id)->first();
            if ($userPackage) {
                // Update UserInvitation records related to the user package
                UserInvitation::where('user_package_id', $userPackage->id)->update([
                    'is_active' => 1,
                ]);

                $invitationData = Invitation::where('id', $userPackage->invitation_id)->first();
            }
               $paymentData = PaymentUserInvitation::where('payment_uuid', $payment_uuid)->first();
                $pdfPath = generateInvoicePDF($paymentData, $user, $userPackage, $invitationData);
            Log::info("PDF Path: ", ['pdf_path' => $pdfPath]);
            if ($pdfPath) {
                // Send the invoice via WhatsApp
                $sent = sendInvoiceViaWhatsapp($user->phone, $pdfPath, $invitationData);

                if ($sent) {
                    Log::info('Invoice sent successfully to user phone: ' . $user->phone);
                } else {
                    Log::error('Failed to send invoice to user phone: ' . $user->phone);
                }
            } else {
                Log::error('Failed to generate invoice PDF for payment ID: ' . $payment->id);
            }
                return response()->json([
                    'data' => [
                        'payment' => PaymentUserInvitation::where('payment_uuid',$payment_uuid)->first(),
                        'user' => $user,
                        'user_package' => $userPackage,
                        'invitation' => $invitationData,
                    ],
                    'message' => 'تم الدفع بنجاح',
                    'status' => $status,
                ], 200);
            }
            // Handle failure case
            elseif ($status == 400) {
                $payment=PaymentUserInvitation::where('payment_uuid',$payment_uuid)->first();
                Log::info("payment error: ", $payment->toArray());
                $payment->delete();
                Log::info("Payment Deleted: ", ['payment_uuid' => $payment_uuid]);
                return response()->json([
                    'message' => 'فشل الدفع',
                    'status' => $status,
                ], 400);
            }
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
