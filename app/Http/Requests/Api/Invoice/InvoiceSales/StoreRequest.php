<?php

namespace App\Http\Requests\Api\Invoice\InvoiceSales;

use Illuminate\Validation\Rule;
use App\Http\Requests\Api\BaseFormRequest;

class StoreRequest extends BaseFormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(): array
    {
        return [
            'order_num'                      => 'nullable|integer',
            'invoice_date'                   => 'required|date|date_format:Y-m-d',
            'subject'                        => 'nullable|string|max:255',
            'element_data'                   => 'required|array',
            'element_data.*'                 => 'required',
            'element_data.*.product_id'      => ['required', Rule::in(auth('owner')->user()->Products->pluck('id')->toArray())],
            'element_data.*.element_details' => 'required',
            'element_data.*.element_amount'  => 'required|numeric',
            'element_data.*.element_price'   => 'required|numeric',
            'file'                           => 'nullable|file|mimes:jpg,jpeg,bmp,png,doc,docx,csv,rtf,xlsx,xls,txt,pdf,zip',
            'client_note'                    => 'nullable|string|max:255',
            'discount'                       => 'nullable|numeric',
            'shipping_fee'                   => 'nullable|numeric',
            'tax'                            => 'nullable|numeric|max:100',
            'representative_id'              => ['nullable', Rule::in(auth('owner')->user()->Representatives->pluck('id')->toArray() ?? [])],
            'client_id'                      => ['required', 'exists:clients,id', Rule::in(auth('owner')->user()->Clients->pluck('id')->toArray() ?? [])],
        ];
    }
}
