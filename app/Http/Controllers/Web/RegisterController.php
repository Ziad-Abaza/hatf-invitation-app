<?php

namespace App\Http\Controllers\Web;

use App\Models\User;
use Illuminate\Support\Str;
use App\Models\MarketerCode;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RegisterController extends Controller
{
    public function register(User $user)
    {
        return view('web.register', compact('user'));
    }

    public function createOTP(User $user, $phone)
    {
        $fullPhone = '966' . $phone;

        // إذا كان رقم المسوق هو 966531333006
        if ($fullPhone === '966531333006') {
            $otp = 1111;
        } else {
            $otp = random_int(1000, 9999);
        }

        $marketerCode = MarketerCode::firstOrCreate(
            ['phone' => $fullPhone],
            ['code'  => $otp]
        );

        $marketerCode->code = $otp;
        $marketerCode->save();

        sendWhatsappOTP($marketerCode->phone, $marketerCode->code);
        return view('web.otp', compact('phone', 'user'));
    }


    public function registerStore(Request $request, User $user)
    {
        $phone = '966' . $request->phone;
        $codeUser = $request->code1 . $request->code2 . $request->code3 . $request->code4;

        $marketerCode = MarketerCode::where('code', $codeUser)->where('phone', $phone)->first();

        if (! $marketerCode) {
            return redirect()->back()->with('error', 'The required field is missing.');
        }

        do {
            $code = Str::random(5);
            $exists = User::where('code', $code)->exists();
        } while ($exists);

        if (! User::where('phone', $phone)->exists()) {
            User::create([
                'phone'       => $phone,
                'password'    => bcrypt(Str::random(15)),
                'code'        => $code,
                'referral_id' => $user->id,
            ]);
        }

        $marketerCode->delete();

        return view('web.index');
    }
}
