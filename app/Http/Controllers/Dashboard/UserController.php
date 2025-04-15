<?php
namespace App\Http\Controllers\Dashboard;


use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($slug_en)
    {

        $slug_ar = "";
        if ($slug_en == 'total_users') {
            $data = User::with('userInvitations')->paginate(10);
            $slug_ar = "إجمالي المستخدمين";
        }
        elseif ($slug_en == 'total_markters') {
            $data = User::with('userInvitations.userPackage.payment')->paginate(10);
            $slug_ar = "إجمالي المسوقين";
        }
        elseif ($slug_en == 'online_today_users') {
            $data = User::with('userInvitations')->whereDate('last_seen', Carbon::today())->paginate(10);
            $slug_ar = "المستخدمون المتصلون اليوم";
        } elseif ($slug_en == 'online_week_users') {
            $data = User::with('userInvitations')->where('last_seen', '>=', Carbon::now()->startOfWeek())->paginate(10);
            $slug_ar = "المستخدمون المتصلون هذا الأسبوع";
        } elseif ($slug_en == 'online_month_users') {
            $data = User::with('userInvitations')->where('last_seen', '>=', Carbon::now()->startOfMonth())->paginate(10);
            $slug_ar = "المستخدمون المتصلون هذا الشهر";
        } elseif ($slug_en == 'online_year_users') {
            $data = User::with('userInvitations')->where('last_seen', '>=', Carbon::now()->startOfYear())->paginate(10);
            $slug_ar = "المستخدمون المتصلون هذا العام";
        } else {
            return abort(404, "الصفحة غير موجودة");
        }

        return view('dashboard.user.index', ['users' => $data,'slug_ar' => $slug_ar,'slug_en' => $slug_en]);

    }

    public function promotion(User $user)
    {
        if ($user->subscription == 'ordinary') {
            
            $user->update(['subscription'=>'vip']);
        } else {
            $user->update(['subscription'=>'ordinary']);
        }
        
        return redirect()->back();

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
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
