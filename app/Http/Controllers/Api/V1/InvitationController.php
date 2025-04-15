<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Invitation;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Invitation\InvitationResource;

class InvitationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $invitations = Invitation::where('max_date', '=', 'unlimited')->get();
        $invitations = InvitationResource::collection($invitations);
        return successResponseDataWithMessage($invitations);
    }

    public function indexPrivate()
    {
        if (auth('api')->user()->subscription !=='vip') {
            return errorResponse('غير مصرح بعرض هذه الباقة', 404);
        }
        $invitations=new Invitation();
        $invitations =$invitations::showMaxDate($invitations)::where('max_date', '!=', 'unlimited')->get();
        $invitations = InvitationResource::collection($invitations);
        return successResponseDataWithMessage($invitations);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Invitation $invitation)
    {
        $invitation = InvitationResource::make($invitation);
        return successResponseDataWithMessage($invitation);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Invitation $invitation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Invitation $invitation)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Invitation $invitation)
    {
        //
    }
}
