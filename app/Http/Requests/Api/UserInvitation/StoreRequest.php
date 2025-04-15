<?php

namespace App\Http\Requests\Api\UserInvitation;

use App\Http\Requests\Api\BaseFormRequest;

class StoreRequest extends BaseFormRequest
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
            'invitation_id'           => 'required|integer|exists:invitations,id',
            // 'image'                   => 'required|file|image|mimes:png,jpg',
            'file'                   => 'required|file|mimes:png,jpg,pdf',
            'invitation_date'         => 'required|date', 
            'invitation_time'         => 'required|date_format:H:i', 
            // 'phone'         => 'required|array',
            // 'name'          => 'required|array',
            // 'code'          => 'required|array',
            // 'phone.*'       => 'required|numeric',
            // 'name.*'        => 'required|string',
            // 'code.*'        => 'required|numeric',
            // 'qr' => 'required|array',
        ];
    }
}
