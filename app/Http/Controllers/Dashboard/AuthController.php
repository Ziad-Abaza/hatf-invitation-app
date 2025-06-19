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
        $credentials = $request->only('email', 'password');
        $remember = $request->filled('remember');

        if (! Auth::guard('admin')->attempt($credentials, $remember)) {
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
