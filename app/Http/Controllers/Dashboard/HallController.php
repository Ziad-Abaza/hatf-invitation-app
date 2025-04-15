<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Hall;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Dashboard\Hall\StoreRequest;
use App\Http\Requests\Dashboard\Hall\UpdateRequest;

class HallController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $halls = Hall::get();
        return view('dashboard.hall.index', compact('halls'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('dashboard.hall.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRequest $request)
    {
        $hall = Hall::create($request->validated());

        foreach ($request->images as $image)
            $hall->addMedia($image)->toMediaCollection('default');

        return redirect()->route('dashboard.hall.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Hall $hall)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Hall $hall)
    {
        return view('dashboard.hall.edit', compact('hall'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRequest $request, Hall $hall)
    {
        $hall->update($request->validated());
        $hall->clearMediaCollection('default');

        foreach ($request->images as $image)
            $hall->addMedia($image)->toMediaCollection('default');

        return redirect()->route('dashboard.hall.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Hall $hall)
    {
        $hall->delete();
        return redirect()->route('dashboard.hall.index');
    }
}
