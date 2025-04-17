<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserInvitation;

class TestController extends Controller
{
    public function deleteInvitations($user_id)
    {
        $deletedCount = UserInvitation::where('user_id', $user_id)->delete();

        return response()->json([
            'message' => "{$deletedCount} دعوة تم حذفها بنجاح",
            'user_id' => $user_id,
        ]);
    }
}
