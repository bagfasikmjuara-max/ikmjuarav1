@extends('layouts.admin')

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>

<div class="space-y-8" x-data="{ searchQuery: '', statusFilter: 'all' }">
    
    {{-- HEADER BAR --}}
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 p-8 rounded-[35px] text-white shadow-xl relative overflow-hidden">
        <div class="relative z-10">
            <span class="text-xs font-black text-indigo-400 uppercase tracking-[0.2em] bg-indigo-900/50 px-3 py-1 rounded-full border border-indigo-700/50">Modul Landing Page</span>
            <h2 class="text-3xl lg:text-4xl font-black mt-2 tracking-tight">Manajemen <span class="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 via-indigo-300 to-indigo-400">Publikasi & Berita</span></h2>
            <p class="text-slate-300 text-sm mt-1 max-w-xl font-medium">Kelola artikel, pengumuman, dan berita terbaru yang ditayangkan secara publik di halaman utama website IKM JUARA.</p>
        </div>
        
        <button onclick="openTambahModal()" class="relative z-10 group inline-flex items-center gap-3 bg-gradient-to-r from-amber-400 to-amber-500 hover:from-amber-500 hover:to-amber-600 text-slate-950 px-6 py-4 rounded-2xl font-black text-sm shadow-xl shadow-amber-500/20 transition-all duration-300 transform hover:scale-[1.02] active:scale-95 shrink-0">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 group-hover:rotate-90 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M12 4v16m8-8H4" />
            </svg>
            <span>Tambah Publikasi Baru</span>
        </button>

        {{-- BACKGROUND DECORATION GLOW --}}
        <div class="absolute -right-16 -bottom-16 w-64 h-64 bg-indigo-600/30 rounded-full blur-3xl pointer-events-none"></div>
        <div class="absolute -left-16 -top-16 w-64 h-64 bg-amber-500/20 rounded-full blur-3xl pointer-events-none"></div>
    </div>

    {{-- METRICS OVERVIEW CARDS --}}
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        @php
            $totalPublikasi = count($publikasi);
            $totalAktif = $publikasi->where('is_active', 1)->count();
            $totalDraft = $publikasi->where('is_active', 0)->count();
            $totalInformasi = $publikasi->where('status', 'Informasi')->count();
        @endphp

        <div class="bg-white p-6 rounded-3xl border border-slate-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-indigo-50 text-indigo-600 flex items-center justify-center font-black text-xl shadow-inner">
                📰
            </div>
            <div>
                <span class="text-xs font-extrabold text-slate-400 uppercase tracking-wider block">Total Publikasi</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalPublikasi) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-emerald-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center font-black text-xl shadow-inner">
                🌐
            </div>
            <div>
                <span class="text-xs font-extrabold text-emerald-600 uppercase tracking-wider block">Aktif di Landing Page</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalAktif) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-amber-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center font-black text-xl shadow-inner">
                📂
            </div>
            <div>
                <span class="text-xs font-extrabold text-amber-600 uppercase tracking-wider block">Draft / Sembunyi</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalDraft) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-blue-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-blue-50 text-blue-600 flex items-center justify-center font-black text-xl shadow-inner">
                📌
            </div>
            <div>
                <span class="text-xs font-extrabold text-blue-600 uppercase tracking-wider block">Kategori Informasi</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalInformasi) }}</span>
            </div>
        </div>
    </div>

    {{-- MAIN CONTENT BOARD --}}
    <div class="bg-white rounded-[35px] border border-slate-200 shadow-sm overflow-hidden">
        
        {{-- TOOLBAR & FILTER --}}
        <div class="p-6 border-b border-slate-100 bg-slate-50/50 flex flex-col md:flex-row justify-between items-stretch md:items-center gap-4">
            {{-- SEARCH BAR --}}
            <div class="relative flex-1 max-w-md">
                <span class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </span>
                <input type="text" x-model="searchQuery" placeholder="Cari berdasarkan judul atau isi berita..." class="w-full pl-11 pr-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 focus:ring-2 focus:ring-indigo-100 transition">
            </div>

            {{-- TAB FILTER STATUS --}}
            <div class="flex bg-slate-200/60 p-1.5 rounded-2xl gap-1 self-start md:self-auto">
                <button type="button" @click="statusFilter = 'all'" :class="statusFilter === 'all' ? 'bg-white text-indigo-700 shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-4 py-2 text-xs font-extrabold rounded-xl transition uppercase tracking-wider">
                    Semua ({{ $totalPublikasi }})
                </button>
                <button type="button" @click="statusFilter = 'active'" :class="statusFilter === 'active' ? 'bg-emerald-500 text-white shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-4 py-2 text-xs font-extrabold rounded-xl transition uppercase tracking-wider">
                    Aktif ({{ $totalAktif }})
                </button>
                <button type="button" @click="statusFilter = 'draft'" :class="statusFilter === 'draft' ? 'bg-amber-500 text-white shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-4 py-2 text-xs font-extrabold rounded-xl transition uppercase tracking-wider">
                    Draft ({{ $totalDraft }})
                </button>
            </div>
        </div>

        {{-- TABLE DATA PUBLIKASI --}}
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="text-[10px] font-black text-slate-400 uppercase tracking-widest bg-slate-50 border-b border-slate-100">
                        <th class="px-8 py-5">Pratinjau Thumbnail</th>
                        <th class="px-8 py-5">Judul & Ringkasan Konten</th>
                        <th class="px-8 py-5">Tanggal & Waktu</th>
                        <th class="px-8 py-5">Status Tayang</th>
                        <th class="px-8 py-5 text-center">Aksi Pengelolaan</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                    @forelse($publikasi as $row)
                    @php
                        $rowActive = (int)$row->is_active;
                        $searchableText = strtolower(addslashes($row->judul . ' ' . $row->deskripsi . ' ' . $row->status));
                    @endphp
                    <tr x-show="(statusFilter === 'all' || (statusFilter === 'active' && {{ $rowActive }} === 1) || (statusFilter === 'draft' && {{ $rowActive }} === 0)) && ('{{ $searchableText }}'.includes(searchQuery.toLowerCase()))" 
                        x-transition 
                        class="hover:bg-indigo-50/30 transition duration-200">
                        
                        {{-- THUMBNAIL GAMBAR --}}
                        <td class="px-8 py-5 min-w-[140px]">
                            <div class="relative group w-24 h-16 rounded-2xl overflow-hidden border border-slate-200 shadow-sm bg-slate-100">
                                <img src="{{ $row->gambar }}" 
                                     alt="{{ $row->judul }}" 
                                     class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300 cursor-zoom-in"
                                     onclick="window.open(this.src)"
                                     onerror="this.onerror=null;this.src='https://placehold.co/120x80/e2e8f0/475569?text=No+Image';">
                                <div class="absolute inset-0 bg-slate-900/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center pointer-events-none">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268-2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                    </svg>
                                </div>
                            </div>
                        </td>

                        {{-- JUDUL & DESKRIPSI --}}
                        <td class="px-8 py-5 max-w-md">
                            <div class="font-black text-slate-800 text-sm leading-snug hover:text-indigo-600 transition">{{ $row->judul }}</div>
                            <p class="text-xs text-slate-400 mt-1 line-clamp-2 leading-relaxed font-medium">{{ $row->deskripsi }}</p>
                            
                            <div class="flex items-center gap-2 mt-2">
                                <span class="text-[9px] px-2.5 py-0.5 rounded-full bg-indigo-50 text-indigo-600 border border-indigo-100 font-black uppercase tracking-wider">
                                    📌 {{ $row->status ?? 'Informasi' }}
                                </span>
                            </div>
                        </td>

                        {{-- TANGGAL --}}
                        <td class="px-8 py-5 min-w-[140px]">
                            <div class="text-xs font-bold text-slate-700">
                                📅 {{ \Carbon\Carbon::parse($row->tanggal)->translatedFormat('d F Y') }}
                            </div>
                            @if(!empty($row->waktu))
                                <div class="text-[10px] font-semibold text-slate-400 mt-0.5">
                                    ⏰ {{ $row->waktu }}
                                </div>
                            @endif
                        </td>

                        {{-- STATUS TAYANG (AKTIF / DRAFT) --}}
                        <td class="px-8 py-5 whitespace-nowrap">
                            @if($row->is_active)
                                <span class="inline-flex items-center gap-1.5 text-[10px] px-3 py-1.5 rounded-full bg-emerald-50 text-emerald-700 border border-emerald-200 font-black uppercase tracking-wider shadow-2xs">
                                    <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                                    <span>Aktif di Web</span>
                                </span>
                            @else
                                <span class="inline-flex items-center gap-1.5 text-[10px] px-3 py-1.5 rounded-full bg-amber-50 text-amber-700 border border-amber-200 font-black uppercase tracking-wider shadow-2xs">
                                    <span class="w-2 h-2 rounded-full bg-amber-500"></span>
                                    <span>Draft / Sembunyi</span>
                                </span>
                            @endif
                        </td>

                        {{-- AKSI PENGELOLAAN (TOGGLE, EDIT, DELETE) --}}
                        <td class="px-8 py-5">
                            <div class="flex items-center justify-center gap-2">
                                {{-- 1. TOMBOL TOGGLE STATUS TAYANG --}}
                                <form action="{{ route('admin.publikasi.toggle', $row->id) }}" method="POST">
                                    @csrf
                                    @method('PATCH')
                                    <button type="submit" 
                                            class="h-10 w-10 flex items-center justify-center rounded-2xl transition-all duration-300 {{ $row->is_active ? 'bg-emerald-50 text-emerald-600 hover:bg-emerald-600 hover:text-white' : 'bg-slate-100 text-slate-400 hover:bg-slate-600 hover:text-white' }}"
                                            title="{{ $row->is_active ? 'Sembunyikan dari Web' : 'Publikasikan ke Web' }}">
                                        @if($row->is_active)
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268-2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                            </svg>
                                        @else
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l18 18" />
                                            </svg>
                                        @endif
                                    </button>
                                </form>

                                {{-- 2. TOMBOL EDIT POSTINGAN --}}
                                <button type="button" 
                                        data-item="{{ json_encode([
                                            'id' => $row->id,
                                            'judul' => $row->judul,
                                            'tanggal' => $row->tanggal,
                                            'waktu' => $row->waktu ?? '',
                                            'status' => $row->status ?? 'Informasi',
                                            'is_active' => $row->is_active ?? 1,
                                            'deskripsi' => $row->deskripsi,
                                            'gambar' => $row->gambar
                                        ]) }}"
                                        onclick="openEditModalFromData(this)"
                                        class="h-10 w-10 flex items-center justify-center rounded-2xl bg-amber-50 text-amber-600 hover:bg-amber-500 hover:text-white transition-all duration-300 shadow-xs"
                                        title="Edit Postingan Publikasi">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                    </svg>
                                </button>

                                {{-- 3. TOMBOL HAPUS POSTINGAN --}}
                                <button type="button" 
                                        data-judul="{{ json_encode($row->judul) }}"
                                        onclick="confirmDelete({{ $row->id }}, JSON.parse(this.dataset.judul))"
                                        class="h-10 w-10 flex items-center justify-center rounded-2xl bg-rose-50 text-rose-500 hover:bg-rose-600 hover:text-white transition-all duration-300 shadow-xs"
                                        title="Hapus Postingan">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>
                                </button>

                                <form id="delete-form-{{ $row->id }}" action="{{ route('admin.publikasi.destroy', $row->id) }}" method="POST" class="hidden">
                                    @csrf
                                    @method('DELETE')
                                </form>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" class="text-center py-16 text-slate-400 font-medium">
                            <div class="w-16 h-16 bg-slate-100 rounded-full flex items-center justify-center mx-auto mb-3 text-2xl text-slate-300">
                                📭
                            </div>
                            <span>Belum ada data publikasi atau berita yang ditambahkan.</span>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>

