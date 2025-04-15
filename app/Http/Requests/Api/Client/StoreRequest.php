<?php

namespace App\Http\Requests\Api\Client;

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
            'name'         => 'nullable|string|max:255',
            'second_name'  => 'nullable|string|max:255',
            'email'        => 'nullable|email|max:255',
            'display_name'   => 'required|string|max:255',
            'comapny_name' => 'nullable|string|max:255',
            'phone'        => 'nullable|string|max:255',
            'mobile'       => 'nullable|string|max:255',
            'type'         => 'required|in:1,2',
        ];
    }
}
