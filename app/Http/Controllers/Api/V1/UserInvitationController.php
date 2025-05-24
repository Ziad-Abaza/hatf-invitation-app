<?php

namespace App\Http\Controllers\Api\V1;

use DateTime;
use Carbon\Carbon;
use App\Models\Invitation;
use App\Models\UserPackage;
use App\Models\InvitedUsers;
use Illuminate\Http\Request;
use App\Models\UserInvitation;
use App\Services\ImageTemplate;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Models\PaymentUserInvitation;
use App\Services\UserInvitationService;
use App\Jobs\SendOpeningInvitationJob;
use App\Http\Requests\Api\UserInvitation\StoreRequest;
use App\Http\Requests\Api\UserInvitation\InviteRequest;
use App\Http\Requests\Api\UserInvitation\InviteOpeningRequest;
use App\Http\Requests\Api\UserInvitation\InviteRequestP;
use App\Http\Resources\UserInvitation\UserInvitationResource;
use App\Http\Resources\UserInvitation\UserPrivateInvitationResource;
use App\Http\Requests\Api\UserInvitation\PaymentUserInvitationRequest;
use App\Jobs\SendInvitationJob;
use App\Jobs\BulkSendPrivateInvitationsJob;
use App\Jobs\SendPrivateInvitationJob;



class UserInvitationController extends Controller
{
    public function index()
    {
        $userInvitation = UserInvitation::where('user_id', auth('api')->id())->with('invitedUsers', 'invitation', 'userPackage.payment')->get();
        $userInvitation = UserInvitationResource::collection($userInvitation);
        return successResponseDataWithMessage($userInvitation);
    }

    public function show(UserInvitation $userInvitation)
    {
        if ($userInvitation->user_id != auth('api')->id())
            return errorResponse('You do not have access', 403);

        $userInvitation = UserInvitationResource::make($userInvitation);
        return successResponseDataWithMessage($userInvitation);
    }

    public function create(StoreRequest $request)
    {
        $invitation = Invitation::find($request->invitation_id);

        if (auth()->user()->subscription !== 'vip' && $invitation->max_date !== 'unlimited') {
            return errorResponse('غير مصرح بشراء هذه الباقة', 404);
        }

        $userInvitation = UserInvitation::create([
            'state'                    => UserInvitation::AVAILABLE,
            'number_invitees'          => 0,
            'user_id'                  => auth('api')->id(),
            'invitation_id'            => $invitation->getKey(),
            'invitation_date'          => $request->invitation_date,
            'invitation_time'          => $request->invitation_time,
        ]);

        $userInvitation->addMedia($request->file('file'))->toMediaCollection('default');

        PaymentUserInvitation::create([
            'user_invitation_id' => $userInvitation->getKey(),
        ]);

        $userInvitation = UserInvitationResource::make($userInvitation);
        return successResponseDataWithMessage($userInvitation);
    }

    public function validateInviteUsersBeforePayment(InviteRequest $request, UserInvitation $userInvitation)
    {
        // check if the user has access to the invitation
        if ($userInvitation->user_id != auth('api')->id()) {
            return errorResponse('You do not have access', 403);
        }

        // check if the user has paid for the package
        if (empty($userInvitation->getFirstMediaUrl('userInvitation'))) {
            return errorResponse('لا يوجد ملف دعوة مرفق.');
        }

        // check if the user has paid for the package
        $totalAllowed = $userInvitation->number_invitees;
        $currentCount = InvitedUsers::where('user_invitations_id', $userInvitation->id)
            ->where('send_status', 'send')
            ->count();
        $remaining = $totalAllowed - $currentCount;

        if ($totalAllowed <= $currentCount) {
            return errorResponse('تم الوصول للحد الأقصى للدعوات');
        }

        // check if the number of invitations doesn't exceed allowed limit
        $errors = [];

        foreach ($request->name as $index => $name) {
            if (!isset($request->name[$index], $request->phone[$index], $request->code[$index], $request->qr[$index])) {
                $errors[] = "بيانات ناقصة في الدعوة رقم " . ($index + 1) . ".";
                continue;
            }


            if (!preg_match('/^9665\d{8}$/', $request->phone[$index])) {
                $errors[] = "رقم الهاتف في الدعوة رقم " . ($index + 1) . " غير صالح.";
                continue;
            }
        }

        if (!empty($errors)) {
            return response()->json([
                'message' => 'خطأ في البيانات.',
                'errors' => $errors,
                'success' => false
            ], 422);
        }

        // if the validation passes, return a success response
        return response()->json([
            'message' => 'البيانات صحيحة وجاهزة لإتمام الدفع.',
            'success' => true
        ]);
    }

