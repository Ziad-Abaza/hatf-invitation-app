<?php

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\RegisterController;
use App\Http\Controllers\Dashboard\AuthController;
use App\Http\Controllers\Dashboard\HallController;
use App\Http\Controllers\Dashboard\UserController;
use App\Http\Controllers\Dashboard\AdminController;
use App\Http\Controllers\Dashboard\PaymnetController;
use App\Http\Controllers\Dashboard\SettingController;
use App\Http\Controllers\Api\V1\UserPaymentController;
use App\Http\Controllers\Dashboard\LanguageController;
use App\Http\Controllers\Dashboard\MarketeerController;
use App\Http\Controllers\Dashboard\InvitationController;
use App\Http\Controllers\Dashboard\MainDashboardController;
use App\Http\Controllers\Dashboard\PrivacyPolicyController;
use App\Http\Controllers\Dashboard\TransferredAmountController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/



Route::get('test/{phone}', function ($phone) {
    try {
        // Uncomment this line if needed for testing
        // sendWhatsappOTP($phone, '55555');

        sendWhatsappImage(
            $phone,
            'https://www.w3schools.com/images/picture.jpg',
            $phone, // No need for ?? 'غير متوفر' since it's a fixed value
            'dinner',
            'ahmed',
            '18/5/2025',
            '5:6 am'
        );

        // sendWhatsappInvoice($phone, 'https://islamsalah95.github.io/cv/cv.pdf');

        return response()->json(['message' => 'WhatsApp messages sent successfully']);
    } catch (\Exception $e) {
        Log::error('Error sending WhatsApp messages: ' . $e->getMessage(), [
            'file' => $e->getFile(),
            'line' => $e->getLine(),
            'trace' => $e->getTraceAsString(),
        ]);

        return response()->json([
            'error' => 'Failed to send WhatsApp messages',
            'message' => $e->getMessage(),
            'file' => $e->getFile(),
            'line' => $e->getLine(),
        ], 500);
    }
});


Route::get('testss', function () {
    return view("web.index");
});
Route::get('register/{user:code}', [RegisterController::class, 'register'])->name('register.create');
Route::get('register/otp/{user:code}/{phone?}', [RegisterController::class, 'createOTP'])->name('register.create.otp');
Route::post('register/{user:code}', [RegisterController::class, 'registerStore'])->name('register.store');