{{-- MODAL TAMBAH PUBLIKASI --}}
<div id="modalTambah" class="fixed inset-0 bg-slate-900/70 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
    <div class="bg-white w-full max-w-xl rounded-[35px] p-8 lg:p-10 shadow-2xl animate-in fade-in zoom-in duration-200">
        <div class="flex justify-between items-center mb-6">
            <div>
                <h3 class="text-2xl font-black text-slate-800 uppercase tracking-tight">Tambah Postingan Baru</h3>
                <p class="text-xs text-slate-400 font-medium mt-0.5">Isi informasi lengkap untuk mempublikasikan berita di website.</p>
            </div>
            <button type="button" onclick="closeTambahModal()" class="w-10 h-10 rounded-full bg-slate-100 text-slate-400 hover:bg-slate-200 hover:text-slate-700 flex items-center justify-center transition">
                ✕
            </button>
        </div>

        <form action="{{ route('admin.publikasi.store') }}" method="POST" enctype="multipart/form-data" class="space-y-5">
            @csrf
            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Judul Publikasi / Berita</label>
                <input type="text" name="judul" required placeholder="Contoh: Pelatihan Pelatihan Digital Marketing IKM 2026" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Tanggal</label>
                    <input type="date" name="tanggal" value="{{ date('Y-m-d') }}" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-4 py-3.5 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Waktu (Opsional)</label>
                    <input type="text" name="waktu" placeholder="08.00 - 12.00 WIB" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-4 py-3.5 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Tipe / Status Konten</label>
                    <select name="status" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-4 py-3.5 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                        <option value="Informasi">Informasi</option>
                        <option value="Belum Dimulai">Belum Dimulai</option>
                        <option value="Selesai">Selesai</option>
                    </select>
                </div>
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Status Penayangan Web</label>
                <select name="is_active" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                    <option value="1">🟢 Langsung Aktif di Landing Page</option>
                    <option value="0">🟡 Simpan Sebagai Draft (Sembunyi)</option>
                </select>
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Deskripsi / Inti Ringkasan Berita</label>
                <textarea name="deskripsi" rows="3" required placeholder="Tuliskan ulasan atau isi ringkas berita..." class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition"></textarea>
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Unggah Gambar Utama</label>
                <input type="file" name="gambar" accept="image/*" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3 text-xs font-bold text-slate-600 outline-none focus:border-indigo-500 transition">
            </div>

            <div class="flex gap-4 pt-4">
                <button type="button" onclick="closeTambahModal()" class="flex-1 px-6 py-4 rounded-2xl font-bold text-slate-400 hover:bg-slate-100 transition text-sm">Batal</button>
                <button type="submit" class="flex-1 bg-gradient-to-r from-indigo-600 to-indigo-700 text-white px-6 py-4 rounded-2xl font-bold text-sm shadow-xl shadow-indigo-600/30 hover:from-indigo-700 hover:to-indigo-800 transition">Terbitkan Sekarang</button>
            </div>
        </form>
    </div>
