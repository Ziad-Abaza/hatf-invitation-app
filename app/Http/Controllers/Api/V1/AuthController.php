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
        Log::info('Starting user registration process', [
            'phone' => $request->phone,
            'email' => $request->email,
        ]);

        try {
            // Generate OTP
            $otp = random_int(1000, 9999);
            Log::debug('Generated random OTP', ['otp' => $otp]);

            // Check for test phone numbers
            if ($this->isTestPhone($request->phone)) {
                $otp = 1111;
                Log::warning('Test phone detected, OTP overridden with 1111', ['phone' => $request->phone]);
            }

            // Generate unique user code
            do {
                $code   = Str::random(5);
                $exists = User::where('code', $code)->exists();
            } while ($exists);

            Log::debug('Generated unique user code', ['code' => $code]);

            // Create new user
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

            Log::info('User record created successfully', ['user_id' => $user->id, 'phone' => $user->phone]);

            // Send OTP via WhatsApp
            sendWhatsappOTP($user->phone, $otp);
            Log::info('OTP sent via WhatsApp successfully', [
                'phone' => $user->phone,
                'otp'   => $otp,
            ]);

            Log::info('User registration completed successfully', [
                'user_id' => $user->id,
                'code'    => $user->code,
            ]);

            return successResponseDataWithMessage(UserResource::make($user->refresh()));
        } catch (\Throwable $e) {
            Log::error('User registration failed', [
                'error'   => $e->getMessage(),
                'trace'   => $e->getTraceAsString(),
                'phone'   => $request->phone,
                'email'   => $request->email,
            ]);

            return errorResponse('Registration failed. Please try again later.');
        }
    }


    public function login(LoginRequest $request): JsonResponse
    {
        Log::info('Starting login process', [
            'phone' => $request->phone,
        ]);

        try {
            // Generate unique user code
            do {
                $code   = Str::random(5);
                $exists = User::where('code', $code)->exists();
            } while ($exists);

            Log::debug('Generated unique user code for login', ['code' => $code]);

            // Generate OTP
            $otp = random_int(1000, 9999);
            Log::debug('Generated OTP for login', ['otp' => $otp]);

            // Find or create user
            $user = User::firstOrCreate(
                ['phone' => $request->phone],
                [
                    'password' => bcrypt($request->password ?? Str::random(15)),
                    'otp'      => $otp,
                    'code'     => $code,
                ]
            );

            if ($user->wasRecentlyCreated) {
                Log::info('New user created during login', ['user_id' => $user->id, 'phone' => $user->phone]);
            } else {
                Log::info('Existing user found during login', ['user_id' => $user->id, 'phone' => $user->phone]);
            }

            // Handle test phone (override OTP)
            if ($this->isTestPhone($request->phone)) {
                $otp = 1111;
                Log::warning('Test phone detected, overriding OTP with 1111', ['phone' => $request->phone]);
            }

            // Update OTP
            $user->update(['otp' => $otp]);
            Log::debug('Updated OTP in database', ['user_id' => $user->id, 'otp' => $otp]);

            // Send OTP via WhatsApp
            sendWhatsappOTP($user->phone, $otp);
            Log::info('OTP sent via WhatsApp successfully', [
                'phone' => $user->phone,
                'otp'   => $otp,
            ]);

            Log::info('Login process completed successfully', [
                'user_id' => $user->id,
                'phone'   => $user->phone,
            ]);

            return successResponseDataWithMessage(UserResource::make($user->refresh()));
        } catch (\Throwable $e) {
            Log::error('Login process failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'phone' => $request->phone,
            ]);

            return errorResponse('Login failed. Please try again later.');
        }
    }


    public function resendOtp(LoginRequest $request): JsonResponse
    {
        Log::info('Starting resend OTP process', ['phone' => $request->phone]);

        try {
            $user = User::where('phone', $request->phone)->first();

            if (! $user) {
                Log::warning('User not found for resend OTP', ['phone' => $request->phone]);
                return errorResponse('User not found.', 404);
            }

            $otp = random_int(1000, 9999);
            Log::debug('Generated new OTP', ['otp' => $otp]);

            if ($this->isTestPhone($request->phone)) {
                $otp = 1111;
                Log::warning('Test phone detected, overriding OTP with 1111', ['phone' => $request->phone]);
            }

            $user->update(['otp' => $otp]);
            Log::info('Updated user OTP successfully', ['user_id' => $user->id, 'otp' => $otp]);

            sendWhatsappOTP($user->phone, $otp);
            Log::info('OTP sent successfully via WhatsApp', ['phone' => $user->phone]);

            $user->refresh();
            $user->referral_count = User::where('referral_id', auth('api')->id())->count();

            Log::info('Resend OTP process completed successfully', ['user_id' => $user->id]);
            return successResponseDataWithMessage(UserResource::make($user));
        } catch (\Throwable $e) {
            Log::error('Resend OTP failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'phone' => $request->phone,
            ]);

            return errorResponse('Resend OTP failed. Please try again later.');
        }
    }


    public function createToken(CreateTokenRequest $request): JsonResponse
    {
        Log::info('=========== Start createToken process ===========', [
            'phone' => $request->phone,
            'otp'   => $request->otp,
        ]);

        try {
            $user = User::wherePhone($request->phone)->whereOtp($request->otp)->first();

            if (! $user) {
                Log::warning('Invalid OTP during createToken', [
                    'phone' => $request->phone,
                    'otp'   => $request->otp,
                ]);
                return errorResponse('الرمز غير صحيح', 401);
            }

            $user->update(['otp' => null, 'fcm_token' => $request->fcm_token]);
            Log::info('OTP cleared and FCM token updated', ['user_id' => $user->id]);

            $user['token'] = auth('api')->login($user);
            Log::info('JWT token created successfully', ['user_id' => $user->id]);

            return successResponseDataWithMessage(UserResource::make($user));
        } catch (\Throwable $e) {
            Log::error('createToken process failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'phone' => $request->phone,
            ]);

            return errorResponse('Token creation failed. Please try again later.');
        }
    }


    public function logout(): JsonResponse
    {
        try {
            $user = User::find(auth('api')->id());
            Log::info('Logout initiated', ['user_id' => $user?->id]);

            if ($user) {
                $user->update(['fcm_token' => null]);
                Log::info('FCM token cleared for user', ['user_id' => $user->id]);
            }

            auth('api')->logout(true);
            Log::info('User logged out successfully', ['user_id' => $user?->id]);

            return successResponse(__('site.Logout_Successfully'));
        } catch (\Throwable $e) {
            Log::error('Logout failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return errorResponse('Logout failed. Please try again later.');
        }
    }


    public function profile(): JsonResponse
    {
        try {
            $user = User::find(auth('api')->id());
            Log::info('Profile fetched successfully', ['user_id' => $user?->id]);

            return successResponseDataWithMessage(UserResource::make($user));
        } catch (\Throwable $e) {
            Log::error('Profile fetch failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return errorResponse('Failed to fetch profile.');
        }
    }


    public function update(UpdateUserRequest $request): JsonResponse
    {
        try {
            $user = User::find(auth('api')->id());
            $user->update($request->validated());

            Log::info('User profile updated successfully', ['user_id' => $user->id]);

            return successResponse(__('Update profile Successfully'));
        } catch (\Throwable $e) {
            Log::error('Profile update failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return errorResponse('Failed to update profile.');
        }
    }


    public function delete()
    {
        try {
            $user = User::find(auth('api')->id());

            if (! $user) {
                Log::warning('Attempted to delete a non-existing user.');
                return errorResponse('User not found.', 404);
            }

            $user->delete();
            auth('api')->logout();

            Log::info('User account deleted successfully', ['user_id' => $user->id]);

            return successResponse(__('Delete Profile Successfully'));
        } catch (\Throwable $e) {
            Log::error('Delete profile failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return errorResponse('Failed to delete profile.');
        }
    }


    public function userVerified(UserVerifiedRequest $request)
    {
        try {
            Log::info('Starting user verification process', ['user_id' => auth('api')->id()]);

            do {
                $code   = Str::random(5);
                $exists = User::where('code', $code)->exists();
            } while ($exists);

            $user = User::find(auth('api')->id());

            if (! $user) {
                Log::warning('User not found during verification');
                return errorResponse('User not found.', 404);
            }

            $user->update([
                'name'          => $request->name,
                'email'         => $request->email,
                'user_verified' => now(),
                'code'          => $code,
                'url'           => route('register.create', $code),
            ]);

            Log::info('User verification completed successfully', [
                'user_id' => $user->id,
                'code'    => $code,
            ]);

            return successResponseDataWithMessage(UserResource::make($user));
        } catch (\Throwable $e) {
            Log::error('User verification failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return errorResponse('User verification failed.');
        }
    }

    public function updateBank(UpdateBankRequest $request)
    {
        $user = User::find(auth('api')->id());

        $user->update([
            'bank_name' => $request->bank_name,
            'iban'      => $request->iban,
        ]);

        return successResponseDataWithMessage(UserResource::make($user));
    }

    private function isTestPhone($phone): bool
    {
        return in_array((string) $phone, ['966531333006', '966530000000', '966531111111', '966500079915', '966530333218']);
    }
}
