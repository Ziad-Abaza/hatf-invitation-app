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
        // get all user invitations for the authenticated user
        $userInvitations = UserInvitation::where('user_id', auth('api')->id())
            ->with('invitedUsers', 'invitation', 'userPackage.payment', 'media')
            ->get();

        // merge invitations that share the same invitation_id, invitation_date, and name
        $grouped = $userInvitations->groupBy(function ($item) {
            return $item->invitation_id . '-' . $item->invitation_date . '-' . $item->name;
        });

        // convert the grouped invitations into a new collection of merged models
        $mergedModels = $grouped->map(function ($group) {
            $firstModel = $group->first();
            $mergedInvitedUsers = $group->flatMap->invitedUsers;
            $mergedMedia = $group->flatMap->media;

            // Group media by collection name to avoid duplicates
            $groupedMedia = $mergedMedia->groupBy('collection_name');

            $mergedModel = new UserInvitation();
            $mergedModel->id = $firstModel->id;
            $mergedModel->state = $firstModel->state;
            $mergedModel->name = $firstModel->name;
            $mergedModel->invitation_id = $firstModel->invitation_id;
            $mergedModel->invitation_date = $firstModel->invitation_date;
            $mergedModel->invitation_time = $firstModel->invitation_time;
            $mergedModel->userPackage = $firstModel->userPackage;
            $mergedModel->invitation = $firstModel->invitation;

            // Set the first media of each collection
            $mergedModel->setRelation('media', $mergedMedia);

            // For direct access to specific media types
            $mergedModel->defaultMedia = $groupedMedia->get('default')?->first();
            $mergedModel->userInvitationMedia = $groupedMedia->get('userInvitation')?->first();
            $mergedModel->qrMedia = $groupedMedia->get('qr')?->first();

            $mergedModel->setRelation('invitedUsers', $mergedInvitedUsers);
            $mergedModel->number_invitees = $mergedInvitedUsers->count();

            return $mergedModel;
        });

        $data = UserInvitationResource::collection($mergedModels->values());

        return successResponseDataWithMessage($data);
    }

    public function show(UserInvitation $userInvitation)
    {
        if ($userInvitation->user_id != auth('api')->id()) {
            return errorResponse('You do not have access', 403);
        }

        // get all user invitations for the authenticated user
        $userInvitations = UserInvitation::where('user_id', auth('api')->id())
            ->with('invitedUsers', 'invitation', 'userPackage.payment', 'media')
            ->get();

        // merge invitations that share the same invitation_id, invitation_date, and name
        $grouped = $userInvitations->groupBy(function ($item) {
            return $item->invitation_id . '-' . $item->invitation_date . '-' . $item->name;
        });

        // find the group that contains the specific user invitation
        $targetGroup = $grouped->first(fn($group) => $group->contains(fn($item) => $item->id === $userInvitation->id));

        if (!$targetGroup) {
            return errorResponse('Invitation not found', 404);
        }

        // create a new UserInvitation model to hold the merged data
        $mergedModel = new UserInvitation();
        $firstModel = $targetGroup->first();

        // merge invitedUsers from all models in the group
        $mergedInvitedUsers = $targetGroup->flatMap->invitedUsers;

        // merge media from all models in the group and group by collection name
        $mergedMedia = $targetGroup->flatMap->media;
        $groupedMedia = $mergedMedia->groupBy('collection_name');

        // set the properties of the merged model from the first model in the group
        $mergedModel->id = $firstModel->id;
        $mergedModel->state = $firstModel->state;
        $mergedModel->name = $firstModel->name;
        $mergedModel->invitation_id = $firstModel->invitation_id;
        $mergedModel->invitation_date = $firstModel->invitation_date;
        $mergedModel->invitation_time = $firstModel->invitation_time;
        $mergedModel->userPackage = $firstModel->userPackage;
        $mergedModel->invitation = $firstModel->invitation;

        // Set media relations
        $mergedModel->setRelation('media', $mergedMedia);

        // For direct access to specific media types
        $mergedModel->defaultMedia = $groupedMedia->get('default')?->first();
        $mergedModel->userInvitationMedia = $groupedMedia->get('userInvitation')?->first();
        $mergedModel->qrMedia = $groupedMedia->get('qr')?->first();

        // set the invitedUsers relation to the merged collection
        $mergedModel->setRelation('invitedUsers', $mergedInvitedUsers);

        // update the number of invitees
        $mergedModel->number_invitees = $mergedInvitedUsers->count();

        $data = UserInvitationResource::make($mergedModel);

        return successResponseDataWithMessage($data);
    }
    
    public function create(StoreRequest $request)
    {
        Log::info("========== بدء إنشاء UserInvitation ==========");
        Log::info("بيانات الطلب", $request->all());

        $invitation = Invitation::find($request->invitation_id);

        if (!$invitation) {
            Log::error("لم يتم العثور على الدعوة بالمعرف: " . $request->invitation_id);
            return errorResponse('الدعوة غير موجودة', 404);
        }
        Log::info("تم العثور على الدعوة", ['invitation_id' => $invitation->id]);

        if (auth()->user()->subscription !== 'vip' && $invitation->max_date !== 'unlimited') {
            Log::warning("غير مصرح بشراء هذه الباقة للمستخدم", [
                'user_id' => auth('api')->id(),
                'subscription' => auth()->user()->subscription,
                'invitation_max_date' => $invitation->max_date
            ]);
            return errorResponse('غير مصرح بشراء هذه الباقة', 404);
        }

        try {
            $userInvitation = UserInvitation::create([
                'state'           => UserInvitation::AVAILABLE,
                'number_invitees' => 0,
                'user_id'         => auth('api')->id(),
                'invitation_id'   => $invitation->getKey(),
                'invitation_date' => $request->invitation_date,
                'invitation_time' => $request->invitation_time,
                'text_settings'   => $request->text ?? null,
            ]);
            Log::info("تم إنشاء UserInvitation", ['user_invitation_id' => $userInvitation->id]);

            if ($request->hasFile('file')) {
                $userInvitation->addMedia($request->file('file'))->toMediaCollection('default');
                Log::info("تم إضافة الملف للوسائط (Media Collection)", ['user_invitation_id' => $userInvitation->id]);
            } else {
                Log::info("لا يوجد ملف مرفق في الطلب", ['user_invitation_id' => $userInvitation->id]);
            }

            PaymentUserInvitation::create([
                'user_invitation_id' => $userInvitation->getKey(),
            ]);
            Log::info("تم إنشاء سجل الدفع PaymentUserInvitation", ['user_invitation_id' => $userInvitation->id]);

            $userInvitationResource = UserInvitationResource::make($userInvitation);
            Log::info("========== انتهاء إنشاء UserInvitation بنجاح ==========");
            return successResponseDataWithMessage($userInvitationResource);
        } catch (\Exception $e) {
            Log::error("خطأ أثناء إنشاء UserInvitation: " . $e->getMessage(), [
                'trace' => $e->getTraceAsString()
            ]);
            return errorResponse('حدث خطأ أثناء إنشاء الدعوة', 500);
        }
    }


    public function addInviteUsers(InviteRequest $request, UserInvitation $userInvitation)
    {
        Log::info("========== بدء addInviteUsers ==========");
        Log::info("مستخدم ID:", ['user_id' => auth('api')->id()]);
        Log::info("UserInvitation ID:", ['user_invitation_id' => $userInvitation->id]);
        Log::info("بيانات الطلب:", $request->all());

        if ($userInvitation->user_id != auth('api')->id()) {
            Log::warning("محاولة وصول غير مصرح بها", ['user_invitation_user_id' => $userInvitation->user_id]);
            return errorResponse('You do not have access', 403);
        }

        if ($userInvitation->userPackage->payment->status == 0) {
            Log::warning("لم يتم الدفع بعد", ['user_invitation_id' => $userInvitation->id]);
            return response()->json(['message' => 'not payment'], 400);
        }

        if ($userInvitation->is_active == 0) {
            Log::warning("الدعوة غير مفعلة بسبب عدم الدفع", ['user_invitation_id' => $userInvitation->id]);
            return errorResponse('لم يتم الدفع بعد');
        }

        if ($request->has('phone')) {
            $phones = $request->input('phone');
            Log::info("أرقام الهاتف قبل التعديل", ['phones' => $phones]);

            foreach ($phones as $index => $phone) {
                if ($phone === '966530000000') {
                    $phones[$index] = '201006403927';
                }
            }

            $request->merge(['phone' => $phones]);
            Log::info("أرقام الهاتف بعد التعديل", ['phones' => $phones]);
        }

        $totalAllowed = $userInvitation->number_invitees;
        $currentCount = InvitedUsers::where('user_invitations_id', $userInvitation->id)
            ->where('send_status', 'send')
            ->count();

        Log::info("عدد الدعوات المسموح بها", ['totalAllowed' => $totalAllowed]);
        Log::info("عدد الدعوات المرسلة", ['currentCount' => $currentCount]);

        if ($totalAllowed <= $currentCount) {
            Log::warning("تم الوصول للحد الأقصى للدعوات", ['user_invitation_id' => $userInvitation->id]);
            return errorResponse('تم الوصول للحد الأقصى للدعوات');
        }

        $errors = [];
        foreach ($request->name as $index => $name) {
            if (!isset($request->name[$index], $request->phone[$index], $request->code[$index], $request->qr[$index])) {
                $errors[] = "بيانات ناقصة في الدعوة رقم " . ($index + 1) . ".";
                Log::warning("بيانات ناقصة في الدعوة", ['index' => $index + 1]);
                continue;
            }
        }

        if (!empty($errors)) {
            Log::error("أخطاء في بيانات الدعوات", ['errors' => $errors]);
            return response()->json([
                'message' => 'خطأ في البيانات.',
                'errors' => $errors,
                'success' => false
            ], 422);
        }

        $batchSize = min($totalAllowed - $currentCount, count($request->name));
        Log::info("عدد الدعوات التي سيتم معالجتها", ['batchSize' => $batchSize]);

        $invitationType = $request->input('invitation_type', 'standard');

        $jobClass = $invitationType === 'opening' ? SendOpeningInvitationJob::class : SendInvitationJob::class;

        foreach (range(0, $batchSize - 1) as $index) {
            try {
                $imageName = ImageTemplate::process(
                    $request->qr[$index],
                    $request->name[$index],
                    $userInvitation
                );

                $imageUrl = null;
                if ($invitationType === 'opening') {
                    $imageUrl = ImageTemplate::processOpening($userInvitation, $request->name[$index]);
                }

                $invitedUser = InvitedUsers::create([
                    'name' => $request->name[$index],
                    'phone' => $request->phone[$index],
                    'code' => $request->code[$index],
                    'qr' => $imageName,
                    'user_invitations_id' => $userInvitation->id,
                    'send_status' => 'pending'
                ]);

                Log::info("تم إنشاء دعوة مستخدم", ['invited_user_id' => $invitedUser->id]);

                if ($invitationType === 'opening') {
                    dispatch(new $jobClass($invitedUser->id, $imageUrl))->onQueue('high');
                } else {
                    dispatch(new $jobClass($invitedUser->id, $userInvitation->id))->onQueue('high');
                }

                Log::info("تم إرسال مهمة إرسال الدعوة إلى الطابور", ['invited_user_id' => $invitedUser->id]);
            } catch (\Exception $e) {
                Log::error('خطأ أثناء إنشاء دعوة المستخدم أو إرسال المهمة: ' . $e->getMessage(), [
                    'trace' => $e->getTraceAsString()
                ]);
            }
        }

        Log::info("========== انتهاء addInviteUsers بنجاح ==========");

        return response()->json([
            'message' => 'جارٍ معالجة الدعوات في الخلفية...',
            'total_queued' => $batchSize,
            'success' => true
        ]);
    }

    public function addInviteUsersP(InviteRequestP $request, UserPackage $userPackage)
    {
        Log::info("======= Start addInviteUsersP =======");

        if ($userPackage->payment->status == 0) {
            Log::warning("======= Payment status is 0 - not paid =======");
            return response()->json(['message' => 'لم يتم الدفع'], 400);
        }
        Log::info("======= Payment status checked - paid =======");

        // replace phone 966530000000 with 201006403927 for testing
        if ($request->has('phone')) {
            Log::info("======= Phone numbers received for replacement =======");
            $phones = $request->input('phone');

            foreach ($phones as $index => $phone) {
                if ($phone === '966530000000') {
                    Log::info("======= Replacing phone 966530000000 at index $index =======");
                    $phones[$index] = '201006403927';
                }
            }

            $request->merge(['phone' => $phones]);
            Log::info("======= Phone numbers replaced and merged into request =======");
        }

        try {
            Log::info("======= Checking expiration of private invitation =======");
            PaymentUserInvitation::chickExpirartionPrivateInvitation($userPackage->id);
            Log::info("======= Expiration check passed =======");
        } catch (\Throwable $th) {
            Log::error("======= Expiration check failed: " . $th->getMessage() . " =======");
            throw $th;
        }

        $user = auth('api')->user();
        Log::info("======= Authenticated user ID: " . $user->id . " =======");

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
        Log::info("======= UserInvitation created with ID: " . $userInvitation->id . " =======");

        if ($request->hasFile('file')) {
            Log::info("======= File received, adding to media collection =======");
            $userInvitation->addMedia($request->file('file'))->toMediaCollection('userInvitation');
            Log::info("======= File added to media collection =======");
        }

        $totalAllowed = $userInvitation->number_invitees;
        $currentCount = InvitedUsers::where('user_invitations_id', $userInvitation->id)
            ->where('send_status', 'sent')
            ->count();
        $remaining = $totalAllowed - $currentCount;
        Log::info("======= Invitations allowed: $totalAllowed, sent: $currentCount, remaining: $remaining =======");

        if ($totalAllowed <= $currentCount) {
            Log::warning("======= Invitation limit reached. Cannot send more invitations =======");
            return response()->json([
                'message' => 'فشل إرسال الدعوات',
                'data' => $userInvitation,
                'error' => "عدد الدعوات المرسلة ($currentCount) يساوي الحد المسموح ($totalAllowed)"
            ], 400);
        }

        $errors = [];
        foreach ($request->name as $index => $name) {
            if (
                !isset($request->name[$index]) ||
                !isset($request->phone[$index]) ||
                !isset($request->code[$index]) ||
                !isset($request->qr[$index])
            ) {
                $errors[] = "الدعوة رقم " . ($index + 1) . " تحتوي على بيانات ناقصة.";
                Log::warning("======= Missing data in invitation index $index =======");
                continue;
            }
        }

        if (!empty($errors)) {
            Log::error("======= Validation errors found in invitations: " . json_encode($errors) . " =======");
            return response()->json([
                'message' => 'فشل التحقق من بعض الدعوات.',
                'errors' => $errors
            ], 422);
        }

        $invitedUsersData = [];
        foreach ($request->name as $index => $name) {
            try {
                Log::info("======= Processing invitation index $index =======");
                $imageName = ImageTemplate::process($request->qr[$index], $request->name[$index], $userInvitation);

                $invitedUser = InvitedUsers::create([
                    'name' => $request->name[$index],
                    'phone' => $request->phone[$index],
                    'code' => $request->code[$index],
                    'qr' => $imageName,
                    'user_invitations_id' => $userInvitation->id,
                    'send_status' => 'pending'
                ]);
                Log::info("======= Invited user created with ID: " . $invitedUser->id . " =======");

                $invitedUsersData[] = $invitedUser->id;
            } catch (\Exception $e) {
                Log::error("======= Error creating invited user at index $index: " . $e->getMessage() . " =======");
                return response()->json([
                    'message' => 'حدث خطأ أثناء حفظ الدعوات.',
                    'error' => $e->getMessage()
                ], 500);
            }
        }

        dispatch(new BulkSendPrivateInvitationsJob($invitedUsersData, $userInvitation->id))
            ->onQueue('high')
            ->delay(now()->addSeconds(1));

        Log::info("======= Dispatched BulkSendPrivateInvitationsJob for " . count($invitedUsersData) . " invitations =======");
        Log::info("======= End addInviteUsersP =======");

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
