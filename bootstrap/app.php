<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
->withMiddleware(function (Middleware $middleware) {
    // Menghubungkan alias 'admin' dengan class AdminMiddleware yang Anda buat
    $middleware->alias([
        'admin' => \App\Http\Middleware\AdminMiddleware::class,
        'role_pusat' => \App\Http\Middleware\RolePusat::class,
        'dukungan' => \App\Http\Middleware\DukunganMiddleware::class,
    ]);

    // Kecualikan rute API publik & usulan dari proteksi CSRF
    $middleware->validateCsrfTokens(except: [
        'usul-ubah-ikm',
        'api/buat-konsultasi',
        'api/kirim-pesan-konsultasi',
        'api/kirim-pesan-user',
        'api/cari-ikm',
        'api/tnadigital/store',
    ]);
})
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
