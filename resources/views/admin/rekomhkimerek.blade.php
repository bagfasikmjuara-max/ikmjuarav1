@extends('layouts.dukungan')

@section('title', 'Layanan MPP - Permohonan HKI Merek')

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>

<div class="space-y-8" x-data="{ searchQuery: '', statusFilter: 'all', activeDetail: null }">
    
    {{-- HEADER BANNER FULL-COLOUR --}}
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 p-8 rounded-[35px] text-white shadow-xl relative overflow-hidden">
        <div class="relative z-10">
            <span class="text-xs font-black text-amber-400 uppercase tracking-[0.2em] bg-amber-400/10 px-3 py-1 rounded-full border border-amber-400/20">Layanan MPP Kota Madiun</span>
            <h2 class="text-3xl lg:text-4xl font-black mt-2 tracking-tight">Permohonan <span class="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 via-indigo-200 to-amber-300">Rekomendasi HKI Merek</span></h2>
            <p class="text-slate-300 text-sm mt-1 max-w-xl font-medium">Verifikasi, kelola dokumen, dan input link Google Drive Surat Rekomendasi yang telah terbit.</p>
        </div>
        
        <div class="relative z-10 flex items-center gap-3 shrink-0">
            <span class="px-5 py-3 bg-amber-400/10 border border-amber-400/30 text-amber-400 font-extrabold rounded-2xl text-xs uppercase tracking-wider">
                🏛️ Integrasi Layanan MPP
            </span>
        </div>

        <div class="absolute -right-16 -bottom-16 w-64 h-64 bg-amber-500/20 rounded-full blur-3xl pointer-events-none"></div>
        <div class="absolute -left-16 -top-16 w-64 h-64 bg-indigo-600/30 rounded-full blur-3xl pointer-events-none"></div>
    </div>

    {{-- METRICS SUMMARY CARDS --}}
    @php
        $totalPermohonan = count($permohonanList);
        $totalPending = $permohonanList->where('status', 'Pending')->count();
        $totalDisetujui = $permohonanList->where('status', 'Disetujui')->count();
        $totalDitolak = $permohonanList->where('status', 'Ditolak')->count();
    @endphp

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-white p-6 rounded-3xl border border-slate-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-indigo-50 text-indigo-600 flex items-center justify-center font-black text-xl shadow-inner">
                📋
            </div>
            <div>
                <span class="text-xs font-extrabold text-slate-400 uppercase tracking-wider block">Total Permohonan</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalPermohonan) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-amber-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center font-black text-xl shadow-inner">
                ⏳
            </div>
            <div>
                <span class="text-xs font-extrabold text-amber-600 uppercase tracking-wider block">Perlu Verifikasi</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalPending) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-emerald-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center font-black text-xl shadow-inner">
                ✅
            </div>
            <div>
                <span class="text-xs font-extrabold text-emerald-600 uppercase tracking-wider block">Disetujui / Terbit</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalDisetujui) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-rose-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-rose-50 text-rose-600 flex items-center justify-center font-black text-xl shadow-inner">
                ❌
            </div>
            <div>
                <span class="text-xs font-extrabold text-rose-600 uppercase tracking-wider block">Berkas Ditolak</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalDitolak) }}</span>
            </div>
        </div>
    </div>

    {{-- MAIN TABLE BOARD --}}
    <div class="bg-white rounded-[35px] border border-slate-200 shadow-sm overflow-hidden">
        
        {{-- TOOLBAR & FILTER --}}
        <div class="p-6 border-b border-slate-100 bg-slate-50/50 flex flex-col md:flex-row justify-between items-stretch md:items-center gap-4">
            <div class="relative flex-1 max-w-md">
                <span class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400">
                    🔍
                </span>
                <input type="text" x-model="searchQuery" placeholder="Cari nama, NIK, NIB, atau nama merek..." class="w-full pl-11 pr-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-bold text-slate-700 outline-none focus:border-amber-400 focus:ring-2 focus:ring-amber-100 transition">
            </div>

            <div class="flex bg-slate-200/60 p-1.5 rounded-2xl gap-1 self-start md:self-auto">
                <button type="button" @click="statusFilter = 'all'" :class="statusFilter === 'all' ? 'bg-white text-indigo-700 shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-4 py-2 text-xs font-extrabold rounded-xl transition uppercase tracking-wider">
                    Semua ({{ $totalPermohonan }})
                </button>
                <button type="button" @click="statusFilter = 'pending'" :class="statusFilter === 'pending' ? 'bg-amber-500 text-white shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-4 py-2 text-xs font-extrabold rounded-xl transition uppercase tracking-wider">
                    Pending ({{ $totalPending }})
                </button>
                <button type="button" @click="statusFilter = 'disetujui'" :class="statusFilter === 'disetujui' ? 'bg-emerald-500 text-white shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-4 py-2 text-xs font-extrabold rounded-xl transition uppercase tracking-wider">
                    Disetujui ({{ $totalDisetujui }})
                </button>
            </div>
        </div>

        {{-- TABLE REKOMENDASI HKI MEREK --}}
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="text-[10px] font-black text-slate-400 uppercase tracking-widest bg-slate-50 border-b border-slate-100">
                        <th class="px-6 py-5">Pemohon & Kontak</th>
                        <th class="px-6 py-5">NIK & NIB</th>
                        <th class="px-6 py-5">Nama & Kelas Merek</th>
                        <th class="px-6 py-5">Berkas Persyaratan</th>
                        <th class="px-6 py-5">Status</th>
                        <th class="px-6 py-5">Surat Rekomendasi (Link GDrive)</th>
                        <th class="px-6 py-5 text-center">Aksi & Detail</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                    @forelse($permohonanList as $row)
                    @php
                        $searchableText = strtolower(addslashes($row->nama_lengkap . ' ' . $row->nik . ' ' . $row->nib . ' ' . $row->nama_merek . ' ' . $row->kelas_merek . ' ' . $row->status));
                        $statusLower = strtolower($row->status);
                    @endphp
                    <tr x-show="(statusFilter === 'all' || (statusFilter === 'pending' && '{{ $statusLower }}' === 'pending') || (statusFilter === 'disetujui' && '{{ $statusLower }}' === 'disetujui')) && ('{{ $searchableText }}'.includes(searchQuery.toLowerCase()))" 
                        x-transition 
                        x-data="{ editingGdrive: false }"
                        class="hover:bg-amber-50/20 transition duration-150">
                        
                        {{-- PEMOHON & KONTAK --}}
                        <td class="px-6 py-5">
                            <div class="font-black text-slate-800 text-sm leading-snug">{{ $row->nama_lengkap }}</div>
                            <div class="text-xs font-bold text-indigo-600 mt-0.5">📞 {{ $row->no_hp }}</div>
                            <div class="text-[10px] text-slate-400 mt-1 line-clamp-1" title="{{ $row->alamat_ktp }}">📍 {{ $row->alamat_ktp }}</div>
                        </td>

                        {{-- NIK & NIB --}}
                        <td class="px-6 py-5 whitespace-nowrap">
                            <div class="text-xs font-mono font-bold text-slate-700">NIK: {{ $row->nik }}</div>
                            <div class="text-xs font-mono font-bold text-amber-700 mt-0.5">NIB: {{ $row->nib }}</div>
                        </td>

                        {{-- MEREK & KELAS --}}
                        <td class="px-6 py-5 max-w-xs">
                            <div class="font-black text-slate-900 text-sm leading-snug">{{ $row->nama_merek }}</div>
                            <span class="inline-block mt-1 text-[10px] px-2.5 py-0.5 rounded-full bg-indigo-50 text-indigo-700 font-bold border border-indigo-100">
                                Kelas {{ $row->kelas_merek }}
                            </span>
                        </td>

                        {{-- BERKAS PERSYARATAN --}}
                        <td class="px-6 py-5">
                            <div class="flex flex-wrap gap-1.5">
                                @if($row->file_ktp)
                                    <a href="{{ $row->file_ktp }}" target="_blank" class="text-[9px] font-extrabold px-2 py-1 bg-slate-100 text-slate-700 hover:bg-indigo-600 hover:text-white rounded-lg border transition">
                                        📄 KTP
                                    </a>
                                @endif
                                @if($row->file_nib)
                                    <a href="{{ $row->file_nib }}" target="_blank" class="text-[9px] font-extrabold px-2 py-1 bg-slate-100 text-slate-700 hover:bg-indigo-600 hover:text-white rounded-lg border transition">
                                        📄 NIB
                                    </a>
                                @endif
                                @if($row->file_etiket_merek)
                                    <a href="{{ $row->file_etiket_merek }}" target="_blank" class="text-[9px] font-extrabold px-2 py-1 bg-amber-50 text-amber-700 hover:bg-amber-500 hover:text-white rounded-lg border border-amber-200 transition">
                                        🖼️ Logo Merek
                                    </a>
                                @endif
                                @if($row->file_surat_pernyataan)
                                    <a href="{{ $row->file_surat_pernyataan }}" target="_blank" class="text-[9px] font-extrabold px-2 py-1 bg-emerald-50 text-emerald-700 hover:bg-emerald-600 hover:text-white rounded-lg border border-emerald-200 transition">
                                        📜 Surat Pernyataan
                                    </a>
                                @endif
                            </div>
                        </td>

                        {{-- STATUS --}}
                        <td class="px-6 py-5 whitespace-nowrap">
                            @if($row->status === 'Disetujui')
                                <span class="inline-flex items-center gap-1 text-[10px] px-3 py-1 rounded-full bg-emerald-50 text-emerald-700 border border-emerald-200 font-black uppercase tracking-wider">
                                    ✅ Disetujui
                                </span>
                            @elseif($row->status === 'Ditolak')
                                <span class="inline-flex items-center gap-1 text-[10px] px-3 py-1 rounded-full bg-rose-50 text-rose-700 border border-rose-200 font-black uppercase tracking-wider">
                                    ❌ Ditolak
                                </span>
                            @else
                                <span class="inline-flex items-center gap-1 text-[10px] px-3 py-1 rounded-full bg-amber-50 text-amber-700 border border-amber-200 font-black uppercase tracking-wider">
                                    ⏳ Pending
                                </span>
                            @endif
                        </td>

                        {{-- LINK GDRIVE SURAT REKOMENDASI --}}
                        <td class="px-6 py-5 min-w-[240px]">
                            @if($row->status === 'Disetujui')
                                <div x-show="!editingGdrive && '{{ $row->link_gdrive_rekom }}' !== ''" class="space-y-2">
                                    <a href="{{ $row->link_gdrive_rekom }}" target="_blank" class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-gradient-to-r from-blue-600 to-indigo-600 text-white font-extrabold text-xs shadow-sm hover:shadow transition">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" /></svg>
                                        <span>Buka Surat GDrive</span>
                                    </a>
                                    <div>
                                        <button type="button" @click="editingGdrive = true" class="text-[10px] font-bold text-indigo-600 hover:underline inline-flex items-center gap-1">
                                            ✏️ Edit Link GDrive
                                        </button>
                                    </div>
                                </div>

                                <div x-show="editingGdrive || '{{ $row->link_gdrive_rekom }}' === ''">
                                    <form action="{{ route('dukungan.rekomhkimerek.gdrive', $row->id) }}" method="POST" class="space-y-2">
                                        @csrf
                                        @method('PATCH')
                                        <input type="url" name="link_gdrive_rekom" value="{{ $row->link_gdrive_rekom }}" placeholder="Paste link Google Drive surat rekom..." required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-xl text-xs font-medium text-slate-800 outline-none focus:border-indigo-500 focus:bg-white transition">
                                        <div class="flex gap-2">
                                            <button type="submit" class="px-3 py-1.5 bg-emerald-600 hover:bg-emerald-700 text-white font-bold text-[11px] rounded-xl shadow-xs transition">
                                                💾 Simpan Link
                                            </button>
                                            <button type="button" x-show="'{{ $row->link_gdrive_rekom }}' !== ''" @click="editingGdrive = false" class="px-2 py-1.5 bg-slate-200 text-slate-700 font-bold text-[11px] rounded-xl hover:bg-slate-300 transition">
                                                Batal
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            @else
                                <span class="text-[11px] text-slate-400 italic">Pilih status "Disetujui" untuk input link GDrive.</span>
                            @endif
                        </td>

                        {{-- AKSI & LIHAT DETAIL --}}
                        <td class="px-6 py-5">
                            <div class="flex items-center justify-center gap-2">
                                {{-- LIHAT DETAIL BUTTON --}}
                                <button type="button" 
                                        @click="activeDetail = {{ json_encode($row) }}" 
                                        class="px-3 py-1.5 bg-indigo-600 hover:bg-indigo-700 text-white font-black text-xs rounded-xl shadow-xs transition flex items-center gap-1 shrink-0">
                                    <span>👁️ Lihat Detail</span>
                                </button>

                                {{-- UPDATE STATUS FORM --}}
                                <form action="{{ route('dukungan.rekomhkimerek.status', $row->id) }}" method="POST" class="flex items-center gap-1">
                                    @csrf
                                    @method('PATCH')
                                    <select name="status" onchange="this.form.submit()" class="text-xs font-bold bg-slate-100 border border-slate-200 rounded-xl px-2.5 py-1.5 outline-none focus:border-amber-400 transition">
                                        <option value="Pending" {{ $row->status === 'Pending' ? 'selected' : '' }}>⏳ Pending</option>
                                        <option value="Disetujui" {{ $row->status === 'Disetujui' ? 'selected' : '' }}>✅ Setujui</option>
                                        <option value="Ditolak" {{ $row->status === 'Ditolak' ? 'selected' : '' }}>❌ Tolak</option>
                                    </select>
                                </form>

                                {{-- DELETE BUTTON --}}
                                <button type="button" 
                                        onclick="confirmDelete({{ $row->id }}, '{{ addslashes($row->nama_lengkap) }}')" 
                                        class="h-9 w-9 flex items-center justify-center rounded-xl bg-rose-50 text-rose-500 hover:bg-rose-600 hover:text-white transition shadow-xs shrink-0"
                                        title="Hapus Permohonan">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>
                                </button>

                                <form id="delete-form-{{ $row->id }}" action="{{ route('dukungan.rekomhkimerek.destroy', $row->id) }}" method="POST" class="hidden">
                                    @csrf
                                    @method('DELETE')
                                </form>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" class="text-center py-16 text-slate-400 font-medium">
                            📭 Belum ada permohonan rekomendasi HKI Merek dari Layanan MPP.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    {{-- POP-UP MODAL DETAIL INTERAKTIF FULL COLOUR --}}
    <div x-show="activeDetail" 
         x-transition 
         class="fixed inset-0 bg-slate-950/70 backdrop-blur-md z-50 flex items-center justify-center p-4 overflow-y-auto" 
         style="display: none;">
        <div class="bg-white rounded-[35px] max-w-3xl w-full p-8 shadow-2xl space-y-6 relative overflow-hidden border border-slate-200" @click.outside="activeDetail = null">
            
            {{-- MODAL HEADER BANNER --}}
            <div class="flex justify-between items-start bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 -m-8 p-8 mb-4 text-white">
                <div>
                    <span class="text-[10px] font-black text-amber-400 uppercase tracking-widest bg-amber-400/10 px-3 py-1 rounded-full border border-amber-400/20">Detail Permohonan Rekomendasi HKI</span>
                    <h3 class="text-2xl font-black mt-2" x-text="activeDetail ? activeDetail.nama_merek : ''"></h3>
                    <p class="text-xs text-slate-300 font-medium">Kelas Merek: <span class="font-bold text-amber-300" x-text="activeDetail ? activeDetail.kelas_merek : ''"></span></p>
                </div>
                <button type="button" @click="activeDetail = null" class="w-10 h-10 rounded-2xl bg-white/10 hover:bg-white/20 text-white flex items-center justify-center font-bold text-xl transition">
                    ✕
                </button>
            </div>

            {{-- DETAIL GRID CONTENT --}}
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 pt-4">
                {{-- PEMOHON --}}
                <div class="bg-slate-50 p-5 rounded-3xl border border-slate-100 space-y-1">
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider">Nama Lengkap Pemohon</span>
                    <p class="text-sm font-black text-slate-900" x-text="activeDetail ? activeDetail.nama_lengkap : ''"></p>
                </div>

                {{-- KONTAK --}}
                <div class="bg-slate-50 p-5 rounded-3xl border border-slate-100 space-y-1">
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider">Nomor HP / WhatsApp Aktif</span>
                    <p class="text-sm font-black text-indigo-600" x-text="activeDetail ? '📞 ' + activeDetail.no_hp : ''"></p>
                </div>

                {{-- NIK --}}
                <div class="bg-slate-50 p-5 rounded-3xl border border-slate-100 space-y-1">
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider">NIK (16 Digit)</span>
                    <p class="text-sm font-mono font-bold text-slate-800" x-text="activeDetail ? activeDetail.nik : ''"></p>
                </div>

                {{-- NIB --}}
                <div class="bg-slate-50 p-5 rounded-3xl border border-slate-100 space-y-1">
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider">NIB (13 Digit)</span>
                    <p class="text-sm font-mono font-bold text-amber-700" x-text="activeDetail ? activeDetail.nib : ''"></p>
                </div>

                {{-- ALAMAT KTP --}}
                <div class="bg-slate-50 p-5 rounded-3xl border border-slate-100 space-y-1 md:col-span-2">
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider">Alamat Lengkap Pemohon (Sesuai KTP)</span>
                    <p class="text-xs font-bold text-slate-800 leading-relaxed" x-text="activeDetail ? activeDetail.alamat_ktp : ''"></p>
                </div>

                {{-- ALAMAT USAHA --}}
                <div class="bg-slate-50 p-5 rounded-3xl border border-slate-100 space-y-1 md:col-span-2">
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider">Alamat Lokasi Tempat Usaha</span>
                    <p class="text-xs font-bold text-slate-800 leading-relaxed" x-text="activeDetail ? activeDetail.alamat_usaha : ''"></p>
                </div>

                {{-- URAIAN BARANG JASA --}}
                <div class="bg-indigo-50/70 p-5 rounded-3xl border border-indigo-100 space-y-1 md:col-span-2">
                    <span class="text-[10px] font-black text-indigo-900 uppercase tracking-wider">Uraian Barang / Jasa yang Didaftarkan Merek (Sesuai Kelas)</span>
                    <p class="text-xs font-bold text-indigo-950 leading-relaxed whitespace-pre-line" x-text="activeDetail && activeDetail.uraian_barang_jasa ? activeDetail.uraian_barang_jasa : 'Belum diisi'"></p>
                </div>

                {{-- GDRIVE LINK --}}
                <div class="bg-slate-50 p-5 rounded-3xl border border-slate-100 space-y-1 md:col-span-2" x-show="activeDetail && activeDetail.link_gdrive_rekom">
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider">Tautan Google Drive Surat Rekomendasi</span>
                    <div>
                        <a :href="activeDetail ? activeDetail.link_gdrive_rekom : '#'" target="_blank" class="inline-flex items-center gap-2 text-xs font-black text-indigo-600 hover:underline">
                            🔗 <span x-text="activeDetail ? activeDetail.link_gdrive_rekom : ''"></span>
                        </a>
                    </div>
                </div>

                {{-- BERKAS LAMPIRAN --}}
                <div class="bg-slate-50 p-5 rounded-3xl border border-slate-100 space-y-3 md:col-span-2">
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider">Berkas Dokumen Lampiran</span>
                    <div class="flex flex-wrap gap-2">
                        <template x-if="activeDetail && activeDetail.file_ktp">
                            <a :href="activeDetail.file_ktp" target="_blank" class="px-4 py-2 bg-white text-slate-800 border border-slate-200 rounded-xl text-xs font-extrabold shadow-xs hover:bg-indigo-600 hover:text-white transition">
                                📄 Buka File KTP
                            </a>
                        </template>
                        <template x-if="activeDetail && activeDetail.file_nib">
                            <a :href="activeDetail.file_nib" target="_blank" class="px-4 py-2 bg-white text-slate-800 border border-slate-200 rounded-xl text-xs font-extrabold shadow-xs hover:bg-indigo-600 hover:text-white transition">
                                📄 Buka File NIB
                            </a>
                        </template>
                        <template x-if="activeDetail && activeDetail.file_etiket_merek">
                            <a :href="activeDetail.file_etiket_merek" target="_blank" class="px-4 py-2 bg-amber-50 text-amber-800 border border-amber-200 rounded-xl text-xs font-extrabold shadow-xs hover:bg-amber-500 hover:text-white transition">
                                🖼️ Buka Logo Merek
                            </a>
                        </template>
                        <template x-if="activeDetail && activeDetail.file_surat_pernyataan">
                            <a :href="activeDetail.file_surat_pernyataan" target="_blank" class="px-4 py-2 bg-emerald-50 text-emerald-800 border border-emerald-200 rounded-xl text-xs font-extrabold shadow-xs hover:bg-emerald-600 hover:text-white transition">
                                📜 Buka Surat Pernyataan
                            </a>
                        </template>
                    </div>
                </div>
            </div>

            {{-- MODAL FOOTER --}}
            <div class="pt-4 border-t border-slate-100 flex justify-end">
                <button type="button" @click="activeDetail = null" class="bg-slate-900 text-white font-bold px-6 py-3 rounded-2xl text-xs uppercase tracking-wider hover:bg-slate-800 transition">
                    Tutup Detail
                </button>
            </div>
        </div>
    </div>

</div>

<script>
    function confirmDelete(id, nama) {
        Swal.fire({
            title: 'Hapus Permohonan?',
            text: "Apakah Anda yakin ingin menghapus permohonan HKI Merek atas nama '" + nama + "'? Tindakan ini tidak dapat dibatalkan.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#ef4444',
            cancelButtonColor: '#64748b',
            confirmButtonText: 'Ya, Hapus!',
            cancelButtonText: 'Batal',
            borderRadius: '20px'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('delete-form-' + id).submit();
            }
        });
    }

    @if(session('success'))
        Swal.fire({
            title: 'Berhasil!',
            text: "{{ session('success') }}",
            icon: 'success',
            timer: 3000,
            showConfirmButton: false,
            borderRadius: '20px'
        });
    @endif

    @if(session('error'))
        Swal.fire({
            title: 'Gagal!',
            text: "{{ session('error') }}",
            icon: 'error',
            confirmButtonColor: '#4f46e5',
            borderRadius: '20px'
        });
    @endif
</script>
@endsection
