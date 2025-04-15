<?php

namespace App\Http\Requests\Api\Product;

use App\Models\Account;
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
            'name'           => 'required|string|max:255',
            'type'           => 'required|in:1,2',
            'default_price'  => 'required|numeric',
            'account_id'     => ['required', Rule::in(Account::myAccountsIds() ?? [])],
            'unit_id'        => 'nullable|exists:units,id',
        ];
    }
}
