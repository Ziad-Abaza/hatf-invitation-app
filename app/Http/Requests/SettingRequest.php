<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SettingRequest extends FormRequest
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
            'phone'             =>'nullable|min:8|max:20',
            'phone2'            =>'nullable|min:8|max:20',
            'email'             =>'nullable|email|min:5|max:100',
            'whatsapp'          =>'nullable|min:8|max:20',
            'facebook'          =>'nullable|min:8|max:200|url',
            'twitter'           =>'nullable|min:8|max:200|url',
            'linkedin'          =>'nullable|min:8|max:200|url',
            'tel'               =>'nullable|min:8|max:20',
            'website'           =>'nullable|url|min:2|max:255'
        ];
    }
}
