<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Exports\UsersExport;
use App\Models\TransferredAmount;
use Maatwebsite\Excel\Facades\Excel;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use App\Exports\MarkterDeservePaymentImport;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id',
        'name',
        'email',
        'password',
        'phone',
        'otp',
        'fcm_token',
        'code',
        'url',
        'wallet',
        'user_verified',
        'referral_id',
        'bank_name',
        'iban',
        'subscription',
        'last_seen'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        // 'password'          => 'hashed',
    ];

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims(): array
    {
        return [];
    }

    public function userInvitations()
    {
        return $this->hasMany(UserInvitation::class);
    }

    public static function getUsersByReferral($referralId)
    {
        return self::where('referral_id', $referralId)->count();
    }


    // public function totalPaymentValue($id,$transfered='0')
    // {
    //     // return PaymentUserInvitation::where('status', 1)
    //     // ->with('userPackage.userInvitation.user', function ($q) {
    //     //     $q->where('referral_id', 27); // Compare `referral_id` to the value `8`
    //     // })->selectRaw('SUM((value - (value * 0.172) - 1) * 0.10) as total')
    //     // ->value('total');

    //         return PaymentUserInvitation::where('status', 1)->where('transfered',$transfered)
    //             ->whereHas('userPackage.user', function ($q) use ($id) {
    //                 $q->where('referral_id', $id);
    //             })
    //             ->get()
    //             ->sum(function ($invitation) {
    //                 $paymentValue = $invitation->value;
    //                 return ($paymentValue - ($paymentValue * 0.173) - 1) * 0.10;
    //             });



    //     // return $this->userInvitations->sum(function ($userInvitation) {
    //     //     $paymentValue = $userInvitation->userPackage->payment->value;
    //     //     $paymentValue = ($paymentValue - ($paymentValue * 0.173) - 1) * 0.10;
    //     //     return $paymentValue;
    //     // });

    // }


    public function totalPaymentValue($id, $transfered = '0')
    {
        $indirectSumUsers = User::where('referral_id', $id)->get();
            
        $sumIndirectSumUsers = [];

        foreach ($indirectSumUsers as $indirectSumUser) {
            $userId=$indirectSumUser->id;
            $value =  PaymentUserInvitation::where('status', 1)->where('transfered', $transfered)
                ->whereHas('userPackage.user', function ($q) use ($userId) {
                    $q->where('referral_id', $userId);
                })
                ->get()
                ->sum(function ($invitation) {
                    $paymentValue = $invitation->value;
                    return ($paymentValue - ($paymentValue * 0.173) - 1) * 0.05;
                });

            $sumIndirectSumUsers[] = $value;
        }


        $directSumUsers = PaymentUserInvitation::where('status', 1)->where('transfered', $transfered)
            ->whereHas('userPackage.user', function ($q) use ($id) {
                $q->where('referral_id', $id);
            })
            ->get()
            ->sum(function ($invitation) {
                $paymentValue = $invitation->value;
                return ($paymentValue - ($paymentValue * 0.173) - 1) * 0.10;
            });

        $sumIndirectSumUsers[] = $directSumUsers;

        return array_sum($sumIndirectSumUsers);
        // dd(array_sum($sumIndirectSumUsers));
    }

    public function referrals()
    {
        return $this->hasMany(User::class, 'referral_id');
    }



    public function totalPaymentHistory($userid)
    {
        // return $this->userInvitations->flatMap(function ($invitation) {
        //     return $invitation->paymentUserInvitations;
        // });
        return PaymentUserInvitation::where('status', 1)->where('transfered', '0')
            ->whereHas('userPackage.user', function ($q) use ($userid) {
                $q->where('referral_id', $userid);
            })
            ->get();
    }


    public function transferredAmounts()
    {
        return $this->hasMany(TransferredAmount::class);
    }
}
