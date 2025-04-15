<?php

namespace App\Http\Requests\Api\Account;

use App\Models\AccountType;
use Illuminate\Validation\Rule;
use App\Http\Requests\Api\BaseFormRequest;

class UpdateRequest extends BaseFormRequest
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
            'account_name'    => 'required|string|max:255',
            'account_code'    => 'nullable|string|max:255',
            'description'     => 'nullable|string|max:255',
            'follow_main'     => 'required|boolean',
            'account_type_id' => ['required', Rule::in(AccountType::pluck('id')->toArray() ?? [])],
        ];
    }
}
