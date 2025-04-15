<?php

namespace App\Http\Resources\Excel;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MarkterTransferedPaymentImportResource extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @return array<int|string, mixed>
     */
    public function toArray(Request $request): array
    {

        return [
            'رقم' =>                  $this->id,
            'اسم المسوق' =>           $this->user->name,
            'المبلغ' =>               $this->amount,
        ];
    }
}
