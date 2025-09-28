<?php

namespace App\Http\Resources\Invitation;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InvitationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $baseData = [
            'id'              => $this->id,
            'name'            => json_decode($this->name, true),
            'number_of_users' => $this->number_of_users,
            'prise'           => $this->prise,
            'image'           => $this->getFirstMediaUrl('default'),
            'type'            => $this->type,
            'discount'        => 100, 
            'created_at'      => $this->created_at,
            'updated_at'      => $this->updated_at,
        ];

        if ($this->max_date != "unlimited") {
            $baseData['max_date'] = $this->max_date;
        }

        return $baseData;
    }
}