Route::get('set-language/{lang}', [LanguageController::class, 'setLanguage'])->name('dashboard.set.language');
Route::middleware('set.lang')->group(function () {

    Route::middleware('guest:admin')->group(function () {
        Route::get('login', [AuthController::class, 'login'])->name('login');
        Route::post('login', [AuthController::class, 'loginPost'])->name('login.post');
    });



    Route::middleware('auth:admin')->name('dashboard.')->group(function () {
        Route::get('/', [MainDashboardController::class, 'index'])->name('dashboard');

        Route::get('logout', [AuthController::class, 'logout'])->name('logout');

        // Admins
        Route::get('admins', [AdminController::class, 'index'])->name('admin.index');
        Route::get('admins/create', [AdminController::class, 'create'])->name('admin.create');
        Route::get('admins/{admin}', [AdminController::class, 'show'])->name('admin.show');
        Route::post('admins', [AdminController::class, 'store'])->name('admin.store');
        Route::get('admins/{admin}/edit', [AdminController::class, 'edit'])->name('admin.edit');
        Route::put('admins/{admin}/update', [AdminController::class, 'update'])->name('admin.update');
        Route::delete('admins', [AdminController::class, 'index'])->name('admin.delete');

        // Halls
        Route::get('halls', [HallController::class, 'index'])->name('hall.index');
        Route::get('halls/create', [HallController::class, 'create'])->name('hall.create');
        Route::get('halls/{hall}', [HallController::class, 'show'])->name('hall.show');
        Route::post('halls', [HallController::class, 'store'])->name('hall.store');
        Route::get('halls/{hall}/edit', [HallController::class, 'edit'])->name('hall.edit');
        Route::put('halls/{hall}/update', [HallController::class, 'update'])->name('hall.update');
        Route::get('halls/{hall}/delete', [HallController::class, 'destroy'])->name('hall.delete');

        // Invitations
        Route::get('invitations', [InvitationController::class, 'index'])->name('invitation.index');
        Route::get('invitations/create', [InvitationController::class, 'create'])->name('invitation.create');
        Route::get('invitations/private/create', [InvitationController::class, 'createPrivate'])->name('invitation.createPrivate');
        Route::get('invitations/{invitation}', [InvitationController::class, 'show'])->name('invitation.show');
        Route::post('invitations', [InvitationController::class, 'store'])->name('invitation.store');
        Route::post('invitations/private', [InvitationController::class, 'storePrivate'])->name('invitation.storePrivate');
        Route::get('invitations/{invitation}/edit', [InvitationController::class, 'edit'])->name('invitation.edit');
        Route::put('invitations/{invitation}/update', [InvitationController::class, 'update'])->name('invitation.update');
        Route::get('invitations/{invitation}/delete', [InvitationController::class, 'destroy'])->name('invitation.delete');

        // Settings
        Route::get('settings', [SettingController::class, 'index'])->name('setting.index');
        Route::post('settings', [SettingController::class, 'store'])->name('setting.store');
        Route::get('settings/{setting}/edit', [SettingController::class, 'edit'])->name('setting.edit');
        Route::put('settings/{setting}/update', [SettingController::class, 'update'])->name('setting.update');

        Route::get('privacy-policy/{privacyPolicy}/edit', [PrivacyPolicyController::class, 'edit'])->name('privacy.policy.edit');
        Route::put('privacy-policy/{privacyPolicy}/update', [PrivacyPolicyController::class, 'update'])->name('privacy.policy.update');

        // Marketeers
        Route::get('marketeers', [MarketeerController::class, 'index'])->name('marketeer.index');
        Route::get('marketeers/create', [MarketeerController::class, 'create'])->name('marketeer.create');
        Route::post('marketeers/store', [MarketeerController::class, 'store'])->name('marketeer.store');
        Route::get('marketeers/customer/{code}', [MarketeerController::class, 'getCustomers'])->name('marketeer.customer.index');
        Route::get('marketeers/withdrawals/{user}', [MarketeerController::class, 'viewAddWithdrawals'])->name('marketeer.withdrawals.index');
        Route::post('marketeers/withdrawals/{code}', [MarketeerController::class, 'saveAddWithdrawals'])->name('marketeer.withdrawals.save');
        Route::get('marketeers/export',              [MarketeerController::class, 'export'])->name('marketeer.export');


        Route::get('transferred', [TransferredAmountController::class, 'index'])->name('transferred.index');
        Route::post('transferred/{markterId}', [TransferredAmountController::class, 'store'])->name('transferred.store');
        Route::delete('transferred/{transferredAmount}', [TransferredAmountController::class, 'destroy'])->name('transferred.destroy');
        Route::delete('transferred/destroy_all', [TransferredAmountController::class, 'destroyAll'])->name('transferred.destroy_all');
        Route::get('transferred/export', [TransferredAmountController::class, 'export'])->name('transferred.export');

        Route::get('users/{slug}',    [UserController::class, 'index'])->name('users.index');
        Route::post('users/promotion/{user}', [UserController::class, 'promotion'])->name('users.promotion');
        Route::get('payments/{slug}', [PaymnetController::class, 'index'])->name('payments.index');
    });
});

Route::any('payment/return', [UserPaymentController::class, 'returnAction'])->name('paymentreturn');
Route::any('payment/successPayment', [UserPaymentController::class, 'successPayment'])->name('successPayment');
Route::any('payment/failedPayment', [UserPaymentController::class, 'failedPayment'])->name('failedPayment');
//Route::any('payment/return/{payment_id}/{invitation_id}/{user_id}', [UserPaymentController::class, 'returnAction'])->name('paymentreturn');
Route::post('payment/callback', [UserPaymentController::class, 'callbackAction'])->name('paymentcallback');
Route::any('paymenttest', [UserPaymentController::class, 'paymentTest'])->name('paymentTest');
