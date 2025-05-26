<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\UserPackage;
use Spatie\MediaLibrary\HasMedia;
use App\Services\UserPaymentService;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserInvitation extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    public const AVAILABLE = 1;
    public const FULL      = 0;

    protected $fillable = [
        'state',
        'name',
        'number_invitees',
        'is_active',
        'time',
        'user_id',
        'invitation_id',
        'invitation_date',
        'invitation_time',
        'type',
        'user_package_id',
        'text_settings'
    ];

    protected $casts = [
        'text_settings' => 'array',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function invitation(): BelongsTo
    {
        return $this->belongsTo(Invitation::class);
    }

    public function invitedUsers(): HasMany
    {
        return $this->hasMany(InvitedUsers::class, 'user_invitations_id');
    }



    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('default');
        $this->addMediaCollection('document');
        $this->addMediaCollection('userInvitation');
        $this->addMediaCollection('qr');
    }

    public function userPackage()
    {
        return $this->belongsTo(UserPackage::class,'user_package_id');
    }

    public function paymentUserInvitations()
{
    return $this->belongsToMany(PaymentUserInvitation::class);
}
}