</div>

{{-- MODAL EDIT PUBLIKASI --}}
<div id="modalEdit" class="fixed inset-0 bg-slate-900/70 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
    <div class="bg-white w-full max-w-xl rounded-[35px] p-8 lg:p-10 shadow-2xl animate-in fade-in zoom-in duration-200">
        <div class="flex justify-between items-center mb-6">
            <div>
                <h3 class="text-2xl font-black text-slate-800 uppercase tracking-tight">Edit Postingan Publikasi</h3>
                <p class="text-xs text-slate-400 font-medium mt-0.5">Perbarui rincian berita, gambar, atau ubah status penayangan.</p>
            </div>
            <button type="button" onclick="closeEditModal()" class="w-10 h-10 rounded-full bg-slate-100 text-slate-400 hover:bg-slate-200 hover:text-slate-700 flex items-center justify-center transition">
                ✕
            </button>
        </div>

        <form id="formEditPublikasi" method="POST" enctype="multipart/form-data" class="space-y-5">
            @csrf
            @method('PUT')
            
            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Judul Publikasi / Berita</label>
                <input type="text" name="judul" id="edit_judul" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Tanggal</label>
                    <input type="date" name="tanggal" id="edit_tanggal" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-4 py-3.5 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Waktu</label>
                    <input type="text" name="waktu" id="edit_waktu" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-4 py-3.5 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                </div>
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Tipe Konten</label>
                    <select name="status" id="edit_status" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-4 py-3.5 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                        <option value="Informasi">Informasi</option>
                        <option value="Belum Dimulai">Belum Dimulai</option>
                        <option value="Selesai">Selesai</option>
                    </select>
                </div>
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Status Penayangan Web</label>
                <select name="is_active" id="edit_is_active" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                    <option value="1">🟢 Aktif di Landing Page</option>
                    <option value="0">🟡 Sembunyi / Draft</option>
                </select>
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Deskripsi / Inti Ringkasan Berita</label>
                <textarea name="deskripsi" id="edit_deskripsi" rows="3" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition"></textarea>
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Ganti Gambar (Kosongkan Jika Tidak Diubah)</label>
                <div class="flex items-center gap-4">
                    <img id="edit_gambar_preview" class="w-16 h-12 object-cover rounded-xl border border-slate-200 shadow-xs bg-slate-100">
                    <input type="file" name="gambar" accept="image/*" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-3 text-xs font-bold text-slate-600 outline-none focus:border-indigo-500 transition">
                </div>
            </div>

            <div class="flex gap-4 pt-4">
                <button type="button" onclick="closeEditModal()" class="flex-1 px-6 py-4 rounded-2xl font-bold text-slate-400 hover:bg-slate-100 transition text-sm">Batal</button>
                <button type="submit" class="flex-1 bg-gradient-to-r from-amber-500 to-amber-600 text-slate-950 px-6 py-4 rounded-2xl font-black text-sm shadow-xl shadow-amber-500/20 hover:from-amber-600 hover:to-amber-700 transition">Simpan Perubahan</button>
            </div>
        </form>
    </div>
