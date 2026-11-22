<?php

namespace App\Http\Controllers\Pusat;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLoginForm() {
        return view('pusat.login'); // Kita buat filenya setelah ini
    }

    public function login(Request $request) {
        $credentials = $request->only('username', 'password');

        if (Auth::attempt($credentials)) {
            // Cek apakah yang login BENAR seorang superadmin
            if (auth()->user()->role === 'superadmin') {
                return redirect()->intended('/pusat/dashboard');
            }
            // Jika bukan superadmin, paksa logout
            Auth::logout();
            return back()->with('error', 'Anda bukan Superadmin!');
        }

        return back()->with('error', 'Login Gagal!');
    }
}