    public function addInviteUsers(InviteRequest $request, UserInvitation $userInvitation)
    {
        if ($userInvitation->user_id != auth('api')->id()) {
            return errorResponse('You do not have access', 403);
        }

        if ($userInvitation->userPackage->payment->status == 0) {
            return response()->json(['message' => 'not payment'], 400);
        }

        if ($userInvitation->is_active == 0) {
            return errorResponse('لم يتم الدفع بعد');
        }

        // replace phone 966530000000 with 201006403927 for testing
        if ($request->has('phone')) {
            // 1. انسخ المصفوفة إلى متغيّر جديد
            $phones = $request->input('phone');

            // 2. عدّل على نسخة المصفوفة
            foreach ($phones as $index => $phone) {
                if ($phone === '966530000000') {
                    $phones[$index] = '201006403927';
                }
            }

            // 3. أعد دمج المصفوفة المعدلة في الـRequest
            $request->merge(['phone' => $phones]);
        }

        // Ensure the number of invitations doesn't exceed allowed limit
        $totalAllowed = $userInvitation->number_invitees;
        $currentCount = InvitedUsers::where('user_invitations_id', $userInvitation->id)
            ->where('send_status', 'send')
            ->count();
        $remaining = $totalAllowed - $currentCount;

        if ($totalAllowed <= $currentCount) {
            return errorResponse('تم الوصول للحد الأقصى للدعوات');
        }

        // check if the number of invitations doesn't exceed allowed limit
        $errors = [];

        foreach ($request->name as $index => $name) {
            if (!isset($request->name[$index], $request->phone[$index], $request->code[$index], $request->qr[$index])) {
                $errors[] = "بيانات ناقصة في الدعوة رقم " . ($index + 1) . ".";
                continue;
            }
        }

        if (!empty($errors)) {
            return response()->json([
                'message' => 'خطأ في البيانات.',
                'errors' => $errors,
                'success' => false
            ], 422);
        }

        $batchSize = min($remaining, count($request->name));
        $invitedUsersData = [];

        foreach (range(0, $batchSize - 1) as $index) {
            try {
                // Check if all required fields are set
                $imageName = ImageTemplate::process(
                    $request->qr[$index],
                    $request->name[$index],
                    $userInvitation
                );

                // Create a new invited user record
                $invitedUser = InvitedUsers::create([
                    'name' => $request->name[$index],
                    'phone' => $request->phone[$index],
                    'code' => $request->code[$index],
                    'qr' => $imageName,
                    'user_invitations_id' => $userInvitation->id,
                    'send_status' => 'pending'
                ]);

                dispatch(new SendInvitationJob(
                    $invitedUser->id,
                    $userInvitation->id
                ))->onQueue('high');
            } catch (\Exception $e) {
                Log::error('Error creating invited user: ' . $e->getMessage());
            }
        }

        return response()->json([
            'message' => 'جارٍ معالجة الدعوات في الخلفية...',
            'total_queued' => $batchSize,
            'success' => true
        ]);
    }

    /*
    |===============================================
    |addInvite Opening Users
    |===============================================
    */


