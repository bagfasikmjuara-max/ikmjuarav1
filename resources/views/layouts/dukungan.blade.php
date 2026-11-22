<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IKMJUARA - Support Panel</title>
    <link rel="icon" type="image/png" href="{{ asset('favicon.png') }}?v=1">
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('favicon.ico') }}?v=1">
    <link rel="apple-touch-icon" href="{{ asset('logo-ikm.png') }}?v=1">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        [x-cloak] { display: none !important; }
    </style>
    @yield('styles')
</head>
<body class="bg-slate-50">
    <div class="flex min-h-screen">
<aside class="w-80 bg-[#0F172A] text-white p-8 flex flex-col fixed top-0 left-0 h-full shadow-2xl z-50 overflow-y-auto">
    <div class="mb-12">
        <h1 class="text-2xl font-bold tracking-tight italic text-emerald-500">IKM<span class="text-white">JUARA</span></h1>
        <p class="text-[10px] text-slate-500 tracking-[0.3em] font-bold uppercase mt-1">Support Panel</p>
    </div>

    <nav class="space-y-3 flex-1">
        <a href="{{ url('dukungan/dashboard') }}" 
           class="flex items-center gap-4 p-4 rounded-2xl transition-all {{ request()->is('dukungan/dashboard*') ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
            </svg>
            <span class="font-bold text-[15px]">Dashboard</span>
        </a>

        <a href="{{ url('dukungan/peta') }}" 
           class="flex items-center gap-4 p-4 rounded-2xl transition-all {{ request()->is('dukungan/peta*') ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
            <span class="font-bold text-[15px]">Peta Sebaran</span>
        </a>

        {{-- Database IKM Terintegrasi with Sub-Menu --}}
        @php
            $isDbGroupActive = request()->is('dukungan/sebaran*') || request()->is('dukungan/usuldata*');
            $pendingUsulanCount = \App\Models\UsulanPerubahan::where('status_usulan', 'pending')->count();
        @endphp
        <div x-data="{ open: {{ $isDbGroupActive ? 'true' : 'false' }} }" class="space-y-1">
            <button type="button" @click="open = !open" 
                    class="w-full flex items-center justify-between p-4 rounded-2xl transition-all {{ $isDbGroupActive ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
                <div class="flex items-center gap-4">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                    </svg>
                    <span class="font-bold text-[14px]">Database IKM Terintegrasi</span>
                </div>
                <div class="flex items-center gap-2">
                    @if($pendingUsulanCount > 0)
                        <span class="bg-rose-500 text-white text-[10px] font-extrabold px-1.5 py-0.5 rounded-full animate-pulse">
                            {{ $pendingUsulanCount }}
                        </span>
                    @endif
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 transition-transform duration-200" :class="open ? 'rotate-180' : ''" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M19 9l-7 7-7-7" />
                    </svg>
                </div>
            </button>
            
            <div x-show="open" x-transition class="pl-12 space-y-1 pt-1">
                <a href="{{ url('dukungan/sebaran') }}" 
                   class="flex items-center justify-between p-3 rounded-xl text-xs font-bold transition-all {{ request()->is('dukungan/sebaran*') ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30' : 'text-slate-400 hover:text-white hover:bg-slate-800/30' }}">
                    <span>Data IKM</span>
                </a>
                <a href="{{ route('dukungan.usuldata.index') }}" 
                   class="flex items-center justify-between p-3 rounded-xl text-xs font-bold transition-all {{ request()->is('dukungan/usuldata*') ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30' : 'text-slate-400 hover:text-white hover:bg-slate-800/30' }}">
                    <span>Data Usulan</span>
                    @if($pendingUsulanCount > 0)
                        <span class="bg-rose-500 text-white text-[9px] font-black px-2 py-0.5 rounded-full">
                            {{ $pendingUsulanCount }}
                        </span>
                    @endif
                </a>
            </div>
        </div>

        <a href="{{ route('dukungan.konsultasi.index') }}" 
           class="flex items-center gap-4 p-4 rounded-2xl transition-all {{ request()->is('dukungan/konsultasi*') ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
            </svg>
            <span class="font-bold text-[15px]">Layanan Konsultasi</span>
            @php
                $unreadCount = \App\Models\Konsultasi::where('status', 'Belum Dijawab')
                    ->where('created_at', '>=', now()->subHours(6))
                    ->count();
            @endphp
            @if($unreadCount > 0)
                <span class="ml-auto bg-rose-500 text-white text-[10px] font-bold px-2 py-0.5 rounded-full animate-pulse">
                    {{ $unreadCount }}
                </span>
            @endif
        </a>

        {{-- Legalitas IKM with Sub-Menu --}}
        @php
            $isLegalitasActive = request()->is('dukungan/legalitas*');
        @endphp
        <div x-data="{ open: {{ $isLegalitasActive ? 'true' : 'false' }} }" class="space-y-1">
            <button type="button" @click="open = !open" 
                    class="w-full flex items-center justify-between p-4 rounded-2xl transition-all {{ $isLegalitasActive ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
                <div class="flex items-center gap-4">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                    </svg>
                    <span class="font-bold text-[14px]">Legalitas IKM</span>
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 transition-transform duration-200" :class="open ? 'rotate-180' : ''" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M19 9l-7 7-7-7" />
                </svg>
            </button>
            
            <div x-show="open" x-transition class="pl-12 space-y-1 pt-1">
                <a href="{{ route('dukungan.legalitas.index') }}" 
                   class="flex items-center justify-between p-3 rounded-xl text-xs font-bold transition-all {{ request()->is('dukungan/legalitas') && !request()->is('dukungan/legalitas/database*') ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30' : 'text-slate-400 hover:text-white hover:bg-slate-800/30' }}">
                    <span>Tracker Legalitas</span>
                </a>
                <a href="{{ route('dukungan.legalitas.database') }}" 
                   class="flex items-center justify-between p-3 rounded-xl text-xs font-bold transition-all {{ request()->is('dukungan/legalitas/database*') ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30' : 'text-slate-400 hover:text-white hover:bg-slate-800/30' }}">
                    <span>Database HKI & Halal</span>
                </a>
            </div>
        </div>

        <a href="{{ route('dukungan.tnadigital.index') }}" 
           class="flex items-center gap-4 p-4 rounded-2xl transition-all {{ request()->is('dukungan/tnadigital*') ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
            </svg>
            <span class="font-bold text-[15px]">TNA Digital</span>
        </a>

        <a href="{{ route('dukungan.daftarpeserta.index') }}" 
           class="flex items-center gap-4 p-4 rounded-2xl transition-all {{ request()->is('dukungan/daftarpeserta*') ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
            </svg>
            <span class="font-bold text-[15px]">Rekap Peserta Pelatihan</span>
        </a>

        <a href="{{ route('dukungan.siinas.index') }}" 
           class="flex items-center gap-4 p-4 rounded-2xl transition-all {{ request()->is('dukungan/siinas*') ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
            </svg>
            <span class="font-bold text-[15px]">Integrator SIINas</span>
        </a>

        <a href="{{ route('dukungan.rekomhkimerek.index') }}" 
           class="flex items-center gap-4 p-4 rounded-2xl transition-all {{ request()->is('dukungan/rekomhkimerek*') ? 'bg-amber-500 text-slate-950 font-black shadow-lg shadow-amber-500/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
            </svg>
            <span class="font-bold text-[15px]">Rekomendasi HKI Merek</span>
            @php
                $pendingHkiCount = \App\Models\PermohonanHkiMerek::where('status', 'Pending')->count();
            @endphp
            @if($pendingHkiCount > 0)
                <span class="ml-auto bg-amber-400 text-slate-950 text-[10px] font-black px-2 py-0.5 rounded-full">
                    {{ $pendingHkiCount }}
                </span>
            @endif
        </a>

        <a href="{{ route('dukungan.statistik-sosmed.index') }}" 
           class="flex items-center gap-4 p-4 rounded-2xl transition-all {{ request()->is('dukungan/statistik-sosmed*') ? 'bg-emerald-600 text-white shadow-lg shadow-emerald-600/30' : 'text-slate-400 hover:bg-slate-800/50 hover:text-white' }}">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
            </svg>
            <span class="font-bold text-[15px]">Statistik & Sosmed</span>
        </a>

    </nav>

    <div class="mt-auto">
        <hr class="border-slate-800/50 mb-6">
        <a href="javascript:void(0)" onclick="handleLogout()" 
           class="flex items-center gap-4 p-4 rounded-2xl text-red-400 hover:bg-red-500/10 hover:text-red-500 transition-all font-bold">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-500/50 group-hover:text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
            </svg>
            <span class="text-[15px]">Keluar Sesi</span>
        </a>
        <form id="logout-form" action="{{ route('logout.dukungan') }}" method="POST" class="hidden">
            @csrf
        </form>
    </div>
