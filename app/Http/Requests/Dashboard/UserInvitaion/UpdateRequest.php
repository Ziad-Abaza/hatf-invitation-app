<?php

namespace App\Http\Requests\Dashboard\UserInvitaion;

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
            'user_id'       => 'required|integer',
            'invitation_id' => 'required|integer',
            'photo'         => 'file|image|mimes:png,jpg,svg',
        ];
    }
}
