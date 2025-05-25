<?php

// App/Http/Requests/Api/UserInvitation/InviteOpeningRequest.php

namespace App\Http\Requests\Api\UserInvitation;

use App\Http\Requests\Api\BaseFormRequest;

class InviteOpeningRequest extends BaseFormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'phone'   => 'required|array',
            'name'    => 'required|array',
            'code'    => 'required|array',
            'qr'      => 'required|array',
            'note'    => 'nullable|array',
            'text'   => 'required|array',

            'phone.*' => 'required|numeric',
            'name.*'  => 'required|string',
            'code.*'  => 'required|numeric|unique:invited_users,code',
            'qr.*'    => 'required|file|max:15000',
            'note.*'  => 'nullable|string',
            'text.color' => 'required|string',
            'text.size' => 'required|integer',
            'text.font' => 'required|string',
            'text.x' => 'required',
            'text.y' => 'required',
        ];
    }
}

