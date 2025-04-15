<?php

namespace App\Models;

use Spatie\MediaLibrary\HasMedia;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Hall extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'desc',
        'longitude',
        'latitude',
        'url',
    ];

    public function scopeNearest($query, $latitude, $longitude, $radius = 50)
    {
        $haversine = "(6371 * acos(cos(radians($latitude))
                        * cos(radians(latitude))
                        * cos(radians(longitude) - radians($longitude))
                        + sin(radians($latitude))
                        * sin(radians(latitude))))";

        return $query->select('*', DB::raw("{$haversine} AS distance"))
            ->having('distance', '<=', $radius)
            ->orderBy('distance');
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('default');
    }
}
