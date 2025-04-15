<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Hall;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Hall\HallResource;

class HallController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $halls = Hall::when($request->filled('latitude') && $request->filled('longitude'), function ($q) use ($request) {
            $q->nearest($request->latitude, $request->longitude);
        })->get();

        return successResponseDataWithMessage(HallResource::collection($halls));
    }

    /**
     * Display the specified resource.
     */
    public function show(Hall $hall)
    {
        return successResponseDataWithMessage(HallResource::make($hall));
    }
}
