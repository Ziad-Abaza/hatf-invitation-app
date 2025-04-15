<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Admin;
use Illuminate\Contracts\View\View;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Dashboard\Admin\StoreRequest;
use App\Http\Requests\Dashboard\Admin\UpdateRequest;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        $admins = Admin::get();
        return view('dashboard.admin.index', compact('admins'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('dashboard.admin.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRequest $request)
    {
        $imageName = null;

        if ($request->image) {
            $imageName = date('Y-m-d') . '_' . uniqid() . '.' . $request->image->extension();
            $request->image->storeAs('public/images', $imageName);
        }

        Admin::create(['password' => Hash::make($request->password), 'image' => $imageName]  + $request->validated());
        return redirect()->route('dashboard.admin.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Admin $admin)
    {
        return view('dashboard.admin.edit', compact('admin'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Admin $admin)
    {
        return view('dashboard.admin.edit', compact('admin'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRequest $request, Admin $admin)
    {
        $imageName = $admin->image;

        if ($request->image) {
            $imageName = date('Y-m-d') . '_' . uniqid() . '.' . $request->image->extension();
            $request->image->storeAs('public/images', $imageName);

            if (Storage::exists('public/images/' . $admin->image)) {
                Storage::delete('public/images/' . $admin->image);
            }
        }

        $password = ($request->password) ? Hash::make($request->password) : $admin->password;

        $admin->update(['password' => $password, 'image' => $imageName] + $request->validated());
        return redirect()->route('dashboard.admin.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Admin $admin)
    {
        $admin->delete();
        if (Storage::exists('public/images/' . $admin->image))
            Storage::delete('public/images/' . $admin->image);

        return redirect()->route('dashboard.admin.index');
    }
}