</aside>
        <main class="flex-1 ml-80 min-w-0 overflow-x-hidden min-h-screen">
            @unless(View::hasSection('hide_header_title'))
            <header class="bg-white border-b border-slate-100 p-10 flex justify-between items-end">
                <div>
                    <h2 class="text-3xl font-extrabold text-slate-800">@yield('title', 'Dukungan Panel')</h2>
                    <p class="text-xs text-slate-400 font-bold uppercase tracking-widest mt-2">
                        {{ strtoupper(\Carbon\Carbon::now()->translatedFormat('l, d F Y')) }}
                    </p>
                </div>
            </header>
            @endunless

            <div class="p-10">
                @yield('content')
            </div>
        </main>
    </div>
<script>
    function handleLogout() {
        Swal.fire({
            title: 'Konfirmasi Keluar',
            html: `
                <div class="flex flex-col items-center text-center p-2">
                    <div class="w-20 h-20 bg-rose-50 rounded-full flex items-center justify-center mb-6 text-rose-500 animate-pulse">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                        </svg>
                    </div>
                    <p class="text-slate-500 font-semibold leading-relaxed text-sm">
                        Apakah Anda yakin ingin keluar dari Support Panel <span class="font-extrabold text-slate-800">IKMJUARA</span>?
                    </p>
                </div>
            `,
            showCancelButton: true,
            confirmButtonText: 'Ya, Keluar Sekarang',
            cancelButtonText: 'Batal',
            confirmButtonColor: '#ef4444',
            cancelButtonColor: '#475569',
            focusCancel: true,
            borderRadius: '24px',
            padding: '2.5rem',
            customClass: {
                popup: 'rounded-[2rem] border border-slate-100 shadow-2xl',
                title: 'font-extrabold text-slate-800 text-2xl',
                confirmButton: 'px-6 py-3 rounded-2xl font-bold text-sm shadow-lg shadow-rose-500/20 transition-all duration-300 hover:scale-[1.02]',
                cancelButton: 'px-6 py-3 rounded-2xl font-bold text-sm transition-all duration-300 hover:scale-[1.02]'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                let timerInterval;
                let secondsLeft = 3;
                
                Swal.fire({
                    title: 'Mengeluarkan Anda...',
                    html: `
                        <div class="flex flex-col items-center text-center p-2">
                            <div class="relative w-24 h-24 flex items-center justify-center mb-6">
                                <svg class="w-full h-full transform -rotate-90">
                                    <circle cx="48" cy="48" r="40" stroke="#f1f5f9" stroke-width="8" fill="transparent" />
                                    <circle id="progress-circle" cx="48" cy="48" r="40" stroke="#ef4444" stroke-width="8" fill="transparent" 
                                            stroke-dasharray="251.3" stroke-dashoffset="0" class="transition-all duration-1000 ease-linear" />
                                </svg>
                                <span id="countdown-text" class="absolute text-3xl font-extrabold text-slate-800">3</span>
                            </div>
                            <p class="text-slate-500 font-semibold text-sm">
                                Sesi Anda akan ditutup dalam <span id="countdown-duration" class="font-extrabold text-rose-500">3 detik</span>.
                            </p>
                        </div>
                    `,
                    showCancelButton: true,
                    cancelButtonText: 'Batal Keluar',
                    cancelButtonColor: '#475569',
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    borderRadius: '24px',
                    padding: '2.5rem',
                    customClass: {
                        popup: 'rounded-[2rem] border border-slate-100 shadow-2xl',
                        title: 'font-extrabold text-slate-800 text-2xl',
                        cancelButton: 'px-6 py-3 rounded-2xl font-bold text-sm transition-all duration-300 hover:scale-[1.02]'
                    },
                    didOpen: () => {
                        const progressCircle = document.getElementById('progress-circle');
                        const countdownText = document.getElementById('countdown-text');
                        const countdownDuration = document.getElementById('countdown-duration');
                        const circumference = 251.3;
                        
                        timerInterval = setInterval(() => {
                            secondsLeft--;
                            if (secondsLeft >= 0) {
                                if (countdownText) countdownText.innerText = secondsLeft;
                                if (countdownDuration) countdownDuration.innerText = secondsLeft + ' detik';
                                
                                const offset = circumference - (secondsLeft / 3) * circumference;
                                if (progressCircle) {
                                    progressCircle.style.strokeDashoffset = offset;
                                }
                            }
                            
                            if (secondsLeft === 0) {
                                clearInterval(timerInterval);
                                document.getElementById('logout-form').submit();
                            }
                        }, 1000);
                    },
                    willClose: () => {
                        clearInterval(timerInterval);
                    }
                }).then((countdownResult) => {
                    if (countdownResult.dismiss === Swal.DismissReason.cancel) {
                        Swal.fire({
                            title: 'Dibatalkan',
                            text: 'Sesi Anda tetap aktif.',
                            icon: 'info',
                            timer: 1500,
                            showConfirmButton: false,
                            borderRadius: '24px',
                            customClass: {
                                popup: 'rounded-[2rem] border border-slate-100 shadow-2xl',
                                title: 'font-extrabold text-slate-800 text-xl'
                            }
                        });
                    }
                });
            }
        });
    }
</script>
    @yield('scripts')
</body>
</html>
