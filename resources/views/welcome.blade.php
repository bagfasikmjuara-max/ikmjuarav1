<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
        content="IKM Juara - Platform akselerasi industri lokal Kota Madiun menuju pasar global. Integrasi Konsultasi Mandiri untuk produktivitas industri.">
    <title>IKM Juara - Akselerasi Industri Lokal</title>

    <link rel="icon" type="image/png" href="{{ asset('favicon.png') }}?v=1">
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('favicon.ico') }}?v=1">
    <link rel="apple-touch-icon" href="{{ asset('logo-ikm.png') }}?v=1">

    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        .gradient-text {
            background: linear-gradient(90deg, #6366f1, #a855f7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-card {
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.05);
            animation: float 6s ease-in-out infinite;
        }

        html {
            scroll-behavior: smooth;
        }

        @keyframes float {
            0% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-20px);
            }

            100% {
                transform: translateY(0px);
            }
        }

        /* Optimalisasi transisi menu mobile */
        #mobile-menu {
            transition: all 0.3s ease-in-out;
        }

        /* Animasi Maskot Character */
        @keyframes mascotFloat {

            0%,
            100% {
                transform: translateY(0px) rotate(0deg);
            }

            50% {
                transform: translateY(-14px) rotate(1.8deg);
            }
        }

        @keyframes mascotPulseGlow {

            0%,
            100% {
                opacity: 0.35;
                transform: scale(0.95);
            }

            50% {
                opacity: 0.75;
                transform: scale(1.1);
            }
        }

        .animate-mascot-float {
            animation: mascotFloat 4.5s ease-in-out infinite;
        }

        .animate-mascot-glow {
            animation: mascotPulseGlow 3.5s ease-in-out infinite;
        }
    </style>
</head>