    public function addInviteOpeningUsers(InviteOpeningRequest $request, UserInvitation $userInvitation)
    {
        Log::info('Start addInviteOpeningUsers', [
            'user_id' => auth('api')->id(),
            'user_invitation_id' => $userInvitation->id
        ]);

        if ($userInvitation->user_id != auth('api')->id()) {
            Log::warning('Unauthorized access attempt', [
                'auth_user' => auth('api')->id(),
                'owner_user_id' => $userInvitation->user_id
            ]);
            return errorResponse('You do not have access', 403);
        }

        // replace phone 966530000000 with 201006403927 for testing
        if ($request->has('phone')) {
            // 1. انسخ المصفوفة إلى متغيّر جديد
            $phones = $request->input('phone');

            // 2. عدّل على نسخة المصفوفة
            foreach ($phones as $index => $phone) {
                if ($phone === '966530000000') {
                    $phones[$index] = '201006403927';
                }
            }

            // 3. أعد دمج المصفوفة المعدلة في الـRequest
            $request->merge(['phone' => $phones]);
        }


        if ($userInvitation->userPackage->payment->status == 0) {
            Log::info('User has not paid yet', [
                'user_id' => auth('api')->id()
            ]);
            return response()->json(['message' => 'not payment'], 400);
        }

        if ($userInvitation->is_active == 0) {
            Log::info('Invitation is not active', [
                'user_invitation_id' => $userInvitation->id
            ]);
            return errorResponse('لم يتم الدفع بعد');
        }

        $totalAllowed = $userInvitation->number_invitees;
        $currentCount = InvitedUsers::where('user_invitations_id', $userInvitation->id)
            ->where('send_status', 'send')
            ->count();

        Log::info('Invitation count check', [
            'allowed' => $totalAllowed,
            'current' => $currentCount
        ]);

        if ($totalAllowed <= $currentCount) {
            Log::warning('Invitation limit reached', [
                'user_invitation_id' => $userInvitation->id
            ]);
            return errorResponse('تم الوصول للحد الأقصى للدعوات');
        }

        $errors = [];
        foreach ($request->name as $index => $name) {
            if (!isset($request->name[$index], $request->phone[$index], $request->code[$index], $request->qr[$index])) {
                $errors[] = "بيانات ناقصة في الدعوة رقم " . ($index + 1) . ".";
                Log::warning('Incomplete data in invite', [
                    'index' => $index,
                    'data' => $request->all()
                ]);
                continue;
            }

            // إذا كنت ستفعل التحقق من الرقم:
            // if (!preg_match('/^9665\d{8}$/', $request->phone[$index])) {
            //     $errors[] = "رقم الهاتف في الدعوة رقم " . ($index + 1) . " غير صالح.";
            //     Log::warning('Invalid phone format', ['phone' => $request->phone[$index]]);
            //     continue;
            // }
        }

        if (!empty($errors)) {
            Log::info('Validation failed', ['errors' => $errors]);
            return response()->json([
                'message' => 'خطأ في البيانات.',
                'errors' => $errors,
                'success' => false
            ], 422);
        }

        $batchSize = min($totalAllowed - $currentCount, count($request->name));
        Log::info('Batch processing', [
            'batch_size' => $batchSize,
            'text_settings' => $request->input('text')
        ]);

        $textSettings = $request->input('text');
        $invitedIds = [];

        foreach (range(0, $batchSize - 1) as $index) {
            try {
                $imageName = ImageTemplate::process(
                    $request->qr[$index],
                    $request->name[$index],
                    $userInvitation
                );

                $imageUrl = ImageTemplate::processOpening(
                    $request->qr[$index],
                    $request->name[$index],
                    $userInvitation,
                    $textSettings
                );

                $invitedUser = InvitedUsers::create([
                    'name' => $request->name[$index],
                    'phone' => $request->phone[$index],
                    'code' => $request->code[$index],
                    'qr' => $imageName,
                    'user_invitations_id' => $userInvitation->id,
                    'send_status' => 'pending'
                ]);

                dispatch(new SendOpeningInvitationJob(
                    $invitedUser,
                    $imageUrl
                ))->onQueue('high');

                Log::info('Invitation queued', [
                    'invited_user_id' => $invitedUser->id,
                    'name' => $request->name[$index]
                ]);

                $invitedIds[] = $invitedUser->id;
            } catch (\Exception $e) {
                Log::error('Error creating invited user', [
                    'error' => $e->getMessage(),
                    'index' => $index,
                    'data' => $request->all()
                ]);
            }
        }

        Log::info('Completed invitation processing', [
            'invited_ids' => $invitedIds,
            'total_queued' => $batchSize
        ]);

        return response()->json([
            'message' => 'جارٍ معالجة الدعوات في الخلفية...',
            'total_queued' => $batchSize,
            'success' => true
        ]);
    }

