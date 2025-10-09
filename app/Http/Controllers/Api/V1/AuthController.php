<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Http\Resources\User\UserResource;
use App\Http\Requests\Api\Auth\LoginRequest;
use App\Http\Requests\Api\Auth\RegisterRequest;
use App\Http\Requests\Api\Auth\UpdateUserRequest;
use App\Http\Requests\Api\User\UpdateBankRequest;
use App\Http\Requests\Api\Auth\CreateTokenRequest;
use App\Http\Requests\Api\Auth\UserVerifiedRequest;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function register(RegisterRequest $request): JsonResponse
    {
        $request->merge([
            'phone' => $this->normalizePhone($request->phone),
        ]);

        $otp = random_int(1000, 9999);

        if ($this->isTestPhone($request->phone)) {
            $otp = 1111;
        }


        do {
            $code   = Str::random(5);
            $exists = User::where('code', $code)->exists();
        } while ($exists);

        $user = User::create([
            'name'          => $request->name,
            'email'         => $request->email,
            'password'      => bcrypt($request->password ?? Str::random(15)),
            'phone'         => $request->phone,
            'otp'           => $otp,
            'code'          => $code,
            'url'           => route('register.create', $code),
            'user_verified' => now(),
        ]);

        // Send Otp number
        sendWhatsappOTP($user->phone, $otp);

        return successResponseDataWithMessage(UserResource::make($user->refresh()));
    }

    public function login(LoginRequest $request): JsonResponse
    {
        $request->merge([
            'phone' => $this->normalizePhone($request->phone),
        ]);

        do {
            $code   = Str::random(5);
            $exists = User::where('code', $code)->exists();
        } while ($exists);

        $otp = random_int(1000, 9999);

        $user = User::firstOrCreate([
            'phone' => $request->phone,
        ], [
            'password'      => bcrypt($request->password ?? Str::random(15)),
            'otp'           => $otp,
        ]);


        if ($this->isTestPhone($request->phone)) {
            $otp = 1111;
        }


        $user = User::where('phone', $request->phone)->first();
        $user->update(['otp' => $otp]);

        // Send Otp number
        sendWhatsappOTP($user->phone, $otp);

        return successResponseDataWithMessage(UserResource::make($user->refresh()));
    }

    public function resendOtp(LoginRequest $request): JsonResponse
    {
        $request->merge([
            'phone' => $this->normalizePhone($request->phone),
        ]);

        $user = User::where('phone', $request->phone)->first();

        $otp = random_int(1000, 9999);

        if ($this->isTestPhone($request->phone)){
            $otp = 1111;
        }

        $user->update(['otp' => $otp]);

        // Send Otp number
        sendWhatsappOTP($user->phone, $otp);
        $user->refresh();
        $user->referral_count = User::where('referral_id', auth('api')->id())->count();
        return successResponseDataWithMessage(UserResource::make($user));
    }

    public function createToken(CreateTokenRequest $request): JsonResponse
    {
        // تسجيل البيانات الأصلية القادمة من الواجهة
        \Log::info('OTP Verification Request Received', [
            'original_phone' => $request->phone,
            'otp' => $request->otp,
        ]);

        // تحويل الرقم إن لزم الأمر
        $phone = $this->normalizePhone($request->phone);
        $otp   = $request->otp;

        // تسجيل الرقم بعد التحويل
        \Log::info('Normalized Phone', ['normalized_phone' => $phone]);

        // محاولة إيجاد المستخدم في قاعدة البيانات
        $user = User::where('phone', $phone)->where('otp', $otp)->first();

        // تسجيل النتيجة سواء تم العثور على المستخدم أو لا
        if (!$user) {
            \Log::warning('OTP verification failed', [
                'searched_phone' => $phone,
                'searched_otp' => $otp,
                'user_found' => false,
                'all_matching_users' => User::where('phone', $phone)->pluck('otp'), // لمعرفة الأكواد الموجودة
            ]);

            return errorResponse('الرمز غير صحيح', 401);
        }

        // تسجيل عند النجاح
        \Log::info('OTP verification succeeded', [
            'user_id' => $user->id,
            'user_phone' => $user->phone,
            'matched_otp' => $otp,
        ]);

        // تحديث المستخدم
        $user->update(['otp' => null, 'fcm_token' => $request->fcm_token]);
        $user['token'] = auth('api')->login($user);

        return successResponseDataWithMessage(UserResource::make($user));
    }



    public function logout(): JsonResponse
    {
        $user = User::find(auth('api')->id());
        $user->update(['fcm_token' => NULL]);
        auth('api')->logout('true');

        return successResponse(__('site.Logout_Successfully'));
    }

    public function profile(): JsonResponse
    {
        $user = User::find(auth('api')->id());
        return successResponseDataWithMessage(UserResource::make($user));
    }

    public function update(UpdateUserRequest $request): JsonResponse
    {
        $request->merge([
            'phone' => $this->normalizePhone($request->phone),
        ]);
        User::find(auth('api')->id())->update($request->validated());
        return successResponse(__('Update profile Successfully'));
    }

    public function delete()
    {
        User::find(auth('api')->id())->delete();
        auth('api')->logout();

        return successResponse(__('Delete Profile Successfully'));
    }

    public function userVerified(UserVerifiedRequest $request)
    {
        $request->merge([
            'phone' => $this->normalizePhone($request->phone),
        ]);

        do {
            $code   = Str::random(5);
            $exists = User::where('code', $code)->exists();
        } while ($exists);

        $user = User::find(auth('api')->id());

        $user->update([
            'name'          => $request->name,
            'email'         => $request->email,
            'user_verified' => now(),
            'code'          => $code,
            'url'           => route('register.create', $code)
        ]);

        return successResponseDataWithMessage(UserResource::make($user));
    }

    public function updateBank(UpdateBankRequest $request)
    {
        $request->merge([
            'phone' => $this->normalizePhone($request->phone),
        ]);
        
        $user = User::find(auth('api')->id());

        $user->update([
            'bank_name' => $request->bank_name,
            'iban'      => $request->iban,
        ]);

        return successResponseDataWithMessage(UserResource::make($user));
    }

    private function isTestPhone($phone): bool
    {
        return in_array((string) $phone, ['966531333006', '966530000000', '966531111111', '201006403927', '966500079915']);
    }

    private function normalizePhone($phone)
    {
        if ($phone == '966530000000') {
            return '201006403927';
        }

        return $phone;
    }
}
