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
            ->where('send_status', 'sent')
            ->count();
        $remaining = $totalAllowed - $currentCount;

        if ($remaining <= 0) {
            return errorResponse('تم الوصول للحد الأقصى للدعوات');
        }

        $batchSize = min($remaining, count($request->name));
        $sendResults = [];
        $successfulSends = 0;
        for ($i = 0; $i < $batchSize; $i++) {
            try {
                // check if the required fields are set
                if (!isset($request->name[$i], $request->phone[$i], $request->code[$i], $request->qr[$i])) {
                    $sendResults[] = [
                        'index' => $i,
                        'phone' => $request->phone[$i] ?? 'N/A',
                        'success' => false,
                        'error' => 'بيانات ناقصة'
                    ];
                    continue;
                }

                // process the QR code and generate the image name
                $imageName = ImageTemplate::process($request->qr[$i], $request->name[$i], $userInvitation);
                 //create the invited user
                $invitedUser = InvitedUsers::create([
                    'name' => $request->name[$i],
                    'phone' => $request->phone[$i],
                    'code' => $request->code[$i],
                    'qr' => $imageName,
                    'user_invitations_id' => $userInvitation->id,
                    'send_status' => 'pending'
                ]);

                // retry to send the message with a maximum of 3 attempts
                $maxRetries = 3;
                $retryCount = 0;
                $sent = false;

                while ($retryCount < $maxRetries && !$sent) {
                    $sent = sendWhatsappImage(
                        $invitedUser->phone,
                        $userInvitation->getFirstMediaUrl('userInvitation'),
                        $userInvitation->user->phone ?? 'غير متوفر',
                        $userInvitation->name ?? 'غير متوفر',
                        $userInvitation->user->name ?? 'غير متوفر',
                        $userInvitation->invitation_date ?? 'غير متوفر',
                        $userInvitation->invitation_time ?? 'غير متوفر',
                        $userInvitation->getFirstMediaUrl('qr')
                    );

                    if (!$sent) {
                        $retryCount++;
                        sleep(1); // resend after 1 second
                        Log::info('Retrying to send WhatsApp message', [
                            'attempt' => $retryCount,
                            'phone' => $invitedUser->phone
                        ]);
                    }
                }

                if ($sent) {
                    $invitedUser->update(['send_status' => 'sent']);
                    $successfulSends++;
                    $sendResults[] = [
                        'index' => $i,
                        'phone' => $invitedUser->phone,
                        'success' => true
                    ];
                } else {
                    $invitedUser->update([
                        'send_status' => 'failed',
                        'error_message' => 'فشل الإرسال بعد ' . $maxRetries . ' محاولات'
                    ]);
                    $sendResults[] = [
                        'index' => $i,
                        'phone' => $invitedUser->phone,
                        'success' => false,
                        'error' => 'فشل الإرسال'
                    ];
                }
            } catch (\Exception $e) {
                $sendResults[] = [
                    'index' => $i,
                    'phone' => $request->phone[$i] ?? 'N/A',
                    'success' => false,
                    'error' => $e->getMessage()
                ];
            }
        }

        $userInvitation->update([
            'number_invitees' => $currentCount + $successfulSends
        ]);

        return response()->json([
            'message' => 'تمت معالجة الدعوات',
            'total' => $batchSize,
            'successful' => $successfulSends,
            'failed' => $batchSize - $successfulSends,
            'results' => $sendResults
        ]);
    }

    public function addInviteUsersP(InviteRequestP $request, UserPackage $userPackage)
    {
        // Check payment status
        if ($userPackage->payment->status == 0) {
            return response()->json(['message' => 'لم يتم الدفع'], 400);
        }

        // Check the validity of the private package (expiration date)
        try {
            PaymentUserInvitation::chickExpirartionPrivateInvitation($userPackage->id);
        } catch (\Throwable $th) {
            throw $th;
        }

        // Create a new invitation
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

        // Add media file (e.g., image or PDF)
        if ($request->hasFile('file')) {
            $userInvitation->addMedia($request->file('file'))->toMediaCollection('userInvitation');
        }

        // Ensure the number of invitations does not exceed the allowed limit
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

        // Limit the number of invitations to send
        $totalRequests = count($request->name);
        $batchSize = min($remainingInvitations, $totalRequests);

        $sendResults = [];
        $successfulSends = 0;

        for ($index = 0; $index < $batchSize; $index++) {
            try {
                // Check if all required fields are set
                if (!isset($request->name[$index], $request->phone[$index], $request->code[$index], $request->qr[$index])) {
                    $sendResults[] = [
                        'index' => $index,
                        'phone' => $request->phone[$index] ?? 'N/A',
                        'success' => false,
                        'error' => 'بيانات ناقصة'
                    ];
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
                $maxRetries = 3;
                $retryCount = 0;
                $sent = false;

                while ($retryCount < $maxRetries && !$sent) {
                    $sent = sendWhatsappImage(
                        $invitedUser->phone,
                        $userInvitation->getFirstMediaUrl('userInvitation'),
                        $userInvitation->user->phone ?? 'غير متوفر',
                        $userInvitation->name ?? 'غير متوفر',
                        $userInvitation->user->name ?? 'غير متوفر',
                        $userInvitation->invitation_date ?? 'غير متوفر',
                        $userInvitation->invitation_time ?? 'غير متوفر',
                        $userInvitation->getFirstMediaUrl('qr')
                    );

                    if (!$sent) {
                        $retryCount++;
                        sleep(1); // Wait before retrying
                        Log::info('Retry sending message:', ['attempt' => $retryCount, 'phone' => $invitedUser->phone]);
                    }
                }

                // Update the sending status based on the result
                if ($sent) {
                    $invitedUser->update(['send_status' => 'sent']);
                    $successfulSends++;
                    $sendResults[] = [
                        'index' => $index,
                        'phone' => $invitedUser->phone,
                        'success' => true
                    ];
                } else {
                    $invitedUser->update([
                        'send_status' => 'failed',
                        'error_message' => 'Failed after ' . $maxRetries . ' attempts'
                    ]);
                    $sendResults[] = [
                        'index' => $index,
                        'phone' => $invitedUser->phone,
                        'success' => false,
                        'error' => 'فشل الإرسال'
                    ];
                }
            } catch (\Exception $e) {
                $sendResults[] = [
                    'index' => $index,
                    'phone' => $request->phone[$index] ?? 'N/A',
                    'success' => false,
                    'error' => $e->getMessage()
                ];
            }
        }

        // Update the number of successfully sent invitations
        $userInvitation->update([
            'number_invitees' => $currentInviteCount + $successfulSends
        ]);

        // Return the final results
        return response()->json([
            'message' => 'تمت معالجة الدعوات',
            'total' => $batchSize,
            'successful' => $successfulSends,
            'failed' => $batchSize - $successfulSends,
            'results' => $sendResults
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
}