    public function validateInviteUsersBeforePaymentP(InviteRequestP $request, UserPackage $userPackage)
    {
        // check if the user has access to the package
        if ($request->hasFile('file') && !$request->file('file')->isValid()) {
            return response()->json([
                'message' => 'الملف غير صالح.',
                'success' => false
            ], 400);
        }

        // check if the user has paid for the package
        $userInvitation = UserInvitation::where('user_package_id', $userPackage->id)->first();

        if (!$userInvitation) {
            return response()->json([
                'message' => 'لم يتم العثور على الدعوة المرتبطة بهذه الباقة.',
                'success' => false
            ], 404);
        }

        $totalAllowed = $request->number_invitees;
        $currentCount = InvitedUsers::where('user_invitations_id', $userInvitation->id)
            ->where('send_status', 'sent')
            ->count();
        $remaining = $totalAllowed - $currentCount;

        if ($totalAllowed <= $currentCount) {
            return response()->json([
                'message' => 'فشل إرسال الدعوات',
                'error' => "عدد الدعوات المرسلة ($currentCount) يساوي الحد المسموح ($totalAllowed)"
            ], 400);
        }

        // check if the number of invitations doesn't exceed allowed limit
        $errors = [];

        foreach ($request->name as $index => $name) {
            // check if all required fields are set
            if (!isset($request->name[$index]) || !isset($request->phone[$index]) || !isset($request->code[$index]) || !isset($request->qr[$index])) {
                $errors[] = "الدعوة رقم " . ($index + 1) . " تحتوي على بيانات ناقصة.";
                continue;
            }

            // Check if the phone number is valid
            if (!preg_match('/^9665\d{8}$/', $request->phone[$index])) {
                $errors[] = "رقم الهاتف في الدعوة رقم " . ($index + 1) . " غير صالح.";
            }
        }

        if (!empty($errors)) {
            return response()->json([
                'message' => 'فشل التحقق من بعض الدعوات.',
                'errors' => $errors
            ], 422);
        }

        // if the validation passes, return a success response
        return response()->json([
            'message' => 'البيانات تم التحقق منها بنجاح.',
            'success' => true
        ]);
    }

    public function addInviteUsersP(InviteRequestP $request, UserPackage $userPackage)
    {
        if ($userPackage->payment->status == 0) {
            return response()->json(['message' => 'لم يتم الدفع'], 400);
        }

        // replace phone 966530000000 with 201006403927 for testing
        if ($request->has('phone')) {
            // 1. انسخ المصفوفة إلى متغيّر جديد
            $phones = $request->input('phone');

            // 2. عدّل على نسخة المصفوفة
            foreach ($phones as $index => $phone) {
                if ($phone === '966530000000') {
                    $phones[$index] = '201006403927';
                }
            }

            // 3. أعد دمج المصفوفة المعدلة في الـRequest
            $request->merge(['phone' => $phones]);
        }


        try {
            PaymentUserInvitation::chickExpirartionPrivateInvitation($userPackage->id);
        } catch (\Throwable $th) {
            throw $th;
        }

        $user = auth('api')->user();
        $userInvitation = UserInvitation::create([
            'state'           => UserInvitation::AVAILABLE,
            'name'            => $request->invitation_name,
            'number_invitees' => $request->number_invitees,
            'user_id'         => $user->id,
            'invitation_id'   => $userPackage->invitation->id,
            'invitation_date' => $request->invitation_date,
            'invitation_time' => $request->invitation_time,
            'user_package_id' => $userPackage->id,
            'is_active'       => 1
        ]);

        if ($request->hasFile('file')) {
            $userInvitation->addMedia($request->file('file'))->toMediaCollection('userInvitation');
        }

        $totalAllowed = $userInvitation->number_invitees;
        $currentCount = InvitedUsers::where('user_invitations_id', $userInvitation->id)
            ->where('send_status', 'sent')
            ->count();
        $remaining = $totalAllowed - $currentCount;

        if ($totalAllowed <= $currentCount) {
            return response()->json([
                'message' => 'فشل إرسال الدعوات',
                'data' => $userInvitation,
                'error' => "عدد الدعوات المرسلة ($currentCount) يساوي الحد المسموح ($totalAllowed)"
            ], 400);
        }

        // check if the number of invitations doesn't exceed allowed limit
        $errors = [];
        foreach ($request->name as $index => $name) {
            if (
                !isset($request->name[$index]) ||
                !isset($request->phone[$index]) ||
                !isset($request->code[$index]) ||
                !isset($request->qr[$index])
            ) {
                $errors[] = "الدعوة رقم " . ($index + 1) . " تحتوي على بيانات ناقصة.";
                continue;
            }

            //  Check if the phone number is valid like 966591234567
            // if (!preg_match('/^9665\d{8}$/', $request->phone[$index])) {
            //     $errors[] = "رقم الهاتف في الدعوة رقم " . ($index + 1) . " غير صالح.";
            // }
        }

        if (!empty($errors)) {
            return response()->json([
                'message' => 'فشل التحقق من بعض الدعوات.',
                'errors' => $errors
            ], 422);
        }

        // Process the QR code and create invited users
        $invitedUsersData = [];
        foreach ($request->name as $index => $name) {
            try {
                $imageName = ImageTemplate::process($request->qr[$index], $request->name[$index], $userInvitation);

                $invitedUser = InvitedUsers::create([
                    'name' => $request->name[$index],
                    'phone' => $request->phone[$index],
                    'code' => $request->code[$index],
                    'qr' => $imageName,
                    'user_invitations_id' => $userInvitation->id,
                    'send_status' => 'pending'
                ]);

                $invitedUsersData[] = $invitedUser->id;
            } catch (\Exception $e) {
                // Log the error and continue
                return response()->json([
                    'message' => 'حدث خطأ أثناء حفظ الدعوات.',
                    'error' => $e->getMessage()
                ], 500);
            }
        }

        dispatch(new BulkSendPrivateInvitationsJob($invitedUsersData, $userInvitation->id))
            ->onQueue('high')
            ->delay(now()->addSeconds(1));

        return response()->json([
            'message' => 'تم التحقق من الدعوات وإرسالها للمعالجة.',
            'total_queued' => count($invitedUsersData),
            'success' => true
        ]);
    }

