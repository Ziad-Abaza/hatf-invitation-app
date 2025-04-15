<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\User;
use App\Models\TransferredAmount;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\PaymentUserInvitation;
use App\Exports\MarkterTransferedPaymentImport;

class TransferredAmountController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $transferredAmounts=TransferredAmount::all();


        return view('dashboard.transferPayments.index',compact('transferredAmounts'));

    }


    /**
     * Store a newly created resource in storage.
     */
    public function store($markterId)
    {
        $Markter = User::find($markterId);
        $totalPaymentHistory=$Markter->totalPaymentHistory($markterId);
        $data =[
            'user_id' => $markterId,
            'amount' => $Markter->totalPaymentValue($markterId),
            'history' => json_encode($totalPaymentHistory),
        ];
        $Markter->update(['wallet'=> ($Markter->wallet + $data['amount']) ]);
        TransferredAmount::create($data);
       foreach ($totalPaymentHistory as $value) {
        PaymentUserInvitation::where('id',$value->id)->update(['transfered'=>'1']);
       }
        return redirect()->back()->with("success", "transfered success");
    }

    /**
     * Display the specified resource.
     */
    public function show(TransferredAmount $transferredAmount)
    {
        $data =[
            'user_id' =>$transferredAmount->user_id,
            'amount' => $transferredAmount->amount,
            'history' => json_decode($transferredAmount->history)
        ];
        
        dd($data);
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(TransferredAmount $transferredAmount)
    {
        $transferredAmount->delete();
        
        return redirect()->back()->with("success", "transfered deleted success");

    }


    public function destroyAll()
    {
        
        $transferredAmounts=TransferredAmount::all();

        dd($transferredAmounts);

        foreach ($transferredAmounts as  $value) {
            $value->delete();

        }
        
        return redirect()->back()->with("success", "transfered all deleted success");

    }

    public function export()
    {

        return Excel::download(new MarkterTransferedPaymentImport, 'MarkterTransferedPaymentImport.xlsx');


    }
}
