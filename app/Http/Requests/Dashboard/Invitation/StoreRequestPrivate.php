<?php

namespace App\Http\Requests\Dashboard\Invitation;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequestPrivate extends FormRequest
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
            'name'            => 'required|string',
            'prise'           => 'required|numeric',
            'number_of_users' => 'required|numeric',
            'image'           => 'required|file|image|mimes:png,jpg,svg',
            'max_date'        => 'required|in:day,month,year',
        ];
    }
}
