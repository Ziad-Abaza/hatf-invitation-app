<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class NotificationController extends Controller
{
    public function index(Request $request)
    {
        $user = User::find(auth('api')->id());
        return successResponseDataWithMessage($user->notifications);
    }

    public function markAsRead(Request $request)
    {
        $notification = $request->user()->notifications()->find($request->notification_id);

        if (!$notification)
            return errorResponse('Notification not found.', 404);

        $notification->markAsRead();
        successResponse('Notification marked as read.');
    }
}
