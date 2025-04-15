<?php

namespace App\Http\Requests\Api\UserInvitation;

use App\Http\Requests\Api\BaseFormRequest;

class InviteRequest extends BaseFormRequest
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




            'phone'   => 'required|array',
            'name'    => 'required|array',
            'code'    => 'required|array',
            'qr'      => 'required|array',
            'note'    => 'nullable|array',

            'phone.*' => 'required|numeric',
            'name.*'  => 'required|string',
            'code.*'  => 'required|numeric|unique:invited_users,code',
            'qr.*'    => 'required|file|max:15000',
            'note.*'  => 'nullable|string',



        ];
    }
}
