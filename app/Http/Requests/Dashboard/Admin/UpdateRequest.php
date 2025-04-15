<?php

namespace App\Http\Requests\Dashboard\Admin;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
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
            'name'     => 'required|string|max:255',
            'password' => 'nullable|string|max:255',
            'email'    => 'required|string|email|unique:admins,email,'. $this->admin->id,
            'phone'    => 'nullable|numeric|unique:admins,phone,'. $this->admin->id,
            'address'  => 'nullable|string|max:255',
            'image'    => 'nullable|image|file|mimes:png,jpg,svg',
        ];
    }
}
