@extends('layouts.admin')

@section('title', 'Pusat Kendali IKM JUARA')

@section('content')
<style>
    /* Glassmorphism & Custom styling */
    .glass {
        background: rgba(255, 255, 255, 0.08);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border: 1px solid rgba(255, 255, 255, 0.12);
    }
    .gradient-text {
        background: linear-gradient(135deg, #6366f1, #a855f7, #ec4899);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }
    .pulse-ring {
        animation: pulseRing 2s ease-out infinite;
    }
    @keyframes pulseRing {
        0% { box-shadow: 0 0 0 0 rgba(99, 102, 241, 0.4); }
        70% { box-shadow: 0 0 0 15px rgba(99, 102, 241, 0); }
        100% { box-shadow: 0 0 0 0 rgba(99, 102, 241, 0); }
    }
    .float-anim {
        animation: float 4s ease-in-out infinite;
    }
    @keyframes float {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-10px); }
    }
</style>

<div class="space-y-10" x-data="dashboardApp()" x-init="init()">
    {{-- ============================== --}}
    {{-- HERO BANNER (INTEGRATED INTO SIDEBAR LAYOUT) --}}
    {{-- ============================== --}}
    <div class="relative overflow-hidden rounded-[32px] bg-gradient-to-br from-[#0F172A] via-[#1E1B4B] to-[#312E81] p-10 text-white shadow-xl shadow-indigo-950/20">
        <div class="absolute inset-0 bg-[url('data:image/svg+xml,%3Csvg%20width%3D%2240%22%20height%3D%2240%22%20viewBox%3D%220%200%2040%2040%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%3E%3Cg%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%3Cg%20fill%3D%22%23ffffff%22%20fill-opacity%3D%220.02%22%3E%3Cpath%20d%3D%22M0%200h1v1H0zM20%200h1v1h-1zM0%2020h1v1H0zM20%2020h1v1h-1z%22%2F%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E')] opacity-40"></div>
        <div class="relative z-10 flex flex-col md:flex-row justify-between items-start md:items-center gap-6">
            <div>
                <div class="inline-flex items-center gap-2 px-3 py-1 bg-white/5 border border-white/10 rounded-full mb-4">
                    <span class="w-1.5 h-1.5 bg-emerald-400 rounded-full animate-pulse"></span>
                    <span class="text-[9px] font-bold text-emerald-300 tracking-[0.2em] uppercase">Control Panel Mode</span>
                </div>
                <h2 class="text-3xl lg:text-4xl font-black tracking-tight leading-none mb-3">
                    Dashboard <span class="text-transparent bg-clip-text bg-gradient-to-r from-indigo-300 via-purple-300 to-pink-300">IKM JUARA</span>
                </h2>
                <p class="text-xs text-indigo-200/80 font-bold uppercase tracking-wider">
                    "Satu Data, Satu Kendali, IKM Kota Madiun Naik Kelas!"
                </p>
            </div>
            <div class="bg-white/10 backdrop-blur border border-white/10 p-4 rounded-2xl flex flex-col items-center">
                <span class="text-[9px] font-black text-slate-300 uppercase tracking-widest mb-1">Status Database</span>
                <span class="text-xl font-black text-emerald-300">Data Terintegrasi</span>
            </div>
        </div>
    </div>

    {{-- ============================== --}}
    {{-- STATS OVERVIEW --}}
    {{-- ============================== --}}
    <div class="grid grid-cols-2 lg:grid-cols-4 gap-6">
        {{-- Card 1: Total Investasi --}}
        <div class="bg-white p-6 rounded-3xl shadow-sm border border-slate-100 flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-emerald-50 rounded-2xl flex items-center justify-center text-emerald-600 group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                </div>
                <span class="text-[9px] font-bold text-slate-400 tracking-widest uppercase">Investasi</span>
            </div>
            <div>
                <p class="text-xl lg:text-2xl font-black text-slate-800 mb-0.5">Rp {{ number_format($totalInvestasi, 0, ',', '.') }}</p>
                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Total Investasi Usaha</p>
            </div>
        </div>

        {{-- Card 2: Tenaga Kerja --}}
        <div class="bg-white p-6 rounded-3xl shadow-sm border border-slate-100 flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-blue-50 rounded-2xl flex items-center justify-center text-blue-600 group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
                </div>
                <span class="text-[9px] font-bold text-slate-400 tracking-widest uppercase">Tenaga Kerja</span>
            </div>
            <div>
                <p class="text-3xl font-black text-slate-800 mb-0.5 count-up" data-target="{{ $totalTenagaKerja }}">0</p>
                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Serapan Tenaga Kerja</p>
            </div>
        </div>

        {{-- Card 3: Pelaku Usaha (NIB Unik) --}}
        <div class="bg-white p-6 rounded-3xl shadow-sm border border-slate-100 flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-purple-50 rounded-2xl flex items-center justify-center text-purple-600 group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                </div>
                <span class="text-[9px] font-bold text-slate-400 tracking-widest uppercase">NIB Unik</span>
            </div>
            <div>
                <p class="text-3xl font-black text-slate-800 mb-0.5 count-up" data-target="{{ $totalPelakuUnik }}">0</p>
                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Pelaku Usaha (NIB Unik)</p>
            </div>
        </div>

        {{-- Card 4: Total Data IKM --}}
        <div class="bg-white p-6 rounded-3xl shadow-sm border border-slate-100 flex flex-col justify-between group hover:shadow-lg transition-all duration-300">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-indigo-50 rounded-2xl flex items-center justify-center text-indigo-600 group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/></svg>
                </div>
                <span class="text-[9px] font-bold text-slate-400 tracking-widest uppercase">Total Proyek</span>
            </div>
            <div>
                <p class="text-3xl font-black text-slate-800 mb-0.5 count-up" data-target="{{ $totalIkm }}">0</p>
                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Total Data Usaha</p>
            </div>
        </div>
    </div>

    {{-- ============================== --}}
    {{-- MODUL 1: DATABASE IKM TERINTEGRASI --}}
    {{-- ============================== --}}
    <div class="bg-white p-8 rounded-[32px] border border-slate-100 shadow-sm" id="database">
        <div class="flex items-center gap-3 mb-6">
            <div class="w-8 h-8 rounded-lg bg-indigo-50 flex items-center justify-center text-indigo-600">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4"/></svg>
            </div>
            <div>
                <h3 class="text-lg font-black text-slate-800 leading-tight">Database IKM Terintegrasi</h3>
                <p class="text-xs text-slate-400">Pusat penyimpanan profil skala usaha dan sebaran wilayah</p>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <div class="bg-slate-50 p-6 rounded-2xl">
                <h4 class="text-sm font-bold text-slate-700 mb-4">Proporsi Skala Usaha</h4>
                <div class="h-64 flex items-center justify-center">
                    <canvas id="chartSkalaUsaha"></canvas>
                </div>
            </div>
            <div class="bg-slate-50 p-6 rounded-2xl">
                <h4 class="text-sm font-bold text-slate-700 mb-4">Sebaran Wilayah IKM</h4>
                <div class="h-64">
                    <canvas id="chartKecamatan"></canvas>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-2 lg:grid-cols-4 gap-4 mt-8">
            <div class="bg-slate-50 p-4 rounded-xl text-center">
                <p class="text-xs font-bold text-slate-400 uppercase">Serapan Tenaga Kerja</p>
                <p class="text-2xl font-black text-slate-800 mt-1">{{ number_format($totalTenagaKerja) }} Orang</p>
            </div>
            <div class="bg-slate-50 p-4 rounded-xl text-center">
                <p class="text-xs font-bold text-slate-400 uppercase">Total Investasi</p>
                <p class="text-2xl font-black text-slate-800 mt-1">Rp {{ $totalInvestasi > 1000000000 ? number_format($totalInvestasi/1000000000, 1) . ' M' : number_format($totalInvestasi/1000000, 0) . ' Jt' }}</p>
            </div>
            <div class="bg-slate-50 p-4 rounded-xl text-center col-span-2">
                <p class="text-xs font-bold text-slate-400 uppercase">Status Data</p>
                <p class="text-sm font-bold text-emerald-600 mt-2 flex items-center justify-center gap-1">
                    <span class="w-2 h-2 bg-emerald-500 rounded-full"></span> Terintegrasi dengan Sistem Pusat
                </p>
            </div>
        </div>
    </div>

    {{-- ============================== --}}
    {{-- MODUL 2: LAYANAN KONSULTASI & PEMBINAAN --}}
    {{-- ============================== --}}
    <div class="bg-white p-8 rounded-[32px] border border-slate-100 shadow-sm">
        <div class="flex items-center gap-3 mb-6">
            <div class="w-8 h-8 rounded-lg bg-amber-50 flex items-center justify-center text-amber-600">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"/></svg>
            </div>
            <div>
                <h3 class="text-lg font-black text-slate-800 leading-tight">Layanan Konsultasi & Pembinaan</h3>
                <p class="text-xs text-slate-400">Status penyelesaian keluhan dan permohonan pembinaan</p>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-slate-50 p-6 rounded-2xl">
                <p class="text-xs font-bold text-slate-400 uppercase">Total Pengaduan</p>
                <p class="text-3xl font-black text-slate-800 mt-2">{{ $totalKonsultasi }}</p>
            </div>
            <div class="bg-slate-50 p-6 rounded-2xl border-l-4 border-emerald-500">
                <p class="text-xs font-bold text-emerald-600 uppercase">Terselesaikan</p>
                <p class="text-3xl font-black text-emerald-600 mt-2">{{ $konsultasiDijawab }}</p>
            </div>
            <div class="bg-slate-50 p-6 rounded-2xl border-l-4 border-amber-500">
                <p class="text-xs font-bold text-amber-600 uppercase">Menunggu Tindak Lanjut</p>
                <p class="text-3xl font-black text-amber-600 mt-2">{{ $konsultasiBelum }}</p>
            </div>
        </div>

        <div class="bg-slate-50 p-6 rounded-2xl flex flex-col md:flex-row items-center gap-6 justify-between">
            <div class="flex-1">
                <div class="flex justify-between items-center mb-2">
                    <span class="text-sm font-bold text-slate-700">Tingkat Respon Layanan</span>
                    <span class="text-sm font-black text-indigo-600">{{ $totalKonsultasi > 0 ? round(($konsultasiDijawab / $totalKonsultasi) * 100) : 0 }}%</span>
                </div>
                <div class="w-full bg-slate-200 rounded-full h-3 overflow-hidden">
                    <div class="bg-gradient-to-r from-indigo-500 to-purple-500 h-3 rounded-full" style="width: {{ $totalKonsultasi > 0 ? round(($konsultasiDijawab / $totalKonsultasi) * 100) : 0 }}%"></div>
                </div>
            </div>
            <span class="px-6 py-3 bg-slate-100 text-slate-400 rounded-2xl text-xs font-bold">
                Dikelola di Panel Dukungan
            </span>
        </div>
    </div>

    {{-- ============================== --}}
    {{-- MODUL 3: PROFIL KATEGORI & RISIKO USAHA (TNA DIGITAL) --}}
    {{-- ============================== --}}
    <div class="bg-white p-8 rounded-[32px] border border-slate-100 shadow-sm">
        <div class="flex items-center gap-3 mb-6">
            <div class="w-8 h-8 rounded-lg bg-indigo-50 flex items-center justify-center text-indigo-600">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/></svg>
            </div>
            <div>
                <h3 class="text-lg font-black text-slate-800 leading-tight">Analisis Kategori & Tingkat Risiko Usaha</h3>
                <p class="text-xs text-slate-400">Kategori usaha dan tingkat risiko untuk penyesuaian program pembinaan</p>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <div class="bg-slate-50 p-6 rounded-2xl">
                <h4 class="text-sm font-bold text-slate-700 mb-4">8 Kategori Usaha Teratas</h4>
                <div class="h-64">
                    <canvas id="chartKategori"></canvas>
                </div>
            </div>
            <div class="bg-slate-50 p-6 rounded-2xl flex flex-col justify-between">
                <div>
                    <h4 class="text-sm font-bold text-slate-700 mb-4">Tingkat Risiko Operasional</h4>
                    <div class="space-y-4">
                        @foreach($tingkatRisiko as $risk)
                            @php $riskPersen = $totalIkm > 0 ? round(($risk->total / $totalIkm) * 100, 1) : 0; @endphp
                            <div>
                                <div class="flex justify-between items-center text-xs font-bold mb-1">
                                    <span class="text-slate-600">{{ $risk->tingkat_risiko ?? 'Lainnya' }}</span>
                                    <span class="text-indigo-600">{{ $risk->total }} ({{ $riskPersen }}%)</span>
                                </div>
                                <div class="w-full bg-slate-200 h-2 rounded-full overflow-hidden">
                                    <div class="h-2 rounded-full bg-indigo-500" style="width: {{ $riskPersen }}%"></div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>


    {{-- ============================== --}}
    {{-- MODUL 7: EXECUTIVE DASHBOARD --}}
    {{-- ============================== --}}
    <div class="bg-white p-8 rounded-[32px] border border-slate-100 shadow-sm" id="executive">
        <div class="flex items-center gap-3 mb-6">
            <div class="w-8 h-8 rounded-lg bg-indigo-50 flex items-center justify-center text-indigo-600">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"/></svg>
            </div>
            <div>
                <h3 class="text-lg font-black text-slate-800 leading-tight">Executive Dashboard</h3>
                <p class="text-xs text-slate-400">Visualisasi data makro persebaran wilayah secara mendalam</p>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            <div class="bg-slate-50 p-6 rounded-2xl">
                <h4 class="text-sm font-bold text-slate-700 mb-4">Volume IKM per Kecamatan</h4>
                <div class="h-64">
                    <canvas id="chartExecKecamatan"></canvas>
                </div>
            </div>
            <div class="bg-slate-50 p-6 rounded-2xl">
                <h4 class="text-sm font-bold text-slate-700 mb-4">Top 10 Kelurahan Terpadat</h4>
                <div class="h-64">
                    <canvas id="chartKelurahan"></canvas>
                </div>
            </div>
        </div>
    </div>

    {{-- ============================== --}}
    {{-- MODUL REKAPITULASI PELAKU USAHA: KESELURUHAN KELURAHAN & KODE KBLI --}}
    {{-- ============================== --}}
    <div class="bg-gradient-to-br from-slate-900 via-indigo-950 to-slate-900 p-8 lg:p-10 rounded-[35px] text-white shadow-xl relative overflow-hidden border border-indigo-800/40"
         x-data="{ searchKelurahan: '', searchKbli: '', activeRekapTab: 'kelurahan' }">
        
        {{-- HEADER BANNER --}}
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-8 border-b border-indigo-800/60 pb-6 relative z-10">
            <div>
                <span class="text-xs font-black text-amber-400 uppercase tracking-[0.2em] bg-amber-400/10 px-3.5 py-1 rounded-full border border-amber-400/20">Rekapitulasi Laporan Keseluruhan Data</span>
                <h3 class="text-2xl lg:text-3xl font-black mt-2 tracking-tight">Data Lengkap <span class="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 via-indigo-200 to-indigo-400">Seluruh Kelurahan & Kode KBLI</span></h3>
                <p class="text-slate-300 text-xs mt-1 font-medium max-w-2xl">Visualisasi dan tabel rekapitulasi 100% data jumlah pelaku usaha IKM terdaftar di Kota Madiun berdasarkan seluruh wilayah Kelurahan ({{ count($perKelurahan) }} Kelurahan) dan seluruh Kode KBLI ({{ count($perKbli) }} Kode KBLI).</p>
            </div>
            
            <div class="flex items-center gap-2 bg-indigo-950/80 p-1.5 rounded-2xl border border-indigo-800/60 shrink-0">
                <button type="button" @click="activeRekapTab = 'kelurahan'" :class="activeRekapTab === 'kelurahan' ? 'bg-amber-400 text-slate-950 shadow-md font-black' : 'text-slate-300 hover:text-white font-bold'" class="px-4 py-2 text-xs rounded-xl transition uppercase tracking-wider">
                    📍 Seluruh Kelurahan ({{ count($perKelurahan) }})
                </button>
                <button type="button" @click="activeRekapTab = 'kbli'" :class="activeRekapTab === 'kbli' ? 'bg-amber-400 text-slate-950 shadow-md font-black' : 'text-slate-300 hover:text-white font-bold'" class="px-4 py-2 text-xs rounded-xl transition uppercase tracking-wider">
                    🏷️ Seluruh Kode KBLI ({{ count($perKbli) }})
                </button>
            </div>
        </div>

        {{-- SUMMARY METRICS --}}
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-6 mb-8 relative z-10">
            <div class="bg-slate-800/80 border border-slate-700/60 p-5 rounded-3xl backdrop-blur-md flex items-center justify-between">
                <div>
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest block">Total Wilayah Kelurahan</span>
                    <span class="text-2xl font-black text-amber-400 mt-0.5 block">{{ count($perKelurahan) }} Kelurahan</span>
                    <span class="text-[10px] text-slate-400 font-medium">Kota Madiun (3 Kecamatan)</span>
                </div>
                <div class="w-12 h-12 rounded-2xl bg-amber-400/10 text-amber-400 flex items-center justify-center text-xl font-black">
                    🗺️
                </div>
            </div>

            <div class="bg-slate-800/80 border border-slate-700/60 p-5 rounded-3xl backdrop-blur-md flex items-center justify-between">
                <div>
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest block">Total Kode KBLI Terdaftar</span>
                    <span class="text-2xl font-black text-indigo-300 mt-0.5 block">{{ count($perKbli) }} Klasifikasi</span>
                    <span class="text-[10px] text-slate-400 font-medium">Standardisasi KBLI BPS</span>
                </div>
                <div class="w-12 h-12 rounded-2xl bg-indigo-500/10 text-indigo-400 flex items-center justify-center text-xl font-black">
                    📋
                </div>
            </div>

            <div class="bg-slate-800/80 border border-slate-700/60 p-5 rounded-3xl backdrop-blur-md flex items-center justify-between">
                <div>
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest block">Total Usaha Terakumulasi</span>
                    <span class="text-2xl font-black text-emerald-400 mt-0.5 block">{{ number_format($totalIkm) }} Unit Usaha</span>
                    <span class="text-[10px] text-slate-400 font-medium">Pelaku Usaha Aktif</span>
                </div>
                <div class="w-12 h-12 rounded-2xl bg-emerald-500/10 text-emerald-400 flex items-center justify-center text-xl font-black">
                    🏬
                </div>
            </div>
        </div>

        {{-- TAB CONTENT 1: REKAPITULASI KESELURUHAN KELURAHAN --}}
        <div x-show="activeRekapTab === 'kelurahan'" x-transition class="space-y-8 relative z-10">
            {{-- SEARCH TOOLBAR KELURAHAN --}}
            <div class="bg-slate-800/90 border border-slate-700/80 p-5 rounded-3xl flex flex-col sm:flex-row justify-between items-stretch sm:items-center gap-4">
                <div class="relative flex-1">
                    <span class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400">
                        🔍
                    </span>
                    <input type="text" x-model="searchKelurahan" placeholder="Cari nama kelurahan di Kota Madiun..." class="w-full pl-11 pr-4 py-3 bg-slate-900 border border-slate-700 rounded-2xl text-xs font-bold text-white outline-none focus:border-amber-400 transition">
                </div>
                <span class="text-xs font-extrabold text-amber-400 self-center">
                    Menampilkan {{ count($perKelurahan) }} Data Kelurahan
                </span>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
                {{-- CHART GRAPH (7 COLS) --}}
                <div class="lg:col-span-7 bg-slate-800/70 border border-slate-700/60 p-6 rounded-3xl backdrop-blur-md flex flex-col justify-between">
                    <div>
                        <h4 class="text-sm font-black uppercase tracking-wider text-amber-400 mb-4 flex items-center gap-2">
                            <span>📊 Grafis Perbandingan Rekapitulasi Kelurahan (Keseluruhan 26 Kelurahan)</span>
                        </h4>
                        <div class="h-[420px] overflow-y-auto custom-scrollbar pr-2">
                            <div class="h-[650px]">
                                <canvas id="chartAllKelurahan"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- FULL TABLE LIST KELURAHAN (5 COLS) --}}
                <div class="lg:col-span-5 bg-slate-800/70 border border-slate-700/60 p-6 rounded-3xl backdrop-blur-md flex flex-col justify-between">
                    <div>
                        <h4 class="text-sm font-black uppercase tracking-wider text-indigo-300 mb-4 flex items-center gap-2">
                            <span>📑 Tabel Rincian Angka Jumlah Per Kelurahan</span>
                        </h4>

                        <div class="overflow-y-auto max-h-[440px] custom-scrollbar space-y-2.5 pr-2">
                            @foreach($perKelurahan as $idx => $kelRow)
                            @php
                                $percentShare = $totalIkm > 0 ? round(($kelRow->total / $totalIkm) * 100, 1) : 0;
                                $searchableName = strtolower(addslashes($kelRow->kelurahan));
                            @endphp
                            <div x-show="'{{ $searchableName }}'.includes(searchKelurahan.toLowerCase())" 
                                 x-transition
                                 class="bg-slate-900/90 p-3.5 rounded-2xl border border-slate-700/60 hover:border-amber-400/40 transition">
                                <div class="flex items-center justify-between mb-1.5">
                                    <div class="flex items-center gap-2.5">
                                        <span class="w-6 h-6 rounded-full bg-amber-400/20 text-amber-400 text-[10px] font-black flex items-center justify-center border border-amber-400/30">
                                            #{{ $idx+1 }}
                                        </span>
                                        <span class="text-xs font-black text-slate-100 uppercase tracking-wide">
                                            {{ $kelRow->kelurahan }}
                                        </span>
                                    </div>
                                    <span class="text-xs font-black text-emerald-400 bg-emerald-500/10 px-2.5 py-1 rounded-xl border border-emerald-500/20">
                                        {{ number_format($kelRow->total) }} IKM
                                    </span>
                                </div>
                                <div class="w-full bg-slate-800 h-2 rounded-full overflow-hidden flex items-center">
                                    <div class="h-full bg-gradient-to-r from-amber-400 to-amber-500 rounded-full" style="width: {{ max($percentShare, 4) }}%"></div>
                                </div>
                                <div class="flex justify-between items-center text-[10px] font-bold text-slate-400 mt-1">
                                    <span>Porsi: {{ $percentShare }}% dari total</span>
                                    <span>Kota Madiun</span>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- TAB CONTENT 2: REKAPITULASI KESELURUHAN KODE KBLI --}}
        <div x-show="activeRekapTab === 'kbli'" x-transition class="space-y-8 relative z-10">
            {{-- SEARCH TOOLBAR KBLI --}}
            <div class="bg-slate-800/90 border border-slate-700/80 p-5 rounded-3xl flex flex-col sm:flex-row justify-between items-stretch sm:items-center gap-4">
                <div class="relative flex-1">
                    <span class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400">
                        🔍
                    </span>
                    <input type="text" x-model="searchKbli" placeholder="Cari kode KBLI atau jenis usaha..." class="w-full pl-11 pr-4 py-3 bg-slate-900 border border-slate-700 rounded-2xl text-xs font-bold text-white outline-none focus:border-indigo-400 transition">
                </div>
                <span class="text-xs font-extrabold text-indigo-300 self-center">
                    Menampilkan {{ count($perKbli) }} Klasifikasi KBLI
                </span>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-12 gap-8">
                {{-- CHART GRAPH (6 COLS) --}}
                <div class="lg:col-span-6 bg-slate-800/70 border border-slate-700/60 p-6 rounded-3xl backdrop-blur-md flex flex-col justify-between">
                    <div>
                        <h4 class="text-sm font-black uppercase tracking-wider text-indigo-300 mb-4 flex items-center gap-2">
                            <span>📊 Visualisasi Rekapitulasi Kode KBLI</span>
                        </h4>
                        <div class="h-[400px]">
                            <canvas id="chartAllKbli"></canvas>
                        </div>
                    </div>
                </div>

                {{-- FULL TABLE LIST KBLI (6 COLS) --}}
                <div class="lg:col-span-6 bg-slate-800/70 border border-slate-700/60 p-6 rounded-3xl backdrop-blur-md flex flex-col justify-between">
                    <div>
                        <h4 class="text-sm font-black uppercase tracking-wider text-amber-400 mb-4 flex items-center gap-2">
                            <span>🏷️ Tabel Data Keseluruhan Kode KBLI</span>
                        </h4>

                        <div class="overflow-y-auto max-h-[420px] custom-scrollbar space-y-3 pr-2">
                            @foreach($perKbli as $kbliItem)
                            @php
                                $kbliPercent = $totalIkm > 0 ? round(($kbliItem->total / $totalIkm) * 100, 1) : 0;
                                $searchableKbli = strtolower(addslashes($kbliItem->kbli . ' ' . $kbliItem->judul));
                            @endphp
                            <div x-show="'{{ $searchableKbli }}'.includes(searchKbli.toLowerCase())" 
                                 x-transition
                                 class="bg-slate-900/90 p-4 rounded-2xl border border-slate-700/60 hover:border-indigo-400/40 transition">
                                <div class="flex items-start justify-between gap-3 mb-2">
                                    <div class="flex items-center gap-2.5 min-w-0">
                                        <span class="px-3 py-1 rounded-xl bg-indigo-500/30 text-indigo-300 font-mono font-black text-xs border border-indigo-400/30 shrink-0">
                                            KBLI {{ $kbliItem->kbli }}
                                        </span>
                                        <h5 class="text-xs font-extrabold text-slate-100 leading-snug truncate" title="{{ $kbliItem->judul }}">
                                            {{ $kbliItem->judul }}
                                        </h5>
                                    </div>
                                    <span class="text-xs font-black text-amber-400 bg-amber-400/10 px-3 py-1 rounded-xl border border-amber-400/20 shrink-0">
                                        {{ number_format($kbliItem->total) }} Usaha
                                    </span>
                                </div>
                                <div class="w-full bg-slate-800 h-2 rounded-full overflow-hidden flex items-center">
                                    <div class="h-full bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full" style="width: {{ max($kbliPercent, 4) }}%"></div>
                                </div>
                                <div class="flex justify-between items-center text-[10px] font-bold text-slate-400 mt-1">
                                    <span>Porsi: {{ $kbliPercent }}% dari total IKM</span>
                                    <span>Kode Standar BPS</span>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- BACKGROUND DECORATION GLOW --}}
        <div class="absolute -right-20 -bottom-20 w-80 h-80 bg-indigo-600/20 rounded-full blur-3xl pointer-events-none"></div>
        <div class="absolute -left-20 -top-20 w-80 h-80 bg-amber-500/15 rounded-full blur-3xl pointer-events-none"></div>
    </div>
