<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\UserWithdrawals;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\MarkterDeservePaymentImport;

class MarketeerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::with('userInvitations.userPackage.payment')->get();
        return view('dashboard.marketeer.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $users = User::all();
        return view('dashboard.marketeer.create', ['users' => $users]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'nullable|email|max:255|unique:users,email',
            'phone' => 'nullable|string|max:20|unique:users,phone',
            'password' => 'nullable|string|min:8|max:255',
            'bank_name' => 'nullable|string|max:255',
            'iban' => 'nullable|string|size:24',
            'referral_id' => 'nullable|exists:users,id',
        ]);

        $code = Str::random(5);
        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => $request->password ?? Str::random(20),
            'bank_name' => $request->bank_name,
            'iban' => $request->iban,
            'referral_id' => $request->referral_id,
            'code' => $code,
            'url' => env('APP_URL') . '/register/' . $code,
        ]);
        return redirect()->back()->with('success','تم اضافة مسوق بنجاح');
    }

    public function getCustomers(User $user)
    {
        $customers = User::where('referral_id', $user->id)->get();
        return view('dashboard.marketeer.customer', compact('customers', 'user'));
    }

    public function viewAddWithdrawals(User $user)
    {
        return view('dashboard.marketeer.create-payment', compact('user'));
    }

    public function saveAddWithdrawals(Request $request, User $user)
    {
        $request->validate([
            'value' => 'required|integer|numeric'
        ]);

        UserWithdrawals::create([
            'value'   => $request->value,
            'type'    => 0,
            'user_id' => $user->id,
        ]);

        return redirect()->route('dashboard.marketeer.index');
    }


    public function export()
    {
        return Excel::download(new MarkterDeservePaymentImport, 'markters.xlsx');
    }
}
