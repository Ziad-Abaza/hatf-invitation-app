<?php

namespace App\Http\Requests\Api\Client;

use App\Http\Requests\Api\BaseFormRequest;

class IndexRequest extends BaseFormRequest
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
            'name'          => 'nullable|string|max:255',
            // 'account_id'    => ['nullable', Rule::in($this->account_ids)],
            'invoice_date'  => 'nullable|date|date_format:Y-m-d',
            'invoice_num'   => 'nullable|integer',
            'invoic_total'  => 'nullable|numeric',
        ];
    }
}
