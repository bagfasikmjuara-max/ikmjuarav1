@extends('layouts.dukungan')

@section('title', 'Database & Tracker Legalitas IKM')
@section('hide_header_title', true)

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div x-data="legalitasManager()" class="space-y-8">
    {{-- Header Top Bar --}}
    <div class="flex flex-col lg:flex-row justify-between items-start lg:items-center gap-4">
        <div>
            <h2 class="text-3xl font-black text-slate-800 tracking-tighter uppercase">DATABASE & TRACKER <span class="text-emerald-600">LEGALITAS IKM</span></h2>
            <p class="text-slate-400 font-medium mt-1 text-sm">Pencatatan dan pemantauan nomor legalitas usaha, masa berlaku sertifikat, & status pengurusan IKM Kota Madiun.</p>
        </div>
        <div class="flex items-center gap-3">
            <a href="{{ route('dukungan.legalitas.database') }}" class="px-5 py-2.5 bg-slate-800 hover:bg-slate-900 text-white rounded-2xl text-xs font-black transition shadow-md flex items-center gap-2 cursor-pointer">
                <span>📊 Database</span>
            </a>
            <button type="button" @click="resetAddForm(); isAddModalOpen = true" class="px-5 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-black transition shadow-md shadow-emerald-600/20 flex items-center gap-2 cursor-pointer">
                <span>➕ Tambah Data Legalitas</span>
            </button>
        </div>
    </div>

    @if(session('success'))
        <div id="success-alert" class="bg-emerald-50 border border-emerald-200 text-emerald-700 px-6 py-4 rounded-2xl font-bold text-sm shadow-sm flex items-center gap-2">
            <span>🎉 {{ session('success') }}</span>
        </div>
    @endif

    {{-- Top KPI Stat Cards --}}
    <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">
        {{-- NIB / Legalitas Usaha Card --}}
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-sm relative overflow-hidden group hover:border-emerald-300 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">Legalitas Usaha</span>
                <span class="w-2.5 h-2.5 rounded-full bg-emerald-500"></span>
            </div>
            <div class="mt-3">
                <div class="flex items-baseline gap-2">
                    <h3 class="text-3xl font-black text-slate-900 tracking-tight">{{ number_format($totalTracked) }}</h3>
                    <span class="text-xs font-bold text-emerald-600">Data Terinput</span>
                </div>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="text-[11px] font-bold text-slate-500">💳 NIB Terdaftar:</span>
                    <span class="text-[11px] font-black text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded-md">{{ number_format($totalNib) }} Usaha</span>
                </div>
            </div>
        </div>

        {{-- Halal Card --}}
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-sm relative overflow-hidden group hover:border-emerald-300 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">Sertifikat Halal</span>
                <span class="w-2.5 h-2.5 rounded-full bg-emerald-500"></span>
            </div>
            <div class="mt-3">
                <div class="flex items-baseline gap-2">
                    <h3 class="text-3xl font-black text-slate-900 tracking-tight">{{ number_format($totalHalalAda) }}</h3>
                    <span class="text-xs font-bold text-emerald-600">Terbit</span>
                </div>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">⏳ {{ $totalHalalProses }} Dalam Proses</span>
                </div>
            </div>
        </div>

        {{-- BPOM / CPPOB Card --}}
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-sm relative overflow-hidden group hover:border-blue-300 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">BPOM / CPPOB</span>
                <span class="w-2.5 h-2.5 rounded-full bg-blue-500"></span>
            </div>
            <div class="mt-3">
                <div class="flex items-baseline gap-2">
                    <h3 class="text-3xl font-black text-slate-900 tracking-tight">{{ number_format($totalBpomAda) }}</h3>
                    <span class="text-xs font-bold text-blue-600">Terbit</span>
                </div>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">⏳ {{ $totalBpomProses }} Dalam Proses</span>
                </div>
            </div>
        </div>

        {{-- SNI Card --}}
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-sm relative overflow-hidden group hover:border-purple-300 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">SNI Standard</span>
                <span class="w-2.5 h-2.5 rounded-full bg-purple-500"></span>
            </div>
            <div class="mt-3">
                <div class="flex items-baseline gap-2">
                    <h3 class="text-3xl font-black text-slate-900 tracking-tight">{{ number_format($totalSniAda) }}</h3>
                    <span class="text-xs font-bold text-purple-600">Terbit</span>
                </div>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">⏳ {{ $totalSniProses }} Dalam Proses</span>
                </div>
            </div>
        </div>

        {{-- HKI Merek Card --}}
        <div class="bg-white rounded-3xl p-5 border border-amber-200 shadow-sm relative overflow-hidden group hover:border-amber-400 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">HKI Merek</span>
                @if($expiringHkiCount > 0)
                    <button type="button" @click="isExpiryModalOpen = true" title="Klik untuk lihat daftar merek kadaluarsa / hampir habis (< 60 hari)" class="inline-flex items-center gap-1 px-2 py-0.5 bg-amber-500 text-white rounded-full text-[9px] font-black shadow-sm hover:bg-amber-600 transition cursor-pointer">
                        🔔 {{ $expiringHkiCount }} Expiry
                    </button>
                @else
                    <span class="w-2.5 h-2.5 rounded-full bg-amber-500"></span>
                @endif
            </div>
            <div class="mt-3">
                <div class="flex items-baseline gap-2">
                    <h3 class="text-3xl font-black text-slate-900 tracking-tight">{{ number_format($totalHkiAda) }}</h3>
                    <span class="text-xs font-bold text-amber-600">Terdaftar</span>
                </div>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">⏳ {{ $totalHkiProses }} Dalam Proses</span>
                </div>
            </div>
        </div>

        {{-- TKDN Card --}}
        <div class="bg-white rounded-3xl p-5 border border-teal-200 shadow-sm relative overflow-hidden group hover:border-teal-400 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">TKDN-IK</span>
                <span class="w-2.5 h-2.5 rounded-full bg-teal-500"></span>
            </div>
            <div class="mt-3">
                <div class="flex items-baseline gap-2">
                    <h3 class="text-3xl font-black text-slate-900 tracking-tight">{{ number_format($totalTkdnAda) }}</h3>
                    <span class="text-xs font-bold text-teal-600">Sertifikasi</span>
                </div>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">⏳ {{ $totalTkdnProses }} Dalam Proses</span>
                </div>
            </div>
        </div>
    </div>

    {{-- Filter & Search Bar Card --}}
    <div class="bg-white rounded-[32px] border border-slate-200 p-6 shadow-sm space-y-6">
        <form method="GET" action="{{ route('dukungan.legalitas.index') }}" class="flex flex-col md:flex-row gap-4 justify-between items-stretch md:items-center">
            
            {{-- Quick Filter Pills --}}
            <div class="flex flex-wrap items-center gap-2">
                <a href="{{ route('dukungan.legalitas.index') }}" 
                   class="px-4 py-2 rounded-xl text-xs font-bold transition {{ !request('jenis') ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200' }}">
                    Semua IKM
                </a>
                <a href="{{ route('dukungan.legalitas.index', array_merge(request()->query(), ['jenis' => 'nib'])) }}" 
                   class="px-4 py-2 rounded-xl text-xs font-bold transition {{ request('jenis') === 'nib' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200' }}">
                    💳 Ber-NIB
                </a>
                <a href="{{ route('dukungan.legalitas.index', array_merge(request()->query(), ['jenis' => 'halal'])) }}" 
                   class="px-4 py-2 rounded-xl text-xs font-bold transition {{ request('jenis') === 'halal' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200' }}">
                    🟢 Sertifikat Halal
                </a>
                <a href="{{ route('dukungan.legalitas.index', array_merge(request()->query(), ['jenis' => 'bpom_cppob'])) }}" 
                   class="px-4 py-2 rounded-xl text-xs font-bold transition {{ request('jenis') === 'bpom_cppob' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200' }}">
                    🔵 BPOM / CPPOB
                </a>
                <a href="{{ route('dukungan.legalitas.index', array_merge(request()->query(), ['jenis' => 'sni'])) }}" 
                   class="px-4 py-2 rounded-xl text-xs font-bold transition {{ request('jenis') === 'sni' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200' }}">
                    🟣 SNI
                </a>
                <a href="{{ route('dukungan.legalitas.index', array_merge(request()->query(), ['jenis' => 'hki_merek'])) }}" 
                   class="px-4 py-2 rounded-xl text-xs font-bold transition {{ request('jenis') === 'hki_merek' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200' }}">
                    🏷️ HKI Merek
                </a>
                <a href="{{ route('dukungan.legalitas.index', array_merge(request()->query(), ['jenis' => 'tkdn'])) }}" 
                   class="px-4 py-2 rounded-xl text-xs font-bold transition {{ request('jenis') === 'tkdn' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200' }}">
                    🇮🇩 TKDN-IK
                </a>
            </div>


            {{-- Input Search & Filter Kecamatan & Tombol Aksi --}}
            <div class="flex flex-col sm:flex-row flex-wrap gap-2 shrink-0">
                <select name="kecamatan" onchange="this.form.submit()" class="px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-bold text-slate-700 outline-none focus:border-emerald-500">
                    <option value="">Semua Kecamatan</option>
                    @foreach($kecamatanList as $kec)
                        <option value="{{ $kec }}" {{ request('kecamatan') == $kec ? 'selected' : '' }}>Kec. {{ $kec }}</option>
                    @endforeach
                </select>

                <div class="relative min-w-[200px]">
                    <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari NIB / NIK / Nama / Merek..." class="w-full pl-9 pr-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                    <svg class="w-4 h-4 text-slate-400 absolute left-3 top-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </div>
                <button type="submit" class="px-4 py-2.5 bg-slate-800 hover:bg-slate-900 text-white rounded-xl text-xs font-bold transition shadow-sm">
                    Cari
                </button>
                <a href="{{ route('dukungan.legalitas.export', request()->query()) }}" class="px-4 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-extrabold transition shadow-md flex items-center gap-1.5 shrink-0">
                    <span>📥 Export Excel (.xlsx)</span>
                </a>
            </div>
        </form>

        {{-- Data Table --}}
        <div class="overflow-x-auto rounded-2xl border border-slate-200">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-slate-900 text-white text-[11px] font-black uppercase tracking-wider">
                        <th class="py-4 px-4 text-center w-12">No</th>
                        <th class="py-4 px-4">Nama IKM & Pemilik</th>
                        <th class="py-4 px-4">NIB Usaha</th>
                        <th class="py-4 px-4">Sertifikat Halal</th>
                        <th class="py-4 px-4">BPOM / CPPOB</th>
                        <th class="py-4 px-4">SNI</th>
                        <th class="py-4 px-4">HKI Merek & Expiry</th>
                        <th class="py-4 px-4">Sertifikat TKDN</th>
                        <th class="py-4 px-4 text-center">Aksi</th>

                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-200 text-xs font-medium text-slate-700">
                    @forelse($legalitasList as $index => $item)
                        @php
                            $isHkiExpiring = false;
                            $isHkiExpired = false;
                            $daysLeft = null;
                            if(!empty($item->tgl_berakhir_hki)) {
                                $expDate = \Carbon\Carbon::parse($item->tgl_berakhir_hki);
                                $daysLeft = (int) now()->diffInDays($expDate, false);
                                if($daysLeft < 0) {
                                    $isHkiExpired = true;
                                    $isHkiExpiring = true;
                                } elseif($daysLeft <= 60) {
                                    $isHkiExpiring = true;
                                }
                            }
                            
                            $waMessage = urlencode("Halo Bp/Ibu " . $item->pemilik . " (" . $item->nama_usaha . "), kami dari Tim Pembina Dinas Naker KUKM Kota Madiun ingin mengkonfirmasi kelengkapan legalitas dan sertifikasi produk usaha Anda...");
                            if($isHkiExpiring && !empty($item->nama_merek)) {
                                $expStr = \Carbon\Carbon::parse($item->tgl_berakhir_hki)->format('d-m-Y');
                                if($isHkiExpired) {
                                    $waMessage = urlencode("Halo Bp/Ibu " . $item->pemilik . " (" . $item->nama_usaha . "), kami dari Tim Pembina Dinas Naker KUKM Kota Madiun menginfokan bahwa Sertifikat HKI Merek '" . ($item->nama_merek ?: $item->nama_usaha) . "' Anda (" . ($item->no_hki_merek ?: '-') . ") telah KADALUARSA pada tanggal " . $expStr . ". Mohon segera mengajukan perpanjangan merek. Terima kasih!");
                                } else {
                                    $waMessage = urlencode("Halo Bp/Ibu " . $item->pemilik . " (" . $item->nama_usaha . "), kami dari Tim Pembina Dinas Naker KUKM Kota Madiun ingin mengingatkan bahwa Sertifikat HKI Merek '" . ($item->nama_merek ?: $item->nama_usaha) . "' Anda (" . ($item->no_hki_merek ?: '-') . ") akan berakhir dalam " . $daysLeft . " hari lagi pada tanggal " . $expStr . ". Mohon segera melakukan perpanjangan merek. Terima kasih!");
                                }
                            }
                        @endphp
                        <tr class="hover:bg-slate-50/80 transition-colors {{ $isHkiExpired ? 'bg-rose-50/40' : ($isHkiExpiring ? 'bg-amber-50/30' : '') }}">
                            <td class="py-4 px-4 text-center font-bold text-slate-400">
                                {{ $legalitasList->firstItem() + $index }}
                            </td>
                            <td class="py-4 px-4">
                                <div class="font-extrabold text-slate-900 text-sm">{{ $item->nama_usaha }}</div>
                                <div class="text-[11px] text-slate-500 font-semibold">{{ $item->pemilik }} • Kec. {{ $item->kecamatan }}</div>
                                @if(!empty($item->no_hp))
                                    <a href="https://wa.me/{{ preg_replace('/^0/', '62', preg_replace('/\D/', '', $item->no_hp)) }}?text={{ $waMessage }}" 
                                       target="_blank" 
                                       class="inline-flex items-center gap-1 text-[10px] {{ $isHkiExpired ? 'text-rose-600 hover:text-rose-700 font-black' : ($isHkiExpiring ? 'text-amber-700 hover:text-amber-800 font-extrabold' : 'text-emerald-600 hover:text-emerald-700 font-bold') }} mt-1 hover:underline">
                                        📲 WA Pembinaan
                                    </a>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                @if(!empty($item->nib))
                                    <span class="inline-block px-2.5 py-1 bg-emerald-100 text-emerald-700 rounded-lg text-[10px] font-black font-mono">
                                        {{ $item->nib }}
                                    </span>
                                @else
                                    <span class="inline-block px-2.5 py-1 bg-rose-100 text-rose-600 rounded-lg text-[10px] font-bold">
                                        Belum NIB
                                    </span>
                                @endif
                                @if(!empty($item->link_gdrive_nib))
                                    <a href="{{ $item->link_gdrive_nib }}" target="_blank" class="text-[10px] text-indigo-600 hover:text-indigo-800 font-bold mt-1 block">
                                        📂 Berkas GDrive
                                    </a>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                @if($item->status_halal === 'Ada')
                                    <span class="inline-block px-2 py-0.5 bg-emerald-100 text-emerald-700 rounded-md text-[10px] font-extrabold">Ada</span>
                                    <p class="text-[10px] text-slate-500 font-mono mt-0.5">{{ $item->no_halal ?: 'No. Halal Terdaftar' }}</p>
                                @elseif($item->status_halal === 'Proses')
                                    <span class="inline-block px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">Dalam Proses</span>
                                @else
                                    <span class="inline-block px-2 py-0.5 bg-slate-100 text-slate-400 rounded-md text-[10px] font-bold">Belum Ada</span>
                                @endif
                                @if(!empty($item->link_gdrive_halal))
                                    <a href="{{ $item->link_gdrive_halal }}" target="_blank" class="text-[10px] text-indigo-600 hover:text-indigo-800 font-bold mt-1 block">
                                        📂 Berkas GDrive
                                    </a>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                @if($item->status_bpom_cppob === 'Ada')
                                    <span class="inline-block px-2 py-0.5 bg-blue-100 text-blue-700 rounded-md text-[10px] font-extrabold">Ada</span>
                                    <p class="text-[10px] text-slate-500 font-mono mt-0.5">{{ $item->no_bpom_cppob ?: 'No. BPOM/CPPOB' }}</p>
                                @elseif($item->status_bpom_cppob === 'Proses')
                                    <span class="inline-block px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">Dalam Proses</span>
                                @else
                                    <span class="inline-block px-2 py-0.5 bg-slate-100 text-slate-400 rounded-md text-[10px] font-bold">Belum Ada</span>
                                @endif
                                @if(!empty($item->link_gdrive_bpom_cppob))
                                    <a href="{{ $item->link_gdrive_bpom_cppob }}" target="_blank" class="text-[10px] text-indigo-600 hover:text-indigo-800 font-bold mt-1 block">
                                        📂 Berkas GDrive
                                    </a>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                @if($item->status_sni === 'Ada')
                                    <span class="inline-block px-2 py-0.5 bg-purple-100 text-purple-700 rounded-md text-[10px] font-extrabold">Ada</span>
                                    <p class="text-[10px] text-slate-500 font-mono mt-0.5">{{ $item->no_sni ?: 'SNI' }}</p>
                                @elseif($item->status_sni === 'Proses')
                                    <span class="inline-block px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">Dalam Proses</span>
                                @else
                                    <span class="inline-block px-2 py-0.5 bg-slate-100 text-slate-400 rounded-md text-[10px] font-bold">Belum Ada</span>
                                @endif
                                @if(!empty($item->link_gdrive_sni))
                                    <a href="{{ $item->link_gdrive_sni }}" target="_blank" class="text-[10px] text-indigo-600 hover:text-indigo-800 font-bold mt-1 block">
                                        📂 Berkas GDrive
                                    </a>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                @if($item->status_hki_merek === 'Ada')
                                    <span class="inline-block px-2 py-0.5 bg-amber-100 text-amber-800 rounded-md text-[10px] font-extrabold">Terdaftar HKI</span>
                                    <p class="text-[10px] text-slate-700 font-bold mt-0.5">🏷️ {{ $item->nama_merek ?: $item->nama_usaha }}</p>
                                    @if($item->no_hki_merek)
                                        <p class="text-[9px] text-slate-400 font-mono">{{ $item->no_hki_merek }}</p>
                                    @endif
                                @elseif($item->status_hki_merek === 'Proses')
                                    <span class="inline-block px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">Dalam Proses</span>
                                @else
                                    <span class="inline-block px-2 py-0.5 bg-slate-100 text-slate-400 rounded-md text-[10px] font-bold">Belum Ada</span>
                                @endif

                                {{-- Tanggal Berakhir & Bell Expiry --}}
                                @if(!empty($item->tgl_berakhir_hki))
                                    <div class="mt-1 flex items-center gap-1.5 text-[10px] font-semibold text-slate-600">
                                        <span>📅 Expiry: {{ \Carbon\Carbon::parse($item->tgl_berakhir_hki)->format('d/m/Y') }}</span>
                                        @if($isHkiExpired)
                                            <span class="inline-flex items-center gap-0.5 text-rose-600 font-black animate-pulse" title="Sertifikat HKI Merek sudah kadaluarsa!">
                                                ❌ <span class="text-[9px] font-black">(Expired)</span>
                                            </span>
                                        @elseif($isHkiExpiring)
                                            <span class="inline-flex items-center gap-0.5 text-amber-700 font-extrabold" title="Merek hampir habis masa berlaku (< 60 hari)!">
                                                🔔 <span class="text-[9px] font-bold">({{ $daysLeft }} hr lagi)</span>
                                            </span>
                                        @endif
                                    </div>
                                @endif

                                @if(!empty($item->link_gdrive_hki_merek))
                                    <a href="{{ $item->link_gdrive_hki_merek }}" target="_blank" class="text-[10px] text-indigo-600 hover:text-indigo-800 font-bold mt-1 block">
                                        📂 Berkas GDrive
                                    </a>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                @if($item->status_tkdn === 'Ada')
                                    <span class="inline-block px-2 py-0.5 bg-teal-100 text-teal-800 rounded-md text-[10px] font-extrabold">Sertifikat TKDN</span>
                                    <p class="text-[10px] text-slate-700 font-bold font-mono mt-0.5">{{ $item->no_sertifikat_tkdn ?: 'No. Sertifikat TKDN' }}</p>
                                    @if($item->persentase_tkdn)
                                        <span class="inline-block mt-0.5 px-1.5 py-0.5 bg-teal-50 border border-teal-200 text-teal-700 font-bold text-[9px] rounded">
                                            Nilai: {{ $item->persentase_tkdn }}
                                        </span>
                                    @endif
                                @elseif($item->status_tkdn === 'Proses')
                                    <span class="inline-block px-2 py-0.5 bg-amber-100 text-amber-700 rounded-md text-[10px] font-extrabold">Dalam Proses</span>
                                    @if($item->persentase_tkdn)
                                        <p class="text-[9px] text-slate-500 font-medium mt-0.5">Estimasi: {{ $item->persentase_tkdn }}</p>
                                    @endif
                                @else
                                    <span class="inline-block px-2 py-0.5 bg-slate-100 text-slate-400 rounded-md text-[10px] font-bold">Belum Ada</span>
                                @endif
                                @if(!empty($item->link_gdrive_tkdn))
                                    <a href="{{ $item->link_gdrive_tkdn }}" target="_blank" class="text-[10px] text-indigo-600 hover:text-indigo-800 font-bold mt-1 block">
                                        📂 Berkas GDrive
                                    </a>
                                @endif
                            </td>
                            <td class="py-4 px-4 text-center">
                                <div class="flex items-center justify-center gap-1.5">
                                    <button type="button" @click="openModal({{ json_encode($item) }})" class="px-3 py-1.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold transition shadow-sm flex items-center gap-1">
                                        <span>📝 Edit</span>
                                    </button>
                                    <button type="button" @click="openDeleteModal({{ json_encode($item) }})" class="px-3 py-1.5 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-bold transition shadow-sm flex items-center gap-1">
                                        <span>🗑️ Hapus</span>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="9" class="text-center py-8 text-slate-400 font-bold">
                                Data legalitas tidak ditemukan.
                            </td>
                        </tr>
                    @endforelse

                </tbody>
            </table>
        </div>

        {{-- Pagination --}}
        <div class="pt-2">
            {{ $legalitasList->links() }}
        </div>
    </div>

    {{-- Modal Expiry HKI Merek Popup --}}
    <div x-show="isExpiryModalOpen" x-transition class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-sm" style="display:none;">
        <div @click.away="isExpiryModalOpen = false" class="bg-white rounded-3xl p-6 border border-slate-200 shadow-2xl max-w-3xl w-full space-y-6 max-h-[85vh] overflow-y-auto">
            <div class="flex justify-between items-center border-b border-slate-100 pb-4">
                <div class="flex items-center gap-2">
                    <span class="w-8 h-8 rounded-xl bg-rose-100 text-rose-600 flex items-center justify-center text-lg font-black">🔔</span>
                    <div>
                        <h3 class="text-lg font-black text-slate-900">Pengingat Masa Berlaku Sertifikat HKI Merek</h3>
                        <p class="text-xs text-slate-400 font-medium">Daftar sertifikat HKI Merek IKM yang berakhir dalam 60 hari ke depan atau sudah kadaluarsa.</p>
                    </div>
                </div>
                <button type="button" @click="isExpiryModalOpen = false" class="text-slate-400 hover:text-slate-600 font-bold text-2xl">&times;</button>
            </div>

            <div class="space-y-3">
                @forelse($expiringHkiList as $expItem)
                    @php
                        $expDate = \Carbon\Carbon::parse($expItem->tgl_berakhir_hki);
                        $daysLeft = (int) now()->diffInDays($expDate, false);
                        
                        if($daysLeft < 0) {
                            $expWaMsg = urlencode("Halo Bp/Ibu " . $expItem->pemilik . " (" . $expItem->nama_usaha . "), kami dari Tim Pembina Dinas Naker KUKM Kota Madiun menginfokan bahwa Sertifikat HKI Merek '" . ($expItem->nama_merek ?: $expItem->nama_usaha) . "' Anda (" . ($expItem->no_hki_merek ?: '-') . ") telah KADALUARSA pada tanggal " . $expDate->format('d-m-Y') . ". Mohon segera mengajukan perpanjangan merek. Terima kasih!");
                        } else {
                            $expWaMsg = urlencode("Halo Bp/Ibu " . $expItem->pemilik . " (" . $expItem->nama_usaha . "), kami dari Tim Pembina Dinas Naker KUKM Kota Madiun ingin mengingatkan bahwa Sertifikat HKI Merek '" . ($expItem->nama_merek ?: $expItem->nama_usaha) . "' Anda (" . ($expItem->no_hki_merek ?: '-') . ") akan berakhir dalam " . $daysLeft . " hari lagi pada tanggal " . $expDate->format('d-m-Y') . ". Mohon segera melakukan perpanjangan merek. Terima kasih!");
                        }
                    @endphp
                    <div class="p-4 bg-slate-50 border border-slate-200 rounded-2xl flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 hover:border-amber-300 transition">
                        <div>
                            <div class="flex items-center gap-2">
                                <span class="font-extrabold text-slate-900 text-sm">{{ $expItem->nama_usaha }}</span>
                                <span class="px-2.5 py-0.5 text-[10px] font-black rounded-md {{ $daysLeft < 0 ? 'bg-rose-100 text-rose-700' : 'bg-amber-100 text-amber-800' }}">
                                    {{ $daysLeft < 0 ? '❌ KADALUARSA (EXPIRED)' : '🔔 ' . $daysLeft . ' Hari Lagi' }}
                                </span>
                            </div>
                            <p class="text-xs text-slate-600 font-bold mt-1">🏷️ Merek: {{ $expItem->nama_merek ?: $expItem->nama_usaha }} (No. {{ $expItem->no_hki_merek ?: '-' }})</p>
                            <p class="text-[11px] text-slate-500 font-medium">Pemilik: {{ $expItem->pemilik }} • Kec. {{ $expItem->kecamatan }} • 📅 Expiry: {{ $expDate->format('d M Y') }}</p>
                        </div>
                        <div class="shrink-0">
                            @if(!empty($expItem->no_hp))
                                <a href="https://wa.me/{{ preg_replace('/^0/', '62', preg_replace('/\D/', '', $expItem->no_hp)) }}?text={{ $expWaMsg }}" 
                                   target="_blank" 
                                   class="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-extrabold transition shadow-sm inline-flex items-center gap-1.5">
                                    <span>📲 Ingatkan via WA</span>
                                </a>
                            @else
                                <span class="text-xs text-slate-400 font-bold">No WA Kosong</span>
                            @endif
                        </div>
                    </div>
                @empty
                    <div class="text-center py-8 text-slate-400 font-bold">
                        Tidak ada sertifikat HKI Merek yang mendekati kadaluarsa saat ini. 🎉
                    </div>
                @endforelse
            </div>
        </div>
    </div>

    {{-- MODAL KONFIRMASI HAPUS DATA LEGALITAS (FULL COLOUR THEME MERAH) --}}
    <div x-show="isDeleteModalOpen" x-transition class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-sm" style="display:none;">
        <div @click.away="if(!isDeletingCountdown) isDeleteModalOpen = false" class="bg-white rounded-[32px] border border-rose-100 shadow-2xl max-w-md w-full overflow-hidden flex flex-col">
            
            {{-- Header Gradien Red/Rose --}}
            <div class="bg-gradient-to-r from-rose-700 via-rose-800 to-slate-900 px-6 py-5 text-white flex justify-between items-center shrink-0">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-2xl bg-rose-500/20 border border-rose-400/30 flex items-center justify-center text-xl">
                        🗑️
                    </div>
                    <div>
                        <h3 class="text-lg font-black tracking-tight">Konfirmasi Hapus Data</h3>
                        <p class="text-xs text-rose-200 font-medium">Penghapusan permanen data legalitas IKM</p>
                    </div>
                </div>
                <button type="button" x-show="!isDeletingCountdown" @click="isDeleteModalOpen = false" class="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white font-bold text-xl transition">&times;</button>
            </div>

            <div class="p-6 space-y-4">
                <div class="p-4 bg-rose-50/60 border border-rose-200 rounded-2xl">
                    <p class="text-xs font-extrabold text-slate-800">Apakah Anda yakin ingin menghapus data legalitas ini?</p>
                    <p class="text-[11px] text-emerald-700 font-bold mt-1">ℹ️ Data profil IKM pada Peta Sebaran akan tetap utuh & aman.</p>
                    <div class="mt-3 pt-2 border-t border-rose-100 space-y-1 text-xs text-slate-600">
                        <p><span class="font-bold text-slate-400">IKM:</span> <span class="font-extrabold text-slate-900" x-text="deleteItem.nama_usaha"></span></p>
                        <p><span class="font-bold text-slate-400">Pemilik:</span> <span class="font-semibold text-slate-800" x-text="deleteItem.pemilik"></span></p>
                        <p x-show="deleteItem.nib"><span class="font-bold text-slate-400">NIB:</span> <span class="font-mono text-emerald-700 font-bold" x-text="deleteItem.nib"></span></p>
                    </div>
                </div>

                {{-- State Countdown 3 Detik --}}
                <div x-show="isDeletingCountdown" class="p-4 bg-amber-50 border border-amber-200 rounded-2xl text-center space-y-2 animate-pulse">
                    <div class="text-2xl font-black text-amber-700">⏳ <span x-text="deleteCountdown"></span> detik</div>
                    <p class="text-xs font-extrabold text-amber-800">Menghapus data & mensinkronkan ulang database...</p>
                </div>

                <form id="delete-form" :action="'/dukungan/legalitas/destroy/' + (deleteItem.id || '')" method="POST" class="hidden">
                    @csrf
                </form>

                <div x-show="!isDeletingCountdown" class="flex justify-end gap-3 pt-2">
                    <button type="button" @click="isDeleteModalOpen = false" class="px-5 py-2.5 border border-slate-200 text-slate-600 rounded-xl text-xs font-bold hover:bg-slate-50">
                        ❌ Batal
                    </button>
                    <button type="button" @click="startDeleteCountdown()" class="px-6 py-2.5 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-extrabold transition shadow-md flex items-center gap-1.5">
                        <span>🗑️ Ya, Hapus Data</span>
                    </button>
                </div>
            </div>
        </div>
    </div>

    {{-- MODAL TAMBAH DATA LEGALITAS (FULL COLOUR SETEMA HALAMAN UTAMA) --}}
    <div x-show="isAddModalOpen" x-transition class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-sm" style="display:none;">
        <div @click.away="if(!isHkiSelectModalOpen && !isHalalSelectModalOpen) isAddModalOpen = false" class="bg-white rounded-[32px] border border-slate-200 shadow-2xl max-w-2xl w-full overflow-hidden max-h-[92vh] flex flex-col">
            
            {{-- Header Gradien Emerald & Slate --}}
            <div class="bg-gradient-to-r from-emerald-800 via-emerald-900 to-slate-900 px-6 py-5 text-white flex justify-between items-center shrink-0">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-2xl bg-emerald-500/20 border border-emerald-400/30 flex items-center justify-center text-xl">
                        ➕
                    </div>
                    <div>
                        <h3 class="text-lg font-black tracking-tight">Tambah Data Legalitas IKM Baru</h3>
                        <p class="text-xs text-emerald-200 font-medium">Input data profil usaha baru atau tarik data terdaftar via NIB / NIK</p>
                    </div>
                </div>
                <button type="button" @click="isAddModalOpen = false" class="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white font-bold text-xl transition">&times;</button>
            </div>

            <form action="{{ route('dukungan.legalitas.store') }}" method="POST" class="p-6 overflow-y-auto space-y-5">
                @csrf
                <input type="hidden" name="ikm_id" x-model="addForm.ikm_id">

                {{-- Mode Selector Tabs --}}
                <div class="flex p-1 bg-slate-100 rounded-2xl gap-1">
                    <button type="button" @click="addMode = 'manual'" :class="addMode === 'manual' ? 'bg-white text-emerald-700 shadow-sm font-black' : 'text-slate-500 font-bold hover:text-slate-800'" class="flex-1 py-2 px-3 rounded-xl text-xs transition">
                        ✍️ Input Pelaku Usaha Baru
                    </button>
                    <button type="button" @click="addMode = 'existing'" :class="addMode === 'existing' ? 'bg-white text-emerald-700 shadow-sm font-black' : 'text-slate-500 font-bold hover:text-slate-800'" class="flex-1 py-2 px-3 rounded-xl text-xs transition">
                        🔍 Ambil dari Database IKM (Peta Sebaran)
                    </button>
                </div>

                {{-- Search NIB / NIK Card (Mode Existing) --}}
                <div x-show="addMode === 'existing'" class="p-4 bg-emerald-50 border border-emerald-200 rounded-2xl space-y-3">
                    <label class="block text-[11px] font-black text-emerald-900 uppercase">Cari NIB / NIK Pelaku Usaha</label>
                    <div class="flex gap-2">
                        <input type="text" x-model="searchNibNik" @keydown.enter.prevent="searchIkmByNibNik()" placeholder="Masukkan 13-digit NIB atau 16-digit NIK..." class="flex-1 px-4 py-2.5 bg-white border border-emerald-300 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        <button type="button" @click="searchIkmByNibNik()" class="px-4 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-extrabold transition shrink-0 flex items-center gap-1">
                            <span x-show="!isSearching">🔍 Cari Data IKM</span>
                            <span x-show="isSearching">⏳ Mencari...</span>
                        </button>
                    </div>
                    <div x-show="searchMessage" :class="searchSuccess ? 'text-emerald-700 bg-emerald-100/70 border-emerald-300' : 'text-rose-700 bg-rose-100/70 border-rose-300'" class="p-3 rounded-xl text-xs font-bold border">
                        <span x-text="searchMessage"></span>
                    </div>
                </div>

                {{-- Identitas IKM Card --}}
                <div class="p-5 bg-slate-50 border border-slate-200 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-slate-700"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">Profil Usaha & Pemilik</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nama IKM / Usaha *</label>
                            <input type="text" name="nama_usaha" x-model="addForm.nama_usaha" @input="checkAutoDatabaseMatches('add')" required placeholder="Contoh: Kerajinan Jati Utama..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nama Pemilik / Pelaku Usaha *</label>
                            <input type="text" name="pemilik" x-model="addForm.pemilik" @input="checkAutoDatabaseMatches('add')" required placeholder="Nama lengkap pemilik..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">NIK (16 Digit)</label>
                            <input type="text" name="nik" x-model="addForm.nik" @input="checkAutoDatabaseMatches('add')" maxlength="16" placeholder="3577..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">No. HP / WhatsApp</label>
                            <input type="text" name="no_hp" x-model="addForm.no_hp" placeholder="081234567..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Kecamatan</label>
                            <select name="kecamatan" x-model="addForm.kecamatan" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500">
                                <option value="Manguharjo">Manguharjo</option>
                                <option value="Taman">Taman</option>
                                <option value="Kartoharjo">Kartoharjo</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Kelurahan</label>
                            <input type="text" name="kelurahan" x-model="addForm.kelurahan" placeholder="Pangongangan / Nambangan..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 1: NIB (Emerald Theme) --}}
                <div class="p-5 bg-gradient-to-br from-emerald-50/60 to-slate-50 border border-emerald-200 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-emerald-500"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">1. Nomor Induk Berusaha (NIB)</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nomor NIB (13 Digit)</label>
                            <input type="text" name="nib" x-model="addForm.nib" @input="checkAutoDatabaseMatches('add')" maxlength="13" placeholder="Masukkan 13 digit NIB..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Dokumen NIB</label>
                            <input type="url" name="link_gdrive_nib" x-model="addForm.link_gdrive_nib" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 2: Halal (Green Theme) --}}
                <div class="p-5 bg-gradient-to-br from-emerald-50/40 to-slate-50 border border-emerald-300/80 rounded-2xl space-y-3">
                    <div class="flex flex-wrap items-center justify-between gap-2">
                        <div class="flex items-center gap-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-emerald-600"></span>
                            <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">2. Sertifikat Halal</h4>
                        </div>

                        {{-- Auto Detection Notification Badge --}}
                        <template x-if="autoHalalMatches.length > 0">
                            <span class="px-2.5 py-1 bg-emerald-100 text-emerald-800 rounded-full text-[11px] font-black animate-pulse flex items-center gap-1 border border-emerald-300">
                                ✨ Data Terdeteksi di Database Halal (<span x-text="autoHalalMatches.length"></span> Data)
                            </span>
                        </template>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status Sertifikat Halal</label>
                            <select name="status_halal" x-model="addForm.status_halal" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses</option>
                                <option value="Ada">Sudah Ada (Terbit)</option>
                            </select>
                        </div>
                        <div>
                            <div class="flex items-center justify-between mb-1">
                                <label class="block text-[11px] font-bold text-slate-700 uppercase">Nomor Sertifikat Halal</label>
                                <button type="button" @click="pullHalalData('add')" class="text-[10px] font-extrabold text-emerald-700 hover:text-emerald-800 bg-emerald-100 hover:bg-emerald-200 px-2 py-0.5 rounded-lg transition flex items-center gap-1 cursor-pointer border border-emerald-300">
                                    🔍 Tarik Data Halal
                                </button>
                            </div>
                            <div class="flex gap-1.5">
                                <input type="text" name="no_halal" x-model="addForm.no_halal" placeholder="Ketik manual / tarik data..." class="flex-1 px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                                <button type="button" @click="pullHalalData('add')" title="Tarik Data dari Database Halal" class="px-3.5 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-black transition flex items-center gap-1 shrink-0 shadow-sm cursor-pointer">
                                    🔍 Tarik
                                </button>
                            </div>
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Sertifikat Halal</label>
                            <input type="url" name="link_gdrive_halal" x-model="addForm.link_gdrive_halal" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 3: BPOM / CPPOB (Blue Theme) --}}
                <div class="p-5 bg-gradient-to-br from-blue-50/50 to-slate-50 border border-blue-200 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-blue-500"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">3. BPOM / CPPOB</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status BPOM / CPPOB</label>
                            <select name="status_bpom_cppob" x-model="addForm.status_bpom_cppob" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-blue-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses</option>
                                <option value="Ada">Sudah Ada (Terbit)</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nomor BPOM / CPPOB</label>
                            <input type="text" name="no_bpom_cppob" x-model="addForm.no_bpom_cppob" placeholder="Nomor izin BPOM/CPPOB..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-blue-500">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Dokumen BPOM/CPPOB</label>
                            <input type="url" name="link_gdrive_bpom_cppob" x-model="addForm.link_gdrive_bpom_cppob" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-blue-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 4: SNI (Purple Theme) --}}
                <div class="p-5 bg-gradient-to-br from-purple-50/50 to-slate-50 border border-purple-200 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-purple-500"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">4. Standar Nasional Indonesia (SNI)</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status SNI</label>
                            <select name="status_sni" x-model="addForm.status_sni" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-purple-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses</option>
                                <option value="Ada">Sudah Ada (Terbit)</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nomor SNI</label>
                            <input type="text" name="no_sni" x-model="addForm.no_sni" placeholder="Nomor dokumen SNI..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-purple-500">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Dokumen SNI</label>
                            <input type="url" name="link_gdrive_sni" x-model="addForm.link_gdrive_sni" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-purple-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 5: HKI Merek (Amber Theme) --}}
                <div class="p-5 bg-gradient-to-br from-amber-50/60 to-slate-50 border border-amber-300 rounded-2xl space-y-3">
                    <div class="flex flex-wrap items-center justify-between gap-2">
                        <div class="flex items-center gap-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-amber-500"></span>
                            <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">5. Hak Kekayaan Intelektual (HKI Merek)</h4>
                        </div>

                        {{-- Auto Detection Notification Badge --}}
                        <template x-if="autoHkiMatches.length > 0">
                            <span class="px-2.5 py-1 bg-amber-100 text-amber-800 rounded-full text-[11px] font-black animate-pulse flex items-center gap-1 border border-amber-300">
                                🏷️ Data Terdeteksi di Database HKI (<span x-text="autoHkiMatches.length"></span> Data)
                            </span>
                        </template>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status HKI Merek</label>
                            <select name="status_hki_merek" x-model="addForm.status_hki_merek" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses</option>
                                <option value="Ada">Sudah Terdaftar HKI</option>
                            </select>
                        </div>
                        <div>
                            <div class="flex items-center justify-between mb-1">
                                <label class="block text-[11px] font-bold text-slate-700 uppercase">Nomor Pendaftaran HKI</label>
                                <button type="button" @click="pullHkiData('add')" class="text-[10px] font-extrabold text-amber-800 hover:text-amber-900 bg-amber-100 hover:bg-amber-200 px-2 py-0.5 rounded-lg transition flex items-center gap-1 cursor-pointer border border-amber-300">
                                    🔍 Tarik Data HKI
                                </button>
                            </div>
                            <div class="flex gap-1.5">
                                <input type="text" name="no_hki_merek" x-model="addForm.no_hki_merek" placeholder="Ketik manual / tarik data..." class="flex-1 px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-amber-500">
                                <button type="button" @click="pullHkiData('add')" title="Tarik Data dari Database HKI" class="px-3.5 py-2.5 bg-amber-500 hover:bg-amber-600 text-white rounded-xl text-xs font-black transition flex items-center gap-1 shrink-0 shadow-sm cursor-pointer">
                                    🔍 Tarik
                                </button>
                            </div>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nama Merek Terdaftar</label>
                            <input type="text" name="nama_merek" x-model="addForm.nama_merek" placeholder="Masukkan nama merek..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-amber-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-amber-800 uppercase mb-1">📅 Tanggal Berakhir Sertifikat Merek</label>
                            <input type="date" name="tgl_berakhir_hki" x-model="addForm.tgl_berakhir_hki" class="w-full px-4 py-2.5 bg-white border border-amber-300 rounded-xl text-xs font-extrabold text-slate-800 outline-none focus:border-amber-500">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Sertifikat HKI</label>
                            <input type="url" name="link_gdrive_hki_merek" x-model="addForm.link_gdrive_hki_merek" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-amber-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 6: TKDN-IK (Teal Theme) --}}
                <div class="p-5 bg-gradient-to-br from-teal-50/60 to-slate-50 border border-teal-300 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-teal-600"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">6. Tingkat Komponen Dalam Negeri (TKDN-IK)</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status Sertifikat TKDN</label>
                            <select name="status_tkdn" x-model="addForm.status_tkdn" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-teal-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses Pengajuan</option>
                                <option value="Ada">Sudah Ada (Terbit)</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nomor Sertifikat TKDN</label>
                            <input type="text" name="no_sertifikat_tkdn" x-model="addForm.no_sertifikat_tkdn" placeholder="Contoh: TKDN/IK/2025/08192..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-teal-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Capaian Persentase TKDN (%)</label>
                            <input type="text" name="persentase_tkdn" x-model="addForm.persentase_tkdn" placeholder="Contoh: 42.50%" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-teal-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Sertifikat TKDN</label>
                            <input type="url" name="link_gdrive_tkdn" x-model="addForm.link_gdrive_tkdn" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-teal-500">
                        </div>
                    </div>
                </div>

                <div class="flex justify-end gap-3 pt-4 border-t border-slate-100 shrink-0">

                    <button type="button" @click="isAddModalOpen = false" class="px-5 py-2.5 border border-slate-200 text-slate-600 rounded-xl text-xs font-bold hover:bg-slate-50">
                        Batal
                    </button>
                    <button type="submit" class="px-6 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-extrabold transition shadow-md">
                        Simpan Data Legalitas
                    </button>
                </div>
            </form>
        </div>
    </div>

    {{-- Modal Edit Legalitas (FULL COLOUR SETEMA HALAMAN UTAMA) --}}
    <div x-show="isModalOpen" x-transition class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-sm" style="display:none;">
        <div @click.away="if(!isHkiSelectModalOpen && !isHalalSelectModalOpen) isModalOpen = false" class="bg-white rounded-[32px] border border-slate-200 shadow-2xl max-w-2xl w-full overflow-hidden max-h-[92vh] flex flex-col">
            
            {{-- Header Gradien Emerald & Slate --}}
            <div class="bg-gradient-to-r from-emerald-800 via-emerald-900 to-slate-900 px-6 py-5 text-white flex justify-between items-center shrink-0">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-2xl bg-emerald-500/20 border border-emerald-400/30 flex items-center justify-center text-xl">
                        📝
                    </div>
                    <div>
                        <h3 class="text-lg font-black tracking-tight">Edit Legalitas & Berkas Dokumen</h3>
                        <p class="text-xs text-emerald-200 font-medium">Perbarui status legalitas & simpan tautan Google Drive berkas IKM</p>
                    </div>
                </div>
                <button type="button" @click="isModalOpen = false" class="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white font-bold text-xl transition">&times;</button>
            </div>

            <form :action="'/dukungan/legalitas/update/' + (editForm.id || '')" method="POST" class="p-6 overflow-y-auto space-y-5">
                @csrf
                
                {{-- Identitas Usaha Card --}}
                <div class="p-4 bg-emerald-50/50 border border-emerald-200/80 rounded-2xl">
                    <label class="block text-[11px] font-black text-emerald-800 uppercase tracking-wider mb-1">Nama IKM / Usaha</label>
                    <input type="text" x-model="editForm.nama_usaha" disabled class="w-full px-4 py-2.5 bg-white/80 border border-emerald-200 rounded-xl text-xs font-extrabold text-slate-800">
                </div>

                {{-- Seksi 1: NIB (Emerald Theme) --}}
                <div class="p-5 bg-gradient-to-br from-emerald-50/60 to-slate-50 border border-emerald-200 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-emerald-500"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">1. Nomor Induk Berusaha (NIB)</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nomor NIB</label>
                            <input type="text" name="nib" x-model="editForm.nib" @input="checkAutoDatabaseMatches('edit')" placeholder="Masukkan 13 digit NIB..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Dokumen NIB</label>
                            <input type="url" name="link_gdrive_nib" x-model="editForm.link_gdrive_nib" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 2: Halal (Green Theme) --}}
                <div class="p-5 bg-gradient-to-br from-emerald-50/40 to-slate-50 border border-emerald-300/80 rounded-2xl space-y-3">
                    <div class="flex flex-wrap items-center justify-between gap-2">
                        <div class="flex items-center gap-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-emerald-600"></span>
                            <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">2. Sertifikat Halal</h4>
                        </div>

                        {{-- Auto Detection Notification Badge --}}
                        <template x-if="autoHalalMatches.length > 0">
                            <span class="px-2.5 py-1 bg-emerald-100 text-emerald-800 rounded-full text-[11px] font-black animate-pulse flex items-center gap-1 border border-emerald-300">
                                ✨ Data Terdeteksi di Database Halal (<span x-text="autoHalalMatches.length"></span> Data)
                            </span>
                        </template>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status Sertifikat Halal</label>
                            <select name="status_halal" x-model="editForm.status_halal" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses</option>
                                <option value="Ada">Sudah Ada (Terbit)</option>
                            </select>
                        </div>
                        <div>
                            <div class="flex items-center justify-between mb-1">
                                <label class="block text-[11px] font-bold text-slate-700 uppercase">Nomor Sertifikat Halal</label>
                                <button type="button" @click="pullHalalData('edit')" class="text-[10px] font-extrabold text-emerald-700 hover:text-emerald-800 bg-emerald-100 hover:bg-emerald-200 px-2 py-0.5 rounded-lg transition flex items-center gap-1 cursor-pointer border border-emerald-300">
                                    🔍 Tarik Data Halal
                                </button>
                            </div>
                            <div class="flex gap-1.5">
                                <input type="text" name="no_halal" x-model="editForm.no_halal" placeholder="Ketik manual / tarik data..." class="flex-1 px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                                <button type="button" @click="pullHalalData('edit')" title="Tarik Data dari Database Halal" class="px-3.5 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-black transition flex items-center gap-1 shrink-0 shadow-sm cursor-pointer">
                                    🔍 Tarik
                                </button>
                            </div>
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Sertifikat Halal</label>
                            <input type="url" name="link_gdrive_halal" x-model="editForm.link_gdrive_halal" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 3: BPOM / CPPOB (Blue Theme) --}}
                <div class="p-5 bg-gradient-to-br from-blue-50/50 to-slate-50 border border-blue-200 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-blue-500"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">3. BPOM / CPPOB</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status BPOM / CPPOB</label>
                            <select name="status_bpom_cppob" x-model="editForm.status_bpom_cppob" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-blue-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses</option>
                                <option value="Ada">Sudah Ada (Terbit)</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nomor BPOM / CPPOB</label>
                            <input type="text" name="no_bpom_cppob" x-model="editForm.no_bpom_cppob" placeholder="Nomor izin BPOM/CPPOB..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-blue-500">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Dokumen BPOM/CPPOB</label>
                            <input type="url" name="link_gdrive_bpom_cppob" x-model="editForm.link_gdrive_bpom_cppob" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-blue-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 4: SNI (Purple Theme) --}}
                <div class="p-5 bg-gradient-to-br from-purple-50/50 to-slate-50 border border-purple-200 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-purple-500"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">4. Standar Nasional Indonesia (SNI)</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status SNI</label>
                            <select name="status_sni" x-model="editForm.status_sni" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-purple-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses</option>
                                <option value="Ada">Sudah Ada (Terbit)</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nomor SNI</label>
                            <input type="text" name="no_sni" x-model="editForm.no_sni" placeholder="Nomor dokumen SNI..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-purple-500">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Dokumen SNI</label>
                            <input type="url" name="link_gdrive_sni" x-model="editForm.link_gdrive_sni" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-purple-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 5: HKI Merek (Amber Theme) --}}
                <div class="p-5 bg-gradient-to-br from-amber-50/60 to-slate-50 border border-amber-300 rounded-2xl space-y-3">
                    <div class="flex flex-wrap items-center justify-between gap-2">
                        <div class="flex items-center gap-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-amber-500"></span>
                            <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">5. Hak Kekayaan Intelektual (HKI Merek)</h4>
                        </div>

                        {{-- Auto Detection Notification Badge --}}
                        <template x-if="autoHkiMatches.length > 0">
                            <span class="px-2.5 py-1 bg-amber-100 text-amber-800 rounded-full text-[11px] font-black animate-pulse flex items-center gap-1 border border-amber-300">
                                🏷️ Data Terdeteksi di Database HKI (<span x-text="autoHkiMatches.length"></span> Data)
                            </span>
                        </template>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status HKI Merek</label>
                            <select name="status_hki_merek" x-model="editForm.status_hki_merek" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses</option>
                                <option value="Ada">Sudah Terdaftar HKI</option>
                            </select>
                        </div>
                        <div>
                            <div class="flex items-center justify-between mb-1">
                                <label class="block text-[11px] font-bold text-slate-700 uppercase">Nomor Pendaftaran HKI</label>
                                <button type="button" @click="pullHkiData('edit')" class="text-[10px] font-extrabold text-amber-800 hover:text-amber-900 bg-amber-100 hover:bg-amber-200 px-2 py-0.5 rounded-lg transition flex items-center gap-1 cursor-pointer border border-amber-300">
                                    🔍 Tarik Data HKI
                                </button>
                            </div>
                            <div class="flex gap-1.5">
                                <input type="text" name="no_hki_merek" x-model="editForm.no_hki_merek" placeholder="Ketik manual / tarik data..." class="flex-1 px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-amber-500">
                                <button type="button" @click="pullHkiData('edit')" title="Tarik Data dari Database HKI" class="px-3.5 py-2.5 bg-amber-500 hover:bg-amber-600 text-white rounded-xl text-xs font-black transition flex items-center gap-1 shrink-0 shadow-sm cursor-pointer">
                                    🔍 Tarik
                                </button>
                            </div>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nama Merek Terdaftar</label>
                            <input type="text" name="nama_merek" x-model="editForm.nama_merek" placeholder="Masukkan nama merek..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-amber-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-amber-800 uppercase mb-1">📅 Tanggal Berakhir Sertifikat Merek</label>
                            <input type="date" name="tgl_berakhir_hki" x-model="editForm.tgl_berakhir_hki" class="w-full px-4 py-2.5 bg-white border border-amber-300 rounded-xl text-xs font-extrabold text-slate-800 outline-none focus:border-amber-500">
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Sertifikat HKI</label>
                            <input type="url" name="link_gdrive_hki_merek" x-model="editForm.link_gdrive_hki_merek" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-amber-500">
                        </div>
                    </div>
                </div>

                {{-- Seksi 6: TKDN-IK (Teal Theme) --}}
                <div class="p-5 bg-gradient-to-br from-teal-50/60 to-slate-50 border border-teal-300 rounded-2xl space-y-3">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-teal-600"></span>
                        <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">6. Tingkat Komponen Dalam Negeri (TKDN-IK)</h4>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Status Sertifikat TKDN</label>
                            <select name="status_tkdn" x-model="editForm.status_tkdn" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-teal-500">
                                <option value="Belum">Belum Ada</option>
                                <option value="Proses">Dalam Proses Pengajuan</option>
                                <option value="Ada">Sudah Ada (Terbit)</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nomor Sertifikat TKDN</label>
                            <input type="text" name="no_sertifikat_tkdn" x-model="editForm.no_sertifikat_tkdn" placeholder="Contoh: TKDN/IK/2025/08192..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-teal-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Capaian Persentase TKDN (%)</label>
                            <input type="text" name="persentase_tkdn" x-model="editForm.persentase_tkdn" placeholder="Contoh: 42.50%" class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-teal-500">
                        </div>
                        <div>
                            <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Link GDrive Sertifikat TKDN</label>
                            <input type="url" name="link_gdrive_tkdn" x-model="editForm.link_gdrive_tkdn" placeholder="https://drive.google.com/..." class="w-full px-4 py-2.5 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-teal-500">
                        </div>
                    </div>
                </div>

                <div class="flex justify-end gap-3 pt-4 border-t border-slate-100 shrink-0">
                    <button type="button" @click="isModalOpen = false" class="px-5 py-2.5 border border-slate-200 text-slate-600 rounded-xl text-xs font-bold hover:bg-slate-50">
                        Batal
                    </button>
                    <button type="submit" class="px-6 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-extrabold transition shadow-md">
                        Simpan Perubahan
                    </button>
                </div>
            </form>
        </div>
    </div>

    {{-- MODAL PILIHAN HALAL BILA DITEMUKAN BANYAK MATCHES (>1 DATA) --}}
    <div x-show="isHalalSelectModalOpen" x-cloak class="fixed inset-0 z-[80] overflow-y-auto bg-slate-900/80 backdrop-blur-md flex items-center justify-center p-4">
        <div @click.away="isHalalSelectModalOpen = false" class="bg-white rounded-[36px] max-w-2xl w-full overflow-hidden shadow-2xl border-2 border-emerald-300 flex flex-col max-h-[85vh]">
            <div class="bg-gradient-to-r from-emerald-600 via-teal-600 to-cyan-600 p-5 text-white flex items-center justify-between shrink-0">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-2xl bg-white/20 flex items-center justify-center text-xl">✨</div>
                    <div>
                        <h4 class="font-black text-base uppercase tracking-tight">Pilih Data Sertifikat Halal</h4>
                        <p class="text-xs text-white/90 font-medium">Ditemukan <span class="font-black" x-text="autoHalalMatches.length"></span> data Sertifikat Halal di database.</p>
                    </div>
                </div>
                <button type="button" @click="isHalalSelectModalOpen = false" class="text-white text-xl font-bold cursor-pointer">✕</button>
            </div>

            <div class="p-6 overflow-y-auto space-y-4">
                <p class="text-xs font-bold text-slate-600">Klik tombol <span class="text-emerald-700">"Pilih Data Ini"</span> pada salah satu opsi untuk menerapkan data sertifikat ke form legalitas:</p>
                
                <template x-for="(hItem, index) in autoHalalMatches" :key="index">
                    <div class="p-4 bg-slate-50 border border-slate-200 rounded-2xl flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 hover:border-emerald-400 transition">
                        <div class="space-y-1">
                            <div class="flex items-center gap-2">
                                <span class="font-black text-slate-900 text-sm" x-text="hItem.nama_pu"></span>
                                <span class="px-2 py-0.5 bg-emerald-100 text-emerald-800 rounded-md text-[10px] font-extrabold" x-text="hItem.status || 'Terbit'"></span>
                            </div>
                            <p class="text-xs text-emerald-700 font-bold">🟢 Merk: <span x-text="hItem.merk_dagang || '-'"></span></p>
                            <p class="text-[11px] text-slate-600 font-mono">No Sertifikat: <span class="font-bold text-slate-800" x-text="hItem.no_sertifikat || hItem.no_daftar || '-'"></span></p>
                            <p class="text-[10px] text-slate-400 font-medium">NIK: <span x-text="hItem.nik || '-'"></span> • NIB: <span x-text="hItem.nib || '-'"></span></p>
                        </div>
                        <button type="button" @click.stop="applyHalalRecord(hItem)" class="px-4 py-2.5 bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 text-white rounded-xl text-xs font-black shadow-sm shrink-0 cursor-pointer">
                            Pilih Data Ini 🚀
                        </button>
                    </div>
                </template>
            </div>
        </div>
    </div>

    {{-- MODAL PILIHAN HKI MEREK BILA DITEMUKAN BANYAK MATCHES (>1 DATA) --}}
    <div x-show="isHkiSelectModalOpen" x-cloak class="fixed inset-0 z-[80] overflow-y-auto bg-slate-900/80 backdrop-blur-md flex items-center justify-center p-4">
        <div @click.away="isHkiSelectModalOpen = false" class="bg-white rounded-[36px] max-w-2xl w-full overflow-hidden shadow-2xl border-2 border-amber-300 flex flex-col max-h-[85vh]">
            <div class="bg-gradient-to-r from-amber-500 via-orange-500 to-amber-600 p-5 text-white flex items-center justify-between shrink-0">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-2xl bg-white/20 flex items-center justify-center text-xl">🏷️</div>
                    <div>
                        <h4 class="font-black text-base uppercase tracking-tight">Pilih Data HKI Merek</h4>
                        <p class="text-xs text-white/90 font-medium">Ditemukan <span class="font-black" x-text="autoHkiMatches.length"></span> data HKI Merek di database.</p>
                    </div>
                </div>
                <button type="button" @click="isHkiSelectModalOpen = false" class="text-white text-xl font-bold cursor-pointer">✕</button>
            </div>

            <div class="p-6 overflow-y-auto space-y-4">
                <p class="text-xs font-bold text-slate-600">Klik tombol <span class="text-amber-700">"Pilih Data Ini"</span> pada salah satu opsi untuk menerapkan data HKI Merek ke form legalitas:</p>
                
                <template x-for="(kItem, index) in autoHkiMatches" :key="index">
                    <div class="p-4 bg-slate-50 border border-slate-200 rounded-2xl flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 hover:border-amber-400 transition">
                        <div class="space-y-1">
                            <div class="flex items-center gap-2">
                                <span class="font-black text-slate-900 text-sm" x-text="kItem.merek"></span>
                                <span class="px-2 py-0.5 bg-amber-100 text-amber-800 rounded-md text-[10px] font-extrabold" x-text="kItem.status_permohonan_merek || '(TM) Didaftar'"></span>
                            </div>
                            <p class="text-xs text-amber-800 font-bold">🏷️ Kelas: <span x-text="kItem.kelas || '-'"></span> • Tipe: <span x-text="kItem.tipe_permohonan || 'Merek Dagang'"></span></p>
                            <p class="text-[11px] text-slate-600 font-mono">No. Permohonan: <span class="font-bold text-slate-800" x-text="kItem.nomor_permohonan || kItem.nomor_transaksi || '-'"></span></p>
                            <p class="text-[10px] text-slate-400 font-medium">NIK: <span x-text="kItem.nik || '-'"></span> • NIB: <span x-text="kItem.nib || '-'"></span></p>
                        </div>
                        <button type="button" @click.stop="applyHkiRecord(kItem)" class="px-4 py-2.5 bg-gradient-to-r from-amber-500 to-orange-500 hover:from-amber-600 hover:to-orange-600 text-white rounded-xl text-xs font-black shadow-sm shrink-0 cursor-pointer">
                            Pilih Data Ini 🚀
                        </button>
                    </div>
                </template>
            </div>
        </div>
    </div>
