<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LanguageController extends Controller
{
    public function setLanguage(Request $request, string $lang)
    {
        if (!in_array($lang, ['ar', 'en']))
            $lang = 'ar';

        $request->session()->put('lang', $lang);

        return redirect()->back();
    }
}
