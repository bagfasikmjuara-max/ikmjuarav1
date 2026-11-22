@extends('layouts.dukungan')

@section('title', 'Database Legalitas IKM (HKI Merek & Sertifikat Halal)')
@section('hide_header_title', true)

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div x-data="legalitasDatabaseApp()" class="space-y-8">
    {{-- Header Top Bar --}}
    <div class="flex flex-col lg:flex-row justify-between items-start lg:items-center gap-4">
        <div>
            <div class="flex items-center gap-2 mb-1">
                <a href="{{ route('dukungan.legalitas.index') }}" class="text-xs font-bold text-emerald-600 hover:text-emerald-700 flex items-center gap-1 transition">
                    <i class="bi bi-arrow-left"></i> Kembali ke Tracker Legalitas
                </a>
            </div>
            <h2 class="text-3xl font-black text-slate-800 tracking-tighter uppercase">
                DATABASE <span class="text-transparent bg-clip-text bg-gradient-to-r from-emerald-600 via-teal-500 to-cyan-600">LEGALITAS IKM</span>
            </h2>
            <p class="text-slate-400 font-medium mt-1 text-sm">
                Rekapitulasi database independen HKI Merek dan Sertifikat Halal IKM Kota Madiun.
            </p>
        </div>
        
        <div class="flex flex-wrap items-center gap-2 sm:gap-2.5">
            {{-- Download Template Excel --}}
            <a href="{{ route('dukungan.legalitas.database.template', ['tab' => $activeTab]) }}" 
               class="h-11 px-4.5 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-2xl text-xs font-black transition flex items-center justify-center gap-2 shadow-sm border border-slate-200/60 cursor-pointer whitespace-nowrap">
                <span>📄 Template Excel (.xlsx)</span>
            </a>

            {{-- Export Excel --}}
            <a href="{{ route('dukungan.legalitas.database.export', ['tab' => $activeTab, 'search' => request('search')]) }}" 
               class="h-11 px-4.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-black transition flex items-center justify-center gap-2 shadow-sm shadow-emerald-600/20 cursor-pointer whitespace-nowrap">
                <span>📥 Export Excel (.xlsx)</span>
            </a>

            {{-- Unggah Data Massal --}}
            <button type="button" 
                    @click="isImportModalOpen = true" 
                    class="h-11 px-4.5 bg-slate-800 hover:bg-slate-900 text-white rounded-2xl text-xs font-black transition flex items-center justify-center gap-2 shadow-sm cursor-pointer whitespace-nowrap">
                <span>📤 Unggah Data Massal</span>
            </button>

            {{-- Pop-up Input Data Baru --}}
            <button type="button" 
                    @click="openCreateModal()" 
                    class="h-11 px-4.5 rounded-2xl font-black text-xs transition-all shadow-md flex items-center justify-center gap-2 cursor-pointer transform hover:-translate-y-0.5 active:translate-y-0 whitespace-nowrap {{ $activeTab === 'hki' ? 'bg-gradient-to-r from-amber-500 via-orange-500 to-amber-600 text-white shadow-orange-500/25 ring-2 ring-amber-400/30' : 'bg-gradient-to-r from-emerald-600 via-teal-500 to-cyan-600 text-white shadow-emerald-600/25 ring-2 ring-emerald-400/30' }}">
                <span>{{ $activeTab === 'hki' ? '🏷️' : '✨' }}</span>
                <span>➕ Input Data {{ $activeTab === 'hki' ? 'HKI Merek' : 'Sertifikat Halal' }} Baru</span>
            </button>
        </div>
    </div>

    @if(session('success'))
        <div id="success-alert" class="bg-emerald-50 border border-emerald-200 text-emerald-700 px-6 py-4 rounded-2xl font-bold text-sm shadow-sm flex items-center justify-between">
            <div class="flex items-center gap-2">
                <span class="text-xl">🎉</span>
                <span>{{ session('success') }}</span>
            </div>
            <button onclick="document.getElementById('success-alert').remove()" class="text-emerald-500 hover:text-emerald-800 text-xs font-bold cursor-pointer">✕</button>
        </div>
    @endif

    @if(session('error'))
        <div id="error-alert" class="bg-rose-50 border border-rose-200 text-rose-700 px-6 py-4 rounded-2xl font-bold text-sm shadow-sm flex items-center justify-between">
            <div class="flex items-center gap-2">
                <span class="text-xl">⚠️</span>
                <span>{{ session('error') }}</span>
            </div>
            <button onclick="document.getElementById('error-alert').remove()" class="text-rose-500 hover:text-rose-800 text-xs font-bold cursor-pointer">✕</button>
        </div>
    @endif

    {{-- Laporan Hasil Import Massal (Bila Ada) --}}
    @if(session('import_result'))
        @php $res = session('import_result'); @endphp
        <div class="bg-white rounded-3xl border-2 border-slate-200 p-6 shadow-xl space-y-4 animate-fade-in">
            <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3 border-b border-slate-100 pb-4">
                <div class="flex items-center gap-3">
                    <div class="w-12 h-12 rounded-2xl bg-gradient-to-tr from-slate-800 to-slate-900 text-white flex items-center justify-center text-xl shadow-md">
                        📊
                    </div>
                    <div>
                        <h4 class="text-base font-black text-slate-900 uppercase tracking-tight">
                            Laporan Hasil Import Data Massal ({{ $res['tab'] === 'hki' ? 'HKI Merek' : 'Sertifikat Halal' }})
                        </h4>
                        <p class="text-xs text-slate-500 font-medium">Ringkasan hasil import dan pemeriksaan duplikasi data sistem.</p>
                    </div>
                </div>
                <div class="flex items-center gap-2">
                    <span class="px-3.5 py-1.5 bg-emerald-100 text-emerald-800 font-black text-xs rounded-xl border border-emerald-200">
                        🟢 {{ $res['success_count'] }} Berhasil Diimport
                    </span>
                    @if($res['rejected_count'] > 0)
                        <span class="px-3.5 py-1.5 bg-rose-100 text-rose-800 font-black text-xs rounded-xl border border-rose-200">
                            🔴 {{ $res['rejected_count'] }} Ditolak (Duplikasi)
                        </span>
                    @endif
                </div>
            </div>

            @if($res['rejected_count'] > 0)
                <div class="space-y-3">
                    <h5 class="text-xs font-black uppercase text-rose-600 flex items-center gap-1.5">
                        <span>⚠️ Rincian {{ $res['rejected_count'] }} Data Ditolak Karena Duplikasi Nomor Permohonan / Sertifikat:</span>
                    </h5>
                    <div class="overflow-x-auto rounded-2xl border border-rose-200 bg-rose-50/40 max-h-60 overflow-y-auto">
                        <table class="w-full text-left text-xs font-medium border-collapse">
                            <thead>
                                <tr class="bg-rose-600 text-white font-extrabold text-[11px] uppercase sticky top-0">
                                    <th class="py-2.5 px-4 w-20 text-center">Baris Excel</th>
                                    <th class="py-2.5 px-4">Identitas / No Permohonan</th>
                                    <th class="py-2.5 px-4">Keterangan Penolakan</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-rose-200/60 text-slate-700">
                                @foreach($res['rejected_list'] as $rej)
                                    <tr class="hover:bg-rose-100/50 transition-colors">
                                        <td class="py-2.5 px-4 text-center font-black text-rose-700">Baris #{{ $rej['row'] }}</td>
                                        <td class="py-2.5 px-4 font-black text-slate-900">{{ $rej['identifier'] }}</td>
                                        <td class="py-2.5 px-4 text-rose-700 font-semibold">{{ $rej['reason'] }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <p class="text-[11px] text-slate-500 font-medium italic">
                        💡 Catatan: Data Excel yang tidak memiliki duplikasi nomor permohonan telah **BERHASIL 100% diimport** ke dalam tabel database.
                    </p>
                </div>
            @endif
        </div>
    @endif

    {{-- Sub Menu Navigation Pills --}}
    <div class="flex flex-wrap items-center justify-between gap-4 border-b border-slate-200 pb-4">
        <div class="flex flex-wrap items-center gap-3">
            <a href="{{ route('dukungan.legalitas.database', array_merge(request()->query(), ['tab' => 'hki'])) }}" 
               class="px-6 py-3.5 rounded-2xl font-black text-xs transition flex items-center gap-3 shadow-sm cursor-pointer {{ $activeTab === 'hki' ? 'bg-gradient-to-r from-amber-500 to-orange-500 text-white shadow-orange-500/25 ring-2 ring-amber-400/50' : 'bg-white text-slate-600 hover:bg-slate-100 border border-slate-200' }}">
                <span class="text-lg">🏷️</span>
                <span>Database HKI Merek</span>
                <span class="ml-1 px-2.5 py-0.5 rounded-full text-[11px] font-black {{ $activeTab === 'hki' ? 'bg-white/20 text-white' : 'bg-slate-100 text-slate-600' }}">
                    {{ number_format($countHkiTotal) }}
                </span>
            </a>

            <a href="{{ route('dukungan.legalitas.database', array_merge(request()->query(), ['tab' => 'halal'])) }}" 
               class="px-6 py-3.5 rounded-2xl font-black text-xs transition flex items-center gap-3 shadow-sm cursor-pointer {{ $activeTab === 'halal' ? 'bg-gradient-to-r from-emerald-600 to-teal-600 text-white shadow-emerald-600/25 ring-2 ring-emerald-400/50' : 'bg-white text-slate-600 hover:bg-slate-100 border border-slate-200' }}">
                <span class="text-lg">🟢</span>
                <span>Database Sertifikat Halal</span>
                <span class="ml-1 px-2.5 py-0.5 rounded-full text-[11px] font-black {{ $activeTab === 'halal' ? 'bg-white/20 text-white' : 'bg-slate-100 text-slate-600' }}">
                    {{ number_format($countHalalTotal) }}
                </span>
            </a>
        </div>
    </div>

    {{-- Filter & Search Bar Card --}}
    <div class="bg-white rounded-[32px] border border-slate-200 p-6 shadow-sm space-y-6">
        <form method="GET" action="{{ route('dukungan.legalitas.database') }}" class="flex flex-col md:flex-row gap-4 justify-between items-stretch md:items-center">
            <input type="hidden" name="tab" value="{{ $activeTab }}">
            
            <div class="flex items-center gap-2">
                <span class="text-xs font-bold text-slate-500 uppercase tracking-wider">Menampilkan Tabel:</span>
                <span class="px-3 py-1 bg-slate-100 rounded-lg text-xs font-black text-slate-800 uppercase">
                    {{ $activeTab === 'halal' ? 'Database Halal' : 'Database HKI Merek' }}
                </span>
            </div>

            <div class="flex flex-col sm:flex-row flex-wrap gap-2 shrink-0">
                <div class="relative min-w-[280px]">
                    <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari NIK / NIB / Merek / Nama..." class="w-full pl-9 pr-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500">
                    <svg class="w-4 h-4 text-slate-400 absolute left-3 top-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </div>
                <button type="submit" class="px-4 py-2.5 bg-slate-800 hover:bg-slate-900 text-white rounded-xl text-xs font-bold transition shadow-sm cursor-pointer">
                    Cari
                </button>
                @if(request('search'))
                    <a href="{{ route('dukungan.legalitas.database', ['tab' => $activeTab]) }}" class="px-4 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-xl text-xs font-bold transition">
                        Reset
                    </a>
                @endif
            </div>
        </form>

        {{-- TAB 1: DATABASE HKI MEREK TABLE --}}
        @if($activeTab === 'hki')
        <div class="overflow-x-auto rounded-2xl border border-slate-200">
            <table class="w-full text-left border-collapse min-w-[1200px]">
                <thead>
                    <tr class="bg-slate-900 text-white text-[11px] font-black uppercase tracking-wider">
                        <th class="py-4 px-3 text-center w-12 border-b border-slate-800">No.</th>
                        <th class="py-4 px-4 border-b border-slate-800">NIK (16 Digit)</th>
                        <th class="py-4 px-4 border-b border-slate-800">NIB (13 Digit)</th>
                        <th class="py-4 px-4 border-b border-slate-800">Nomor Transaksi</th>
                        <th class="py-4 px-4 border-b border-slate-800">Merek</th>
                        <th class="py-4 px-3 text-center border-b border-slate-800">Kelas</th>
                        <th class="py-4 px-4 border-b border-slate-800">Nomor Permohonan</th>
                        <th class="py-4 px-4 border-b border-slate-800">Link File Tanda Daftar</th>
                        <th class="py-4 px-4 border-b border-slate-800">Tipe Permohonan</th>
                        <th class="py-4 px-4 border-b border-slate-800">Status Permohonan Merek</th>
                        <th class="py-4 px-4 border-b border-slate-800">Link File Sertifikat Merek</th>
                        <th class="py-4 px-3 text-center border-b border-slate-800">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-200 text-xs font-medium text-slate-700">
                    @forelse($items as $index => $item)
                        <tr class="hover:bg-amber-50/30 transition-colors">
                            <td class="py-4 px-3 text-center font-bold text-slate-400">
                                {{ $items->firstItem() + $index }}
                            </td>
                            <td class="py-4 px-4 font-semibold text-slate-800">
                                {{ $item->nik ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-semibold text-slate-800">
                                {{ $item->nib ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-mono">
                                {{ $item->nomor_transaksi ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-black text-slate-900">
                                {{ $item->merek }}
                            </td>
                            <td class="py-4 px-3 text-center font-bold text-amber-700">
                                {{ $item->kelas ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-mono font-semibold text-slate-800">
                                {{ $item->nomor_permohonan ?: '-' }}
                            </td>
                            <td class="py-4 px-4">
                                @if(!empty($item->link_tanda_daftar) && $item->link_tanda_daftar !== '-')
                                    <a href="{{ $item->link_tanda_daftar }}" target="_blank" class="inline-flex items-center gap-1 px-2.5 py-1 bg-amber-50 text-amber-700 border border-amber-200 rounded-lg text-[11px] font-bold hover:bg-amber-100 transition">
                                        <i class="bi bi-file-earmark-pdf"></i> Tanda Daftar
                                    </a>
                                @else
                                    <span class="text-slate-400 italic text-[11px]">Belum Ada</span>
                                @endif
                            </td>
                            <td class="py-4 px-4 font-semibold text-slate-700">
                                {{ $item->tipe_permohonan ?: 'Merek Dagang' }}
                            </td>
                            <td class="py-4 px-4">
                                <span class="px-2.5 py-1 bg-amber-100 text-amber-800 rounded-lg text-[11px] font-extrabold">
                                    {{ $item->status_permohonan_merek ?: '(TM) Didaftar' }}
                                </span>
                            </td>
                            <td class="py-4 px-4">
                                @if(!empty($item->link_sertifikat_merek) && $item->link_sertifikat_merek !== '-')
                                    <a href="{{ $item->link_sertifikat_merek }}" target="_blank" class="inline-flex items-center gap-1 px-2.5 py-1 bg-blue-50 text-blue-700 border border-blue-200 rounded-lg text-[11px] font-bold hover:bg-blue-100 transition">
                                        <i class="bi bi-file-earmark-text"></i> Sertifikat Merek
                                    </a>
                                @else
                                    <span class="text-slate-400 italic text-[11px]">Belum Ada</span>
                                @endif
                            </td>
                            <td class="py-4 px-3 text-center">
                                <div class="flex items-center justify-center gap-1.5">
                                    <button type="button" @click="openEditModal({{ json_encode($item) }})" class="px-3 py-1.5 bg-amber-50 hover:bg-amber-500 hover:text-white text-amber-700 border border-amber-200 rounded-xl font-bold transition shadow-sm cursor-pointer flex items-center gap-1">
                                        ✏️ Edit
                                    </button>
                                    <button type="button" @click="confirmDelete('hki', {{ $item->id }}, {{ json_encode($item->merek) }})" class="px-3 py-1.5 bg-rose-50 hover:bg-rose-600 hover:text-white text-rose-600 border border-rose-200 rounded-xl font-bold transition shadow-sm cursor-pointer flex items-center gap-1">
                                        🗑️ Hapus
                                    </button>
                                </div>
                                <form id="deleteForm_hki_{{ $item->id }}" action="{{ route('dukungan.legalitas.database.hki.destroy', $item->id) }}" method="POST" class="hidden">
                                    @csrf
                                    @method('DELETE')
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="12" class="py-16 text-center text-slate-400 font-bold">
                                <div class="flex flex-col items-center justify-center gap-2">
                                    <span class="text-4xl animate-bounce">🏷️</span>
                                    <span class="text-sm font-black text-slate-600">Tabel Database HKI Merek Masih Kosong</span>
                                    <span class="text-xs font-normal text-slate-400 max-w-sm">Klik tombol "➕ Input Data HKI Merek Baru" atau "📤 Unggah Data Massal" di atas untuk memasukkan data!</span>
                                </div>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        @endif

        {{-- TAB 2: DATABASE SERTIFIKAT HALAL TABLE --}}
        @if($activeTab === 'halal')
        <div class="overflow-x-auto rounded-2xl border border-slate-200">
            <table class="w-full text-left border-collapse min-w-[1400px]">
                <thead>
                    <tr class="bg-slate-900 text-white text-[11px] font-black uppercase tracking-wider">
                        <th class="py-4 px-3 text-center w-12 border-b border-slate-800">No</th>
                        <th class="py-4 px-4 border-b border-slate-800">NIK (16 Digit)</th>
                        <th class="py-4 px-4 border-b border-slate-800">NIB (13 Digit)</th>
                        <th class="py-4 px-4 border-b border-slate-800">No Daftar</th>
                        <th class="py-4 px-4 border-b border-slate-800">Nama PU</th>
                        <th class="py-4 px-4 border-b border-slate-800">Merk Dagang</th>
                        <th class="py-4 px-4 border-b border-slate-800">Tanggal Daftar</th>
                        <th class="py-4 px-4 border-b border-slate-800">Status</th>
                        <th class="py-4 px-4 border-b border-slate-800">Tanggal Sertifikat</th>
                        <th class="py-4 px-4 border-b border-slate-800">No Sertifikat</th>
                        <th class="py-4 px-4 border-b border-slate-800">Nama Fasilitator</th>
                        <th class="py-4 px-4 border-b border-slate-800">Jenis Produk</th>
                        <th class="py-4 px-4 border-b border-slate-800">Link Sertifikat Halal</th>
                        <th class="py-4 px-3 text-center border-b border-slate-800">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-200 text-xs font-medium text-slate-700">
                    @forelse($items as $index => $item)
                        <tr class="hover:bg-emerald-50/30 transition-colors">
                            <td class="py-4 px-3 text-center font-bold text-slate-400">
                                {{ $items->firstItem() + $index }}
                            </td>
                            <td class="py-4 px-4 font-semibold text-slate-800">
                                {{ $item->nik ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-semibold text-slate-800">
                                {{ $item->nib ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-mono font-semibold">
                                {{ $item->no_daftar ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-extrabold text-slate-900">
                                {{ $item->nama_pu }}
                            </td>
                            <td class="py-4 px-4 font-bold text-emerald-700">
                                {{ $item->merk_dagang ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-mono text-xs">
                                {{ $item->formatted_tanggal_daftar ?: '-' }}
                            </td>
                            <td class="py-4 px-4">
                                <span class="px-2.5 py-1 bg-emerald-100 text-emerald-800 rounded-lg text-[11px] font-extrabold">
                                    {{ $item->status ?: 'Terbit' }}
                                </span>
                            </td>
                            <td class="py-4 px-4 font-mono text-xs">
                                {{ $item->formatted_tanggal_sertifikat ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-mono font-semibold text-slate-800">
                                {{ $item->no_sertifikat ?: '-' }}
                            </td>
                            <td class="py-4 px-4 font-semibold text-slate-700">
                                {{ $item->nama_fasilitator ?: '-' }}
                            </td>
                            <td class="py-4 px-4">
                                {{ $item->jenis_produk ?: '-' }}
                            </td>
                            <td class="py-4 px-4">
                                @if(!empty($item->link_sertifikat_halal) && $item->link_sertifikat_halal !== '-')
                                    <a href="{{ $item->link_sertifikat_halal }}" target="_blank" class="inline-flex items-center gap-1 px-2.5 py-1 bg-emerald-50 text-emerald-700 border border-emerald-200 rounded-lg text-[11px] font-bold hover:bg-emerald-100 transition">
                                        <i class="bi bi-patch-check"></i> Sertifikat Halal
                                    </a>
                                @else
                                    <span class="text-slate-400 italic text-[11px]">Belum Ada</span>
                                @endif
                            </td>
                            <td class="py-4 px-3 text-center">
                                <div class="flex items-center justify-center gap-1.5">
                                    <button type="button" @click="openEditModal({{ json_encode($item) }})" class="px-3 py-1.5 bg-emerald-50 hover:bg-emerald-600 hover:text-white text-emerald-700 border border-emerald-200 rounded-xl font-bold transition shadow-sm cursor-pointer flex items-center gap-1">
                                        ✏️ Edit
                                    </button>
                                    <button type="button" @click="confirmDelete('halal', {{ $item->id }}, {{ json_encode($item->nama_pu) }})" class="px-3 py-1.5 bg-rose-50 hover:bg-rose-600 hover:text-white text-rose-600 border border-rose-200 rounded-xl font-bold transition shadow-sm cursor-pointer flex items-center gap-1">
                                        🗑️ Hapus
                                    </button>
                                </div>
                                <form id="deleteForm_halal_{{ $item->id }}" action="{{ route('dukungan.legalitas.database.halal.destroy', $item->id) }}" method="POST" class="hidden">
                                    @csrf
                                    @method('DELETE')
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="14" class="py-16 text-center text-slate-400 font-bold">
                                <div class="flex flex-col items-center justify-center gap-2">
                                    <span class="text-4xl animate-bounce">🟢</span>
                                    <span class="text-sm font-black text-slate-600">Tabel Database Sertifikat Halal Masih Kosong</span>
                                    <span class="text-xs font-normal text-slate-400 max-w-sm">Klik tombol "➕ Input Data Sertifikat Halal Baru" atau "📤 Unggah Data Massal" di atas untuk memasukkan data!</span>
                                </div>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        @endif

        {{-- Pagination Bar (15 Data Per Halaman) --}}
        <div class="pt-5 border-t border-slate-100 flex flex-col sm:flex-row items-center justify-between gap-4">
            <div class="text-xs font-bold text-slate-500">
                Menampilkan <span class="font-black text-slate-900">{{ $items->firstItem() ?? 0 }}</span> s/d <span class="font-black text-slate-900">{{ $items->lastItem() ?? 0 }}</span> dari total <span class="font-black text-slate-900">{{ number_format($items->total()) }}</span> data <span class="px-2 py-0.5 bg-slate-100 text-slate-700 font-extrabold rounded-md text-[11px] ml-1">15 data / halaman</span>
            </div>

            <div class="shrink-0">
                {{ $items->links() }}
            </div>
        </div>
    </div>


    {{-- POP-UP MODAL FORM INPUT & EDIT DATA --}}
    <div x-show="isFormModalOpen" x-cloak class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/70 backdrop-blur-md flex items-center justify-center p-4">
        <div @click.away="isFormModalOpen = false" 
             class="bg-white rounded-[36px] max-w-4xl w-full overflow-hidden shadow-2xl border border-slate-100 transform transition-all duration-300 scale-100 my-8">
            
            {{-- POPUP MODAL HEADER --}}
            <div class="p-6 text-white flex items-center justify-between relative overflow-hidden {{ $activeTab === 'hki' ? 'bg-gradient-to-r from-amber-500 via-orange-500 to-amber-600' : 'bg-gradient-to-r from-emerald-600 via-teal-500 to-cyan-600' }}">
                <div class="flex items-center gap-3 relative z-10">
                    <div class="w-12 h-12 rounded-2xl bg-white/20 backdrop-blur-md flex items-center justify-center text-2xl shadow-inner">
                        <span x-text="isEditMode ? '✏️' : '{{ $activeTab === 'hki' ? '🏷️' : '✨' }}'"></span>
                    </div>
                    <div>
                        <h3 class="text-lg font-black uppercase tracking-tight flex items-center gap-2">
                            <span x-text="isEditMode ? 'Form Edit Data ' + (activeTab === 'hki' ? 'HKI Merek' : 'Sertifikat Halal') : 'Form Input Data ' + (activeTab === 'hki' ? 'HKI Merek' : 'Sertifikat Halal') + ' Baru'"></span>
                        </h3>
                        <p class="text-xs font-medium text-white/90" x-text="isEditMode ? 'Perbarui informasi data database dan simpan perubahan.' : 'Ketikkan data di bawah ini. Tombol Simpan akan aktif secara otomatis saat Anda memasukkan data!'"></p>
                    </div>
                </div>

                <div class="flex items-center gap-2 relative z-10">
                    <button type="button" @click="resetForm()" class="px-3 py-1.5 bg-white/20 hover:bg-white/30 text-white rounded-xl text-xs font-extrabold transition shadow-sm flex items-center gap-1 cursor-pointer">
                        <span>🔄 Reset</span>
                    </button>
                    <button type="button" @click="isFormModalOpen = false" class="w-9 h-9 rounded-xl bg-white/20 hover:bg-white/40 text-white flex items-center justify-center text-lg font-black transition cursor-pointer">✕</button>
                </div>
            </div>

            {{-- POPUP MODAL BODY --}}
            <div class="p-8 max-h-[75vh] overflow-y-auto space-y-6">
                
                {{-- FORM HKI MEREK POPUP --}}
                @if($activeTab === 'hki')
                <form id="formHki" :action="formActionUrl" method="POST" class="space-y-5">
                    @csrf
                    
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700 flex items-center justify-between">
                                <span>1. NIK (16 Digit)</span>
                                <span class="text-[10px] text-amber-600 font-bold">KTP</span>
                            </label>
                            <input type="text" name="nik" x-model="hkiForm.nik" @input="checkHkiTouched()" placeholder="Masukkan 16 digit NIK..." maxlength="16" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white focus:ring-4 focus:ring-amber-500/10 transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700 flex items-center justify-between">
                                <span>2. NIB (13 Digit)</span>
                                <span class="text-[10px] text-amber-600 font-bold">OSS</span>
                            </label>
                            <input type="text" name="nib" x-model="hkiForm.nib" @input="checkHkiTouched()" placeholder="Masukkan 13 digit NIB..." maxlength="13" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white focus:ring-4 focus:ring-amber-500/10 transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700 flex items-center justify-between">
                                <span>3. Nomor Transaksi</span>
                                <span class="text-[10px] text-slate-400 font-medium">IPT...</span>
                            </label>
                            <input type="text" name="nomor_transaksi" x-model="hkiForm.nomor_transaksi" @input="checkHkiTouched()" placeholder="Contoh: IPT2025136011" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white focus:ring-4 focus:ring-amber-500/10 transition">
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700 flex items-center justify-between">
                                <span>4. Merek <span class="text-rose-500">*</span></span>
                                <span class="text-[10px] text-emerald-600 font-extrabold">Wajib Diisi</span>
                            </label>
                            <input type="text" name="merek" x-model="hkiForm.merek" @input="checkHkiTouched()" required placeholder="Nama merek usaha (contoh: ABRA CULINARY + Logo)..." class="w-full px-4 py-3 bg-amber-50/50 border border-amber-300 rounded-2xl text-xs font-black text-slate-900 outline-none focus:border-amber-500 focus:bg-white focus:ring-4 focus:ring-amber-500/20 transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700 flex items-center justify-between">
                                <span>5. Kelas Merek</span>
                                <span class="text-[10px] text-slate-400 font-medium">Contoh: 30, 25</span>
                            </label>
                            <input type="text" name="kelas" x-model="hkiForm.kelas" @input="checkHkiTouched()" placeholder="Contoh: 30 / 25 / 35" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white focus:ring-4 focus:ring-amber-500/10 transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700 flex items-center justify-between">
                                <span>6. Nomor Permohonan</span>
                                <span class="text-[10px] text-slate-400 font-medium">DID...</span>
                            </label>
                            <input type="text" name="nomor_permohonan" x-model="hkiForm.nomor_permohonan" @input="checkHkiTouched()" placeholder="Contoh: DID2025066752" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white focus:ring-4 focus:ring-amber-500/10 transition">
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">7. Tipe Permohonan</label>
                            <select name="tipe_permohonan" x-model="hkiForm.tipe_permohonan" @change="checkHkiTouched()" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white transition">
                                <option value="Merek Dagang">Merek Dagang</option>
                                <option value="Merek Jasa">Merek Jasa</option>
                                <option value="Merek Kolektif">Merek Kolektif</option>
                            </select>
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">8. Status Permohonan</label>
                            <select name="status_permohonan_merek" x-model="hkiForm.status_permohonan_merek" @change="checkHkiTouched()" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white transition">
                                <option value="(TM) Didaftar">(TM) Didaftar</option>
                                <option value="Terbit / Sertifikasi">Terbit / Sertifikasi</option>
                                <option value="Dalam Proses">Dalam Proses</option>
                                <option value="Ditolak">Ditolak</option>
                            </select>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">9. Link File Tanda Daftar</label>
                            <input type="text" name="link_tanda_daftar" x-model="hkiForm.link_tanda_daftar" @input="checkHkiTouched()" placeholder="https://drive.google.com/..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">10. Link File Sertifikat</label>
                            <input type="text" name="link_sertifikat_merek" x-model="hkiForm.link_sertifikat_merek" @input="checkHkiTouched()" placeholder="https://drive.google.com/..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-amber-500 focus:bg-white transition">
                        </div>
                    </div>

                    {{-- FOOTER SIMPAN POPUP --}}
                    <div class="pt-5 flex items-center justify-between border-t border-slate-200">
                        <div class="flex items-center gap-2">
                            <span x-show="isHkiFormTouched" x-transition class="flex items-center gap-1.5 text-xs font-bold text-amber-700 bg-amber-100 px-3 py-1.5 rounded-xl border border-amber-300">
                                <span class="w-2 h-2 rounded-full bg-amber-500 animate-ping"></span>
                                Status: Input terdeteksi! Siap disimpan.
                            </span>
                            <span x-show="!isHkiFormTouched" class="text-xs font-medium text-slate-400 italic">
                                Ketikkan data pada form untuk mengaktifkan tombol Simpan.
                            </span>
                        </div>

                        <button type="button" 
                                @click="triggerRobotModal('formHki')" 
                                :disabled="!isHkiFormValid"
                                :class="isHkiFormValid ? 'bg-gradient-to-r from-amber-500 via-orange-500 to-amber-600 hover:from-amber-600 hover:to-orange-600 text-white shadow-lg shadow-orange-500/30 scale-105 cursor-pointer ring-4 ring-amber-400/30 animate-pulse' : 'bg-slate-200 text-slate-400 cursor-not-allowed opacity-60'"
                                class="px-8 py-3.5 rounded-2xl font-black text-xs tracking-wider uppercase transition-all duration-300 flex items-center gap-2.5">
                            <span x-text="isEditMode ? '💾 Update Data HKI Merek' : '💾 Simpan Data HKI Merek'"></span>
                            <span x-show="isHkiFormValid" class="text-base">🚀</span>
                        </button>
                    </div>
                </form>
                @endif

                {{-- FORM SERTIFIKAT HALAL POPUP --}}
                @if($activeTab === 'halal')
                <form id="formHalal" :action="formActionUrl" method="POST" class="space-y-5">
                    @csrf

                    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">1. NIK (16 Digit)</label>
                            <input type="text" name="nik" x-model="halalForm.nik" @input="checkHalalTouched()" placeholder="16 digit NIK..." maxlength="16" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">2. NIB (13 Digit)</label>
                            <input type="text" name="nib" x-model="halalForm.nib" @input="checkHalalTouched()" placeholder="13 digit NIB..." maxlength="13" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">3. No Daftar</label>
                            <input type="text" name="no_daftar" x-model="halalForm.no_daftar" @input="checkHalalTouched()" placeholder="No Pendaftaran..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700 flex items-center justify-between">
                                <span>4. Nama PU <span class="text-rose-500">*</span></span>
                                <span class="text-[10px] text-emerald-600 font-extrabold">Wajib Diisi</span>
                            </label>
                            <input type="text" name="nama_pu" x-model="halalForm.nama_pu" @input="checkHalalTouched()" required placeholder="Nama Pelaku Usaha..." class="w-full px-4 py-3 bg-emerald-50/50 border border-emerald-300 rounded-2xl text-xs font-black text-slate-900 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">5. Merk Dagang</label>
                            <input type="text" name="merk_dagang" x-model="halalForm.merk_dagang" @input="checkHalalTouched()" placeholder="Nama Merk produk..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">6. Tanggal Daftar</label>
                            <input type="date" name="tanggal_daftar" x-model="halalForm.tanggal_daftar" @change="checkHalalTouched()" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">7. Status Halal</label>
                            <select name="status" x-model="halalForm.status" @change="checkHalalTouched()" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                                <option value="Terbit">Terbit / Sertifikasi Ada</option>
                                <option value="Dalam Proses">Dalam Proses</option>
                                <option value="Belum">Belum</option>
                            </select>
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">8. Tanggal Sertifikat</label>
                            <input type="date" name="tanggal_sertifikat" x-model="halalForm.tanggal_sertifikat" @change="checkHalalTouched()" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">9. No Sertifikat</label>
                            <input type="text" name="no_sertifikat" x-model="halalForm.no_sertifikat" @input="checkHalalTouched()" placeholder="ID3511..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">10. Nama Fasilitator</label>
                            <input type="text" name="nama_fasilitator" x-model="halalForm.nama_fasilitator" @input="checkHalalTouched()" placeholder="DisnakerKUKM..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">11. Jenis Produk</label>
                            <input type="text" name="jenis_produk" x-model="halalForm.jenis_produk" @input="checkHalalTouched()" placeholder="Makanan, Minuman..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>

                        <div class="space-y-1">
                            <label class="block text-xs font-black uppercase text-slate-700">12. Link Sertifikat Halal</label>
                            <input type="text" name="link_sertifikat_halal" x-model="halalForm.link_sertifikat_halal" @input="checkHalalTouched()" placeholder="https://drive.google.com/..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        </div>
                    </div>

                    {{-- FOOTER SIMPAN POPUP --}}
                    <div class="pt-5 flex items-center justify-between border-t border-slate-200">
                        <div class="flex items-center gap-2">
                            <span x-show="isHalalFormTouched" x-transition class="flex items-center gap-1.5 text-xs font-bold text-emerald-700 bg-emerald-100 px-3 py-1.5 rounded-xl border border-emerald-300">
                                <span class="w-2 h-2 rounded-full bg-emerald-500 animate-ping"></span>
                                Status: Input terdeteksi! Siap disimpan.
                            </span>
                            <span x-show="!isHalalFormTouched" class="text-xs font-medium text-slate-400 italic">
                                Ketikkan data pada form untuk mengaktifkan tombol Simpan.
                            </span>
                        </div>

                        <button type="button" 
                                @click="triggerRobotModal('formHalal')" 
                                :disabled="!isHalalFormValid"
                                :class="isHalalFormValid ? 'bg-gradient-to-r from-emerald-500 via-teal-500 to-cyan-600 hover:from-emerald-600 hover:to-teal-600 text-white shadow-lg shadow-emerald-500/30 scale-105 cursor-pointer ring-4 ring-emerald-400/30 animate-pulse' : 'bg-slate-200 text-slate-400 cursor-not-allowed opacity-60'"
                                class="px-8 py-3.5 rounded-2xl font-black text-xs tracking-wider uppercase transition-all duration-300 flex items-center gap-2.5">
                            <span x-text="isEditMode ? '💾 Update Data Halal' : '💾 Simpan Data Sertifikat Halal'"></span>
                            <span x-show="isHalalFormValid" class="text-base">🚀</span>
                        </button>
                    </div>
                </form>
                @endif

            </div>
        </div>
    </div>


    {{-- POP-UP MODAL UNGGAH DATA MASSAL (EXCEL IMPORT WITH PROGRESS & DUPLICATE CHECKING) --}}
    <div x-show="isImportModalOpen" x-cloak class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/75 backdrop-blur-md flex items-center justify-center p-4">
        <div @click.away="if(!isImporting) isImportModalOpen = false" class="bg-white rounded-[36px] max-w-xl w-full overflow-hidden shadow-2xl border border-slate-100 transform transition-all duration-300 scale-100">
            
            {{-- Modal Header --}}
            <div class="p-6 bg-slate-900 text-white flex items-center justify-between">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-2xl bg-emerald-500/20 text-emerald-400 border border-emerald-500/30 flex items-center justify-center text-xl font-black">
                        📤
                    </div>
                    <div>
                        <h4 class="font-black text-base uppercase tracking-tight">Unggah Data Massal {{ $activeTab === 'hki' ? 'HKI Merek' : 'Sertifikat Halal' }}</h4>
                        <p class="text-xs text-slate-400 font-medium">Impor data dari file Excel .xlsx / .xls</p>
                    </div>
                </div>
                <button type="button" @click="if(!isImporting) isImportModalOpen = false" class="text-slate-400 hover:text-white text-xl font-bold transition cursor-pointer">✕</button>
            </div>

            {{-- Modal Body Form --}}
            <form id="importForm" action="{{ route('dukungan.legalitas.database.import') }}" method="POST" enctype="multipart/form-data" @submit.prevent="submitImportWithProgress($event)" class="p-6 space-y-6">
                @csrf
                <input type="hidden" name="tab" value="{{ $activeTab }}">

                {{-- Alert Petunjuk Duplikasi --}}
                <div class="bg-amber-50 border border-amber-200 p-4 rounded-2xl space-y-2">
                    <div class="flex items-start gap-2.5">
                        <span class="text-xl">⚠️</span>
                        <div class="text-xs text-amber-900 space-y-1">
                            <p class="font-black">Ketentuan Pemeriksaan Duplikasi Otomatis:</p>
                            <ul class="list-disc pl-4 font-semibold space-y-0.5 text-[11px] text-amber-800">
                                @if($activeTab === 'hki')
                                    <li>File harus menggunakan format **Template Excel (.xlsx)** asli.</li>
                                    <li>Bila **Nomor Permohonan HKI** sudah ada di database, baris tersebut akan **OTOMATIS DITOLAK (DUPLIKASI)**.</li>
                                    <li>Data yang bebas dari duplikasi akan tetap **BERHASIL DIIKM/IMPORTED** 100%.</li>
                                @else
                                    <li>File harus menggunakan format **Template Excel (.xlsx)** asli.</li>
                                    <li>Bila **No Sertifikat / No Daftar Halal** sudah ada di database, baris tersebut akan **OTOMATIS DITOLAK (DUPLIKASI)**.</li>
                                    <li>Data yang bebas dari duplikasi akan tetap **BERHASIL DIIMPORT** 100%.</li>
                                @endif
                            </ul>
                        </div>
                    </div>
                </div>

                {{-- File Input --}}
                <div class="space-y-2">
                    <label class="block text-xs font-extrabold uppercase text-slate-700">Pilih File Excel Template (.xlsx):</label>
                    <input type="file" name="file_excel" accept=".xlsx, .xls" required 
                           @change="selectedFileName = $event.target.files[0] ? $event.target.files[0].name : ''"
                           class="block w-full text-xs text-slate-500 file:mr-4 file:py-3 file:px-4 file:rounded-2xl file:border-0 file:text-xs file:font-black file:bg-slate-900 file:text-white hover:file:bg-slate-800 cursor-pointer border border-slate-200 rounded-2xl bg-slate-50">
                </div>

                {{-- Simulated Progress Bar Status --}}
                <div x-show="isImporting" x-transition class="space-y-2 pt-2 border-t border-slate-100">
                    <div class="flex items-center justify-between text-xs font-black">
                        <span class="text-slate-800" x-text="importStatusText">🤖 Memproses file...</span>
                        <span class="text-emerald-600" x-text="importProgress + '%'">0%</span>
                    </div>
                    <div class="w-full bg-slate-100 rounded-full h-3 overflow-hidden p-0.5 border border-slate-200">
                        <div class="bg-gradient-to-r from-emerald-500 via-teal-500 to-cyan-500 h-full rounded-full transition-all duration-300" :style="'width: ' + importProgress + '%'"></div>
                    </div>
                </div>

                {{-- Modal Action Buttons --}}
                <div class="pt-4 border-t border-slate-100 flex items-center justify-between gap-3">
                    <a href="{{ route('dukungan.legalitas.database.template', ['tab' => $activeTab]) }}" class="text-xs font-bold text-emerald-600 hover:text-emerald-700 flex items-center gap-1">
                        <i class="bi bi-download"></i> Unduh Template Excel
                    </a>

                    <div class="flex items-center gap-2">
                        <button type="button" @click="isImportModalOpen = false" :disabled="isImporting" class="px-4 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl text-xs font-extrabold transition">
                            Batal
                        </button>
                        <button type="submit" :disabled="isImporting" class="px-6 py-2.5 bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700 text-white rounded-xl text-xs font-black shadow-md transition flex items-center gap-2 cursor-pointer">
                            <span x-show="!isImporting">🚀 Unggah Data Massal</span>
                            <span x-show="isImporting" class="animate-spin">⏳</span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    {{-- INTERACTIVE ROBOT MASCOT CONFIRMATION & COUNTDOWN MODAL POPUP --}}
    <div x-show="isRobotModalOpen" x-cloak class="fixed inset-0 z-[60] overflow-y-auto bg-slate-900/80 backdrop-blur-md flex items-center justify-center p-4">
        <div @click.away="if(robotStep === 'confirm') isRobotModalOpen = false" 
             class="bg-white rounded-[40px] max-w-md w-full overflow-hidden shadow-2xl border-4 {{ $activeTab === 'hki' ? 'border-amber-400' : 'border-emerald-400' }} transform transition-all duration-300 scale-100 relative">
            
            {{-- Robot Background Accent --}}
            <div class="h-32 bg-gradient-to-r {{ $activeTab === 'hki' ? 'from-amber-500 via-orange-500 to-amber-600' : 'from-emerald-600 via-teal-500 to-cyan-600' }} p-6 text-white text-center relative overflow-hidden">
                <div class="absolute -right-8 -top-8 w-32 h-32 bg-white/10 rounded-full blur-xl"></div>
                <h4 class="font-black text-lg uppercase tracking-wider mt-2">SISTEM AUTO-VERIFIKASI</h4>
                <p class="text-[11px] font-semibold opacity-90" x-text="isEditMode ? 'Pemrosesan Perubahan Data Database' : 'Pemrosesan Input Data Database Baru'"></p>
            </div>

            {{-- Floating Animated Robot Avatar --}}
            <div class="-mt-16 flex justify-center relative z-10">
                <div class="w-28 h-28 bg-white rounded-full p-2 shadow-xl ring-4 ring-white flex items-center justify-center relative">
                    
                    {{-- Animated Robot Avatar Body --}}
                    <div class="w-full h-full rounded-full bg-slate-900 flex flex-col items-center justify-center relative overflow-hidden border-2 border-slate-700">
                        {{-- Robot Antenna --}}
                        <div class="w-1.5 h-3 bg-amber-400 -mt-1 rounded-t-sm animate-pulse"></div>
                        <div class="w-3 h-3 rounded-full bg-cyan-400 shadow-md shadow-cyan-400 animate-ping absolute top-1"></div>

                        {{-- Robot Eyes Screen --}}
                        <div class="w-16 h-8 bg-slate-950 rounded-xl flex items-center justify-center gap-2 border border-slate-800 my-1">
                            <span class="w-3.5 h-3.5 rounded-full bg-cyan-400 shadow-lg shadow-cyan-400 flex items-center justify-center text-[8px] font-black text-slate-900" :class="robotStep === 'countdown' ? 'animate-spin' : 'animate-bounce'">
                                {{ $activeTab === 'hki' ? '⚡' : '✨' }}
                            </span>
                            <span class="w-3.5 h-3.5 rounded-full bg-cyan-400 shadow-lg shadow-cyan-400 flex items-center justify-center text-[8px] font-black text-slate-900" :class="robotStep === 'countdown' ? 'animate-spin' : 'animate-bounce'">
                                {{ $activeTab === 'hki' ? '⚡' : '✨' }}
                            </span>
                        </div>

                        {{-- Robot Mouth / Chest Status --}}
                        <div class="text-[9px] font-black text-emerald-400 tracking-wider">
                            <span x-show="robotStep === 'confirm'">🤖 CONFIRM</span>
                            <span x-show="robotStep === 'countdown'" class="text-amber-400 animate-pulse">⏳ RUNNING</span>
                            <span x-show="robotStep === 'saving'" class="text-cyan-400 animate-bounce">🚀 SAVING</span>
                        </div>
                    </div>

                </div>
            </div>

            {{-- Modal Body Content --}}
            <div class="p-6 text-center space-y-5">
                
                {{-- STEP 1: CONFIRMATION QUESTION --}}
                <div x-show="robotStep === 'confirm'" x-transition class="space-y-4">
                    <div class="bg-slate-50 border border-slate-200 p-4 rounded-2xl relative">
                        <div class="absolute -top-2 left-1/2 -translate-x-1/2 w-4 h-4 bg-slate-50 border-t border-l border-slate-200 rotate-45"></div>
                        <p class="text-xs font-black text-slate-800 leading-relaxed">
                            "Halo Kak! 🤖<br>
                            Apakah Anda <span class="{{ $activeTab === 'hki' ? 'text-amber-600' : 'text-emerald-600' }}" x-text="isEditMode ? 'yakin ingin memperbarui perubahan data ini?' : 'yakin data ini sudah benar dan ingin disimpan?'"></span>"
                        </p>
                    </div>

                    <div class="flex items-center justify-center gap-3 pt-2">
                        <button type="button" @click="isRobotModalOpen = false" class="w-1/2 py-3 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-2xl text-xs font-black transition cursor-pointer">
                            Batal
                        </button>
                        <button type="button" @click="startCountdown()" class="w-1/2 py-3 bg-gradient-to-r {{ $activeTab === 'hki' ? 'from-amber-500 to-orange-500 hover:from-amber-600 hover:to-orange-600' : 'from-emerald-600 to-teal-600 hover:from-emerald-700 hover:to-teal-700' }} text-white rounded-2xl text-xs font-black shadow-lg transition transform active:scale-95 cursor-pointer">
                            Yakin, Simpan! 🚀
                        </button>
                    </div>
                </div>

                {{-- STEP 2: COUNTDOWN (5 to 1) --}}
                <div x-show="robotStep === 'countdown'" x-transition class="space-y-4 py-2">
                    <div class="bg-slate-900 text-white p-4 rounded-2xl relative border border-slate-800">
                        <p class="text-xs font-extrabold text-cyan-300 animate-pulse">
                            🤖 Sistem sedang memproses & menyimpan data Anda...
                        </p>
                        <p class="text-[11px] text-slate-400 mt-1">Harap tidak menutup halaman ini.</p>
                    </div>

                    {{-- BIG COUNTDOWN NUMBER --}}
                    <div class="flex items-center justify-center">
                        <div class="w-24 h-24 rounded-full bg-gradient-to-tr {{ $activeTab === 'hki' ? 'from-amber-500 to-orange-500 ring-amber-400' : 'from-emerald-500 to-teal-500 ring-emerald-400' }} text-white flex items-center justify-center shadow-xl ring-8 ring-opacity-30 transform scale-110 transition-all duration-300">
                            <span class="text-5xl font-black animate-pulse" x-text="countdownTimer">5</span>
                        </div>
                    </div>

                    <p class="text-xs font-extrabold text-slate-500 tracking-wider">
                        Menyiapkan penyimpanan otomatis dalam <span class="text-slate-900 font-black" x-text="countdownTimer">5</span> detik...
                    </p>
                </div>

                {{-- STEP 3: SAVING / SUBMITTING --}}
                <div x-show="robotStep === 'saving'" x-transition class="space-y-4 py-4">
                    <div class="text-4xl animate-bounce">🥳 ✨ 🚀</div>
                    <h4 class="text-base font-black text-slate-900">DATA BERHASIL TERSIMPAN!</h4>
                    <p class="text-xs text-slate-500 font-medium">Sistem sedang memperbarui tabel database...</p>
                </div>

            </div>
        </div>
    </div>


    {{-- UNIFORM & COLORFUL CUSTOM DELETE CONFIRMATION MODAL --}}
    <div x-show="isDeleteModalOpen" x-cloak class="fixed inset-0 z-[70] overflow-y-auto bg-slate-900/80 backdrop-blur-md flex items-center justify-center p-4">
        <div @click.away="isDeleteModalOpen = false" class="bg-white rounded-[36px] max-w-md w-full overflow-hidden shadow-2xl border-2 border-rose-300 transform transition-all duration-300 scale-100 relative">
            
            {{-- Modal Header Banner --}}
            <div class="bg-gradient-to-r from-rose-500 via-red-500 to-rose-600 p-6 text-white text-center relative overflow-hidden">
                <div class="w-16 h-16 rounded-3xl bg-white/20 backdrop-blur-md mx-auto flex items-center justify-center text-3xl shadow-inner mb-2 border border-white/30 animate-pulse">
                    🗑️
                </div>
                <h4 class="font-black text-lg uppercase tracking-wider">KONFIRMASI HAPUS DATA</h4>
                <p class="text-xs text-rose-100 font-medium mt-0.5">Tindakan ini memerlukan verifikasi Anda</p>
            </div>

            {{-- Modal Content --}}
            <div class="p-6 text-center space-y-4">
                <div class="bg-rose-50/80 border border-rose-200 p-4 rounded-2xl">
                    <p class="text-xs font-bold text-slate-700 leading-relaxed">
                        Apakah Anda yakin ingin menghapus data <span class="font-black text-rose-600" x-text="deleteTitle"></span> dari database {{ $activeTab === 'hki' ? 'HKI Merek' : 'Sertifikat Halal' }}?
                    </p>
                    <p class="text-[11px] text-slate-400 mt-2 italic">
                        ⚠️ Data yang sudah dihapus tidak dapat dikembalikan lagi.
                    </p>
                </div>

                <div class="flex items-center justify-center gap-3 pt-2">
                    <button type="button" @click="isDeleteModalOpen = false" class="w-1/2 py-3 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-2xl text-xs font-black transition cursor-pointer">
                        Batal
                    </button>
                    <button type="button" @click="executeDelete()" class="w-1/2 py-3 bg-gradient-to-r from-rose-600 to-red-600 hover:from-rose-700 hover:to-red-700 text-white rounded-2xl text-xs font-black shadow-lg shadow-rose-600/30 transition transform active:scale-95 cursor-pointer">
                        Ya, Hapus Data! 🗑️
                    </button>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
function legalitasDatabaseApp() {
    return {
        activeTab: '{{ $activeTab }}',
        isFormModalOpen: false,
        isEditMode: false,
        editId: null,
        
        // Import Modal State
        isImportModalOpen: false,
        isImporting: false,
        importProgress: 0,
        importStatusText: '🤖 Membaca file Excel...',
        selectedFileName: '',

        // Form HKI State
        hkiForm: {
            merek: '',
            nik: '',
            nib: '',
            nomor_transaksi: '',
            kelas: '',
            nomor_permohonan: '',
            tipe_permohonan: 'Merek Dagang',
            status_permohonan_merek: '(TM) Didaftar',
            link_tanda_daftar: '',
            link_sertifikat_merek: ''
        },
        isHkiFormTouched: false,

        // Form Halal State
        halalForm: {
            nama_pu: '',
            nik: '',
            nib: '',
            no_daftar: '',
            merk_dagang: '',
            tanggal_daftar: '',
            status: 'Terbit',
            tanggal_sertifikat: '',
            no_sertifikat: '',
            nama_fasilitator: '',
            jenis_produk: '',
            link_sertifikat_halal: ''
        },
        isHalalFormTouched: false,

        // Robot Modal State
        isRobotModalOpen: false,
        robotStep: 'confirm', // 'confirm', 'countdown', 'saving'
        countdownTimer: 5,
        targetFormId: null,

        // Custom Delete Modal State
        isDeleteModalOpen: false,
        deleteType: null,
        deleteId: null,
        deleteTitle: '',

        get formActionUrl() {
            if (this.activeTab === 'hki') {
                return this.isEditMode 
                    ? '/dukungan/legalitas/database/hki/update/' + this.editId
                    : '{{ route('dukungan.legalitas.database.hki.store') }}';
            } else {
                return this.isEditMode 
                    ? '/dukungan/legalitas/database/halal/update/' + this.editId
                    : '{{ route('dukungan.legalitas.database.halal.store') }}';
            }
        },

        get isHkiFormValid() {
            return this.hkiForm.merek && this.hkiForm.merek.trim().length > 0;
        },

        get isHalalFormValid() {
            return this.halalForm.nama_pu && this.halalForm.nama_pu.trim().length > 0;
        },

        checkHkiTouched() {
            this.isHkiFormTouched = true;
        },

        checkHalalTouched() {
            this.isHalalFormTouched = true;
        },

        openCreateModal() {
            this.isEditMode = false;
            this.editId = null;
            this.resetForm();
            this.isFormModalOpen = true;
        },

        openEditModal(item) {
            this.isEditMode = true;
            this.editId = item.id;
            if (this.activeTab === 'hki') {
                this.hkiForm = {
                    merek: item.merek || '',
                    nik: item.nik || '',
                    nib: item.nib || '',
                    nomor_transaksi: item.nomor_transaksi || '',
                    kelas: item.kelas || '',
                    nomor_permohonan: item.nomor_permohonan || '',
                    tipe_permohonan: item.tipe_permohonan || 'Merek Dagang',
                    status_permohonan_merek: item.status_permohonan_merek || '(TM) Didaftar',
                    link_tanda_daftar: item.link_tanda_daftar || '',
                    link_sertifikat_merek: item.link_sertifikat_merek || ''
                };
                this.isHkiFormTouched = true;
            } else {
                this.halalForm = {
                    nama_pu: item.nama_pu || '',
                    nik: item.nik || '',
                    nib: item.nib || '',
                    no_daftar: item.no_daftar || '',
                    merk_dagang: item.merk_dagang || '',
                    tanggal_daftar: item.iso_tanggal_daftar || item.tanggal_daftar || '',
                    status: item.status || 'Terbit',
                    tanggal_sertifikat: item.iso_tanggal_sertifikat || item.tanggal_sertifikat || '',
                    no_sertifikat: item.no_sertifikat || '',
                    nama_fasilitator: item.nama_fasilitator || '',
                    jenis_produk: item.jenis_produk || '',
                    link_sertifikat_halal: item.link_sertifikat_halal || ''
                };
                this.isHalalFormTouched = true;
            }
            this.isFormModalOpen = true;
        },

        resetForm() {
            this.hkiForm = {
                merek: '',
                nik: '',
                nib: '',
                nomor_transaksi: '',
                kelas: '',
                nomor_permohonan: '',
                tipe_permohonan: 'Merek Dagang',
                status_permohonan_merek: '(TM) Didaftar',
                link_tanda_daftar: '',
                link_sertifikat_merek: ''
            };
            this.halalForm = {
                nama_pu: '',
                nik: '',
                nib: '',
                no_daftar: '',
                merk_dagang: '',
                tanggal_daftar: '',
                status: 'Terbit',
                tanggal_sertifikat: '',
                no_sertifikat: '',
                nama_fasilitator: '',
                jenis_produk: '',
                link_sertifikat_halal: ''
            };
            this.isHkiFormTouched = false;
            this.isHalalFormTouched = false;
        },

        triggerRobotModal(formId) {
            this.targetFormId = formId;
            this.robotStep = 'confirm';
            this.countdownTimer = 5;
            this.isRobotModalOpen = true;
        },

        startCountdown() {
            this.robotStep = 'countdown';
            this.countdownTimer = 5;

            let interval = setInterval(() => {
                this.countdownTimer--;
                if (this.countdownTimer <= 0) {
                    clearInterval(interval);
                    this.robotStep = 'saving';
                    setTimeout(() => {
                        document.getElementById(this.targetFormId).submit();
                    }, 800);
                }
            }, 1000);
        },

        submitImportWithProgress(event) {
            this.isImporting = true;
            this.importProgress = 10;
            this.importStatusText = '🤖 Membaca data file Excel...';

            let timer = setInterval(() => {
                this.importProgress += 20;
                if (this.importProgress >= 40 && this.importProgress < 70) {
                    this.importStatusText = '🔍 Mengidentifikasi Nomor Permohonan HKI / No Sertifikat duplikat...';
                } else if (this.importProgress >= 70 && this.importProgress < 95) {
                    this.importStatusText = '💾 Mengimport data yang bebas duplikasi ke database...';
                } else if (this.importProgress >= 100) {
                    clearInterval(timer);
                    this.importStatusText = '✨ Pemrosesan Selesai!';
                    setTimeout(() => {
                        event.target.submit();
                    }, 400);
                }
            }, 300);
        },

        confirmDelete(type, id, title) {
            this.deleteType = type;
            this.deleteId = id;
            this.deleteTitle = title;
            this.isDeleteModalOpen = true;
        },

        executeDelete() {
            if (this.deleteType && this.deleteId) {
                document.getElementById('deleteForm_' + this.deleteType + '_' + this.deleteId).submit();
            }
        }
    }
}
</script>
@endsection
