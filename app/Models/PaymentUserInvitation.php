<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\UserPackage;
use App\Services\UserPaymentService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PaymentUserInvitation extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id_payment',
        'status',
        'value',
        'user_id',
        'transfered',
        'payment_uuid',
    ];

    public function userPackage(){
        return $this->belongsTo(UserPackage::class,'id','payment_user_invitation_id');
    }




public static function chickExpirartionPrivateInvitation($userPackage)
{
    //chick if success payment  
    $userPackage=UserPackage::where('id',$userPackage)->first();
   
    if ($userPackage->invitation->max_date !== "unlimited") {

        $userInvitationDate = Carbon::parse($userPackage->payment->created_at);

        // Define expiration date based on max_date
        switch ($userPackage->invitation->max_date) {
            case 'day':
                $MaxUserInvitationDate = $userInvitationDate->copy()->addDay(); // Add 1 day
                break;
    
            case 'month':
                $MaxUserInvitationDate = $userInvitationDate->copy()->addMonth(); // Add 1 month
                break;
    
            case 'year':
                $MaxUserInvitationDate = $userInvitationDate->copy()->addYear(); // Add 1 year
                break;
    
            default:
                // Handle unexpected cases
                return errorResponse(['message' => 'Invalid max_date value.'], 422);
        }
        // Check if current date exceeds the allowed invitation date
            // Check if current date exceeds the allowed invitation date
            if ($MaxUserInvitationDate->lt(Carbon::now())) {
                return [
                    'message' =>                    "تخطية " . '' .
                        $MaxUserInvitationDate->format('Y-m-d') .
                        " من الدعوات المسموح بها منذ بداية الباقة في " .
                        Carbon::parse($userPackage->payment->created_at)->format('Y-m-d') . ".",
                    'status' => false,
                ];
            } else {
                return [
                    'message' => 'الباقة فعالة حتى'.''.$MaxUserInvitationDate->format('Y-m-d'),
                    'expire_date' =>$MaxUserInvitationDate->format('Y-m-d'),
                    'status' => true
                ];
            }
    }
}


protected static function boot()
{
    parent::boot();
    static::creating(function ($model) {
        if (auth('api')) {
            $model->user_id = auth('api')->id();
        }
    });
}

}
