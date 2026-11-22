@extends('layouts.dukungan')

@section('title', 'Database IKM Terintegrasi')
@section('hide_header_title', true)

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<div class="space-y-10">
    <div class="flex flex-col lg:flex-row justify-between items-start lg:items-center gap-4">
        <div>
            <h2 class="text-3xl font-black text-slate-800 tracking-tighter uppercase">DATABASE IKM <span class="text-emerald-600">TERINTEGRASI</span></h2>
            <p class="text-slate-400 font-medium mt-1 text-sm">Kelola data profil, KBLI, legalitas, investasi, dan spasial pelaku usaha binaan yang terintegrasi.</p>
        </div>
        <div class="grid grid-cols-2 sm:flex sm:flex-wrap items-center gap-3 w-full lg:w-auto">
            <button onclick="openTambahModal()" class="w-full sm:w-[190px] h-11 bg-emerald-600 text-white px-4 rounded-2xl font-bold text-xs shadow-md shadow-emerald-200 hover:bg-emerald-700 hover:scale-[1.02] active:scale-[0.98] transition-all duration-300 flex items-center justify-center gap-2 shrink-0">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M12 4v16m8-8H4" /></svg>
                <span class="truncate">Tambah Data IKM</span>
            </button>
            <a href="{{ route('dukungan.sebaran.export', ['search' => request('search')]) }}" class="w-full sm:w-[190px] h-11 bg-teal-600 text-white px-4 rounded-2xl font-bold text-xs shadow-md shadow-teal-200 hover:bg-teal-700 hover:scale-[1.02] active:scale-[0.98] transition-all duration-300 flex items-center justify-center gap-2 shrink-0">
                <i class="bi bi-file-earmark-excel-fill text-sm shrink-0"></i>
                <span class="truncate">Export Excel (.xlsx)</span>
            </a>
            <a href="{{ route('dukungan.sebaran.template') }}" class="w-full sm:w-[190px] h-11 bg-indigo-600 text-white px-4 rounded-2xl font-bold text-xs shadow-md shadow-indigo-200 hover:bg-indigo-700 hover:scale-[1.02] active:scale-[0.98] transition-all duration-300 flex items-center justify-center gap-2 shrink-0">
                <i class="bi bi-download text-sm shrink-0"></i>
                <span class="truncate">Download Template</span>
            </a>
            <button onclick="openImportModal()" class="w-full sm:w-[190px] h-11 bg-amber-600 text-white px-4 rounded-2xl font-bold text-xs shadow-md shadow-amber-200 hover:bg-amber-700 hover:scale-[1.02] active:scale-[0.98] transition-all duration-300 flex items-center justify-center gap-2 shrink-0">
                <i class="bi bi-upload text-sm shrink-0"></i>
                <span class="truncate">Unggah Massal (.xlsx)</span>
            </button>
        </div>
    </div>

    @if(session('success'))
        <div id="success-alert" class="bg-emerald-50 border border-emerald-200 text-emerald-600 px-6 py-4 rounded-2xl font-bold text-sm shadow-sm animate-pulse">
            🎉 {{ session('success') }}
        </div>
    @endif
    
    @if ($errors->any())
        <div class="bg-rose-50 border border-rose-200 text-rose-600 px-6 py-4 rounded-2xl font-bold text-sm shadow-sm">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>⚠️ {{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <!-- Filters Toolbar -->
    <div class="bg-white rounded-[32px] border border-slate-200 p-8 shadow-sm">
        <form action="{{ route('dukungan.sebaran.index') }}" method="GET" class="flex flex-col md:flex-row gap-4 items-center justify-between">
            <div class="flex-1 w-full relative">
                <input type="text" name="search" value="{{ request('search') }}" 
                       placeholder="Cari berdasarkan Pemilik, NIB, NIK, Produk, atau Nama Usaha..." 
                       class="w-full bg-slate-50 border border-slate-200 focus:border-emerald-500 rounded-2xl pl-12 pr-6 py-4 text-sm font-bold text-slate-700 outline-none transition duration-300">
                <div class="absolute left-5 top-5 text-slate-400">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </div>
            </div>
            <div class="flex gap-3 w-full md:w-auto">
                <button type="submit" class="flex-1 md:flex-none bg-emerald-600 text-white px-6 py-4 rounded-2xl font-bold text-sm shadow-md hover:bg-emerald-700 transition">
                    Filter Data
                </button>
                @if(request('search'))
                    <a href="{{ route('dukungan.sebaran.index') }}" class="flex-1 md:flex-none bg-slate-100 text-slate-600 px-6 py-4 rounded-2xl font-bold text-sm hover:bg-slate-200 transition text-center flex items-center justify-center">
                        Reset
                    </a>
                @endif
            </div>
        </form>
    </div>

    <div class="bg-white rounded-[40px] border border-slate-200 shadow-sm overflow-hidden">
        <div class="p-8 border-b border-slate-100 bg-slate-50/50 flex justify-between items-center">
            <h3 class="font-black text-slate-800 text-sm uppercase tracking-widest">Daftar Database IKM Terintegrasi</h3>
            <span class="text-[11px] font-bold text-emerald-600 bg-emerald-50 px-3 py-1 rounded-full border border-emerald-100">Total: {{ $sebaranList->total() }} Data</span>
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="text-[10px] font-black text-slate-400 uppercase tracking-widest border-b border-slate-100 whitespace-nowrap">
                        <th class="px-6 py-5 text-center">No</th>
                        <th class="px-6 py-5">Nama Usaha / Pemilik</th>
                        <th class="px-6 py-5">NIB & NIK</th>
                        <th class="px-6 py-5">Kontak & Produk</th>
                        <th class="px-6 py-5">Alamat Lengkap</th>
                        <th class="px-6 py-5">Kategori, Skala & Risiko</th>
                        <th class="px-6 py-5">KBLI & Uraian (2025)</th>
                        <th class="px-6 py-5">Investasi & Tenaga Kerja</th>
                        <th class="px-6 py-5">Koordinat (Lat, Lng)</th>
                        <th class="px-6 py-5 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-50">
                    @forelse($sebaranList as $sebaran)
                    <tr class="hover:bg-slate-50/50 transition">
                        <td class="px-6 py-5 text-center font-mono text-xs font-bold text-slate-400">
                            {{ ($sebaranList->currentPage() - 1) * $sebaranList->perPage() + $loop->iteration }}
                        </td>
                        <td class="px-6 py-5">
                            <span class="font-bold text-slate-700 block leading-tight">{{ $sebaran->nama_usaha }}</span>
                            <span class="text-xs text-slate-400 block mt-0.5 font-medium"><i class="bi bi-person text-emerald-600"></i> {{ $sebaran->pemilik }}</span>
                        </td>
                        <td class="px-6 py-5">
                            <span class="text-xs font-semibold text-slate-600 block">NIB: <span class="font-mono text-slate-700">{{ $sebaran->nib ?? '-' }}</span></span>
                            <span class="text-xs font-semibold text-slate-500 block">NIK: <span class="font-mono text-slate-700">{{ $sebaran->nik ?? '-' }}</span></span>
                        </td>
                        <td class="px-6 py-5">
                            <span class="text-xs font-semibold text-slate-600 block"><i class="bi bi-telephone text-emerald-600"></i> {{ $sebaran->no_hp ?? '-' }}</span>
                            <span class="text-xs font-medium text-slate-500 block"><i class="bi bi-box text-emerald-600"></i> {{ $sebaran->produk ?? '-' }}</span>
                        </td>
                        <td class="px-6 py-5 text-xs text-slate-600 max-w-xs">
                            <span class="font-semibold block text-slate-700">{{ $sebaran->alamat_jalan }} @if($sebaran->alamat_no && $sebaran->alamat_no != '-') No. {{ $sebaran->alamat_no }}@endif</span>
                            <span class="text-[10px] text-slate-450 font-bold block uppercase mt-0.5">Kel. {{ $sebaran->kelurahan }}, Kec. {{ $sebaran->kecamatan }}, {{ $sebaran->kota_madiun }}</span>
                        </td>
                        <td class="px-6 py-5">
                            <div class="space-y-1">
                                <span class="inline-block bg-emerald-50 text-emerald-700 px-3 py-0.5 rounded-full text-[10px] font-black uppercase border border-emerald-100">
                                    {{ $sebaran->kategori }}
                                </span>
                                <span class="block text-[10px] font-extrabold text-slate-400 uppercase tracking-wider">Skala: {{ $sebaran->skala_usaha ?? 'Mikro' }}</span>
                                <span class="block text-[10px] font-extrabold text-slate-450 uppercase tracking-wider">Risiko: {{ $sebaran->tingkat_risiko ?? 'Rendah' }}</span>
                            </div>
                        </td>
                        <td class="px-6 py-5 max-w-xs">
                            <span class="inline-block bg-indigo-50 text-indigo-700 px-2.5 py-0.5 rounded-md text-[10px] font-black font-mono border border-indigo-100 mb-1">
                                KBLI {{ $sebaran->kbli ?? '-' }}
                            </span>
                            <span class="text-xs text-slate-600 font-semibold block line-clamp-2 leading-tight">
                                {{ $sebaran->uraian_kbli ?? '-' }}
                            </span>
                        </td>
                        <td class="px-6 py-5 whitespace-nowrap">
                            <span class="text-xs font-black text-emerald-700 block">
                                Rp {{ number_format($sebaran->investasi ?? 0, 0, ',', '.') }}
                            </span>
                            <span class="text-[11px] font-bold text-slate-500 block mt-0.5">
                                <i class="bi bi-people text-emerald-600"></i> {{ $sebaran->tenaga_kerja ?? 0 }} Pekerja
                            </span>
                        </td>
                        <td class="px-6 py-5 font-mono text-xs text-slate-500 whitespace-nowrap">
                            {{ $sebaran->latitude }}, {{ $sebaran->longitude }}
                        </td>
                        <td class="px-6 py-5">
                            <div class="flex justify-center gap-2">
                                <button onclick="openEditModal({{ $sebaran->id }}, '{{ addslashes($sebaran->nama_usaha) }}', '{{ addslashes($sebaran->pemilik) }}', '{{ $sebaran->nib }}', '{{ $sebaran->nik }}', '{{ $sebaran->no_hp }}', '{{ addslashes($sebaran->produk) }}', '{{ addslashes($sebaran->alamat_jalan) }}', '{{ addslashes($sebaran->alamat_no) }}', '{{ addslashes($sebaran->kelurahan) }}', '{{ addslashes($sebaran->kecamatan) }}', '{{ addslashes($sebaran->kategori) }}', '{{ addslashes($sebaran->skala_usaha) }}', '{{ addslashes($sebaran->tingkat_risiko) }}', '{{ $sebaran->kbli }}', '{{ addslashes($sebaran->uraian_kbli) }}', '{{ $sebaran->investasi }}', '{{ $sebaran->tenaga_kerja }}', '{{ $sebaran->latitude }}', '{{ $sebaran->longitude }}')" 
                                        class="h-9 w-9 flex items-center justify-center rounded-xl bg-amber-50 text-amber-600 hover:bg-amber-600 hover:text-white hover:scale-105 active:scale-95 transition-all shadow-sm">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                    </svg>
                                </button>

                                <button type="button" onclick="confirmDelete({{ $sebaran->id }}, '{{ addslashes($sebaran->nama_usaha) }}')" 
                                        class="h-9 w-9 flex items-center justify-center rounded-xl bg-red-50 text-red-500 hover:bg-red-500 hover:text-white hover:scale-105 active:scale-95 transition-all shadow-sm">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>
                                </button>
                            </div>
                            
                            <form id="delete-form-{{ $sebaran->id }}" action="{{ route('dukungan.sebaran.destroy', $sebaran->id) }}" method="POST" style="display: none;">
                                @csrf
                                @method('DELETE')
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="8" class="text-center py-12 text-slate-400 font-medium">Belum ada data sebaran titik peta.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        
        {{-- MODERN INTERACTIVE PAGINATION --}}
        @if($sebaranList->hasPages())
        <div class="flex items-center justify-between px-8 py-6 bg-white border-t border-slate-100">
            <div class="text-xs font-bold text-slate-450">
                Menampilkan <span class="text-slate-700">{{ $sebaranList->firstItem() }}</span> sampai <span class="text-slate-700">{{ $sebaranList->lastItem() }}</span> dari <span class="text-slate-700">{{ $sebaranList->total() }}</span> data
            </div>
            <div class="flex gap-2">
                {{-- Previous Link --}}
                @if ($sebaranList->onFirstPage())
                    <span class="px-4 py-2 text-xs font-bold text-slate-300 bg-slate-50 border border-slate-100 rounded-xl cursor-not-allowed">Sebelumnya</span>
                @else
                    <a href="{{ $sebaranList->previousPageUrl() }}" class="px-4 py-2 text-xs font-bold text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-xl transition shadow-sm">Sebelumnya</a>
                @endif

                {{-- Page List --}}
                @foreach ($sebaranList->getUrlRange(max(1, $sebaranList->currentPage() - 2), min($sebaranList->lastPage(), $sebaranList->currentPage() + 2)) as $page => $url)
                    @if ($page == $sebaranList->currentPage())
                        <span class="px-3.5 py-2 text-xs font-black text-white bg-emerald-600 rounded-xl shadow-md shadow-emerald-600/20">{{ $page }}</span>
                    @else
                        <a href="{{ $url }}" class="px-3.5 py-2 text-xs font-bold text-slate-500 hover:bg-slate-150 border border-transparent rounded-xl transition">{{ $page }}</a>
                    @endif
                @endforeach

                {{-- Next Link --}}
                @if ($sebaranList->hasMorePages())
                    <a href="{{ $sebaranList->nextPageUrl() }}" class="px-4 py-2 text-xs font-bold text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-xl transition shadow-sm">Berikutnya</a>
                @else
                    <span class="px-4 py-2 text-xs font-bold text-slate-300 bg-slate-50 border border-slate-100 rounded-xl cursor-not-allowed">Berikutnya</span>
                @endif
            </div>
        </div>
        @endif
    </div>
</div>

{{-- MODAL TAMBAH --}}
<div id="modalTambah" class="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
    <div class="bg-white w-full max-w-2xl rounded-[40px] p-10 shadow-2xl overflow-y-auto max-h-[90vh]">
        <h3 class="text-2xl font-black text-slate-800 mb-2 uppercase">Tambah Data IKM Baru</h3>
        <p class="text-slate-400 text-xs mb-6 font-medium italic">Silahkan isi kredensial dan detail pelaku usaha binaan baru.</p>
        
        <form action="{{ route('dukungan.sebaran.store') }}" method="POST" class="space-y-5">
            @csrf
            
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nama Usaha</label>
                    <input type="text" name="nama_usaha" required placeholder="Nama Usaha / Perusahaan" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nama Pemilik</label>
                    <input type="text" name="pemilik" required placeholder="Nama Pemilik" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">NIB (13 Digit)</label>
                    <input type="text" name="nib" id="tambah_nib" oninput="checkDuplicateTambah()" required maxlength="13" minlength="13" placeholder="13 Digit Nomor Induk Berusaha" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition font-mono">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">NIK Pemilik (16 Digit)</label>
                    <input type="text" name="nik" id="tambah_nik" oninput="checkDuplicateTambah()" required maxlength="16" minlength="16" placeholder="16 Digit NIK KTP Pemilik" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition font-mono">
                </div>
            </div>

            <!-- WARNING BOX DUPLIKASI DATA REAL-TIME -->
            <div id="tambah_duplicate_warning" class="hidden bg-rose-50 border border-rose-200 text-rose-700 px-5 py-4 rounded-2xl text-xs font-semibold shadow-sm space-y-1">
                <div class="flex items-center gap-2 text-rose-800 font-black uppercase text-[11px] tracking-wider">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-rose-600" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
                    <span>Peringatan Kesamaan Data!</span>
                </div>
                <div id="tambah_duplicate_details"></div>
                <p class="text-[10px] text-rose-500 font-bold italic pt-1">* Data tidak bisa disimpan jika NIB/NIK memiliki kesamaan dengan database.</p>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nomor HP</label>
                    <input type="text" name="no_hp" required placeholder="Contoh: 081234567890" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Produk Yang Diproduksi</label>
                    <input type="text" name="produk" required placeholder="Contoh: Sambel Pecel, Kripik Tempe" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-4">
                <div class="col-span-2">
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Alamat (Nama Jalan)</label>
                    <input type="text" name="alamat_jalan" required placeholder="Contoh: Jl. Pahlawan" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nomor Rumah</label>
                    <input type="text" name="alamat_no" required placeholder="Contoh: 24A atau 15" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kelurahan</label>
                    <input type="text" name="kelurahan" required placeholder="Kelurahan" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kecamatan</label>
                    <input type="text" name="kecamatan" required placeholder="Kecamatan" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kota</label>
                    <input type="text" name="kota_madiun" readonly value="Kota Madiun" class="w-full bg-slate-100 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-550 cursor-not-allowed outline-none">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kategori Usaha</label>
                    <select name="kategori" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                        <option value="Pangan">Pangan</option>
                        <option value="Sandang">Sandang</option>
                        <option value="Kerajinan (Kriya)">Kerajinan (Kriya)</option>
                        <option value="Kimia dan Furnitur">Kimia dan Furnitur</option>
                        <option value="Logam dan Mesin">Logam dan Mesin</option>
                    </select>
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Skala Usaha</label>
                    <select name="skala_usaha" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                        <option value="Mikro">Mikro</option>
                        <option value="Kecil">Kecil</option>
                        <option value="Menengah">Menengah</option>
                        <option value="Besar">Besar</option>
                    </select>
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Tingkat Risiko</label>
                    <select name="tingkat_risiko" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                        <option value="Rendah">Rendah</option>
                        <option value="Menengah Rendah">Menengah Rendah</option>
                        <option value="Menengah Tinggi">Menengah Tinggi</option>
                        <option value="Tinggi">Tinggi</option>
                    </select>
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div class="relative">
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">KBLI 2025</label>
                    <input type="text" name="kbli" id="tambah_kbli" autocomplete="off" oninput="lookupKbliTambah(this.value)" onfocus="if(this.value.length >= 2) document.getElementById('tambah_kbli_suggestions').classList.remove('hidden')" placeholder="Ketik Kode KBLI 2025" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition font-mono">
                    <div id="tambah_kbli_suggestions" class="absolute left-0 right-0 mt-1.5 bg-white border border-slate-200 rounded-2xl shadow-xl z-50 max-h-48 overflow-y-auto divide-y divide-slate-100 hidden"></div>
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Uraian KBLI 2025</label>
                    <input type="text" name="uraian_kbli" id="tambah_uraian_kbli" readonly placeholder="Otomatis terisi dari KBLI 2025" class="w-full bg-slate-100 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-semibold text-slate-500 cursor-not-allowed outline-none">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nilai Investasi (Rupiah)</label>
                    <input type="number" name="investasi" required placeholder="Contoh: 50000000" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Jumlah Tenaga Kerja (Orang)</label>
                    <input type="number" name="tenaga_kerja" required placeholder="Contoh: 5" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Latitude</label>
                    <input type="text" name="latitude" required placeholder="-7.6298" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Longitude</label>
                    <input type="text" name="longitude" required placeholder="111.5295" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none focus:border-emerald-500 transition">
                </div>
            </div>
            
            <div class="flex gap-4 pt-4">
                <button type="button" onclick="closeTambahModal()" class="flex-1 px-6 py-4 rounded-2xl font-bold text-slate-400 hover:bg-slate-100 transition text-sm">Batal</button>
                <button type="submit" id="btn_simpan_tambah" class="flex-1 bg-emerald-600 text-white px-6 py-4 rounded-2xl font-bold text-sm shadow-lg hover:bg-emerald-700 transition">Simpan Data IKM</button>
            </div>
        </form>
    </div>
</div>

{{-- MODAL EDIT INTERAKTIF & COLORFUL --}}
<div id="modalEdit" class="fixed inset-0 bg-slate-900/70 backdrop-blur-md z-50 hidden flex items-center justify-center p-4 transition-all duration-300">
    <div class="bg-white w-full max-w-2xl rounded-[40px] shadow-2xl overflow-hidden transform scale-95 transition-all duration-300 border-4 border-emerald-500/20">
        
        <!-- Header Colorful Gradient -->
        <div class="bg-gradient-to-r from-emerald-500 via-teal-500 to-indigo-500 px-10 py-8 text-white relative">
            <div class="absolute right-8 top-8 opacity-10 text-9xl font-black pointer-events-none">EDIT</div>
            <h3 class="text-3xl font-black uppercase tracking-tight">Perbarui Data IKM</h3>
            <p class="text-emerald-50/80 text-xs font-semibold tracking-wide uppercase mt-1">Modifikasi Data Profil, KBLI & Lokasi IKM</p>
        </div>
        
        <form id="formEditSebaran" method="POST" onsubmit="submitEditForm(event)" class="p-10 space-y-6 max-h-[70vh] overflow-y-auto">
            @csrf
            @method('PUT')
            
            <div class="grid grid-cols-2 gap-5">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nama Usaha</label>
                    <input type="text" name="nama_usaha" id="edit_nama_usaha" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nama Pemilik</label>
                    <input type="text" name="pemilik" id="edit_pemilik" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-5">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">NIB (13 Digit)</label>
                    <input type="text" name="nib" id="edit_nib" oninput="checkDuplicateEdit()" required maxlength="13" minlength="13" class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition font-mono">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">NIK Pemilik (16 Digit)</label>
                    <input type="text" name="nik" id="edit_nik" oninput="checkDuplicateEdit()" required maxlength="16" minlength="16" class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition font-mono">
                </div>
            </div>

            <!-- WARNING BOX DUPLIKASI DATA REAL-TIME EDIT -->
            <div id="edit_duplicate_warning" class="hidden bg-rose-50 border border-rose-200 text-rose-700 px-5 py-4 rounded-2xl text-xs font-semibold shadow-sm space-y-1">
                <div class="flex items-center gap-2 text-rose-800 font-black uppercase text-[11px] tracking-wider">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-rose-600" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
                    <span>Peringatan Kesamaan Data!</span>
                </div>
                <div id="edit_duplicate_details"></div>
                <p class="text-[10px] text-rose-500 font-bold italic pt-1">* Data tidak bisa disimpan jika NIB/NIK memiliki kesamaan dengan IKM lain.</p>
            </div>

            <div class="grid grid-cols-2 gap-5">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nomor HP</label>
                    <input type="text" name="no_hp" id="edit_no_hp" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Produk Yang Diproduksi</label>
                    <input type="text" name="produk" id="edit_produk" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-5">
                <div class="col-span-2">
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Alamat (Nama Jalan)</label>
                    <input type="text" name="alamat_jalan" id="edit_alamat_jalan" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nomor Rumah</label>
                    <input type="text" name="alamat_no" id="edit_alamat_no" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-5">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kelurahan</label>
                    <input type="text" name="kelurahan" id="edit_kelurahan" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kecamatan</label>
                    <input type="text" name="kecamatan" id="edit_kecamatan" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kota</label>
                    <input type="text" name="kota_madiun" readonly value="Kota Madiun" class="w-full bg-slate-100 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-550 cursor-not-allowed outline-none">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-5">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kategori Usaha</label>
                    <select name="kategori" id="edit_kategori" required class="w-full bg-gradient-to-r from-emerald-50 to-emerald-100/30 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                        <option value="Pangan">Pangan</option>
                        <option value="Sandang">Sandang</option>
                        <option value="Kerajinan (Kriya)">Kerajinan (Kriya)</option>
                        <option value="Kimia dan Furnitur">Kimia dan Furnitur</option>
                        <option value="Logam dan Mesin">Logam dan Mesin</option>
                    </select>
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Skala Usaha</label>
                    <select name="skala_usaha" id="edit_skala_usaha" required class="w-full bg-gradient-to-r from-teal-50 to-teal-100/30 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                        <option value="Mikro">Mikro</option>
                        <option value="Kecil">Kecil</option>
                        <option value="Menengah">Menengah</option>
                        <option value="Besar">Besar</option>
                    </select>
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Tingkat Risiko</label>
                    <select name="tingkat_risiko" id="edit_tingkat_risiko" required class="w-full bg-gradient-to-r from-indigo-50 to-indigo-100/30 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                        <option value="Rendah">Rendah</option>
                        <option value="Menengah Rendah">Menengah Rendah</option>
                        <option value="Menengah Tinggi">Menengah Tinggi</option>
                        <option value="Tinggi">Tinggi</option>
                    </select>
                </div>
            </div>

            <div class="grid grid-cols-2 gap-5">
                <div class="relative">
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">KBLI 2025</label>
                    <input type="text" name="kbli" id="edit_kbli" autocomplete="off" oninput="lookupKbliEdit(this.value)" onfocus="if(this.value.length >= 2) document.getElementById('edit_kbli_suggestions').classList.remove('hidden')" class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition font-mono">
                    <div id="edit_kbli_suggestions" class="absolute left-0 right-0 mt-1.5 bg-white border border-slate-200 rounded-2xl shadow-xl z-50 max-h-48 overflow-y-auto divide-y divide-slate-100 hidden"></div>
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Uraian KBLI 2025</label>
                    <input type="text" name="uraian_kbli" id="edit_uraian_kbli" readonly class="w-full bg-slate-100 border border-slate-200 rounded-2xl px-5 py-3.5 text-sm font-semibold text-slate-500 cursor-not-allowed outline-none">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-5">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nilai Investasi (Rupiah)</label>
                    <input type="number" name="investasi" id="edit_investasi" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Jumlah Tenaga Kerja (Orang)</label>
                    <input type="number" name="tenaga_kerja" id="edit_tenaga_kerja" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-5">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Latitude</label>
                    <input type="text" name="latitude" id="edit_latitude" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Longitude</label>
                    <input type="text" name="longitude" id="edit_longitude" required class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl px-5 py-3.5 text-sm font-bold text-slate-700 outline-none transition">
                </div>
            </div>
            
            <div class="flex gap-4 pt-6 border-t border-slate-100">
                <button type="button" onclick="closeEditModal()" class="flex-1 px-6 py-4 rounded-2xl font-bold text-slate-400 hover:bg-slate-100 transition text-sm">Batal</button>
                <button type="submit" id="btn_simpan_edit" class="flex-1 bg-gradient-to-r from-emerald-600 to-indigo-600 text-white px-6 py-4 rounded-2xl font-bold text-sm shadow-lg shadow-indigo-600/20 hover:from-emerald-700 hover:to-indigo-700 transition">Simpan Perubahan</button>
            </div>
        </form>
    </div>
</div>

<script>
    // Notifikasi sukses disembunyikan otomatis
    setTimeout(function() {
        let alert = document.getElementById('success-alert');
        if (alert) {
            alert.style.transition = "opacity 0.5s ease";
            alert.style.opacity = "0";
            setTimeout(() => alert.remove(), 500);
        }
    }, 3000);

    // Hasil Unggah Massal SweetAlert dengan auto-dismiss 5 detik
    @if(session('import_results'))
        (function() {
            let seconds = 5;
            let timerInterval;
            let importRes = @json(session('import_results'));
            let htmlContent = `
                <div class="text-left text-xs font-semibold space-y-3">
                    <div class="bg-emerald-50 text-emerald-700 p-3 rounded-xl border border-emerald-100 flex justify-between">
                        <span>✅ Berhasil Diunggah:</span>
                        <span class="font-black">${importRes.success} Data</span>
                    </div>
                    <div class="bg-rose-50 text-rose-700 p-3 rounded-xl border border-rose-100 flex justify-between">
                        <span>❌ Gagal Diunggah:</span>
                        <span class="font-black">${importRes.failed} Data</span>
                    </div>
            `;

            if (importRes.failed_details.length > 0) {
                htmlContent += `
                    <div class="mt-4">
                        <p class="font-bold text-slate-700 mb-2 uppercase text-[10px] tracking-wider">Detail Kegagalan:</p>
                        <div class="max-h-40 overflow-y-auto border border-slate-200 rounded-xl divide-y divide-slate-100">
                `;
                importRes.failed_details.forEach(detail => {
                    htmlContent += `
                        <div class="p-3 flex justify-between items-center text-[10px] gap-2">
                            <span class="text-slate-800 font-extrabold truncate max-w-[120px]" title="${detail.identifier}">${detail.identifier}</span>
                            <span class="text-slate-400 font-mono text-[9px]">Baris ${detail.row}</span>
                            <span class="bg-rose-50 text-rose-600 px-2 py-0.5 rounded-full font-black border border-rose-100">${detail.reason}</span>
                        </div>
                    `;
                });
                htmlContent += `
                        </div>
                    </div>
                `;
            }
            htmlContent += `
                    <p class="text-center text-[10px] text-slate-400 pt-3">Popup ini akan tertutup otomatis dalam <b>5</b> detik.</p>
                </div>
            `;

            Swal.fire({
                title: 'Hasil Unggah Massal',
                html: htmlContent,
                icon: importRes.failed > 0 ? 'warning' : 'success',
                confirmButtonColor: '#10b981',
                confirmButtonText: 'Oke',
                timer: 5000,
                timerProgressBar: true,
                borderRadius: '24px',
                didOpen: () => {
                    const b = Swal.getHtmlContainer().querySelector('b');
                    timerInterval = setInterval(() => {
                        seconds--;
                        if (b) b.textContent = seconds;
                    }, 1000);
                },
                willClose: () => {
                    clearInterval(timerInterval);
                }
            });
        })();
    @endif

    // POPUP KONFIRMASI UNGGAH MASSAL DUPLIKASI DATA
    @if(session('import_confirm_popup'))
        (function() {
            let popData = @json(session('import_confirm_popup'));
            
            let htmlContent = `
                <div class="text-left text-xs space-y-3 font-sans">
                    <div class="bg-rose-50 text-rose-700 p-3.5 rounded-2xl border border-rose-200 flex justify-between items-center shadow-sm">
                        <span class="font-bold">❌ Data Tertolak (Duplikat Peta Sebaran):</span>
                        <span class="font-black text-sm bg-rose-200/80 text-rose-900 px-3 py-1 rounded-xl">${popData.duplicate_count} Data</span>
                    </div>
                    <div class="bg-emerald-50 text-emerald-700 p-3.5 rounded-2xl border border-emerald-200 flex justify-between items-center shadow-sm">
                        <span class="font-bold">✅ Data Berbeda Siap Diproses:</span>
                        <span class="font-black text-sm bg-emerald-200/80 text-emerald-900 px-3 py-1 rounded-xl">${popData.valid_count} Data</span>
                    </div>
            `;

            if (popData.duplicate_details && popData.duplicate_details.length > 0) {
                htmlContent += `
                    <div class="mt-3">
                        <p class="font-black text-slate-700 mb-2 uppercase text-[10px] tracking-wider flex items-center gap-1">
                            <span class="text-rose-500">●</span> Detail Data Tertolak Karena Kesamaan NIB / NIK:
                        </p>
                        <div class="max-h-48 overflow-y-auto border border-slate-200 rounded-2xl divide-y divide-slate-100 bg-slate-50/50 p-1">
                `;
                popData.duplicate_details.forEach(item => {
                    htmlContent += `
                        <div class="p-3 text-[11px] space-y-1">
                            <div class="flex justify-between items-center">
                                <span class="font-black text-slate-800">${item.nama_usaha}</span>
                                <span class="text-[9px] font-mono font-bold bg-slate-200 text-slate-600 px-2 py-0.5 rounded-md">Baris #${item.row}</span>
                            </div>
                            <div class="text-[10px] text-slate-500 font-medium">Pemilik: ${item.pemilik} | NIB: <span class="font-mono text-slate-700">${item.nib}</span> | NIK: <span class="font-mono text-slate-700">${item.nik}</span></div>
                            <div class="text-[10px] text-rose-700 font-semibold bg-rose-100/80 p-2 rounded-xl border border-rose-200/60 mt-1">${item.reason}</div>
                        </div>
                    `;
                });
                htmlContent += `
                        </div>
                    </div>
                `;
            }

            if (popData.valid_count > 0) {
                htmlContent += `
                    <div class="pt-3 text-center border-t border-slate-100 mt-2">
                        <p class="text-xs text-slate-700 font-bold">Apakah Anda ingin tetap memproses & menyimpan <span class="text-emerald-600 font-black">${popData.valid_count} data IKM yang berbeda</span> tersebut ke dalam database?</p>
                    </div>
                `;
            } else {
                htmlContent += `
                    <div class="pt-3 text-center border-t border-slate-100 mt-2">
                        <p class="text-xs text-rose-600 font-bold">Semua data pada berkas Excel memiliki kesamaan NIB/NIK dengan database Peta Sebaran. Tidak ada data baru yang dapat diproses.</p>
                    </div>
                `;
            }

            htmlContent += `</div>`;

            Swal.fire({
                title: 'Hasil Pemeriksaan Unggah Massal',
                html: htmlContent,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: popData.valid_count > 0 ? '#10b981' : '#94a3b8',
                cancelButtonColor: '#ef4444',
                confirmButtonText: popData.valid_count > 0 ? `Ya, Proses ${popData.valid_count} Data Berbeda` : 'Tutup',
                cancelButtonText: 'Batal Unggah',
                showConfirmButton: popData.valid_count > 0,
                borderRadius: '28px',
                allowOutsideClick: false,
            }).then((result) => {
                if (result.isConfirmed && popData.valid_count > 0) {
                    document.getElementById('formCommitImport').submit();
                }
            });
        })();
    @endif

    // REAL-TIME DUPLICATE CHECKING FOR TAMBAH MODAL
    let timerTambahNibNik = null;
    function checkDuplicateTambah() {
        clearTimeout(timerTambahNibNik);
        timerTambahNibNik = setTimeout(() => {
            let nib = document.getElementById('tambah_nib').value.trim();
            let nik = document.getElementById('tambah_nik').value.trim();
            let warnBox = document.getElementById('tambah_duplicate_warning');
            let detailsDiv = document.getElementById('tambah_duplicate_details');
            let submitBtn = document.getElementById('btn_simpan_tambah');
            let inputNib = document.getElementById('tambah_nib');
            let inputNik = document.getElementById('tambah_nik');

            if (nib.length !== 13 && nik.length !== 16) {
                warnBox.classList.add('hidden');
                inputNib.classList.remove('border-rose-500', 'bg-rose-50/20');
                inputNik.classList.remove('border-rose-500', 'bg-rose-50/20');
                submitBtn.disabled = false;
                submitBtn.classList.remove('opacity-50', 'cursor-not-allowed');
                return;
            }

            fetch(`/dukungan/sebaran/check-duplikasi?nib=${encodeURIComponent(nib)}&nik=${encodeURIComponent(nik)}`)
                .then(res => res.json())
                .then(data => {
                    if (data.is_duplicate) {
                        let html = '';
                        if (data.duplicate_nib) {
                            inputNib.classList.add('border-rose-500', 'bg-rose-50/20');
                            html += `<p class="text-rose-700 text-xs">⚠️ <b>NIB (${data.duplicate_nib.nib})</b> sudah terdaftar! (Nama Usaha: <b>${data.duplicate_nib.nama_usaha}</b> - Pemilik: <b>${data.duplicate_nib.pemilik}</b>)</p>`;
                        } else {
                            inputNib.classList.remove('border-rose-500', 'bg-rose-50/20');
                        }

                        if (data.duplicate_nik) {
                            inputNik.classList.add('border-rose-500', 'bg-rose-50/20');
                            html += `<p class="text-rose-700 text-xs">⚠️ <b>NIK (${data.duplicate_nik.nik})</b> sudah terdaftar! (Nama Usaha: <b>${data.duplicate_nik.nama_usaha}</b> - Pemilik: <b>${data.duplicate_nik.pemilik}</b>)</p>`;
                        } else {
                            inputNik.classList.remove('border-rose-500', 'bg-rose-50/20');
                        }

                        detailsDiv.innerHTML = html;
                        warnBox.classList.remove('hidden');
                        submitBtn.disabled = true;
                        submitBtn.classList.add('opacity-50', 'cursor-not-allowed');
                    } else {
                        warnBox.classList.add('hidden');
                        inputNib.classList.remove('border-rose-500', 'bg-rose-50/20');
                        inputNik.classList.remove('border-rose-500', 'bg-rose-50/20');
                        submitBtn.disabled = false;
                        submitBtn.classList.remove('opacity-50', 'cursor-not-allowed');
                    }
                });
        }, 300);
    }

    // REAL-TIME DUPLICATE CHECKING FOR EDIT MODAL
    let currentEditId = null;
    let timerEditNibNik = null;
    function checkDuplicateEdit() {
        clearTimeout(timerEditNibNik);
        timerEditNibNik = setTimeout(() => {
            let nib = document.getElementById('edit_nib').value.trim();
            let nik = document.getElementById('edit_nik').value.trim();
            let warnBox = document.getElementById('edit_duplicate_warning');
            let detailsDiv = document.getElementById('edit_duplicate_details');
            let submitBtn = document.getElementById('btn_simpan_edit');
            let inputNib = document.getElementById('edit_nib');
            let inputNik = document.getElementById('edit_nik');

            if (nib.length !== 13 && nik.length !== 16) {
                warnBox.classList.add('hidden');
                inputNib.classList.remove('border-rose-500', 'bg-rose-50/20');
                inputNik.classList.remove('border-rose-500', 'bg-rose-50/20');
                submitBtn.disabled = false;
                submitBtn.classList.remove('opacity-50', 'cursor-not-allowed');
                return;
            }

            fetch(`/dukungan/sebaran/check-duplikasi?nib=${encodeURIComponent(nib)}&nik=${encodeURIComponent(nik)}&ignore_id=${currentEditId || ''}`)
                .then(res => res.json())
                .then(data => {
                    if (data.is_duplicate) {
                        let html = '';
                        if (data.duplicate_nib) {
                            inputNib.classList.add('border-rose-500', 'bg-rose-50/20');
                            html += `<p class="text-rose-700 text-xs">⚠️ <b>NIB (${data.duplicate_nib.nib})</b> sudah digunakan IKM lain! (Nama Usaha: <b>${data.duplicate_nib.nama_usaha}</b> - Pemilik: <b>${data.duplicate_nib.pemilik}</b>)</p>`;
                        } else {
                            inputNib.classList.remove('border-rose-500', 'bg-rose-50/20');
                        }

                        if (data.duplicate_nik) {
                            inputNik.classList.add('border-rose-500', 'bg-rose-50/20');
                            html += `<p class="text-rose-700 text-xs">⚠️ <b>NIK (${data.duplicate_nik.nik})</b> sudah digunakan IKM lain! (Nama Usaha: <b>${data.duplicate_nik.nama_usaha}</b> - Pemilik: <b>${data.duplicate_nik.pemilik}</b>)</p>`;
                        } else {
                            inputNik.classList.remove('border-rose-500', 'bg-rose-50/20');
                        }

                        detailsDiv.innerHTML = html;
                        warnBox.classList.remove('hidden');
                        submitBtn.disabled = true;
                        submitBtn.classList.add('opacity-50', 'cursor-not-allowed');
                    } else {
                        warnBox.classList.add('hidden');
                        inputNib.classList.remove('border-rose-500', 'bg-rose-50/20');
                        inputNik.classList.remove('border-rose-500', 'bg-rose-50/20');
                        submitBtn.disabled = false;
                        submitBtn.classList.remove('opacity-50', 'cursor-not-allowed');
                    }
                });
        }, 300);
    }

    function openTambahModal() {
        document.getElementById('modalTambah').classList.remove('hidden');
        checkDuplicateTambah();
    }

    function closeTambahModal() {
        document.getElementById('modalTambah').classList.add('hidden');
    }

    function openEditModal(id, name, owner, nib, nik, no_hp, produk, jalan, no, kelurahan, kecamatan, kategori, skala, risiko, kbli, uraian_kbli, investasi, tenaga_kerja, lat, lng) {
        currentEditId = id;
        document.getElementById('edit_nama_usaha').value = name;
        document.getElementById('edit_pemilik').value = owner;
        document.getElementById('edit_nib').value = nib;
        document.getElementById('edit_nik').value = nik;
        document.getElementById('edit_no_hp').value = no_hp;
        document.getElementById('edit_produk').value = produk;
        document.getElementById('edit_alamat_jalan').value = jalan;
        document.getElementById('edit_alamat_no').value = no;
        document.getElementById('edit_kelurahan').value = kelurahan;
        document.getElementById('edit_kecamatan').value = kecamatan;
        document.getElementById('edit_kategori').value = kategori;
        document.getElementById('edit_skala_usaha').value = skala;
        document.getElementById('edit_tingkat_risiko').value = risiko;
        document.getElementById('edit_kbli').value = kbli || '';
        document.getElementById('edit_uraian_kbli').value = uraian_kbli || '';
        document.getElementById('edit_investasi').value = investasi || 0;
        document.getElementById('edit_tenaga_kerja').value = tenaga_kerja || 1;
        document.getElementById('edit_latitude').value = lat;
        document.getElementById('edit_longitude').value = lng;
        
        document.getElementById('formEditSebaran').action = "/dukungan/sebaran/update/" + id; 

        checkDuplicateEdit();
        
        const modal = document.getElementById('modalEdit');
        modal.classList.remove('hidden');
        setTimeout(() => {
            modal.firstElementChild.classList.remove('scale-95');
            modal.firstElementChild.classList.add('scale-100');
        }, 50);
    }

    // KBLI AUTOCOMPLETE LOOKUP HELPERS
    function lookupKbliTambah(val) {
        if(val.length < 2) {
            document.getElementById('tambah_kbli_suggestions').classList.add('hidden');
            return;
        }
        fetch('/api/cari-kbli?q=' + val)
            .then(res => res.json())
            .then(data => {
                let container = document.getElementById('tambah_kbli_suggestions');
                if(data.length === 0) {
                    container.classList.add('hidden');
                    return;
                }
                let html = '';
                data.forEach(item => {
                    let safeTitle = item.judul.replace(/'/g, "\\'");
                    html += `<div onclick="selectKbliTambah('${item.kode}', '${safeTitle}')" class="p-2.5 hover:bg-slate-50 cursor-pointer border-b border-slate-100 last:border-0">
                                <span class="font-bold text-xs text-indigo-600 block font-mono">${item.kode}</span>
                                <span class="text-xs text-slate-600 font-medium block leading-tight">${item.judul}</span>
                            </div>`;
                });
                container.innerHTML = html;
                container.classList.remove('hidden');
            });
    }

    function selectKbliTambah(kode, judul) {
        document.getElementById('tambah_kbli').value = kode;
        document.getElementById('tambah_uraian_kbli').value = judul;
        document.getElementById('tambah_kbli_suggestions').classList.add('hidden');
    }

    function lookupKbliEdit(val) {
        if(val.length < 2) {
            document.getElementById('edit_kbli_suggestions').classList.add('hidden');
            return;
        }
        fetch('/api/cari-kbli?q=' + val)
            .then(res => res.json())
            .then(data => {
                let container = document.getElementById('edit_kbli_suggestions');
                if(data.length === 0) {
                    container.classList.add('hidden');
                    return;
                }
                let html = '';
                data.forEach(item => {
                    let safeTitle = item.judul.replace(/'/g, "\\'");
                    html += `<div onclick="selectKbliEdit('${item.kode}', '${safeTitle}')" class="p-2.5 hover:bg-slate-50 cursor-pointer border-b border-slate-100 last:border-0">
                                <span class="font-bold text-xs text-indigo-600 block font-mono">${item.kode}</span>
                                <span class="text-xs text-slate-600 font-medium block leading-tight">${item.judul}</span>
                            </div>`;
                });
                container.innerHTML = html;
                container.classList.remove('hidden');
            });
    }

    function selectKbliEdit(kode, judul) {
        document.getElementById('edit_kbli').value = kode;
        document.getElementById('edit_uraian_kbli').value = judul;
        document.getElementById('edit_kbli_suggestions').classList.add('hidden');
    }

    function closeEditModal() {
        const modal = document.getElementById('modalEdit');
        modal.firstElementChild.classList.remove('scale-100');
        modal.firstElementChild.classList.add('scale-95');
        setTimeout(() => {
            modal.classList.add('hidden');
        }, 200);
    }

    // INTERAKTIF EDIT SUBMISSION WITH COUNTDOWN
    function submitEditForm(event) {
        event.preventDefault();
        let seconds = 3;
        let timerInterval;

        Swal.fire({
            title: 'Memproses Data...',
            html: 'Data sedang disimpan. Sesi akan disimpan otomatis dalam <b>3</b> detik.',
            icon: 'info',
            showConfirmButton: false,
            allowOutsideClick: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: () => {
                const b = Swal.getHtmlContainer().querySelector('b');
                timerInterval = setInterval(() => {
                    seconds--;
                    if (b) {
                        b.textContent = seconds;
                    }
                }, 1000);
            },
            willClose: () => {
                clearInterval(timerInterval);
            }
        }).then((result) => {
            // Jalankan submit
            document.getElementById('formEditSebaran').submit();
        });
    }

    // INTERAKTIF DELETE CONFIRMATION WITH 3s COUNTDOWNS
    function confirmDelete(id, name) {
        Swal.fire({
            title: 'Konfirmasi Hapus',
            text: "Apakah Anda yakin ingin menghapus data IKM '" + name + "'?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#10b981', // Emerald-600
            cancelButtonColor: '#ef4444',
            confirmButtonText: 'Ya, Hapus Data!',
            cancelButtonText: 'Batal',
            borderRadius: '20px'
        }).then((result) => {
            if (result.isConfirmed) {
                let seconds = 3;
                let timerInterval;
                
                Swal.fire({
                    title: 'Menghapus Data...',
                    html: 'Data IKM akan dihapus secara permanen dalam <b>3</b> detik.',
                    icon: 'success',
                    showConfirmButton: false,
                    allowOutsideClick: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: () => {
                        const b = Swal.getHtmlContainer().querySelector('b');
                        timerInterval = setInterval(() => {
                            seconds--;
                            if (b) b.textContent = seconds;
                        }, 1000);
                    },
                    willClose: () => {
                        clearInterval(timerInterval);
                    }
                }).then(() => {
                    document.getElementById('delete-form-' + id).submit();
                });
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                let seconds = 3;
                let timerInterval;

                Swal.fire({
                    title: 'Dibatalkan',
                    html: 'Rencana menghapus data dibatalkan.<br>Pesan ini akan tertutup dalam <b>3</b> detik.',
                    icon: 'info',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: () => {
                        const b = Swal.getHtmlContainer().querySelector('b');
                        timerInterval = setInterval(() => {
                            seconds--;
                            if (b) b.textContent = seconds;
                        }, 1000);
                    },
                    willClose: () => {
                        clearInterval(timerInterval);
                    }
                });
            }
        });
    }

    function openImportModal() {
        document.getElementById('modalImport').classList.remove('hidden');
    }

    function closeImportModal() {
        document.getElementById('modalImport').classList.add('hidden');
    }

    function displaySelectedFile(input) {
        if(input.files && input.files.length > 0) {
            document.getElementById('fileImportLabel').innerText = input.files[0].name;
            document.getElementById('fileImportLabel').classList.remove('text-slate-650');
            document.getElementById('fileImportLabel').classList.add('text-emerald-600', 'font-black');
        }
    }

    function submitImportForm(event) {
        event.preventDefault();
        Swal.fire({
            title: 'Mengunggah Data...',
            html: 'Berkas sedang diproses. Mohon jangan menutup halaman ini.',
            allowOutsideClick: false,
            showConfirmButton: false,
            didOpen: () => {
                Swal.showLoading();
            }
        });
        document.getElementById('formImportExcel').submit();
    }
</script>

{{-- MODAL UPLOAD MASSAL --}}
<div id="modalImport" class="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
    <div class="bg-white w-full max-w-md rounded-[40px] p-10 shadow-2xl overflow-hidden border-4 border-emerald-500/10">
        <h3 class="text-2xl font-black text-slate-800 mb-2 uppercase">Unggah Massal</h3>
        <p class="text-slate-400 text-xs mb-8 font-medium italic">Pilih berkas Excel (.xlsx) yang diisi sesuai dengan template kolom database IKM.</p>
        
        <form id="formImportExcel" action="{{ route('dukungan.sebaran.import') }}" method="POST" enctype="multipart/form-data" onsubmit="submitImportForm(event)" class="space-y-6">
            @csrf
            <div class="border-2 border-dashed border-slate-200 rounded-3xl p-8 text-center bg-slate-50/50 hover:bg-slate-50 transition cursor-pointer relative" onclick="document.getElementById('fileImportInput').click()">
                <input type="file" name="file" id="fileImportInput" required class="hidden" accept=".xlsx, .xls" onchange="displaySelectedFile(this)">
                <i class="bi bi-cloud-arrow-up text-4xl text-emerald-500 mb-2 block animate-bounce"></i>
                <span class="block text-xs font-black text-slate-600 mb-1" id="fileImportLabel">Pilih file Excel</span>
                <span class="block text-[10px] text-slate-400 font-medium">Hanya mendukung format .xlsx atau .xls</span>
            </div>
            
            <div class="flex gap-4">
                <button type="button" onclick="closeImportModal()" class="flex-1 px-6 py-4 rounded-2xl font-bold text-slate-400 hover:bg-slate-100 transition text-sm">Batal</button>
                <button type="submit" class="flex-1 bg-emerald-600 text-white px-6 py-4 rounded-2xl font-bold text-sm shadow-lg hover:bg-emerald-700 transition">Unggah Sekarang</button>
            </div>
        </form>
    </div>
</div>

<form id="formCommitImport" action="{{ route('dukungan.sebaran.commit-import') }}" method="POST" style="display: none;">
    @csrf
</form>
@endsection
