<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Invitation;
use Illuminate\Contracts\View\View;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Dashboard\Invitation\StoreRequest;
use App\Http\Requests\Dashboard\Invitation\UpdateRequest;
use App\Http\Requests\Dashboard\Invitation\StoreRequestPrivate;

class InvitationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $invitations = Invitation::get();


        return view('dashboard.invitation.index', compact('invitations'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('dashboard.invitation.create');
    }

    public function createPrivate()
    {
        return view('dashboard.invitation.createPrivate');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRequest $request)
    {
        $invitation = Invitation::create($request->validated());
        $invitation->addMedia($request->image)->toMediaCollection('default');

        return redirect()->route('dashboard.invitation.index');
    }


    public function storePrivate(StoreRequestPrivate $request)
    {
        $invitation=new Invitation();
        $invitation =$invitation::showMaxDate($invitation)->create($request->validated());
        $invitation->addMedia($request->image)->toMediaCollection('default');
        return redirect()->route('dashboard.invitation.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Invitation $invitation)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Invitation $invitation)
    {
        return view('dashboard.invitation.edit', compact('invitation'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRequest $request, Invitation $invitation)
    {
        $invitation->update($request->validated());
        if ($request->image) {
            $invitation->addMedia($request->image)->toMediaCollection('default');
        }
        return redirect()->route('dashboard.invitation.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Invitation $invitation)
    {
        $invitation->delete();
        return redirect()->route('dashboard.invitation.index');
    }
}
