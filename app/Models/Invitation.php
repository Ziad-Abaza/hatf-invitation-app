<?php

namespace App\Models;

use Spatie\MediaLibrary\HasMedia;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Invitation extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    protected $fillable = [
        'name',
        'number_of_users',
        'prise',
        'max_date'
    ];

    protected $hidden = ['max_date'];


    /**
     * Function to make 'max_date' visible.
     * You can call this method in your controller or wherever needed.
     */
    public static function showMaxDate(Invitation $invitation)
    {
        // Make 'max_date' column visible
        $invitation->makeVisible('max_date');
        return $invitation;
    }

    public function userInvitations()
    {
        return $this->hasMany(UserInvitation::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('default')
            ->singleFile();
    }
}
