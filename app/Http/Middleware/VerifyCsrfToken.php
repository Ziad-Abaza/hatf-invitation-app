<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    protected $except = [
        //
        'payment/return',
        'payment/return/*',
        'invitation/webhook',
        'invitation/webhook/*',
        'api/v1/invitation/webhook',
        'api/v1/invitation/webhook/*',
    ];
}
