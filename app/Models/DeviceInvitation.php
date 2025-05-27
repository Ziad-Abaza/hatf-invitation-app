<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeviceInvitation extends Model
{
    use HasFactory;

    protected $fillable = ['device_id', 'remaining_invitations', 'user_id'];

    /**
     * Get the user that owns the device invitation.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
