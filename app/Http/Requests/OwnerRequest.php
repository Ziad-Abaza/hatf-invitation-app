<?php

namespace App\Http\Requests;

use App\Http\Requests\Api\BaseFormRequest;

class OwnerRequest extends BaseFormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'          => 'required|string|max:255',
            'second_name'   => 'required|string|max:255',
            'email'         => 'required|email|max:255|unique:owners,email' ,
            'password'      => 'required|confirmed|min:6|max:255',
            'avater'        => 'nullable|mimes:jpg,jpeg,png,gif,webp',
        ];
    }
}
