@extends('layouts.dukungan')

@section('title', 'Dukungan Dashboard IKM JUARA')

@section('content')
<style>
    /* Styling & Custom Animations */
    .hero-gradient {
        background: linear-gradient(135deg, #022c22 0%, #064e3b 50%, #0f172a 100%);
    }
    .madiun-gold-border {
        border-color: #d97706; /* Emas Madiun */
    }
    .text-madiun-gold {
        color: #fbbf24;
    }
    .bg-madiun-gold-gradient {
        background: linear-gradient(135deg, #059669 0%, #d97706 100%);
    }
    .accordion-content {
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.4s cubic-bezier(0.4, 0, 0.2, 1), padding 0.3s ease;
    }
    .accordion-item.active .accordion-content {
        max-height: 250px; /* Adjust as needed */
        padding-top: 16px;
    }
    .accordion-chevron {
        transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    }
    .accordion-item.active .accordion-chevron {
        transform: rotate(180deg);
        color: #d97706;
    }
    .feature-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 25px -5px rgba(16, 185, 129, 0.1), 0 10px 10px -5px rgba(16, 185, 129, 0.04);
    }
    @keyframes mascotFloat {
        0%, 100% {
            transform: translateY(0px) rotate(0deg);
        }
        50% {
            transform: translateY(-14px) rotate(1.5deg);
        }
    }
    .animate-mascot-float {
        animation: mascotFloat 4.5s ease-in-out infinite;
    }
    @keyframes mascotGlow {
        0%, 100% {
            opacity: 0.35;
            transform: scale(0.95);
        }
        50% {
            opacity: 0.75;
            transform: scale(1.15);
        }
    }
    .animate-mascot-glow {
        animation: mascotGlow 3.5s ease-in-out infinite;
    }
</style>

<div class="space-y-12">
    {{-- HERO SECTION --}}
    <div class="relative overflow-hidden rounded-[40px] hero-gradient p-10 lg:p-12 text-white shadow-2xl shadow-emerald-950/20 border-b-4 madiun-gold-border">
        <div class="absolute inset-0 bg-[url('data:image/svg+xml,%3Csvg%20width%3D%2240%22%20height%3D%2240%22%20viewBox%3D%220%200%2040%2040%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%3Cg%20fill%3D%22%23ffffff%22%20fill-opacity%3D%220.02%22%3E%3Cpath%20d%3D%22M0%200h1v1H0zM20%200h1v1h-1zM0%2020h1v1H0zM20%2020h1v1h-1z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E')] opacity-30"></div>
        
        <div class="relative z-10 flex flex-col lg:flex-row items-center justify-between gap-8 lg:gap-12">
            
            {{-- Left Content --}}
            <div class="max-w-2xl space-y-6">
                <div class="inline-flex items-center gap-2 px-4 py-1.5 bg-emerald-500/10 border border-emerald-500/20 rounded-full">
                    <span class="w-2 h-2 bg-emerald-400 rounded-full animate-ping"></span>
                    <span class="text-[10px] font-black text-emerald-300 tracking-[0.2em] uppercase">Pusat Kendali Industri</span>
                </div>
                
                <h1 class="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight leading-tight">
                    Satu Data, Satu Kendali,<br>
                    <span class="text-transparent bg-clip-text bg-gradient-to-r from-emerald-300 via-teal-200 to-amber-300">IKM Kota Madiun Naik Kelas!</span>
                </h1>
                
                <p class="text-sm lg:text-base text-emerald-100/80 font-medium leading-relaxed">
                    Transformasi digital tata kelola pembinaan sektor industri. Mengubah layanan pembinaan yang sebelumnya manual dan parsial menjadi pusat kendali yang terintegrasi, responsif, terukur, dan berbasis data secara *real-time*.
                </p>
                
                <div class="flex flex-wrap gap-4 pt-2">
                    <a href="{{ url('dukungan/peta') }}" class="bg-emerald-600 hover:bg-emerald-700 text-white px-8 py-4 rounded-2xl font-bold text-xs tracking-wider uppercase shadow-lg shadow-emerald-650/30 hover:scale-[1.02] active:scale-[0.98] transition-all duration-300 flex items-center gap-2">
                        <i class="bi bi-geo-alt-fill"></i> Monitor Peta Sebaran
                    </a>
                    <a href="{{ url('dukungan/sebaran') }}" class="bg-white/10 hover:bg-white/20 text-white border border-white/15 px-8 py-4 rounded-2xl font-bold text-xs tracking-wider uppercase hover:scale-[1.02] active:scale-[0.98] transition-all duration-300 flex items-center gap-2">
                        <i class="bi bi-folder-fill text-madiun-gold"></i> Database IKM Terintegrasi
                    </a>
                </div>
            </div>

            {{-- Right Mascot Section with Supporting Animations --}}
            <div class="relative shrink-0 w-full lg:w-[360px] flex justify-center items-center mt-6 lg:mt-0 group">
                {{-- Glow background aura --}}
                <div class="absolute w-72 h-72 bg-gradient-to-tr from-emerald-400/30 via-teal-300/20 to-amber-400/30 rounded-full blur-3xl animate-mascot-glow pointer-events-none"></div>

                {{-- Mascot Image with Floating Animation --}}
                <div class="relative z-10 animate-mascot-float group-hover:scale-105 transition-transform duration-500">
                    <img src="{{ asset('maskot-ikm.png') }}" 
                         alt="Maskot IKM Juara Kota Madiun" 
                         class="w-full max-w-[320px] sm:max-w-[350px] lg:max-w-[360px] h-auto object-contain filter drop-shadow-[0_20px_35px_rgba(0,0,0,0.5)]">
                </div>
            </div>

        </div>
    </div>


    {{-- STATS OVERVIEW --}}
    <div class="grid grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-white p-6 rounded-3xl shadow-sm border border-slate-200 flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-emerald-50 rounded-2xl flex items-center justify-center text-emerald-600 group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                    </svg>
                </div>
                <span class="text-[9px] font-bold text-slate-400 tracking-widest uppercase">IKM Binaan</span>
            </div>
            <div>
                <p class="text-3xl font-black text-slate-800 mb-0.5">{{ $totalIkm }}</p>
                <p class="text-[10px] font-bold text-slate-450 uppercase tracking-wider">Total IKM</p>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl shadow-sm border border-slate-200 flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-amber-50 rounded-2xl flex items-center justify-center text-amber-600 group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                </div>
                <span class="text-[9px] font-bold text-slate-400 tracking-widest uppercase">Terpetakan</span>
            </div>
            <div>
                <p class="text-3xl font-black text-slate-800 mb-0.5">{{ $totalTerpetakan }}</p>
                <p class="text-[10px] font-bold text-slate-450 uppercase tracking-wider">Jumlah Terpetakan</p>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl shadow-sm border border-slate-200 flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-indigo-50 rounded-2xl flex items-center justify-center text-indigo-650 group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                    </svg>
                </div>
                <span class="text-[9px] font-bold text-slate-400 tracking-widest uppercase">Rasio</span>
            </div>
            <div>
                <p class="text-3xl font-black text-slate-800 mb-0.5">{{ $persenTerpetakan }}%</p>
                <p class="text-[10px] font-bold text-slate-450 uppercase tracking-wider">Rasio Geografis</p>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl shadow-sm border border-slate-200 flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-blue-50 rounded-2xl flex items-center justify-center text-blue-600 group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
                    </svg>
                </div>
                <span class="text-[9px] font-bold text-slate-400 tracking-widest uppercase">Konsultasi</span>
            </div>
            <div>
                <p class="text-3xl font-black text-slate-800 mb-0.5">{{ $totalKonsultasi }}</p>
                <p class="text-[10px] font-bold text-slate-450 uppercase tracking-wider">Tiket Masuk</p>
            </div>
        </div>
    </div>

    {{-- SECTION MANFAAT LAYANAN (THE WHY) --}}
    <div class="bg-slate-50 rounded-[40px] p-10 lg:p-14 border border-slate-200 shadow-sm flex flex-col lg:flex-row items-center gap-10">
        <div class="lg:w-1/2 space-y-6">
            <h3 class="text-2xl font-black text-slate-800 uppercase tracking-tight">Mengapa Harus <span class="text-emerald-600">IKM JUARA</span>?</h3>
            <p class="text-slate-500 font-medium text-sm leading-relaxed">
                IKM JUARA hadir memecahkan tantangan klasikal pembinaan industri di daerah. Dengan pendekatan data terpusat, kami mengintegrasikan rekam jejak legalitas usaha, standarisasi mutu, pemetaan kompetensi SDM, pembinaan digital, hingga pemantauan dampak program pasca kegiatan ke dalam satu platform.
            </p>
            <p class="text-slate-550 font-bold text-xs leading-relaxed border-l-4 border-emerald-500 pl-4">
                "Setiap kebijakan dan bantuan program dinas dirumuskan secara presisi berdasarkan analisis data riil, bukan sekadar intuisi atau perkiraan biasa."
            </p>
        </div>
        <div class="lg:w-1/2 grid grid-cols-2 gap-4">
            <div class="bg-white p-5 rounded-3xl border border-slate-200 flex flex-col justify-between">
                <i class="bi bi-shield-check text-2xl text-emerald-600 mb-4 block"></i>
                <div>
                    <h5 class="font-extrabold text-slate-800 text-xs uppercase mb-1">Standardisasi Presisi</h5>
                    <p class="text-[11px] text-slate-450 font-medium">Rekam data HKI Merek, Halal, PIRT, BPOM, & TKDN dipantau real-time.</p>

                </div>
            </div>
            <div class="bg-white p-5 rounded-3xl border border-slate-200 flex flex-col justify-between">
                <i class="bi bi-graph-up text-2xl text-indigo-650 mb-4 block"></i>
                <div>
                    <h5 class="font-extrabold text-slate-800 text-xs uppercase mb-1">TNA Berbasis Data</h5>
                    <p class="text-[11px] text-slate-450 font-medium">Program pelatihan dirancang sesuai kebutuhan objektif SDM.</p>
                </div>
            </div>
            <div class="bg-white p-5 rounded-3xl border border-slate-200 flex flex-col justify-between">
                <i class="bi bi-chat-left-dots-fill text-2xl text-amber-500 mb-4 block"></i>
                <div>
                    <h5 class="font-extrabold text-slate-800 text-xs uppercase mb-1">Respons 24 Jam</h5>
                    <p class="text-[11px] text-slate-450 font-medium">Layanan konsultasi interaktif admin-pelaku usaha tersentral.</p>
                </div>
            </div>
            <div class="bg-white p-5 rounded-3xl border border-slate-200 flex flex-col justify-between">
                <i class="bi bi-globe text-2xl text-blue-650 mb-4 block"></i>
                <div>
                    <h5 class="font-extrabold text-slate-800 text-xs uppercase mb-1">Sinkronisasi Nasional</h5>
                    <p class="text-[11px] text-slate-450 font-medium">Konektivitas dan kompatibilitas format data siap lapor SIINas.</p>
                </div>
            </div>
        </div>
    </div>

    {{-- SECTION 7 FITUR UTAMA --}}
    <div class="space-y-8">
        <div class="text-center max-w-2xl mx-auto space-y-2">
            <span class="inline-block px-3.5 py-1 bg-emerald-100 text-emerald-800 text-[10px] font-black rounded-full uppercase tracking-widest mb-1 border border-emerald-200">Pusat Fitur Terpadu</span>
            <h3 class="text-3xl font-black text-slate-900 uppercase tracking-tight">7 Modul Inovasi Utama</h3>
            <p class="text-slate-500 text-xs font-bold uppercase tracking-wider">Fitur unggulan pusat kendali IKM JUARA Kota Madiun</p>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {{-- Card 1 --}}
            <a href="{{ url('dukungan/sebaran') }}" class="group bg-white p-6 rounded-3xl border border-slate-200/80 shadow-sm hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative overflow-hidden">
                <div class="absolute top-0 right-0 w-24 h-24 bg-emerald-500/5 rounded-bl-full pointer-events-none group-hover:scale-150 transition-transform"></div>
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 rounded-2xl bg-emerald-500 text-white flex items-center justify-center shadow-lg shadow-emerald-500/20 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4" />
                            </svg>
                        </div>
                        <span class="text-[10px] font-black text-emerald-700 bg-emerald-50 px-2.5 py-1 rounded-lg border border-emerald-100">MODUL 01</span>
                    </div>
                    <h4 class="font-extrabold text-slate-900 text-sm uppercase mb-2 group-hover:text-emerald-600 transition-colors">Database IKM Terintegrasi</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">
                        Penyimpanan satu pintu data profil IKM Kota Madiun, memuat NIB, KBLI, legalitas, kepemilikan, dan koordinat spasial.
                    </p>
                </div>
                <div class="pt-4 border-t border-slate-100 flex items-center justify-between mt-4">
                    <span class="text-[11px] font-bold text-slate-400 group-hover:text-emerald-600 transition-colors">Akses Database</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-slate-400 group-hover:text-emerald-600 group-hover:translate-x-1 transition-all" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" /></svg>
                </div>
            </a>

            {{-- Card 2 --}}
            <a href="{{ url('dukungan/konsultasi') }}" class="group bg-white p-6 rounded-3xl border border-slate-200/80 shadow-sm hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative overflow-hidden">
                <div class="absolute top-0 right-0 w-24 h-24 bg-indigo-500/5 rounded-bl-full pointer-events-none group-hover:scale-150 transition-transform"></div>
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 rounded-2xl bg-indigo-600 text-white flex items-center justify-center shadow-lg shadow-indigo-600/20 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
                            </svg>
                        </div>
                        <span class="text-[10px] font-black text-indigo-700 bg-indigo-50 px-2.5 py-1 rounded-lg border border-indigo-100">MODUL 02</span>
                    </div>
                    <h4 class="font-extrabold text-slate-900 text-sm uppercase mb-2 group-hover:text-indigo-600 transition-colors">Layanan Konsultasi & Pembinaan</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">
                        Media interaktif konsultasi bisnis online antara admin dengan pelaku usaha dengan rekam histori obrolan terstruktur.
                    </p>
                </div>
                <div class="pt-4 border-t border-slate-100 flex items-center justify-between mt-4">
                    <span class="text-[11px] font-bold text-slate-400 group-hover:text-indigo-600 transition-colors">Kelola Tiket</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-slate-400 group-hover:text-indigo-600 group-hover:translate-x-1 transition-all" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" /></svg>
                </div>
            </a>

            {{-- Card 3 --}}
            <a href="{{ url('dukungan/legalitas') }}" class="group bg-white p-6 rounded-3xl border border-slate-200/80 shadow-sm hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative overflow-hidden">
                <div class="absolute top-0 right-0 w-24 h-24 bg-amber-500/5 rounded-bl-full pointer-events-none group-hover:scale-150 transition-transform"></div>
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 rounded-2xl bg-amber-500 text-white flex items-center justify-center shadow-lg shadow-amber-500/20 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z" />
                            </svg>
                        </div>
                        <span class="text-[10px] font-black text-amber-700 bg-amber-50 px-2.5 py-1 rounded-lg border border-amber-100">MODUL 03</span>
                    </div>
                    <h4 class="font-extrabold text-slate-900 text-sm uppercase mb-2 group-hover:text-amber-600 transition-colors">Tracker Legalitas & Standardisasi</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">
                        Pemantauan progres pemenuhan legalitas perizinan, HKI Merek, sertifikat halal, BPOM, CPPOB, TKDN, dan Standar Nasional Indonesia (SNI).
                    </p>

                </div>
                <div class="pt-4 border-t border-slate-100 flex items-center justify-between mt-4">
                    <span class="text-[11px] font-bold text-slate-400 group-hover:text-amber-600 transition-colors">Pantau Progres</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-slate-400 group-hover:text-amber-600 group-hover:translate-x-1 transition-all" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" /></svg>
                </div>
            </a>

            {{-- Card 4 --}}
            <a href="{{ url('dukungan/tnadigital') }}" class="group bg-white p-6 rounded-3xl border border-slate-200/80 shadow-sm hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative overflow-hidden">
                <div class="absolute top-0 right-0 w-24 h-24 bg-rose-500/5 rounded-bl-full pointer-events-none group-hover:scale-150 transition-transform"></div>
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 rounded-2xl bg-rose-500 text-white flex items-center justify-center shadow-lg shadow-rose-500/20 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4" />
                            </svg>
                        </div>
                        <span class="text-[10px] font-black text-rose-700 bg-rose-50 px-2.5 py-1 rounded-lg border border-rose-100">MODUL 04</span>
                    </div>
                    <h4 class="font-extrabold text-slate-900 text-sm uppercase mb-2 group-hover:text-rose-600 transition-colors">TNA Digital</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">
                        Training Needs Assessment digital untuk memetakan kesenjangan keahlian pelaku usaha guna merancang diklat yang presisi.
                    </p>
                </div>
                <div class="pt-4 border-t border-slate-100 flex items-center justify-between mt-4">
                    <span class="text-[11px] font-bold text-slate-400 group-hover:text-rose-600 transition-colors">Buka TNA</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-slate-400 group-hover:text-rose-600 group-hover:translate-x-1 transition-all" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" /></svg>
                </div>
            </a>

            {{-- Card 5 --}}
            <a href="{{ url('dukungan/sebaran') }}" class="group bg-white p-6 rounded-3xl border border-slate-200/80 shadow-sm hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative overflow-hidden">
                <div class="absolute top-0 right-0 w-24 h-24 bg-sky-500/5 rounded-bl-full pointer-events-none group-hover:scale-150 transition-transform"></div>
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 rounded-2xl bg-sky-500 text-white flex items-center justify-center shadow-lg shadow-sky-500/20 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                            </svg>
                        </div>
                        <span class="text-[10px] font-black text-sky-700 bg-sky-50 px-2.5 py-1 rounded-lg border border-sky-100">MODUL 05</span>
                    </div>
                    <h4 class="font-extrabold text-slate-900 text-sm uppercase mb-2 group-hover:text-sky-600 transition-colors">Monev Pasca Pembinaan</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">
                        Evaluasi dampak setelah pelaksanaan program pembinaan, mengukur rasio peningkatan penjualan atau perluasan usaha.
                    </p>
                </div>
                <div class="pt-4 border-t border-slate-100 flex items-center justify-between mt-4">
                    <span class="text-[11px] font-bold text-slate-400 group-hover:text-sky-600 transition-colors">Lihat Evaluasi</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-slate-400 group-hover:text-sky-600 group-hover:translate-x-1 transition-all" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" /></svg>
                </div>
            </a>

            {{-- Card 6 --}}
            <a href="{{ url('dukungan/siinas') }}" class="group bg-white p-6 rounded-3xl border border-slate-200/80 shadow-sm hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative overflow-hidden">
                <div class="absolute top-0 right-0 w-24 h-24 bg-teal-500/5 rounded-bl-full pointer-events-none group-hover:scale-150 transition-transform"></div>
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 rounded-2xl bg-teal-600 text-white flex items-center justify-center shadow-lg shadow-teal-600/20 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                            </svg>
                        </div>
                        <span class="text-[10px] font-black text-teal-700 bg-teal-50 px-2.5 py-1 rounded-lg border border-teal-100">MODUL 06</span>
                    </div>
                    <h4 class="font-extrabold text-slate-900 text-sm uppercase mb-2 group-hover:text-teal-600 transition-colors">Integrator Pelaporan SIINas</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">
                        Pengolahan dan standarisasi data agar siap diunggah ke Sistem Informasi Industri Nasional Kementerian Perindustrian.
                    </p>
                </div>
                <div class="pt-4 border-t border-slate-100 flex items-center justify-between mt-4">
                    <span class="text-[11px] font-bold text-slate-400 group-hover:text-teal-600 transition-colors">Integrasi SIINas</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-slate-400 group-hover:text-teal-600 group-hover:translate-x-1 transition-all" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" /></svg>
                </div>
            </a>

            {{-- Card 7 --}}
            <a href="{{ url('dukungan/peta') }}" class="group bg-white p-6 rounded-3xl border border-slate-200/80 shadow-sm hover:shadow-xl hover:-translate-y-1.5 transition-all duration-300 flex flex-col justify-between relative overflow-hidden md:col-span-2 lg:col-span-1">
                <div class="absolute top-0 right-0 w-24 h-24 bg-slate-500/5 rounded-bl-full pointer-events-none group-hover:scale-150 transition-transform"></div>
                <div>
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 rounded-2xl bg-slate-900 text-white flex items-center justify-center shadow-lg shadow-slate-900/20 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-emerald-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                            </svg>
                        </div>
                        <span class="text-[10px] font-black text-slate-700 bg-slate-100 px-2.5 py-1 rounded-lg border border-slate-200">MODUL 07</span>
                    </div>
                    <h4 class="font-extrabold text-slate-900 text-sm uppercase mb-2 group-hover:text-emerald-600 transition-colors">Executive Dashboard</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">
                        Ringkasan eksekutif berbasis bagan grafis interaktif untuk memudahkan pengambilan keputusan strategis oleh pimpinan dinas.
                    </p>
                </div>
                <div class="pt-4 border-t border-slate-100 flex items-center justify-between mt-4">
                    <span class="text-[11px] font-bold text-slate-400 group-hover:text-slate-900 transition-colors">Buka Ringkasan</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-slate-400 group-hover:text-slate-900 group-hover:translate-x-1 transition-all" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" /></svg>
                </div>
            </a>
        </div>
    </div>


    {{-- KONSULTASI SUMMARY & MAP PREVIEW --}}
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {{-- Kategori table --}}
        <div class="lg:col-span-2 bg-white rounded-[40px] border border-slate-200 shadow-sm overflow-hidden flex flex-col">
            <div class="p-8 border-b border-slate-100 bg-slate-50/50 flex justify-between items-center">
                <h3 class="font-black text-slate-800 text-sm uppercase tracking-widest">Kategori Layanan Konsultasi</h3>
                <a href="{{ route('dukungan.konsultasi.index') }}" class="px-4 py-2 bg-emerald-50 hover:bg-emerald-600 hover:text-white text-emerald-650 text-xs font-extrabold uppercase rounded-xl transition duration-300">
                    Buka Layanan &rarr;
                </a>
            </div>
            <div class="p-8 flex-1 overflow-x-auto">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="text-[10px] font-black text-slate-400 uppercase tracking-widest border-b border-slate-100">
                            <th class="px-6 py-4">Kategori Pengajuan</th>
                            <th class="px-6 py-4 text-center">Jumlah Konsultasi</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-50">
                        @forelse($totalKategori as $kat)
                        <tr class="hover:bg-slate-50/30 transition">
                            <td class="px-6 py-4 font-bold text-slate-700">{{ $kat->jenis_usaha }}</td>
                            <td class="px-6 py-4 text-center">
                                <span class="bg-emerald-50 text-emerald-700 px-3 py-1 rounded-full text-xs font-black">
                                    {{ $kat->total }} Tiket
                                </span>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="2" class="text-center py-10 text-slate-400 font-medium">Belum ada data pengajuan konsultasi.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        {{-- Map teaser --}}
        <div class="bg-gradient-to-br from-emerald-800 to-teal-900 rounded-[40px] p-8 text-white relative overflow-hidden shadow-2xl shadow-emerald-950/20">
            <div class="relative z-10 flex flex-col h-full justify-between">
                <div>
                    <h4 class="text-xl font-black mb-4 tracking-tight leading-tight">Dukungan Pemetaan</h4>
                    <p class="text-emerald-200 text-xs leading-relaxed font-medium mb-6">
                        Sebagai Admin Dukungan, Anda memiliki tanggung jawab untuk memantau titik koordinat latitude dan longitude seluruh pelaku usaha agar pemetaan geografis IKM di Kota Madiun selalu akurat dan terbarui.
                    </p>
                </div>
                <a href="{{ url('dukungan/peta') }}" class="inline-flex items-center justify-center gap-2 bg-white text-emerald-900 px-5 py-4 rounded-2xl font-bold text-xs shadow-lg hover:bg-emerald-50 hover:scale-[1.02] active:scale-[0.98] transition">
                    Buka Peta Sebaran
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                    </svg>
                </a>
            </div>
            <div class="absolute -right-10 -bottom-10 opacity-10">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-40 w-40" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                </svg>
            </div>
        </div>
    </div>

    {{-- PREMIUM ACCORDION FAQ --}}
    <div class="space-y-8">
        <div class="text-center max-w-2xl mx-auto space-y-2">
            <h3 class="text-3xl font-black text-slate-800 uppercase tracking-tighter">Tanya <span class="text-emerald-600">Jawab</span> Inovasi</h3>
            <p class="text-slate-450 text-xs font-bold uppercase tracking-wider">Segala hal mengenai tata kelola IKM JUARA Kota Madiun</p>
        </div>

        <div class="max-w-4xl mx-auto space-y-4">
            {{-- Accordion Item 1 --}}
            <div class="accordion-item bg-white border border-slate-200 rounded-[24px] p-6 shadow-sm hover:border-emerald-500/30 hover:shadow-md transition-all duration-300">
                <button class="accordion-header w-full flex items-center justify-between text-left focus:outline-none">
                    <span class="font-extrabold text-slate-800 text-sm uppercase tracking-wide flex items-center gap-3">
                        <span class="h-8 w-8 bg-emerald-50 text-emerald-600 rounded-lg flex items-center justify-center font-black text-xs">Q1</span>
                        Apa keunggulan Dashboard IKM JUARA?
                    </span>
                    <i class="bi bi-chevron-down accordion-chevron text-slate-400 font-bold text-sm"></i>
                </button>
                <div class="accordion-content">
                    <p class="text-xs text-slate-500 font-medium leading-relaxed pl-11">
                        Dashboard IKM JUARA adalah inovasi perubahan tata kelola dari layanan pembinaan yang sebelumnya terpisah-pisah menuju pembinaan terpadu berbasis data tunggal. Melalui integrasi ini, dinas dapat mengidentifikasi secara presisi status perizinan, kesenjangan SDM, hingga perkembangan omset pasca intervensi pembinaan, memastikan setiap program kerja tepat sasaran dan objektif.
                    </p>
                </div>
            </div>

            {{-- Accordion Item 2 --}}
            <div class="accordion-item bg-white border border-slate-200 rounded-[24px] p-6 shadow-sm hover:border-emerald-500/30 hover:shadow-md transition-all duration-300">
                <button class="accordion-header w-full flex items-center justify-between text-left focus:outline-none">
                    <span class="font-extrabold text-slate-800 text-sm uppercase tracking-wide flex items-center gap-3">
                        <span class="h-8 w-8 bg-emerald-50 text-emerald-600 rounded-lg flex items-center justify-center font-black text-xs">Q2</span>
                        Siapa saja pengguna sistem ini?
                    </span>
                    <i class="bi bi-chevron-down accordion-chevron text-slate-400 font-bold text-sm"></i>
                </button>
                <div class="accordion-content">
                    <p class="text-xs text-slate-500 font-medium leading-relaxed pl-11">
                        Sistem ini melayani tiga aktor utama:
                        <br><span class="font-black text-emerald-600">1. Pelaku IKM Kota Madiun</span> untuk memperbarui data mandiri dan mengajukan konsultasi interaktif.
                        <br><span class="font-black text-indigo-600">2. Petugas Pembina / Admin Dukungan</span> untuk melakukan verifikasi usulan data, memetakan koordinat spasial, dan memproses layanan pendampingan.
                        <br><span class="font-black text-amber-600">3. Pimpinan Dinas / Pengambil Kebijakan</span> untuk memantau indikator makro industri Kota Madiun melalui visualisasi Executive Dashboard secara data-driven.
                    </p>
                </div>
            </div>

            {{-- Accordion Item 3 --}}
            <div class="accordion-item bg-white border border-slate-200 rounded-[24px] p-6 shadow-sm hover:border-emerald-500/30 hover:shadow-md transition-all duration-300">
                <button class="accordion-header w-full flex items-center justify-between text-left focus:outline-none">
                    <span class="font-extrabold text-slate-800 text-sm uppercase tracking-wide flex items-center gap-3">
                        <span class="h-8 w-8 bg-emerald-50 text-emerald-600 rounded-lg flex items-center justify-center font-black text-xs">Q3</span>
                        Bagaimana sistem menjamin pelatihan yang diberikan tepat sasaran?
                    </span>
                    <i class="bi bi-chevron-down accordion-chevron text-slate-400 font-bold text-sm"></i>
                </button>
                <div class="accordion-content">
                    <p class="text-xs text-slate-500 font-medium leading-relaxed pl-11">
                        Dinas tidak lagi mengadopsi skema pelatihan 'pukul rata'. Dengan modul **TNA (Training Needs Assessment) Digital**, setiap pelaku usaha akan dievaluasi profil usahanya terlebih dahulu guna memetakan kesenjangan kompetensi riil secara otomatis. Data kumulatif TNA tersebut kemudian dikompilasi oleh tim pembina untuk menyusun materi bimbingan teknis yang relevan dengan kebutuhan pasar aktual.
                    </p>
                </div>
            </div>

            {{-- Accordion Item 4 --}}
            <div class="accordion-item bg-white border border-slate-200 rounded-[24px] p-6 shadow-sm hover:border-emerald-500/30 hover:shadow-md transition-all duration-300">
                <button class="accordion-header w-full flex items-center justify-between text-left focus:outline-none">
                    <span class="font-extrabold text-slate-800 text-sm uppercase tracking-wide flex items-center gap-3">
                        <span class="h-8 w-8 bg-emerald-50 text-emerald-600 rounded-lg flex items-center justify-center font-black text-xs">Q4</span>
                        Apakah aplikasi ini memfasilitasi pelaporan nasional?
                    </span>
                    <i class="bi bi-chevron-down accordion-chevron text-slate-400 font-bold text-sm"></i>
                </button>
                <div class="accordion-content">
                    <p class="text-xs text-slate-500 font-medium leading-relaxed pl-11">
                        Ya. Modul **Integrator Pelaporan SIINas** secara khusus dirancang untuk menyelaraskan parameter data IKM binaan lokal agar kompatibel dengan standar integrasi data kementerian. Tim admin dukungan dapat membantu menyaring, menyiapkan, dan mengekspor format data yang dibutuhkan agar IKM Kota Madiun dapat melapor ke Sistem Informasi Industri Nasional (SIINas) milik Kementerian Perindustrian secara cepat dan akurat.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Premium Accordion Interactive Logic
    document.querySelectorAll('.accordion-header').forEach(header => {
        header.addEventListener('click', () => {
            const item = header.parentElement;
            
            // If already active, toggle it
            if (item.classList.contains('active')) {
                item.classList.remove('active');
            } else {
                // Deactivate other active items (optional, makes it single open accordion)
                document.querySelectorAll('.accordion-item.active').forEach(activeItem => {
                    activeItem.classList.remove('active');
                });
                
                item.classList.add('active');
            }
        });
    });
</script>
@endsection
