<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\UserWithdrawals;
use App\Http\Controllers\Controller;

class MarketeerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = UserWithdrawals::where('user_id', auth('api')->id())->get();
        return successResponseDataWithMessage($users);
    }
}
