<?php

namespace App\Http\Requests\Api\User;

use App\Http\Requests\Api\BaseFormRequest;

class UpdateBankRequest extends BaseFormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'bank_name' => 'required|string',
            'iban'      => 'required|string',
        ];
    }
}