<body class="bg-slate-50 overflow-x-hidden">

    <nav class="bg-white/80 backdrop-blur-md sticky top-0 z-50 border-b border-slate-100 transition-all duration-300">
        <div class="flex justify-between items-center px-6 lg:px-12 py-5">
            <a href="{{ url('/') }}"
                class="flex items-center gap-3 group transition-transform duration-300 hover:scale-[1.02]">
                <div
                    class="w-10 h-10 rounded-xl overflow-hidden flex items-center justify-center bg-slate-50 border border-slate-100 group-hover:shadow-md transition-all duration-300">
                    <img src="{{ asset('logo-ikm.png') }}" alt="Logo"
                        class="w-full object-contain group-hover:scale-110 transition-transform duration-300">
                </div>
                <span class="text-2xl font-black tracking-tight text-slate-800 uppercase">
                    IKM<span class="text-amber-500 group-hover:text-amber-600 transition-colors">JUARA</span>
                </span>
            </a>

            <div class="hidden md:flex items-center gap-3 font-bold text-xs tracking-wider text-slate-700">
                <a href="{{ route('profil') }}"
                    class="inline-flex items-center gap-2 px-4 py-2.5 rounded-2xl bg-slate-100/80 hover:bg-slate-900 text-slate-700 hover:text-white border border-slate-200/70 hover:border-slate-900 font-extrabold tracking-wider transition-all duration-300 shadow-sm hover:shadow-md hover:scale-[1.03] active:scale-95 group">
                    <svg xmlns="http://www.w3.org/2000/svg"
                        class="h-4 w-4 text-indigo-500 group-hover:text-white transition-colors" fill="none"
                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                    </svg>
                    <span>PROFIL</span>
                </a>
                <a href="{{ url('/dashboardikmjuara') }}"
                    class="inline-flex items-center gap-2 px-5 py-2.5 rounded-2xl bg-gradient-to-r from-indigo-600 via-purple-600 to-violet-600 hover:from-indigo-700 hover:to-violet-700 text-white font-black tracking-wider shadow-lg shadow-indigo-500/25 hover:shadow-indigo-500/40 hover:scale-[1.04] active:scale-95 transition-all duration-300 border border-indigo-400/30">
                    <span class="relative flex h-2 w-2">
                        <span
                            class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                        <span class="relative inline-flex rounded-full h-2 w-2 bg-emerald-400"></span>
                    </span>
                    <span>DASHBOARD IKM JUARA</span>
                </a>
                <a href="{{ route('peta.umum') }}"
                    class="inline-flex items-center gap-2 px-4 py-2.5 rounded-2xl bg-slate-100/80 hover:bg-slate-900 text-slate-700 hover:text-white border border-slate-200/70 hover:border-slate-900 font-extrabold tracking-wider transition-all duration-300 shadow-sm hover:shadow-md hover:scale-[1.03] active:scale-95 group">
                    <svg xmlns="http://www.w3.org/2000/svg"
                        class="h-4 w-4 text-emerald-500 group-hover:text-white transition-colors" fill="none"
                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" />
                    </svg>
                    <span>PETA IKM BINAAN</span>
                </a>
                <a href="{{ route('daftar') }}"
                    class="inline-flex items-center gap-2 px-4 py-2.5 rounded-2xl bg-slate-100/80 hover:bg-slate-900 text-slate-700 hover:text-white border border-slate-200/70 hover:border-slate-900 font-extrabold tracking-wider transition-all duration-300 shadow-sm hover:shadow-md hover:scale-[1.03] active:scale-95 group">
                    <svg xmlns="http://www.w3.org/2000/svg"
                        class="h-4 w-4 text-amber-500 group-hover:text-white transition-colors" fill="none"
                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                    </svg>
                    <span>PENDAFTARAN</span>
                </a>
                <a href="{{ route('layananmpp') }}"
                    class="inline-flex items-center gap-2 px-4 py-2.5 rounded-2xl bg-amber-500 hover:bg-amber-600 text-slate-950 font-black tracking-wider transition-all duration-300 shadow-md shadow-amber-500/20 hover:shadow-lg hover:scale-[1.03] active:scale-95 group">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-slate-950" fill="none"
                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                    </svg>
                    <span>LAYANAN MPP</span>
                </a>
            </div>

            <div class="md:hidden">
                <button id="mobile-menu-button"
                    class="text-slate-800 focus:outline-none p-2 rounded-xl hover:bg-slate-50 transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24"
                        stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                </button>
            </div>
        </div>

        <div id="mobile-menu"
            class="hidden md:hidden bg-white/95 backdrop-blur-md border-t border-slate-100 px-6 py-6 space-y-3 shadow-xl rounded-b-[2rem] transition-all duration-300">
            <a href="{{ route('profil') }}"
                class="flex items-center gap-3 font-extrabold text-slate-700 hover:text-white hover:bg-slate-900 px-4 py-3 rounded-2xl bg-slate-50 transition-all">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-indigo-500" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                </svg>
                PROFIL
            </a>
            <a href="{{ url('/dashboardikmjuara') }}"
                class="flex items-center gap-3 font-black text-white bg-gradient-to-r from-indigo-600 via-purple-600 to-violet-600 px-4 py-3 rounded-2xl shadow-md transition-all">
                <span class="w-2 h-2 rounded-full bg-emerald-400 animate-ping"></span>
                DASHBOARD IKM JUARA
            </a>
            <a href="{{ route('peta.umum') }}"
                class="flex items-center gap-3 font-extrabold text-slate-700 hover:text-white hover:bg-slate-900 px-4 py-3 rounded-2xl bg-slate-50 transition-all">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-emerald-500" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7" />
                </svg>
                PETA IKM BINAAN
            </a>
            <a href="{{ route('daftar') }}"
                class="flex items-center gap-3 font-extrabold text-slate-700 hover:text-white hover:bg-slate-900 px-4 py-3 rounded-2xl bg-slate-50 transition-all">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-amber-500" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                </svg>
                PENDAFTARAN
            </a>
        </div>

    </nav>

    <section class="relative min-h-screen lg:min-h-[calc(100vh-80px)] flex items-center overflow-hidden bg-slate-50/30">

        <div class="absolute top-0 right-0 w-[500px] h-[500px] bg-indigo-50/50 rounded-full blur-[120px] -z-10"></div>
        <div class="absolute bottom-0 left-0 w-[300px] h-[300px] bg-blue-50/50 rounded-full blur-[100px] -z-10"></div>

        <div class="container mx-auto px-6 lg:px-24 py-12">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">

                <div class="space-y-10 order-2 lg:order-1">
                    <div
                        class="inline-flex items-center gap-2 px-4 py-2 bg-green-50 border border-green-200 rounded-full shadow-sm">
                        <span class="w-2.5 h-2.5 bg-green-500 rounded-full animate-pulse"></span>
                        <span class="text-[10px] font-bold text-green-700 tracking-[0.2em] uppercase">Sistem Aktif: IKM
                            Juara V1.0</span>
                    </div>

                    <h1 class="text-5xl lg:text-7xl font-extrabold text-slate-900 leading-[1.1] tracking-tight">
                        Akselerasi <br> Industri <br>
                        <span class="text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 to-blue-500">Lokal
                            ke Global.</span>
                    </h1>

                    <div
                        class="bg-white p-6 rounded-2xl border-l-4 border-indigo-500 shadow-sm max-w-md transform hover:scale-[1.02] transition-transform">
                        <p class="text-slate-500 italic leading-relaxed text-lg">
                            "Mendorong efisiensi dan jaminan usaha industri Kota Madiun."
                        </p>
                    </div>

                    <div class="flex flex-col sm:flex-row flex-wrap items-center gap-6">
                        <a href="{{ route('daftar') }}"
                            class="group inline-flex items-center gap-3 bg-slate-900 text-white px-8 py-5 rounded-2xl text-lg font-bold hover:bg-indigo-700 transition-all duration-300 shadow-xl hover:shadow-indigo-200 shrink-0">
                            MULAI DAFTAR SEKARANG
                            <svg xmlns="http://www.w3.org/2000/svg"
                                class="h-6 w-6 group-hover:translate-x-2 transition-transform" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M17 8l4 4m0 0l-4 4m4-4H3" />
                            </svg>
                        </a>

                        {{-- MASKOT CHARACTER KARAKTER IKM JUARA (DI SEBELAH KANAN TOMBOL) --}}
                        <div class="relative inline-flex items-center shrink-0">
                            <div
                                class="absolute inset-0 bg-gradient-to-tr from-amber-400/30 via-indigo-500/20 to-purple-500/30 rounded-full blur-2xl animate-mascot-glow">
                            </div>
                            <img src="{{ asset('maskot-ikm.png') }}" alt="Karakter Maskot IKM JUARA"
                                class="w-36 sm:w-44 lg:w-48 drop-shadow-[0_15px_25px_rgba(79,70,229,0.3)] animate-mascot-float relative z-10 transition-transform duration-500 hover:scale-105">
                        </div>

                        <div class="flex items-center shrink-0">
                            <div class="flex -space-x-3 mr-4">
                                <div class="w-12 h-12 rounded-full border-4 border-white shadow-sm bg-gradient-to-tr from-indigo-500 to-purple-600 flex items-center justify-center text-white text-xs font-black uppercase">
                                    IKM
                                </div>
                                <div class="w-12 h-12 rounded-full border-4 border-white shadow-sm bg-gradient-to-tr from-emerald-500 to-teal-600 flex items-center justify-center text-white text-xs font-black uppercase">
                                    MDN
                                </div>
                                <div class="w-12 h-12 rounded-full border-4 border-white shadow-sm bg-gradient-to-tr from-amber-500 to-rose-600 flex items-center justify-center text-white text-xs font-black uppercase">
                                    JRA
                                </div>
                                <div
                                    class="w-12 h-12 rounded-full bg-indigo-600 border-4 border-white flex items-center justify-center text-xs font-bold text-white shadow-sm">
                                    {{ number_format($ikmTerdaftar ?? 560, 0, ',', '.') }}+
                                </div>
                            </div>
                            <div class="flex flex-col">
                                <span class="text-sm font-bold text-slate-800 uppercase tracking-wider">IKM
                                    Terdaftar</span>
                                <span class="text-xs text-slate-400 font-medium">Kota Madiun</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="relative flex justify-center lg:justify-end items-center">
                    <div
                        class="hero-card bg-white p-10 lg:p-16 rounded-[60px] w-full max-w-lg flex flex-col items-center text-center border border-slate-100 relative z-10">
                        <div class="w-40 h-40 mb-10 flex items-center justify-center">
                            <img src="{{ asset('logo-ikm.png') }}" alt="Logo Center" class="w-full object-contain">
                        </div>
                        <h2
                            class="text-4xl lg:text-5xl font-black text-slate-800 italic mb-6 tracking-tighter uppercase">
                            IKM JUARA</h2>
                        <p class="text-slate-400 text-sm leading-relaxed px-4 font-semibold">( Integrasi Konsultasi
                            Mandiri untuk Jaminan Usaha, Akselerasi, dan Produktivitas Industri Anda! )</p>
                    </div>
                    <div
                        class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[110%] h-[110%] bg-gradient-to-tr from-indigo-200/40 to-transparent rounded-full blur-[100px] -z-0">
                    </div>
                </div>
            </div>

        </div>
        </div>
    </section>

    <section class="py-16 bg-slate-50" x-data="{ openModal: false, activeData: {} }">
        <div class="container mx-auto px-4">
            <div class="flex justify-between items-center mb-8">
                <h2 class="text-3xl font-bold text-slate-900">Publikasi & Kegiatan</h2>
                <div class="flex gap-2">
                    <button
                        class="swiper-prev p-2 bg-white rounded-full shadow hover:bg-indigo-600 hover:text-white transition"><svg
                            class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path d="M15 19l-7-7 7-7" />
                        </svg></button>
                    <button
                        class="swiper-next p-2 bg-white rounded-full shadow hover:bg-indigo-600 hover:text-white transition"><svg
                            class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path d="M9 5l7 7-7 7" />
                        </svg></button>
                </div>
            </div>

            <div class="swiper pub-slider mb-16"
                @click="const card = $event.target.closest('.pub-card'); if (card && card.dataset.item) { activeData = JSON.parse(card.dataset.item); openModal = true; }">
                <div class="swiper-wrapper">
                    @foreach($berita as $item)
                        @if($item->is_active)
                            @php
                                $itemPayload = [
                                    'judul' => $item->judul,
                                    'gambar' => $item->gambar,
                                    'deskripsi' => $item->deskripsi,
                                    'tanggal' => \Carbon\Carbon::parse($item->tanggal)->translatedFormat('d F Y'),
                                    'waktu' => $item->waktu ?? ''
                                ];
                            @endphp
                            <div class="swiper-slide cursor-pointer pub-card" data-item="{{ json_encode($itemPayload) }}">
                                <div
                                    class="bg-white rounded-[2rem] shadow-sm border border-slate-100 overflow-hidden group hover:shadow-xl transition h-full">
                                    <div class="relative h-64 overflow-hidden">
                                        <img src="{{ $item->gambar }}"
                                            onerror="this.onerror=null; this.src='https://ikmjuara.my.id{{ $item->gambar }}';"
                                            class="w-full h-full object-cover group-hover:scale-105 transition duration-500">
                                        <div class="absolute top-4 left-4">
                                            <span
                                                class="bg-indigo-600 px-3 py-1 text-[10px] font-bold text-white rounded-full uppercase">{{ $item->status }}</span>
                                        </div>
                                    </div>
                                    <div class="p-6">
                                        <h3 class="font-bold text-slate-800 text-lg mb-2 line-clamp-1">{{ $item->judul }}</h3>
                                        <p class="text-slate-500 text-sm line-clamp-2">{{ strip_tags($item->deskripsi) }}</p>
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
            <div x-show="openModal"
                class="fixed inset-0 z-[999] flex items-center justify-center p-4 md:p-10 bg-black/80 backdrop-blur-md"
                x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0 scale-95"
                x-transition:enter-end="opacity-100 scale-100" x-cloak>

                <div @click.away="openModal = false"
                    class="bg-white rounded-[3rem] max-w-6xl w-full h-auto max-h-[90vh] overflow-hidden relative shadow-2xl flex flex-col md:flex-row">

                    <button @click="openModal = false"
                        class="absolute top-6 right-6 z-50 w-12 h-12 flex items-center justify-center bg-white/90 shadow-lg rounded-full hover:bg-red-500 hover:text-white transition-all duration-300">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"
                                d="M6 18L18 6M6 6l12 12"></path>
                        </svg>
                    </button>

                    <div class="md:w-3/5 bg-slate-100 relative overflow-hidden flex items-center justify-center">
                        <img :src="activeData.gambar"
                            x-on:error="$el.onerror=null; $el.src='https://ikmjuara.my.id' + activeData.gambar"
                            class="w-full h-full object-contain">
                    </div>

                    <div class="md:w-2/5 p-8 md:p-12 overflow-y-auto bg-white flex flex-col justify-between">
                        <div>
                            <span
                                class="inline-block px-4 py-1.5 bg-indigo-50 text-indigo-600 rounded-full text-xs font-bold uppercase tracking-widest mb-4"
                                x-text="activeData.tanggal"></span>

                            <h2 class="text-3xl md:text-4xl font-black text-slate-900 leading-tight mb-6"
                                x-text="activeData.judul"></h2>

                            <div class="prose prose-indigo text-slate-600 leading-relaxed text-lg mb-4"
                                x-html="activeData.deskripsi"></div>
                        </div>

                        <div class="mt-8 pt-6 border-t border-slate-100">
                            <a :href="activeData.gambar" :download="activeData.judul"
                                class="flex items-center justify-center gap-3 w-full py-4 bg-indigo-600 text-white rounded-2xl font-bold shadow-lg shadow-indigo-100 hover:bg-indigo-700 transition-all duration-300 group">
                                <svg class="w-6 h-6 group-hover:bounce" fill="none" stroke="currentColor"
                                    viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path>
                                </svg>
                                Simpan Brosur (Download)
                            </a>
                            <p class="text-center text-slate-400 text-xs mt-3 italic">Klik untuk menyimpan gambar ke
                                perangkat Anda</p>
                        </div>
                    </div>
                </div>
            </div>
            <style>
                [x-cloak] {
                    display: none !important;
                }

                /* Menghilangkan scrollbar pada area deskripsi tapi tetap bisa di-scroll jika panjang */
                .overflow-y-auto {
                    scrollbar-width: none;
                    /* Firefox */
                    -ms-overflow-style: none;
                    /* IE/Edge */
                }

                .overflow-y-auto::-webkit-scrollbar {
                    display: none;
                    /* Chrome/Safari */
                }
            </style>
    </section>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            new Swiper(".pub-slider", {
                slidesPerView: 1,
                spaceBetween: 25, // Jarak antar kartu sedikit diperlebar agar rapi
                loop: true, // Ubah ke TRUE agar slider bisa berputar terus (interaktif)
                autoplay: {
                    delay: 3000,
                    disableOnInteraction: false,
                },
                navigation: {
                    nextEl: ".swiper-next",
                    prevEl: ".swiper-prev",
                },
                breakpoints: {
                    640: { slidesPerView: 1.5 },
                    768: { slidesPerView: 2.2 },
                    1024: { slidesPerView: 3 }, // Menampilkan 3 kartu di layar besar
                },
            });
        });
    </script>

    <section>
        <div class="bg-white p-8 md:p-12 rounded-[3rem] shadow-sm border border-slate-200">
            <div class="text-center mb-12">
                <h2 class="text-3xl font-bold text-slate-900">Statistik Pertumbuhan IKM</h2>
                <p class="text-slate-500 mt-2">Data persebaran pelaku usaha di 3 Kecamatan Utama.</p>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 items-center">
                <div class="space-y-6">
                    <div class="p-8 bg-slate-50 rounded-3xl border border-slate-100">
                        <p class="text-xs font-bold text-slate-400 uppercase tracking-widest mb-1">Kecamatan Utama</p>
                        <h2 class="text-4xl font-black text-slate-800">3</h2>
                    </div>
                    <div class="p-8 bg-indigo-600 rounded-3xl text-white shadow-lg shadow-indigo-100">
                        <p class="text-xs font-bold opacity-80 uppercase tracking-widest mb-1">Total IKM Terverifikasi
                        </p>
                        <h2 class="text-4xl font-black">{{ number_format($totalIkmManual) }}</h2>
                    </div>
                </div>

                <div class="lg:col-span-2 bg-slate-50 p-6 rounded-3xl h-[400px]">
                    <canvas id="ikmChart"></canvas>
                </div>
            </div>
        </div>
        </div>
    </section>

    <footer class="bg-slate-900 text-white pt-20 pb-10">
        <div class="container mx-auto px-6 lg:px-24">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 mb-16">
                <div class="space-y-6">
                    <div class="flex items-center gap-2">
                        <span class="text-2xl font-extrabold tracking-tight">IKM<span
                                class="text-yellow-500">JUARA</span></span>
                    </div>
                    <p class="text-slate-400 text-sm leading-relaxed">Akselerasi Industri Lokal Madiun menuju pasar
                        Global. Di bawah naungan Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun.</p>
                    <div class="space-y-3">
                        <h4 class="font-bold text-white uppercase text-xs tracking-widest">Alamat Kantor</h4>
                        <p class="text-slate-400 text-sm italic">Jl. Bolodewo No.8, Kartoharjo, Kec. Kartoharjo, Kota
                            Madiun, Jawa Timur 63117</p>
                        <div
                            class="rounded-2xl overflow-hidden h-32 mt-4 grayscale opacity-70 hover:grayscale-0 hover:opacity-100 transition duration-500">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3954.5518465430883!2d111.5358!3d-7.62!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zN8KwMzcnMTIuMCJTIDExMcKwMzInMDguOCJF!5e0!3m2!1sid!2sid!4v1650000000000!5m2!1sid!2sid"
                                width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>
                <div class="space-y-6">
                    <h4
                        class="font-bold text-white uppercase text-xs tracking-widest border-l-2 border-yellow-500 pl-3">
                        Navigasi</h4>
                    <ul class="space-y-4 text-slate-400 text-sm">
                        <li><a href="{{ route('profil-dinas') }}" class="hover:text-white transition">Profil Dinas</a>
                        </li>
                        <li><a href="{{ route('alur-pendaftaran') }}" class="hover:text-white transition">Alur
                                Pendaftaran</a></li>
                        <li><a href="{{ route('faq') }}" class="hover:text-white transition">FAQ</a></li>
                    </ul>
                </div>
                <div class="space-y-6">
                    <h4
                        class="font-bold text-white uppercase text-xs tracking-widest border-l-2 border-indigo-500 pl-3">
                        Statistik Website</h4>
                    <div class="bg-slate-800/50 p-6 rounded-2xl space-y-3 border border-slate-700">
                        <div class="flex justify-between items-center text-xs">
                            <span class="text-slate-400">Hari Ini</span>
                            <span class="font-bold text-white">{{ number_format($kunjunganHariIni ?? 0, 0, ',', '.') }}
                                Orang</span>
                        </div>
                        <div class="flex justify-between items-center text-xs">
                            <span class="text-slate-400">Bulan Ini</span>
                            <span class="font-bold text-white">{{ number_format($kunjunganBulanIni ?? 0, 0, ',', '.') }}
                                Orang</span>
                        </div>
                        <div class="flex justify-between items-center text-xs">
                            <span class="text-slate-400">Tahun Ini</span>
                            <span class="font-bold text-white">{{ number_format($kunjunganTahunIni ?? 0, 0, ',', '.') }}
                                Orang</span>
                        </div>
                        <div class="flex justify-between items-center text-xs">
                            <span class="text-slate-400">Total Kunjungan</span>
                            <span
                                class="font-bold text-indigo-400">{{ number_format($kunjunganTotal ?? 0, 0, ',', '.') }}
                                Orang</span>
                        </div>
                        <div class="flex justify-between items-center text-xs pt-2 border-t border-slate-700/50">
                            <span class="text-slate-400">Pengunjung Aktif</span>
                            <span
                                class="font-bold text-green-400">{{ number_format($pengunjungAktif ?? 0, 0, ',', '.') }}
                                Orang</span>
                        </div>
                        <div class="pt-3 border-t border-slate-700/50 space-y-1.5">
                            <div class="flex items-center justify-between">
                                <div class="flex items-center gap-2">
                                    <span class="relative flex h-2 w-2">
                                        <span
                                            class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                                        <span class="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
                                    </span>
                                    <span
                                        class="text-[10px] font-black text-emerald-400 uppercase tracking-wider">Terupdate
                                        Otomatis (Real-Time)</span>
                                </div>
                                <span
                                    class="inline-flex items-center gap-1 text-[9px] font-extrabold text-emerald-300 bg-emerald-950/80 px-2 py-0.5 rounded-full border border-emerald-500/30">
                                    <svg class="w-3 h-3 text-emerald-400 animate-spin" fill="none" viewBox="0 0 24 24"
                                        stroke="currentColor" stroke-width="2.5">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M4 4v5h.582m15.356 2A8.001 8.001 0 1121.21 7.89M9 11l3-3 3 3" />
                                    </svg>
                                    Live Sync
                                </span>
                            </div>
                            <p class="text-[10px] text-slate-400 font-medium">
                                ⏱️ Waktu Server: <span class="font-bold text-slate-200" id="live-clock-text">--</span>
                            </p>
                        </div>

                    </div>
                </div>
                <div class="space-y-6">
                    <h4
                        class="font-bold text-white uppercase text-xs tracking-widest border-l-2 border-purple-500 pl-3">
                        Kontak Kami</h4>
                    <ul class="space-y-4 text-slate-400 text-sm">
                        <li class="flex items-center gap-3">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-indigo-500 shrink-0" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                            </svg>
                            {{ $telpDinas }}
                        </li>
                        <li class="flex items-center gap-3">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-indigo-500 shrink-0" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                            </svg>
                            {{ $emailDinas }}
                        </li>
                        @if(!empty($sosialMedia))
                            @foreach($sosialMedia as $sm)
                                <li class="flex items-center gap-3">
                                    @if(strtolower($sm['platform']) === 'instagram')
                                        <svg class="h-5 w-5 text-indigo-500 shrink-0 fill-current" viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.051.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 1 0 0 12.324 6.162 6.162 0 0 0 0-12.324zM12 16a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm6.406-11.845a1.44 1.44 0 1 0 0 2.881 1.44 1.44 0 0 0 0-2.881z" />
                                        </svg>
                                    @elseif(strtolower($sm['platform']) === 'facebook')
                                        <svg class="h-5 w-5 text-indigo-500 shrink-0 fill-current" viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
                                        </svg>
                                    @elseif(strtolower($sm['platform']) === 'tiktok')
                                        <svg class="h-5 w-5 text-indigo-500 shrink-0 fill-current" viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.05-2.89-.53-4.09-1.34a7.92 7.92 0 0 1-2.14-2.12v8.52c.02 1.7-.42 3.47-1.47 4.79-1.28 1.62-3.35 2.5-5.39 2.27-2.31-.13-4.5-1.57-5.55-3.65-1.3-2.45-1.07-5.74.68-7.97 1.4-1.84 3.73-2.8 6.05-2.51v4.03c-1.3-.17-2.69.35-3.48 1.4-.76 1.01-.79 2.45-.11 3.46.68 1.04 1.98 1.61 3.22 1.4 1.28-.13 2.38-1.12 2.6-2.4.08-.47.06-.95.06-1.43V.02z" />
                                        </svg>
                                    @elseif(strtolower($sm['platform']) === 'x')
                                        <svg class="h-5 w-5 text-indigo-500 shrink-0 fill-current" viewBox="0 0 24 24"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
                                        </svg>
                                    @else
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-indigo-500 shrink-0" fill="none"
                                            viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
                                        </svg>
                                    @endif
                                    <a href="{{ $sm['url'] }}" target="_blank" class="hover:text-white transition">
                                        {{ $sm['username'] }}
                                    </a>
                                </li>
                            @endforeach
                        @endif
                    </ul>
                </div>
            </div>
        </div>
        <div
            class="pt-8 border-t border-slate-800 flex flex-col md:flex-row justify-between items-center gap-4 text-slate-500 text-xs font-medium">
            <p>© 2026 Pemerintah Kota Madiun. All rights reserved. / Developed by Bidang Perindustrian.</p>
            <div class="flex gap-6">
                <a href="#" class="hover:text-white transition">Privacy Policy</a>
                <a href="#" class="hover:text-white transition">Terms of Service</a>
            </div>
        </div>
        </div>
    </footer>

    <script>
        // 1. Script Mobile Menu
        const btn = document.getElementById('mobile-menu-button');
        const menu = document.getElementById('mobile-menu');

        btn.addEventListener('click', () => {
            menu.classList.toggle('hidden');
        });

        window.addEventListener('resize', () => {
            if (window.innerWidth >= 768) {
                menu.classList.add('hidden');
            }
        });

        // 2. Script Chart.js dengan Data Dinamis dari Controller
        const ctx = document.getElementById('ikmChart').getContext('2d');
        const gradient = ctx.createLinearGradient(0, 0, 0, 400);
        gradient.addColorStop(0, 'rgba(99, 102, 241, 1)');
        gradient.addColorStop(1, 'rgba(168, 85, 247, 0.2)');

        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Kartoharjo', 'Manguharjo', 'Taman'],
                datasets: [{
                    label: 'Jumlah IKM (Manual)',
                    data: [
    {{ $dataChartManual['Kartoharjo'] ?? 0 }},
    {{ $dataChartManual['Manguharjo'] ?? 0 }},
                        {{ $dataChartManual['Taman'] ?? 0 }}
                    ],
                    backgroundColor: gradient,
                    borderRadius: 12,
                    borderSkipped: false,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: { display: false },
                        ticks: { font: { family: 'Plus Jakarta Sans', weight: 'bold' } }
                    },
                    x: {
                        grid: { display: false },
                        ticks: { font: { family: 'Plus Jakarta Sans', weight: 'bold' } }
                    }
                },
                animation: {
                    duration: 2000,
                    easing: 'easeOutQuart'
                }
            }
        });

        // 3. Script Live Clock Realtime Statistik Website
        function updateLiveStatClock() {
            const now = new Date();
            const months = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
            const day = now.getDate();
            const month = months[now.getMonth()];
            const year = now.getFullYear();
            const hours = String(now.getHours()).padStart(2, '0');
            const minutes = String(now.getMinutes()).padStart(2, '0');
            const seconds = String(now.getSeconds()).padStart(2, '0');

            const el = document.getElementById('live-clock-text');
            if (el) {
                el.innerText = `${day} ${month} ${year}, ${hours}:${minutes}:${seconds} WIB`;
            }
        }
        setInterval(updateLiveStatClock, 1000);
        updateLiveStatClock();
    </script>



    <!-- Floating Action Buttons & Consultation Modal -->
    <div x-data="{ openConsultation: false, email: '', keluhan: '', captchaInput: '', captchaValue: '', successMessage: '', errorMessage: '', generateCaptcha() {
        const chars = 'abcdefhkmnprstuvwxz2345678';
        let result = '';
        for (let i = 0; i < 5; i++) {
            result += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        this.captchaValue = result;
        this.$nextTick(() => {
            const canvas = document.getElementById('captchaCanvas');
            if (canvas) {
                const ctx = canvas.getContext('2d');
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.fillStyle = '#f1f5f9';
                ctx.fillRect(0, 0, canvas.width, canvas.height);
                for (let i = 0; i < 6; i++) {
                    ctx.strokeStyle = `rgba(${Math.random()*150}, ${Math.random()*150}, ${Math.random()*150}, 0.4)`;
                    ctx.beginPath();
                    ctx.moveTo(Math.random() * canvas.width, Math.random() * canvas.height);
                    ctx.lineTo(Math.random() * canvas.width, Math.random() * canvas.height);
                    ctx.stroke();
                }
                ctx.font = 'bold 20px monospace';
                for (let i = 0; i < result.length; i++) {
                    ctx.fillStyle = `rgb(${Math.random()*100}, ${Math.random()*100}, ${Math.random()*100})`;
                    ctx.save();
                    ctx.translate(15 + i * 18, 26);
                    ctx.rotate((Math.random() - 0.5) * 0.4);
                    ctx.fillText(result[i], 0, 0);
                    ctx.restore();
                }
            }
        });
    }, submitForm() {
        this.successMessage = '';
        this.errorMessage = '';
        if (this.captchaInput.toLowerCase() !== this.captchaValue.toLowerCase()) {
            this.errorMessage = 'Captcha yang Anda masukkan salah.';
            return;
        }
        fetch('{{ route('konsultasi.store') }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
                email: this.email,
                keluhan: this.keluhan,
                captcha: this.captchaInput,
                captcha_expected: this.captchaValue
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                this.successMessage = data.message;
                this.email = '';
                this.keluhan = '';
                this.captchaInput = '';
                this.generateCaptcha();
                setTimeout(() => {
                    this.openConsultation = false;
                    this.successMessage = '';
                }, 3000);
            } else {
                this.errorMessage = data.message;
            }
        })
        .catch(err => {
            this.errorMessage = 'Terjadi kesalahan, silakan coba lagi.';
        });
    } }" x-init="generateCaptcha()">

        <!-- Floating Button Container -->
        <div class="fixed bottom-6 right-6 z-[99] flex flex-col gap-4">
            <!-- WhatsApp Button (Dynamic admin_wa_number from /dukungan/statistik-sosmed) -->
            @php
                $rawWaChat = $adminWaNumber ?? ($admin_wa_number ?? (\Illuminate\Support\Facades\DB::table('statistik_kecamatan')->value('admin_wa_number') ?? '628123456789'));
                $cleanWaChat = preg_replace('/[^0-9]/', '', $rawWaChat);
                if (str_starts_with($cleanWaChat, '0')) {
                    $cleanWaChat = '62' . substr($cleanWaChat, 1);
                }
            @endphp
            <a href="https://wa.me/{{ $cleanWaChat ?: '628123456789' }}" target="_blank"
                class="w-14 h-14 bg-[#25D366] rounded-full flex items-center justify-center shadow-2xl hover:scale-110 transition-all duration-300 text-white hover:bg-[#1ebd59]"
                title="Chat WhatsApp DisnakerKUKM Kota Madiun ({{ $cleanWaChat }})">
                <svg class="w-8 h-8 fill-current" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946C.06 5.348 5.397.01 12.008.01c3.202.001 6.212 1.246 8.477 3.514 2.266 2.268 3.507 5.28 3.505 8.484-.004 6.657-5.34 11.997-11.953 11.997-2.005-.001-3.973-.502-5.73-1.45L0 24zm6.59-4.846c1.6.95 3.188 1.449 4.825 1.451 5.436 0 9.86-4.42 9.864-9.864.002-2.637-1.023-5.116-2.88-6.976A9.79 9.79 0 0 0 12.008 1.83c-5.447 0-9.873 4.423-9.877 9.869-.001 1.782.477 3.524 1.385 5.08L2.53 21.46l4.117-1.08c-.001 0-.001 0 0 0zm11.238-7.06c-.3-.15-1.772-.875-2.046-.975-.276-.1-.476-.15-.676.15-.2.3-.775.975-.95 1.175-.175.2-.35.225-.65.075-3.512-1.76-4.664-3.136-5.105-3.896-.29-.5-.03-.77.22-1.02.225-.224.5-.584.75-.875.25-.29.333-.49.5-.82.167-.33.084-.62-.041-.87-.125-.25-1.002-2.414-1.375-3.312-.363-.872-.733-.755-.958-.767-.217-.012-.467-.012-.717-.012-.25 0-.65.094-.99.467-.34.373-1.3 1.272-1.3 3.102 0 1.829 1.33 3.593 1.517 3.843.187.25 2.617 3.997 6.34 5.61 3.722 1.613 3.722 1.075 4.39 1.007.667-.067 1.772-.724 2.022-1.424.25-.7.25-1.3.175-1.425-.075-.125-.275-.2-.575-.35z" />
                </svg>
            </a>

            <!-- Open Modal Button -->
            <button @click="openConsultation = true; generateCaptcha()"
                class="w-14 h-14 bg-indigo-600 rounded-full flex items-center justify-center shadow-2xl hover:scale-110 hover:bg-indigo-700 transition duration-300 text-white">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z" />
                </svg>
            </button>
        </div>

        <!-- Consultation Modal Backdrop and Container -->
        <div x-show="openConsultation"
            class="fixed inset-0 z-[999] flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm"
            x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0"
            x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in duration-200"
            x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0" x-cloak>

            <!-- Modal Box -->
            <div @click.away="openConsultation = false"
                class="bg-white rounded-[2rem] max-w-lg w-full overflow-hidden relative shadow-2xl p-8 flex flex-col border border-slate-100"
                x-transition:enter="transition ease-out duration-300" x-transition:enter-start="scale-95 translate-y-4"
                x-transition:enter-end="scale-100 translate-y-0" x-transition:leave="transition ease-in duration-200"
                x-transition:leave-start="scale-100 translate-y-0" x-transition:leave-end="scale-95 translate-y-4">

                <!-- Close Button -->
                <button @click="openConsultation = false"
                    class="absolute top-6 right-6 w-10 h-10 flex items-center justify-center bg-slate-100 hover:bg-rose-500 hover:text-white rounded-full transition duration-300 text-slate-500">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"
                            d="M6 18L18 6M6 6l12 12">
                    </svg>
                </button>

                <!-- Header Title -->
                <h3 class="text-xl font-bold text-slate-800 mb-2 pr-10">Kirim Kritik, Saran dan Pertanyaan</h3>
                <p class="text-xs text-slate-400 italic mb-6">Yang bertanda <span class="text-rose-500">*</span> wajib
                    diisi.</p>

                <!-- Alert Messages -->
                <template x-if="successMessage">
                    <div
                        class="mb-4 p-4 bg-green-50 border border-green-200 text-green-700 text-sm rounded-2xl flex items-center gap-2">
                        <svg class="w-5 h-5 text-green-500 shrink-0" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <span x-text="successMessage"></span>
                    </div>
                </template>
                <template x-if="errorMessage">
                    <div
                        class="mb-4 p-4 bg-rose-50 border border-rose-200 text-rose-700 text-sm rounded-2xl flex items-center gap-2">
                        <svg class="w-5 h-5 text-rose-500 shrink-0" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <span x-text="errorMessage"></span>
                    </div>
                </template>

                <!-- Form -->
                <form @submit.prevent="submitForm()" class="space-y-5">
                    <!-- Email Input -->
                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-slate-500 mb-2">Alamat Email
                            Anda <span class="text-rose-500">*</span></label>
                        <input type="email" x-model="email" required placeholder="Masukkan Email"
                            class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-2 focus:ring-indigo-500 focus:bg-white transition outline-none text-slate-800 text-sm font-semibold">
                    </div>

                    <!-- Message TextArea -->
                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-slate-500 mb-2">Kritik,
                            Saran dan Pertanyaan <span class="text-rose-500">*</span></label>
                        <textarea x-model="keluhan" required rows="4"
                            placeholder="Tuliskan Kritik, Saran dan Pertanyaan"
                            class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-2 focus:ring-indigo-500 focus:bg-white transition outline-none text-slate-800 text-sm font-semibold resize-none"></textarea>
                    </div>

                    <!-- Captcha Input -->
                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-slate-500 mb-2">Captcha
                            <span class="text-rose-500">*</span></label>
                        <div class="flex items-center gap-3 mb-3">
                            <canvas id="captchaCanvas" width="120" height="42"
                                class="rounded-2xl border border-slate-200 bg-slate-50"></canvas>
                            <button type="button" @click="generateCaptcha()"
                                class="w-10 h-10 flex items-center justify-center bg-rose-500 hover:bg-rose-600 text-white rounded-2xl transition duration-300 shadow-md shadow-rose-500/20">
                                <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                    stroke-width="2.5">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M4 4v5h.582m15.356 2A8.001 8.001 0 1121.21 7.89M9 11l3-3 3 3" />
                                </svg>
                            </button>
                        </div>
                        <input type="text" x-model="captchaInput" required placeholder="Masukkan Captcha"
                            class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-2 focus:ring-indigo-500 focus:bg-white transition outline-none text-slate-800 text-sm font-semibold">
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex justify-end gap-3 pt-2">
                        <button type="button" @click="openConsultation = false"
                            class="px-6 py-3 border border-slate-200 text-slate-500 hover:bg-slate-50 rounded-2xl text-sm font-bold transition">
                            Tutup
                        </button>
                        <button type="submit"
                            class="px-6 py-3 bg-indigo-600 hover:bg-indigo-700 text-white rounded-2xl text-sm font-bold transition flex items-center gap-2 shadow-lg shadow-indigo-500/20">
                            <svg class="w-4 h-4 transform rotate-45" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" stroke-width="2.5">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8" />
                            </svg>
                            Kirim
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>