</div>

{{-- Scripts --}}
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
function dashboardApp() {
    return {
        init() {
            this.initCountUp();
        },
        initCountUp() {
            const counters = document.querySelectorAll('.count-up');
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const target = parseInt(entry.target.dataset.target);
                        let current = 0;
                        const increment = Math.ceil(target / 60);
                        const timer = setInterval(() => {
                            current += increment;
                            if (current >= target) {
                                current = target;
                                clearInterval(timer);
                            }
                            entry.target.textContent = current.toLocaleString('id-ID');
                        }, 25);
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.5 });
            counters.forEach(c => observer.observe(c));
        }
    };
}

document.addEventListener('DOMContentLoaded', function() {
    // Chart defaults
    Chart.defaults.font.family = "'Plus Jakarta Sans', sans-serif";
    Chart.defaults.font.weight = '600';
    Chart.defaults.color = '#94a3b8';

    // ---- CHART 1: Skala Usaha (Doughnut) ----
    const skalaCanvas = document.getElementById('chartSkalaUsaha');
    if (skalaCanvas) {
        new Chart(skalaCanvas, {
            type: 'doughnut',
            data: {
                labels: {!! json_encode($skalaUsaha->pluck('skala_usaha')) !!},
                datasets: [{
                    data: {!! json_encode($skalaUsaha->pluck('total')) !!},
                    backgroundColor: ['#6366f1', '#a855f7', '#ec4899', '#f59e0b', '#10b981'],
                    borderWidth: 0,
                    hoverOffset: 12,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '65%',
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: { padding: 16, usePointStyle: true, pointStyleWidth: 12, font: { size: 12, weight: '700' } }
                    }
                },
                animation: { animateRotate: true, duration: 1500 }
            }
        });
    }

    // ---- CHART 2: Per Kecamatan (Bar) ----
    const kecCanvas = document.getElementById('chartKecamatan');
    if (kecCanvas) {
        const kecGradient = kecCanvas.getContext('2d').createLinearGradient(0, 0, 0, 300);
        kecGradient.addColorStop(0, '#6366f1');
        kecGradient.addColorStop(1, '#a855f7');

        new Chart(kecCanvas, {
            type: 'bar',
            data: {
                labels: {!! json_encode($perKecamatan->pluck('kecamatan')) !!},
                datasets: [{
                    label: 'Jumlah IKM',
                    data: {!! json_encode($perKecamatan->pluck('total')) !!},
                    backgroundColor: kecGradient,
                    borderRadius: 12,
                    borderSkipped: false,
                    maxBarThickness: 50,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: { beginAtZero: true, grid: { color: '#f1f5f9' }, ticks: { font: { weight: '700' } } },
                    x: { grid: { display: false }, ticks: { font: { weight: '700' } } }
                },
                animation: { duration: 1500, easing: 'easeOutQuart' }
            }
        });
    }

    // ---- CHART 3: Kategori Usaha (Polar Area) ----
    const katCanvas = document.getElementById('chartKategori');
    if (katCanvas) {
        new Chart(katCanvas, {
            type: 'polarArea',
            data: {
                labels: {!! json_encode($perKategori->pluck('kategori')->take(8)) !!},
                datasets: [{
                    data: {!! json_encode($perKategori->pluck('total')->take(8)) !!},
                    backgroundColor: [
                        'rgba(99,102,241,0.7)', 'rgba(168,85,247,0.7)', 'rgba(236,72,153,0.7)',
                        'rgba(245,158,11,0.7)', 'rgba(16,185,129,0.7)', 'rgba(59,130,246,0.7)',
                        'rgba(239,68,68,0.7)', 'rgba(20,184,166,0.7)'
                    ],
                    borderWidth: 0,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: { padding: 12, usePointStyle: true, pointStyleWidth: 10, font: { size: 11, weight: '600' } }
                    }
                },
                scales: {
                    r: {
                        grid: { color: 'rgba(0,0,0,0.05)' },
                        ticks: { display: false }
                    }
                },
                animation: { duration: 1500 }
            }
        });
    }

    // ---- CHART 4: Exec Kecamatan (Horizontal Bar) ----
    const execCanvas = document.getElementById('chartExecKecamatan');
    if (execCanvas) {
        new Chart(execCanvas, {
            type: 'bar',
            data: {
                labels: {!! json_encode($perKecamatan->pluck('kecamatan')) !!},
                datasets: [{
                    label: 'Jumlah IKM',
                    data: {!! json_encode($perKecamatan->pluck('total')) !!},
                    backgroundColor: ['rgba(99,102,241,0.8)', 'rgba(168,85,247,0.8)', 'rgba(236,72,153,0.8)', 'rgba(245,158,11,0.8)', 'rgba(16,185,129,0.8)'],
                    borderRadius: 8,
                    borderSkipped: false,
                }]
            },
            options: {
                indexAxis: 'y',
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    x: { beginAtZero: true, grid: { color: 'rgba(0,0,0,0.05)' }, ticks: { color: '#94a3b8', font: { weight: '700' } } },
                    y: { grid: { display: false }, ticks: { color: '#475569', font: { weight: '700' } } }
                },
                animation: { duration: 1500, easing: 'easeOutQuart' }
            }
        });
    }

    // ---- CHART 5: Top Kelurahan (Bar) ----
    const kelCanvas = document.getElementById('chartKelurahan');
    if (kelCanvas) {
        const topKelurahan = {!! json_encode($perKelurahan->take(10)) !!};
        new Chart(kelCanvas, {
            type: 'bar',
            data: {
                labels: topKelurahan.map(k => k.kelurahan),
                datasets: [{
                    label: 'Jumlah IKM',
                    data: topKelurahan.map(k => k.total),
                    backgroundColor: 'rgba(168,85,247,0.7)',
                    borderRadius: 8,
                    borderSkipped: false,
                    maxBarThickness: 36,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: { beginAtZero: true, grid: { color: 'rgba(0,0,0,0.05)' }, ticks: { color: '#94a3b8', font: { weight: '700' } } },
                    x: { grid: { display: false }, ticks: { color: '#475569', font: { weight: '700', size: 10 }, maxRotation: 45, minRotation: 45 } }
                },
                animation: { duration: 1500, easing: 'easeOutQuart' }
            }
        });
    }

    // ---- CHART 6: KESELURUHAN KELURAHAN FULL-DATA (Horizontal Bar for 26 Kelurahan) ----
    const allKelCanvas = document.getElementById('chartAllKelurahan');
    if (allKelCanvas) {
        const dataAllKel = {!! json_encode($perKelurahan) !!};
        new Chart(allKelCanvas, {
            type: 'bar',
            data: {
                labels: dataAllKel.map(k => k.kelurahan),
                datasets: [{
                    label: 'Jumlah Pelaku Usaha',
                    data: dataAllKel.map(k => k.total),
                    backgroundColor: '#fbbf24',
                    borderRadius: 6,
                    borderSkipped: false,
                }]
            },
            options: {
                indexAxis: 'y',
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        callbacks: {
                            label: function(ctx) { return ' Total: ' + ctx.raw + ' Pelaku Usaha'; }
                        }
                    }
                },
                scales: {
                    x: { beginAtZero: true, grid: { color: 'rgba(255,255,255,0.08)' }, ticks: { color: '#cbd5e1', font: { weight: '700' } } },
                    y: { grid: { display: false }, ticks: { color: '#f8fafc', font: { weight: '700', size: 10 } } }
                },
                animation: { duration: 1500, easing: 'easeOutQuart' }
            }
        });
    }

    // ---- CHART 7: KESELURUHAN KODE KBLI FULL-DATA (Horizontal Bar) ----
    const allKbliCanvas = document.getElementById('chartAllKbli');
    if (allKbliCanvas) {
        const dataAllKbli = {!! json_encode($perKbli) !!};
        new Chart(allKbliCanvas, {
            type: 'bar',
            data: {
                labels: dataAllKbli.map(k => 'KBLI ' + k.kbli),
                datasets: [{
                    label: 'Jumlah Usaha',
                    data: dataAllKbli.map(k => k.total),
                    backgroundColor: ['#818cf8', '#38bdf8', '#34d399', '#fbbf24', '#f43f5e', '#a855f7'],
                    borderRadius: 8,
                    borderSkipped: false,
                }]
            },
            options: {
                indexAxis: 'y',
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        callbacks: {
                            title: function(items) {
                                const item = dataAllKbli[items[0].dataIndex];
                                return 'KBLI ' + item.kbli + ': ' + item.judul;
                            },
                            label: function(ctx) { return ' Total: ' + ctx.raw + ' Usaha'; }
                        }
                    }
                },
                scales: {
                    x: { beginAtZero: true, grid: { color: 'rgba(255,255,255,0.08)' }, ticks: { color: '#cbd5e1', font: { weight: '700' } } },
                    y: { grid: { display: false }, ticks: { color: '#f8fafc', font: { weight: '700' } } }
                },
                animation: { duration: 1500, easing: 'easeOutQuart' }
            }
        });
    }
});
</script>
@endsection