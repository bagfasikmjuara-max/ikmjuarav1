<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class RolePusat
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next): Response
    {
        // 1. Cek apakah user sudah login
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        // 2. Cek apakah role di database adalah 'superadmin'
        if (Auth::user()->role === 'superadmin') {
            return $next($request);
        }

        // 3. Jika login tapi bukan superadmin, lempar ke halaman depan
        return redirect('/')->with('error', 'Akses ditolak!');
    }
}