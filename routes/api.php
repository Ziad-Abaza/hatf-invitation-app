<?php

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;
use App\Notifications\UserNotification;
use App\Http\Controllers\Api\V1\AuthController;
use App\Http\Controllers\Api\V1\HallController;
use App\Http\Controllers\Api\V1\InitLoginController;
use App\Http\Controllers\Api\V1\MarketeerController;
use App\Http\Controllers\Api\V1\InvitationController;
use App\Http\Controllers\Api\V1\AppSettingsController;
use App\Http\Controllers\Api\V1\UserPaymentController;
use App\Http\Controllers\Api\V1\NotificationController;
use App\Http\Controllers\Api\V1\PrivacyPolicyController;
use App\Http\Controllers\Api\V1\UserInvitationController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\InvoiceController;

Route::prefix('v1')->group(function () {
    //settings
    Route::get('/app-settings', [AppSettingsController::class, 'show']);
    Route::get('/app-init-login', [InitLoginController::class, 'show']);

    Route::post('signin', function () {
        $user = User::where('email', request()->email)->first();
        if ($user && Hash::check(request()->password, $user->password)) {
            $user['token'] = auth('api')->login($user);
            return response()->json(['user' => $user, 'token' => $user['token']], 200);
        } else {
            return response("not found", 400);
        }
    });

    // Auth
    // Route::middleware('guest:api')->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('resend-otp', [AuthController::class, 'resendOtp']);
    Route::post('create-token', [AuthController::class, 'createToken']);
    Route::get('privacy-policy', [PrivacyPolicyController::class, 'index']);
    // });

    // Hall
    Route::get('halls', [HallController::class, 'index']);
    Route::get('halls/{hall}', [HallController::class, 'show']);

    // Invitation
    Route::get('invitations', [InvitationController::class, 'index']);
    Route::get('invitations/{invitation}', [InvitationController::class, 'show']);

    Route::middleware('auth:api')->group(function () {
        Route::post('profiles/logout', [AuthController::class, 'logout']);
        Route::post('profiles/update', [AuthController::class, 'update']);
        Route::get('profiles', [AuthController::class, 'profile']);
        Route::post('profiles/user-verified', [AuthController::class, 'userVerified']);
        Route::delete('profiles/delete', [AuthController::class, 'delete']);
        Route::post('profiles/update-bank', [AuthController::class, 'updateBank']);

        //settings
        Route::put('/app-settings', [AppSettingsController::class, 'update']);
        Route::put('/app-init-login', [InitLoginController::class, 'update']);



        // Validate user invitations before payment
        // Route::post('user-invitation/{userInvitation}/validate', [UserInvitationController::class, 'validateInviteUsersBeforePayment']);
        // Route::post('user-invitation/{userPackage}/validate-private', [UserInvitationController::class, 'validateInviteUsersBeforePaymentP']);

        // user invitationsInvitation_date
        Route::get('invitations/private/index', [InvitationController::class, 'indexPrivate']);
        Route::patch('user-invitations/{userInvitation}/archive', [UserInvitationController::class, 'userInvitationArchive']);//hide from user private invitation
        Route::get('user-invitations/private', [UserInvitationController::class, 'userPrivateInvitation']);//here Get user Private Invitation
        Route::get('user-invitations', [UserInvitationController::class, 'index']);//
        Route::get('user-invitations/{userInvitation}', [UserInvitationController::class, 'show']);
        Route::post('user-invitations', [UserInvitationController::class, 'create']);
        Route::post('user-invitation/{userInvitation}/invite-users', [UserInvitationController::class, 'addInviteUsers']);//3
        Route::post('user-invitation/{userPackage}/invite-users-private', [UserInvitationController::class, 'addInviteUsersP']); //3

        Route::get('user-invitation/{userInvitation}/check-status', [UserInvitationController::class, 'checkInvitationStatus']);

        Route::post('user-invitation/{userInvitation}/scan-qr', [UserInvitationController::class, 'scanQr']);
        Route::post('user-invitations/{paymentUserInvitation}/success-payment', [UserInvitationController::class, 'successPaymentUserInvitation']);

        //user payment
        Route::post('user-invitations/payment', [UserPaymentController::class, 'payment']);//1
        Route::post('user-invitations/payment-private', [UserPaymentController::class, 'paymentP']);//1//

        Route::post('user-invitations/returnAction', [UserPaymentController::class, 'returnAction']);//2
        Route::post('user-invitations/payment/check', [UserPaymentController::class, 'checkAction']);

        // Account Owner
        // Route::get('getProfile', [ProfileController::class, 'show']);
        // Route::post('updateProfile', [ProfileController::class, 'updateProfile']);
        // Route::post('changePassword', [ProfileController::class, 'changePassword']);
        // Route::post('deleteProfile', [ProfileController::class, 'deleteProfile']);

        // marketeers
        Route::get('marketeers/withdrawals', [MarketeerController::class, 'index']);

        Route::get('notifications', [NotificationController::class, 'index']);
        Route::post('notifications/mark-as-read', [NotificationController::class, 'markAsRead']);

        Route::post('notifications/create', function () {
            $user = User::find(auth('api')->id());
            $user->notify(new UserNotification('Welcome User ' . $user->name));
        });
    });
});

// Route for testing purposes
Route::delete('/remove-invitations/{user}', [TestController::class, 'deleteInvitations']);