</div>

<script>
    function openTambahModal() {
        document.getElementById('modalTambah').classList.remove('hidden');
    }

    function closeTambahModal() {
        document.getElementById('modalTambah').classList.add('hidden');
    }

    function openEditModalFromData(btn) {
        if (!btn || !btn.dataset.item) return;
        const data = JSON.parse(btn.dataset.item);
        openEditModal(data.id, data.judul, data.tanggal, data.waktu, data.status, data.is_active, data.deskripsi, data.gambar);
    }

    function openEditModal(id, judul, tanggal, waktu, status, isActive, deskripsi, gambarUrl) {
        document.getElementById('edit_judul').value = judul;
        document.getElementById('edit_tanggal').value = tanggal;
        document.getElementById('edit_waktu').value = waktu;
        document.getElementById('edit_status').value = status;
        document.getElementById('edit_is_active').value = isActive;
        document.getElementById('edit_deskripsi').value = deskripsi;
        
        const previewImg = document.getElementById('edit_gambar_preview');
        if (previewImg) {
            previewImg.src = gambarUrl || 'https://placehold.co/120x80/e2e8f0/475569?text=No+Image';
        }

        document.getElementById('formEditPublikasi').action = "/admin/publikasi/" + id;
        document.getElementById('modalEdit').classList.remove('hidden');
    }

    function closeEditModal() {
        document.getElementById('modalEdit').classList.add('hidden');
    }

    function confirmDelete(id, judul) {
        Swal.fire({
            title: 'Hapus Postingan?',
            text: "Apakah Anda yakin ingin menghapus publikasi '" + judul + "'? Tindakan ini tidak dapat dibatalkan.",
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