    public function scanQr(Request $request, UserInvitation $userInvitation)
    {
        $invitedUsers = InvitedUsers::where('user_invitations_id', $userInvitation->id)->where('code', $request->code)->first();

        if (!$invitedUsers || $invitedUsers->status)
            return errorResponse('غير مصرح لة با الدخول او لقد تم استخدام رمز التحقق من قبل', 403);

        if ((new DateTime() > (clone new DateTime($userInvitation->invitation_date))->modify('+2 days')))
            return errorResponse('لقد اقيمت الدعوى منذ يومين او اكثر', 403);

        if (! $userInvitation->time)
            $userInvitation->update(['time' => now()]);

        $invitedUsers->update(['status' => 1]);
        return successResponse('مصرح لة با الدخول');
    }

    public function successPaymentUserInvitation(PaymentUserInvitationRequest $request, PaymentUserInvitation $paymentUserInvitation)
    {
        $paymentUserInvitation->update([
            'id_payment' => $request->id_payment,
            'value'      => $request->value,
            'status'     => 1,
        ]);

        UserInvitation::find($paymentUserInvitation->id)->update(['is_active' => 1]);

        return successResponse('تم تسجيل الدفع بنجاح');
    }

    public function userPrivateInvitation()
    {
        //  $invitation->max_date !== 'unlimited'

        $userPackages = UserPackage::where('user_id', auth('api')->id())
            ->whereHas('payment', function ($query) {
                $query->where('status', '=', 1);
            })
            ->whereHas('invitation', function ($query) {
                $query->where('max_date', '!=', 'unlimited');
            })
            ->with('invitation')
            ->get();

        $userInvitation = UserPrivateInvitationResource::collection($userPackages);

        return successResponseDataWithMessage($userInvitation);
    }


    public function userInvitationArchive(UserInvitation $userInvitation)
    {

        $userInvitation->update(['type' => 'exclude']);

        return successResponseDataWithMessage('تم حذف بنجاح', 200);
    }


    public function checkInvitationStatus(UserInvitation $userInvitation)
    {
        // check if the user has access to the invitation
        if ($userInvitation->user_id != auth('api')->id()) {
            return errorResponse('You do not have access', 403);
        }

        // Retrieve the invited users associated with the invitation
        $invitedUsers = InvitedUsers::where('user_invitations_id', $userInvitation->id)->get();

        // Check if there are any invited users
        $sent = [];
        $failed = [];
        $pending = [];

        foreach ($invitedUsers as $user) {
            $details = [
                'name' => $user->name,
                'phone' => $user->phone,
                'code' => $user->code,
                'qr' => $user->qr,
            ];

            if ($user->send_status === 'sent') {
                $sent[] = $details;
            } elseif ($user->send_status === 'failed') {
                $failed[] = array_merge($details, [
                    'error_message' => $user->error_message ?? 'No error message available',
                ]);
            } else {
                $pending[] = $details;
            }
        }

        // Return the response with the summary and details
        return response()->json([
            'invitation_details' => [
                'id' => $userInvitation->id,
                'name' => $userInvitation->name,
                'number_invitees' => $userInvitation->number_invitees,
                'invitation_date' => $userInvitation->invitation_date,
                'invitation_time' => $userInvitation->invitation_time,
            ],
            'summary' => [
                'total_sent' => count($sent),
                'total_failed' => count($failed),
                'total_pending' => count($pending),
                'remaining' => $userInvitation->number_invitees - count($sent),
            ],
            'details' => [
                'sent' => $sent,
                'failed' => $failed,
                'pending' => $pending,
            ],
        ]);
    }
}
