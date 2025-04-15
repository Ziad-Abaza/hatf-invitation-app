<?php

namespace App\Http\Resources\Excel;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MarkterDeservePaymentImportResource extends JsonResource
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
            'اسم المسوق' =>           $this->name,
            'البريد الالكتروني' =>    $this->email,
            'هاتف المسوق' =>         $this->phone,
            'رمز المسوق' =>          $this->code,
            'رقم الحساب' =>          $this->iban,
            'عدد العملاء' =>          User::getUsersByReferral($this->id),
            'رابط المسوق' =>         $this->url,
            'المبالغ المستحقة<' =>  $this->totalPaymentValue($this->id),
        ];
    }
}
