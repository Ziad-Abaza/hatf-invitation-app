<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class InvitedUsers extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'phone',
        'code',
        'qr',
        'status',
        'user_invitations_id',
        'note'
    ];

    public function userInvitation()
    {
        return $this->belongsTo(UserInvitation::class, 'user_invitations_id');
    }
}