</div>

<script>
function legalitasManager() {
    return {
        isModalOpen: false,
        isAddModalOpen: false,
        isExpiryModalOpen: false,
        isDeleteModalOpen: false,
        deleteItem: {},
        isDeletingCountdown: false,
        deleteCountdown: 3,
        addMode: 'manual',
        searchNibNik: '',
        isSearching: false,
        searchMessage: '',
        searchSuccess: false,

        // Auto Database Matching & Choice State
        autoHalalMatches: [],
        autoHkiMatches: [],
        isHalalSelectModalOpen: false,
        isHkiSelectModalOpen: false,
        currentActiveModalType: 'add',

        addForm: {
            ikm_id: '',
            nama_usaha: '',
            pemilik: '',
            nik: '',
            no_hp: '',
            kecamatan: 'Manguharjo',
            kelurahan: '',
            nib: '',
            link_gdrive_nib: '',
            status_halal: 'Belum',
            no_halal: '',
            link_gdrive_halal: '',
            status_bpom_cppob: 'Belum',
            no_bpom_cppob: '',
            link_gdrive_bpom_cppob: '',
            status_sni: 'Belum',
            no_sni: '',
            link_gdrive_sni: '',
            status_hki_merek: 'Belum',
            no_hki_merek: '',
            nama_merek: '',
            tgl_berakhir_hki: '',
            link_gdrive_hki_merek: '',
            status_tkdn: 'Belum',
            no_sertifikat_tkdn: '',
            persentase_tkdn: '',
            link_gdrive_tkdn: ''
        },
        editForm: {
            id: '',
            nama_usaha: '',
            nib: '',
            link_gdrive_nib: '',
            status_halal: 'Belum',
            no_halal: '',
            link_gdrive_halal: '',
            status_bpom_cppob: 'Belum',
            no_bpom_cppob: '',
            link_gdrive_bpom_cppob: '',
            status_sni: 'Belum',
            no_sni: '',
            link_gdrive_sni: '',
            status_hki_merek: 'Belum',
            no_hki_merek: '',
            nama_merek: '',
            tgl_berakhir_hki: '',
            link_gdrive_hki_merek: '',
            status_tkdn: 'Belum',
            no_sertifikat_tkdn: '',
            persentase_tkdn: '',
            link_gdrive_tkdn: ''
        },

        resetAddForm() {
            this.addMode = 'manual';
            this.searchNibNik = '';
            this.searchMessage = '';
            this.searchSuccess = false;
            this.autoHalalMatches = [];
            this.autoHkiMatches = [];
            this.addForm = {
                ikm_id: '',
                nama_usaha: '',
                pemilik: '',
                nik: '',
                no_hp: '',
                kecamatan: 'Manguharjo',
                kelurahan: '',
                nib: '',
                link_gdrive_nib: '',
                status_halal: 'Belum',
                no_halal: '',
                link_gdrive_halal: '',
                status_bpom_cppob: 'Belum',
                no_bpom_cppob: '',
                link_gdrive_bpom_cppob: '',
                status_sni: 'Belum',
                no_sni: '',
                link_gdrive_sni: '',
                status_hki_merek: 'Belum',
                no_hki_merek: '',
                nama_merek: '',
                tgl_berakhir_hki: '',
                link_gdrive_hki_merek: '',
                status_tkdn: 'Belum',
                no_sertifikat_tkdn: '',
                persentase_tkdn: '',
                link_gdrive_tkdn: ''
            };
        },

        checkAutoDatabaseMatches(modalType) {
            this.currentActiveModalType = modalType;
            const form = modalType === 'add' ? this.addForm : this.editForm;
            const nik = form.nik || '';
            const nib = form.nib || '';
            const name = form.nama_usaha || form.pemilik || '';

            if (!nik && !nib && !name) {
                this.autoHalalMatches = [];
                this.autoHkiMatches = [];
                return;
            }

            fetch(`/dukungan/legalitas/search-database-auto?nik=${encodeURIComponent(nik)}&nib=${encodeURIComponent(nib)}&query=${encodeURIComponent(name)}`)
                .then(res => res.json())
                .then(res => {
                    if (res.success) {
                        this.autoHalalMatches = res.halal_matches || [];
                        this.autoHkiMatches = res.hki_matches || [];
                    }
                })
                .catch(() => {});
        },

        pullHalalData(modalType) {
            this.currentActiveModalType = modalType;
            const form = modalType === 'add' ? this.addForm : this.editForm;
            const nik = form.nik || '';
            const nib = form.nib || '';
            const name = form.nama_usaha || form.pemilik || '';

            fetch(`/dukungan/legalitas/search-database-auto?nik=${encodeURIComponent(nik)}&nib=${encodeURIComponent(nib)}&query=${encodeURIComponent(name)}`)
                .then(res => res.json())
                .then(res => {
                    if (res.success && res.halal_matches && res.halal_matches.length > 0) {
                        this.autoHalalMatches = res.halal_matches;
                        if (res.halal_matches.length === 1) {
                            this.applyHalalRecord(res.halal_matches[0]);
                            Swal.fire({
                                icon: 'success',
                                title: 'Data Halal Berhasil Ditarik!',
                                text: `Nomor Sertifikat "${res.halal_matches[0].no_sertifikat || res.halal_matches[0].no_daftar}" otomatis terisi.`,
                                timer: 2000,
                                showConfirmButton: false
                            });
                        } else {
                            this.isHalalSelectModalOpen = true;
                        }
                    } else {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Data Halal Tidak Ditemukan',
                            text: 'Tidak ada data Sertifikat Halal yang cocok di database http://localhost:8000/dukungan/legalitas/database?tab=halal untuk NIK/NIB/Nama Usaha ini.'
                        });
                    }
                })
                .catch(() => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal Memuat Data',
                        text: 'Terjadi kesalahan saat menghubungi server database.'
                    });
                });
        },

        applyHalalRecord(record) {
            const form = this.currentActiveModalType === 'add' ? this.addForm : this.editForm;
            form.status_halal = 'Ada';
            form.no_halal = record.no_sertifikat || record.no_daftar || '';
            if (record.link_sertifikat_halal && record.link_sertifikat_halal !== '-') {
                form.link_gdrive_halal = record.link_sertifikat_halal;
            }
            this.isHalalSelectModalOpen = false;
            Swal.fire({
                icon: 'success',
                title: 'Data Halal Diterapkan!',
                text: `Nomor Sertifikat "${form.no_halal}" otomatis terisi ke dalam form. Silakan periksa & simpan data.`,
                timer: 2200,
                showConfirmButton: false
            });
        },

        pullHkiData(modalType) {
            this.currentActiveModalType = modalType;
            const form = modalType === 'add' ? this.addForm : this.editForm;
            const nik = form.nik || '';
            const nib = form.nib || '';
            const name = form.nama_usaha || form.pemilik || '';

            fetch(`/dukungan/legalitas/search-database-auto?nik=${encodeURIComponent(nik)}&nib=${encodeURIComponent(nib)}&query=${encodeURIComponent(name)}`)
                .then(res => res.json())
                .then(res => {
                    if (res.success && res.hki_matches && res.hki_matches.length > 0) {
                        this.autoHkiMatches = res.hki_matches;
                        if (res.hki_matches.length === 1) {
                            this.applyHkiRecord(res.hki_matches[0]);
                        } else {
                            this.isHkiSelectModalOpen = true;
                        }
                    } else {
                        Swal.fire({
                            icon: 'warning',
                            title: 'Data HKI Merek Tidak Ditemukan',
                            text: 'Tidak ada data HKI Merek yang cocok di database http://localhost:8000/dukungan/legalitas/database untuk NIK/NIB/Nama Usaha ini.'
                        });
                    }
                })
                .catch(() => {
                    Swal.fire({
                        icon: 'error',
                        title: 'Gagal Memuat Data',
                        text: 'Terjadi kesalahan saat menghubungi server database.'
                    });
                });
        },

        applyHkiRecord(record) {
            const form = this.currentActiveModalType === 'add' ? this.addForm : this.editForm;
            form.status_hki_merek = 'Ada';
            form.no_hki_merek = record.nomor_permohonan || record.nomor_transaksi || '';
            form.nama_merek = record.merek || form.nama_usaha || '';
            if (record.link_sertifikat_merek && record.link_sertifikat_merek !== '-') {
                form.link_gdrive_hki_merek = record.link_sertifikat_merek;
            } else if (record.link_tanda_daftar && record.link_tanda_daftar !== '-') {
                form.link_gdrive_hki_merek = record.link_tanda_daftar;
            }
            this.isHkiSelectModalOpen = false;
            Swal.fire({
                icon: 'success',
                title: 'Data HKI Merek Diterapkan!',
                text: `Merek "${form.nama_merek}" & Nomor HKI "${form.no_hki_merek}" otomatis terisi ke dalam form. Silakan periksa & simpan data.`,
                timer: 2200,
                showConfirmButton: false
            });
        },

        searchIkmByNibNik() {
            if (!this.searchNibNik) return;
            this.isSearching = true;
            this.searchMessage = '';
            this.searchSuccess = false;
            fetch('/dukungan/legalitas/find-ikm?query=' + encodeURIComponent(this.searchNibNik))
                .then(res => res.json())
                .then(res => {
                    this.isSearching = false;
                    if (res.success && res.data) {
                        const item = res.data;
                        this.addForm = {
                            ikm_id: item.id || '',
                            nama_usaha: item.nama_usaha || '',
                            pemilik: item.pemilik || '',
                            nik: item.nik || '',
                            no_hp: item.no_hp || '',
                            kecamatan: item.kecamatan || 'Manguharjo',
                            kelurahan: item.kelurahan || '',
                            nib: item.nib || '',
                            link_gdrive_nib: item.link_gdrive_nib || '',
                            status_halal: item.status_halal || 'Belum',
                            no_halal: item.no_halal || '',
                            link_gdrive_halal: item.link_gdrive_halal || '',
                            status_bpom_cppob: item.status_bpom_cppob || 'Belum',
                            no_bpom_cppob: item.no_bpom_cppob || '',
                            link_gdrive_bpom_cppob: item.link_gdrive_bpom_cppob || '',
                            status_sni: item.status_sni || 'Belum',
                            no_sni: item.no_sni || '',
                            link_gdrive_sni: item.link_gdrive_sni || '',
                            status_hki_merek: item.status_hki_merek || 'Belum',
                            no_hki_merek: item.no_hki_merek || '',
                            nama_merek: item.nama_merek || item.nama_usaha || '',
                            tgl_berakhir_hki: item.tgl_berakhir_hki || '',
                            link_gdrive_hki_merek: item.link_gdrive_hki_merek || '',
                            status_tkdn: item.status_tkdn || 'Belum',
                            no_sertifikat_tkdn: item.no_sertifikat_tkdn || '',
                            persentase_tkdn: item.persentase_tkdn || '',
                            link_gdrive_tkdn: item.link_gdrive_tkdn || ''
                        };
                        this.searchSuccess = true;
                        this.searchMessage = '✅ Data IKM "' + item.nama_usaha + '" ditemukan! Profil & legalitas terisi otomatis.';
                        this.checkAutoDatabaseMatches('add');
                    } else {
                        this.searchSuccess = false;
                        this.searchMessage = '⚠️ ' + (res.message || 'Data IKM tidak ditemukan.');
                    }
                })
                .catch(err => {
                    this.isSearching = false;
                    this.searchSuccess = false;
                    this.searchMessage = '⚠️ Terjadi kesalahan saat mencari data.';
                });
        },
        openModal(item) {
            this.editForm = {
                id: item.id || '',
                nama_usaha: item.nama_usaha || '',
                nib: item.nib || '',
                link_gdrive_nib: item.link_gdrive_nib || '',
                status_halal: item.status_halal || 'Belum',
                no_halal: item.no_halal || '',
                link_gdrive_halal: item.link_gdrive_halal || '',
                status_bpom_cppob: item.status_bpom_cppob || 'Belum',
                no_bpom_cppob: item.no_bpom_cppob || '',
                link_gdrive_bpom_cppob: item.link_gdrive_bpom_cppob || '',
                status_sni: item.status_sni || 'Belum',
                no_sni: item.no_sni || '',
                link_gdrive_sni: item.link_gdrive_sni || '',
                status_hki_merek: item.status_hki_merek || 'Belum',
                no_hki_merek: item.no_hki_merek || '',
                nama_merek: item.nama_merek || item.nama_usaha || '',
                tgl_berakhir_hki: item.tgl_berakhir_hki || '',
                link_gdrive_hki_merek: item.link_gdrive_hki_merek || '',
                status_tkdn: item.status_tkdn || 'Belum',
                no_sertifikat_tkdn: item.no_sertifikat_tkdn || '',
                persentase_tkdn: item.persentase_tkdn || '',
                link_gdrive_tkdn: item.link_gdrive_tkdn || ''
            };
            this.isModalOpen = true;
            this.checkAutoDatabaseMatches('edit');
        },
        openDeleteModal(item) {
            this.deleteItem = item;
            this.isDeletingCountdown = false;
            this.deleteCountdown = 3;
            this.isDeleteModalOpen = true;
        },
        startDeleteCountdown() {
            this.isDeletingCountdown = true;
            this.deleteCountdown = 3;
            const timer = setInterval(() => {
                this.deleteCountdown--;
                if (this.deleteCountdown <= 0) {
                    clearInterval(timer);
                    document.getElementById('delete-form').submit();
                }
            }, 1000);
        }
    };
}
</script>

@endsection
