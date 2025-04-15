<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Contracts\View\View;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use App\Http\Requests\Dashboard\Auth\LoginRequest;

class AuthController extends Controller
{
    public function login(): View
    {
        return view('dashboard.auth.login');
    }

    public function loginPost(LoginRequest $request): RedirectResponse
    {
        if (! Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password])) {
            return redirect()->back()->with('error', 'The email and password do not match');
        }

        return redirect()->route('dashboard.dashboard');
    }

    public function logout(): RedirectResponse
    {
        Auth::logout();
        return redirect()->route('login');
    }
}
