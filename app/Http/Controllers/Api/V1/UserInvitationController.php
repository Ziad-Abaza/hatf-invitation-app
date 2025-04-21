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
        $user = auth('api')->user();
        $userPackage = $user->userPackage()->latest()->first();

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
            'user_package_id'    => $userPackage?->id,
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
        $totalAllowedInvitations = $userInvitation->number_invitees;
        $currentInviteCount = InvitedUsers::where("user_invitations_id", $userInvitation->id)->count();
        if ($totalAllowedInvitations <= $currentInviteCount) {
            return response()->json([
                'message' => 'فشل ارسال الدعاوى',
                'data' => $userInvitation,
                'error' => "الدعاوى المرسلة " . $currentInviteCount . " تساوى عدد الدعاوى التي تم شرائها " . $totalAllowedInvitations
            ], 400);
        }

        foreach ($request->name as $index => $name) {


            $imageName = ImageTemplate::process($request->qr[$index], $name,$userInvitation);


            $invitedUsers = InvitedUsers::create([
                'name'                => $name,
                'phone'               => $request->phone[$index],
                'code'                => $request->code[$index],
                'qr'                  => $imageName,
                'user_invitations_id' => $userInvitation->id,
            ]);
            if ($userInvitation->getFirstMediaUrl('userInvitation')) {
                // Ensure the path is valid and the file exists
                    sendWhatsappImage(
                        $invitedUsers->phone,
                        $userInvitation->getFirstMediaUrl('userInvitation'),
                        $userInvitation->user->phone ?? 'غير متوفر',
                        $userInvitation->name ?? 'غير متوفر',
                        $userInvitation->user->name ?? 'غير متوفر',
                        $userInvitation->invitation_date ?? 'غير متوفر',
                        $userInvitation->invitation_time ?? 'غير متوفر',
                        $userInvitation->getFirstMediaUrl('qr')
                    );
            }



            Log::info(
                'WhatsApp message sent successfully',
                [
                    'default' => [
                        $invitedUsers->phone,
                        $userInvitation->getFirstMediaUrl('userInvitation'),
                        $userInvitation->user->phone ?? 'غير متوفر',
                        $userInvitation->name ?? 'غير متوفر',
                        $userInvitation->user->name ?? 'غير متوفر',
                        $userInvitation->invitation_date ?? 'غير متوفر',
                        $userInvitation->invitation_time ?? 'غير متوفر',
                        $userInvitation->getFirstMediaUrl('qr'),
                    ]
                ]
            );

            $userInvitation->update(['number_invitees' => $userInvitation->number_invitees + 1]);
            $userInvitation->refresh();
        }

        $userInvitation->clearMediaCollection('default');
        return successResponseDataWithMessage($userInvitation);
    }

    public function addInviteUsersP(InviteRequestP $request, UserPackage $userPackage)
    {



        if ($userPackage->payment->status == 0) {
            return response()->json(['message' => 'not paymnet'], 400);
        }

        //incase private invitation chick if pass created at or not
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
            'is_active' => 1
        ]);

        if ($request->hasFile('file')) {
            $userInvitation->addMedia($request->file('file'))->toMediaCollection('userInvitation');
            // $userInvitation->addMedia($request->file('image'))->toMediaCollection('default');
        }

        // Ensure the number of invitations doesn't exceed allowed limit
        $totalAllowedInvitations = $userInvitation->number_invitees;
        $currentInviteCount = InvitedUsers::where("user_invitations_id", $userInvitation->id)->count();
        if ($totalAllowedInvitations <= $currentInviteCount) {
            return response()->json([
                'message' => 'فشل ارسال الدعاوى',
                'data' => $userInvitation,
                'error' => "الدعاوى المرسلة " . $currentInviteCount . " تساوى عدد الدعاوى التي تم شرائها " . $totalAllowedInvitations
            ], 400);
        }
        // Limit the number of loops to avoid exceeding the allowed number of invites
        $remainingInvitations = $totalAllowedInvitations - $currentInviteCount;
        $totalRequests = count($request->name);

        for ($index = 0; $index < min($remainingInvitations, $totalRequests); $index++) {
            if (!isset($request->name[$index], $request->phone[$index], $request->code[$index], $request->qr[$index])) {
                continue; // Skip if any required field is missing
            }

            $name = $request->name[$index];

            // Add media to the user's media collection
             ImageTemplate::process($request->qr[$index], $name,$userInvitation);

            // Create a new InvitedUsers record
            $invitedUsers = InvitedUsers::create([
                'name'                => $name,
                'phone'               => $request->phone[$index],
                'code'                => $request->code[$index],
                'qr'                  => $userInvitation->getFirstMediaUrl('qr') ,
                'user_invitations_id' => $userInvitation->id,
            ]);



            sendWhatsappImage(
                $invitedUsers->phone,
                $userInvitation->getFirstMediaUrl('userInvitation'),
                $userInvitation->user->phone ?? 'غير متوفر',
                $userInvitation->name ?? 'غير متوفر',
                $userInvitation->user->name ?? 'غير متوفر',
                $userInvitation->invitation_date ?? 'غير متوفر',
                $userInvitation->invitation_time ?? 'غير متوفر',
                $userInvitation->getFirstMediaUrl('qr')
            );

            Log::info(
                'WhatsApp message sent successfully',
                [
                    'userInvitation' => [
                        $invitedUsers->phone,
                        $userInvitation->getFirstMediaUrl('userInvitation'),
                        $userInvitation->user->phone ?? 'غير متوفر',
                        $userInvitation->name ?? 'غير متوفر',
                        $userInvitation->user->name ?? 'غير متوفر',
                        $userInvitation->invitation_date ?? 'غير متوفر',
                        $userInvitation->invitation_time ?? 'غير متوفر',
                        $userInvitation->getFirstMediaUrl('qr')
                    ]
                ]
            );

            $userInvitation->refresh();
        }
        //success message via with $userInvitation
        $userInvitation->clearMediaCollection('default');
        return response()->json([
            'message' => 'تم ارسال الدعاوى بنجاح',
            'data' => $userInvitation,
            'error' => ($userInvitation->number_invitees < count($request->name ?? '')) ?
                "الدعاوى المرسلة" . count($request->name) . "أكبر من عدد الدعاوى التي تم شرائها" . $userInvitation->number_of_users . "لذلك تم ارسال" . $userInvitation->number_of_users : null
        ], 200);
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
