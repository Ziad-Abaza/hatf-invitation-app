<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\User;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class LastSeen
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Check if the user is authenticated using the 'api' guard
        if (auth('api')->check()) {
            // Retrieve the authenticated user
            $user = auth('api')->user();
            
            // Update the last_seen timestamp to the current time and date
            $user->update(['last_seen' => now()]);
        }
    
        return $next($request);
    }
}
