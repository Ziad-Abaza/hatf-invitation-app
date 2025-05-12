<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Invitation;
use App\Models\UserInvitation;
use Illuminate\Contracts\View\View;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Dashboard\Invitation\StoreRequest;
use App\Http\Requests\Dashboard\Invitation\UpdateRequest;

class UserInvitationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user_invitations = UserInvitation::get();
        return view('dashboard.user_invitation.index', compact('user_invitations'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRequest $request)
    {
        
    }

    /**
     * Display the specified resource.
     */
    public function show(Invitation $user_invitation)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Invitation $user_invitation)
    {
        // return view('dashboard.user_invitation.edit', compact('user_invitation'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRequest $request, Invitation $user_invitation)
    {

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Invitation $user_invitation)
    {

    }
}
