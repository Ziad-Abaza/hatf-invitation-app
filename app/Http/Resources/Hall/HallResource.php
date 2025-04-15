<?php

namespace App\Http\Resources\Hall;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class HallResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id'         => $this->id,
            'name'       => $this->name,
            'email'      => $this->email,
            'phone'      => $this->phone,
            'desc'       => $this->desc,
            'longitude'  => $this->longitude,
            'latitude'   => $this->latitude,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'image'      => getIamgesMediaUrl($this->getMedia()),
        ];
    }
}
