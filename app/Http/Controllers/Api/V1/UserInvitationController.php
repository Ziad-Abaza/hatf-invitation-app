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
use App\Http\Requests\Api\UserInvitation\StoreRequest;
use App\Http\Requests\Api\UserInvitation\InviteRequest;
use App\Http\Requests\Api\UserInvitation\InviteRequestP;
use App\Http\Resources\UserInvitation\UserInvitationResource;
use App\Http\Resources\UserInvitation\UserPrivateInvitationResource;
use App\Http\Requests\Api\UserInvitation\PaymentUserInvitationRequest;
use App\Jobs\SendInvitationJob;
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
    public function addInviteUsers(InviteRequest $request, UserInvitation $userInvitation)
    {
        if ($userInvitation->user_id != auth('api')->id()) {
            return errorResponse('You do not have access', 403);
        }

        if ($userInvitation->userPackage->payment->status == 0) {
            return response()->json(['message' => 'not paymnet'], 400);
        }

        if ($userInvitation->is_active == 0) {
            return errorResponse('لم يتم الدفع بعد');
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

        $batchSize = min($remaining, count($request->name));
        $invitedUserIds = [];

        foreach ($request->name as $index => $name) {
            try {
                // Check if all required fields are set
                if (!isset($request->name[$index], $request->phone[$index], $request->code[$index], $request->qr[$index])) {
                    Log::warning('Missing data for invitation at index: ' . $index);
                    continue;
                }

                // Process QR and preview the image
                $imageName = ImageTemplate::process($request->qr[$index], $request->name[$index], $userInvitation);

                // Create a new invited user record
                $invitedUser = InvitedUsers::create([
                    'name' => $request->name[$index],
                    'phone' => $request->phone[$index],
                    'code' => $request->code[$index],
                    'qr' => $imageName,
                    'user_invitations_id' => $userInvitation->id,
                    'send_status' => 'pending'
                ]);

                // Retry sending the message
                $invitedUserIds[] = $invitedUser->id;
            } catch (\Exception $e) {
                Log::error('Error creating invited user: ' . $e->getMessage());
            }
        }

        // Check if there are any invited users to process
        foreach ($invitedUserIds as $userId) {
            $invitedUser = InvitedUsers::find($userId);
            dispatch(new SendInvitationJob(
                $invitedUser,
                $userInvitation->getFirstMediaUrl('userInvitation'),
                $userInvitation
            ))->onQueue('high');
        }

        // Update the number of successfully sent invitations
        return response()->json([
            'message' => 'جارٍ معالجة الدعوات في الخلفية...',
            'total_queued' => count($invitedUserIds),
            'success' => true
        ]);
    }
    public function addInviteUsersP(InviteRequestP $request, UserPackage $userPackage)
    {
        // التحقق من حالة الدفع
        if ($userPackage->payment->status == 0) {
            return response()->json(['message' => 'لم يتم الدفع'], 400);
        }

        // التحقق من صلاحية الباقة الخاصة (تاريخ انتهاء الصلاحية)
        try {
            PaymentUserInvitation::chickExpirartionPrivateInvitation($userPackage->id);
        } catch (\Throwable $th) {
            throw $th;
        }

        // إنشاء دعوة جديدة
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

        // إضافة ملف الوسائط (مثل صورة أو ملف PDF)
        if ($request->hasFile('file')) {
            $userInvitation->addMedia($request->file('file'))->toMediaCollection('userInvitation');
        }

        // التحقق من عدد الدعوات المسموح بها
        $totalAllowedInvitations = $userInvitation->number_invitees;
        $currentInviteCount = InvitedUsers::where("user_invitations_id", $userInvitation->id)->count();
        $remainingInvitations = $totalAllowedInvitations - $currentInviteCount;

        if ($remainingInvitations <= 0) {
            return response()->json([
                'message' => 'فشل إرسال الدعوات',
                'data' => $userInvitation,
                'error' => "الدعوات المرسلة " . $currentInviteCount . " تساوي عدد الدعوات التي تم شراؤها " . $totalAllowedInvitations
            ], 400);
        }

        // تحديد عدد الدعوات المطلوب إرسالها
        $totalRequests = count($request->name);
        $batchSize = min($remainingInvitations, $totalRequests);

        $errors = [];

        for ($index = 0; $index < $batchSize; $index++) {
            // التحقق من وجود جميع الحقول المطلوبة
            if (!isset($request->name[$index], $request->phone[$index], $request->code[$index], $request->qr[$index])) {
                $errors[] = [
                    'index' => $index,
                    'phone' => $request->phone[$index] ?? 'N/A',
                    'success' => false,
                    'error' => 'بيانات ناقصة'
                ];
                continue;
            }

            // إرسال المهمة إلى الـ Queue
            dispatch(new SendPrivateInvitationJob([
                'name' => $request->name[$index],
                'phone' => $request->phone[$index],
                'code' => $request->code[$index],
                'qr' => $request->qr[$index],
            ], $userInvitation))->onQueue('high');
        }

        // إذا كانت هناك أخطاء في البيانات، يتم إرجاع الخطأ دون إرسال أي دعوة
        if (!empty($errors)) {
            return response()->json([
                'message' => 'فشل إرسال بعض الدعوات بسبب بيانات ناقصة',
                'errors' => $errors
            ], 400);
        }

        // إرجاع رد فوري بأن الدعوات قيد الإرسال
        return response()->json([
            'message' => 'الدعوات قيد الإرسال في الخلفية...',
            'total_queued' => $batchSize
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
