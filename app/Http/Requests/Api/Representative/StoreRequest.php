<?php

namespace App\Http\Requests\Api\Representative;

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
            'name'        => 'required|string|max:255',
            'second_name' => 'required|string|max:255',
            'email'       => 'nullable|email|max:255',
            'salary'      => 'nullable|integer',
            'managment'   => 'nullable|string|max:255',
            'phone'       => 'nullable|numeric',
            'mobile'      => 'nullable|numeric',
            'address'     => 'nullable|string|max:255',
            'ratio'       => 'required|numeric|max:100',
        ];
    }
}
