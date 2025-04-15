<?php

namespace App\Http\Controllers\Dashboard;

use Carbon\Carbon;
use App\Models\Hall;
use App\Models\User;
use App\Models\Admin;
use App\Models\Invitation;
use App\Http\Controllers\Controller;
use App\Models\PaymentUserInvitation;

class MainDashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {


        $invats=Invitation::with('userInvitations')->get();
        $invitations=[];
        foreach ($invats as  $value) {
            $invitations[]=[
                'name'=> $value->name,
                'prise'=> $value->prise,
                'number_of_users'=> $value->number_of_users,
                'count'=> $value->userInvitations->count(),                
            ];
        }

        
        $data = [
            'total_admins' => Admin::select('id')->count(),
            'total_users' => User::select('id')->count(),
            'online_today_users' => User::select('last_seen')->whereDate('last_seen', Carbon::today())->count(),
            'online_week_users' =>  User::select('last_seen')->where('last_seen', '>=', Carbon::now()->startOfWeek())->count(),
            'online_month_users' => User::select('last_seen')->where('last_seen', '>=', Carbon::now()->startOfMonth())->count(),
            'online_year_users' => User::select('last_seen')->where('last_seen', '>=', Carbon::now()->startOfYear())->count(),

            'total_halls' =>         Hall::select('id')->count(),
            'total_invitaions' =>    Invitation::select('id')->count(),
            
            'invitations' => $invitations, 

            'success_payment' => [
                'value' => PaymentUserInvitation::select('id')->where('status', 1)->sum('value'),
                'count' => PaymentUserInvitation::select('id')->where('status', 1)->count('id'),
            ],
            'fail_payment' => [
                'value' => PaymentUserInvitation::select('id')->where('status', 0)->sum('value'),
                'count' => PaymentUserInvitation::select('id')->where('status', 0)->count('id'),
            ],

        ];




        $labels = [];
        $invatdata = [];
        foreach ($invitations as $invitation) {
            $labels[] = json_decode($invitation['name'], true)['name_ar'] ;
            $invatdata[] = $invitation['count'];
        }



        return view("dashboard.main", compact('data'),[
            'labels' => $labels,
            'invatdata' => $invatdata,
        ]);
    }
}
