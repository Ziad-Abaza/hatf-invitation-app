<?php

namespace App\Http\Requests\Api\Invoice\PaymentSales;

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
            'receipt_number'               => 'required|integer',
            'date'                         => 'required|date|date_format:Y-m-d',
            'receipt_amount'               => 'nullable|numeric',
            'account_id'                   => ['required', Rule::in(auth('owner')->user()->Accounts->pluck('id')->toArray())],
            'payment_method'               => ['required', Rule::in(1, 2)],
            'check_number'                 => 'nullable|integer',
            'element_data'                 => 'required|array',
            'element_data.*'               => 'required',
            'element_data.*.invoic_id'     => ['required', Rule::in(auth('owner')->user()->invoiceSales->pluck('id')->toArray())],
            'element_data.*.invoic_amount' => 'nullable|numeric',
            'invoice_sales_id'             =>['nullable', Rule::in(auth('owner')->user()->invoiceSales->pluck('id')->toArray())],
        ];
    }
}
