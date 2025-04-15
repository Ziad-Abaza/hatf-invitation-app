<?php
namespace App\Http\Controllers\Dashboard;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\PaymentUserInvitation;

class PaymnetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($slug)
    {


        $slug_ar = "";
        if ($slug == 'success_payment') {
            $data =  PaymentUserInvitation::where('status', 1)->paginate(10);
            $slug_ar = "دفعات ناجحة";
        } 
        elseif ($slug == 'fail_payment') {
            $data =  PaymentUserInvitation::where('status', 0)->paginate(10);
            $slug_ar = "دفعات فاشلة";
        }
        elseif ($slug == 'total_payment') {
            $data =  PaymentUserInvitation::paginate(10);
            $slug_ar = "اجمالى الدفعات";
        }
        else {
            return abort(404, "الصفحة غير موجودة");
        }
        return view('dashboard.payment.index', ['payments' => $data, 'slug_ar' => $slug_ar]);
        
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
