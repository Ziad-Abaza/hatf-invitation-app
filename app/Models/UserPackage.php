<?php

namespace App\Models;

use App\Models\User;
use App\Models\UserInvitation;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserPackage extends Model
{
    use HasFactory;
    protected $fillable = [
        'payment_user_invitation_id',
        'invitation_id',
        'user_id'
    ];
    protected static function boot()
    {
        parent::boot();
        static::creating(function ($userPackage) {
                $userPackage->user_id = auth('api')->user()->id;
        });
    }

    public function invitation(){
        return $this->belongsTo(Invitation::class,'invitation_id');
    }

    public function payment(){
        return $this->belongsTo(PaymentUserInvitation::class,'payment_user_invitation_id');
    }

    public function userInvitation()
    {
        return $this->belongsTo(UserInvitation::class,'id','user_package_id');
    }
    
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
