@extends('layouts.dukungan')

@section('content')
<div class="space-y-8 pb-12" x-data="daftarPesertaHandler()">
    
    <!-- HEADER TITLE & BANNER -->
    <div class="bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 text-white rounded-[35px] p-8 shadow-2xl relative overflow-hidden border border-slate-800">
        <div class="absolute -right-10 -bottom-10 opacity-15 pointer-events-none">
            <svg class="w-96 h-96 text-indigo-400" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
            </svg>
        </div>

        <div class="relative z-10 flex flex-col lg:flex-row justify-between items-start lg:items-center gap-6">
            <div>
                <div class="inline-flex items-center gap-2 bg-indigo-500/20 border border-indigo-500/30 text-indigo-300 px-3.5 py-1 rounded-full text-xs font-bold uppercase tracking-wider mb-3">
                    <span class="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
                    <span>Modul Peserta Lolos Pelatihan IKM</span>
                </div>
                <h1 class="text-3xl font-black tracking-tight">Rekap Peserta & Riwayat Pelatihan</h1>
                <p class="text-slate-300 text-xs mt-1.5 font-medium max-w-2xl leading-relaxed">
                    Kelola peserta yang diloloskan oleh Admin Dinas per kegiatan pelatihan (/admin/kegiatan), daftarkan peserta lolos via NIB/NIK, ekspor data ke Excel (.xlsx), serta lacak riwayat keikutsertaan pelatihan IKM.
                </p>
            </div>

            <!-- STAT COUNTER BADGES -->
            <div class="flex flex-wrap items-center gap-3 w-full lg:w-auto">
                <div class="bg-white/10 backdrop-blur-md border border-white/10 px-5 py-3 rounded-2xl flex-1 lg:flex-none">
                    <span class="text-[10px] font-bold text-slate-300 uppercase tracking-widest block">Total Kegiatan</span>
                    <strong class="text-xl font-black text-white block mt-0.5">{{ $totalKegiatan }}</strong>
                </div>
                <div class="bg-emerald-500/20 backdrop-blur-md border border-emerald-500/30 px-5 py-3 rounded-2xl flex-1 lg:flex-none">
                    <span class="text-[10px] font-bold text-emerald-300 uppercase tracking-widest block">Peserta Lolos Pelatihan</span>
                    <strong class="text-xl font-black text-emerald-400 block mt-0.5">{{ $totalPendaftar }}</strong>
                </div>
                <div class="bg-indigo-500/20 backdrop-blur-md border border-indigo-500/30 px-5 py-3 rounded-2xl flex-1 lg:flex-none">
                    <span class="text-[10px] font-bold text-indigo-300 uppercase tracking-widest block">IKM Pernah Lolos</span>
                    <strong class="text-xl font-black text-indigo-300 block mt-0.5">{{ $totalUniqueIkm }}</strong>
                </div>
            </div>
        </div>
    </div>

    <!-- FLASH NOTIFICATION -->
    @if(session('success'))
        <div id="success-alert" class="bg-emerald-50 border border-emerald-200 text-emerald-800 px-6 py-4 rounded-2xl font-bold text-sm shadow-sm flex items-center justify-between">
            <span class="flex items-center gap-2">🎉 {{ session('success') }}</span>
            <button onclick="document.getElementById('success-alert').remove()" class="text-emerald-500 hover:text-emerald-700 font-bold">✕</button>
        </div>
    @endif
    @if(session('error'))
        <div id="error-alert" class="bg-rose-50 border border-rose-200 text-rose-800 px-6 py-4 rounded-2xl font-bold text-sm shadow-sm flex items-center justify-between">
            <span class="flex items-center gap-2">⚠️ {{ session('error') }}</span>
            <button onclick="document.getElementById('error-alert').remove()" class="text-rose-500 hover:text-rose-700 font-bold">✕</button>
        </div>
    @endif

    <!-- SECTION 1: FITUR PENCARIAN RIWAYAT PELATIHAN PELAKU USAHA (NIB / NIK) -->
    <div class="bg-white rounded-[35px] border border-slate-200 p-8 shadow-sm space-y-6">
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 border-b border-slate-100 pb-5">
            <div>
                <h3 class="text-lg font-black text-slate-900 tracking-tight flex items-center gap-2">
                    <span>🔍 Pencarian Riwayat Pelatihan Pelaku Usaha</span>
                </h3>
                <p class="text-xs text-slate-500 font-semibold mt-1">Cari berdasarkan NIB atau NIK untuk melihat rekam jejak pelatihan yang pernah diikuti dan diloloskan bagi IKM tersebut.</p>
            </div>
        </div>

        <form action="{{ route('dukungan.daftarpeserta.index') }}" method="GET" class="flex flex-col md:flex-row gap-3">
            <div class="flex-1 relative">
                <input type="text" name="q" value="{{ $searchQuery }}" required placeholder="Masukkan 13 Digit NIB atau 16 Digit NIK Pelaku Usaha..." class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl pl-12 pr-6 py-4 text-sm font-mono font-bold text-slate-800 outline-none transition">
                <div class="absolute left-4 top-4 text-slate-400">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </div>
            </div>
            <button type="submit" class="px-8 py-4 bg-indigo-600 hover:bg-indigo-700 active:scale-95 text-white font-extrabold rounded-2xl text-xs shadow-lg shadow-indigo-600/20 transition flex items-center justify-center gap-2">
                <span>Cari Riwayat Pelatihan</span>
            </button>
            @if($searchQuery)
                <a href="{{ route('dukungan.daftarpeserta.index') }}" class="px-6 py-4 bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold rounded-2xl text-xs transition flex items-center justify-center">
                    Reset
                </a>
            @endif
        </form>

        <!-- HASIL PENCARIAN RIWAYAT -->
        @if($searchQuery)
            <div class="pt-4 border-t border-slate-100 space-y-6">
                @if($searchProfile)
                    <!-- KARTU PROFIL PELAKU USAHA -->
                    <div class="bg-gradient-to-br from-indigo-50 via-slate-50 to-purple-50 p-6 rounded-3xl border border-indigo-100 space-y-4">
                        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 border-b border-indigo-100/80 pb-4">
                            <div>
                                <span class="text-[10px] font-black text-indigo-600 uppercase tracking-widest bg-indigo-100 px-3 py-1 rounded-full border border-indigo-200">Profil Pelaku Usaha Terdaftar</span>
                                <h4 class="text-xl font-black text-slate-900 mt-2">{{ $searchProfile->nama_usaha }}</h4>
                                <p class="text-xs font-bold text-slate-600 mt-0.5">👤 {{ $searchProfile->pemilik ?? $searchProfile->nama_pemilik }}</p>
                            </div>
                            @if($searchProfile->no_hp || $searchProfile->no_telp)
                                @php
                                    $phone = preg_replace('/[^0-9]/', '', $searchProfile->no_hp ?: $searchProfile->no_telp);
                                    if (str_starts_with($phone, '0')) $phone = '62' . substr($phone, 1);
                                @endphp
                                <a href="https://wa.me/{{ $phone }}" target="_blank" class="px-4 py-2 bg-emerald-500 hover:bg-emerald-600 text-white rounded-xl text-xs font-bold shadow-md transition inline-flex items-center gap-1.5 shrink-0">
                                    <span>📱 Hubungi WA Pelaku Usaha</span>
                                </a>
                            @endif
                        </div>

                        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 text-xs">
                            <div>
                                <span class="text-slate-400 font-bold block text-[10px] uppercase">NIB</span>
                                <strong class="font-mono text-slate-800">{{ $searchProfile->nib ?: '-' }}</strong>
                            </div>
                            <div>
                                <span class="text-slate-400 font-bold block text-[10px] uppercase">NIK</span>
                                <strong class="font-mono text-slate-800">{{ $searchProfile->nik ?: '-' }}</strong>
                            </div>
                            <div>
                                <span class="text-slate-400 font-bold block text-[10px] uppercase">Kecamatan / Kelurahan</span>
                                <strong class="text-slate-800">{{ $searchProfile->kecamatan }}, {{ $searchProfile->kelurahan }}</strong>
                            </div>
                            <div>
                                <span class="text-slate-400 font-bold block text-[10px] uppercase">Kategori & Skala</span>
                                <strong class="text-slate-800">{{ $searchProfile->kategori ?: 'Pangan' }} ({{ $searchProfile->skala_usaha ?: 'Mikro' }})</strong>
                            </div>
                        </div>
                    </div>
                @endif

                <!-- DAFTAR RIWAYAT KEGIATAN -->
                <div>
                    <h4 class="text-sm font-black text-slate-900 uppercase tracking-wider mb-4 flex items-center justify-between">
                        <span>📋 Riwayat Pelatihan Yang Pernah Diloloskan ({{ $searchRiwayat->count() }} Kegiatan)</span>
                    </h4>

                    @if($searchRiwayat->count() > 0)
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                            @foreach($searchRiwayat as $rw)
                                <div class="bg-white p-6 rounded-[30px] border border-slate-200 shadow-xs space-y-4 relative hover:border-indigo-300 hover:shadow-md transition">
                                    <!-- HEADER CARD -->
                                    <div class="flex justify-between items-start gap-2 border-b border-slate-100 pb-3.5">
                                        <div>
                                            <div class="flex flex-wrap items-center gap-2 mb-1.5">
                                                <span class="text-[10px] font-black text-emerald-700 bg-emerald-100 px-2.5 py-0.5 rounded-full border border-emerald-200">
                                                    ✅ Peserta Lolos Pelatihan
                                                </span>
                                                @if($rw->sub_pelaksana)
                                                    <span class="text-[10px] font-extrabold text-indigo-700 bg-indigo-50 px-2 py-0.5 rounded-md border border-indigo-100">
                                                        📌 {{ $rw->sub_pelaksana }}
                                                    </span>
                                                @endif
                                            </div>
                                            <h5 class="text-base font-black text-slate-900 leading-snug">{{ $rw->nama_kegiatan }}</h5>
                                        </div>
                                    </div>

                                    <!-- RINCIAN DETAIL PELATIHAN / KEGIATAN MASTER -->
                                    <div class="bg-slate-50/80 rounded-2xl p-3.5 border border-slate-200/80 text-xs space-y-1.5">
                                        <div class="text-[10px] font-black text-indigo-800 uppercase tracking-widest border-b border-slate-200/60 pb-1 flex justify-between">
                                            <span>🎓 RINCIAN PELATIHAN / KEGIATAN</span>
                                            <span class="text-slate-500 font-bold">Kuota: {{ $rw->kuota_peserta ?: '-' }} Kursi</span>
                                        </div>
                                        <div class="grid grid-cols-1 gap-1 text-slate-700 font-medium">
                                            <p><span class="text-slate-400 font-bold">📅 Tanggal Pelaksanaan:</span> 
                                                <strong class="text-slate-900 font-bold">
                                                    {{ $rw->tgl_mulai ? \Carbon\Carbon::parse($rw->tgl_mulai)->translatedFormat('d M Y') : 'Jadwal Ditentukan' }}
                                                    @if($rw->tgl_selesai && $rw->tgl_selesai !== $rw->tgl_mulai)
                                                        s/d {{ \Carbon\Carbon::parse($rw->tgl_selesai)->translatedFormat('d M Y') }}
                                                    @endif
                                                </strong>
                                            </p>
                                            <p><span class="text-slate-400 font-bold">📍 Tempat Kegiatan:</span> <strong class="text-slate-800">{{ $rw->tempat_kegiatan ?: 'Dinas Tenaga Kerja, KUKM Kota Madiun' }}</strong></p>
                                            @if($rw->deskripsi_kegiatan)
                                                <p class="text-[11px] text-slate-500 italic mt-0.5">"{{ $rw->deskripsi_kegiatan }}"</p>
                                            @endif
                                        </div>
                                    </div>

                                    <!-- RINCIAN PENDAFTARAN IKM -->
                                    <div class="bg-emerald-50/50 rounded-2xl p-3.5 border border-emerald-100 text-xs space-y-1">
                                        <div class="text-[10px] font-black text-emerald-800 uppercase tracking-widest border-b border-emerald-200/60 pb-1">
                                            <span>👤 DETAIL KEPESERTAAN IKM</span>
                                        </div>
                                        <p><span class="text-slate-400 font-bold">Tanggal Didaftarkan Lolos:</span> <strong class="text-slate-800">{{ \Carbon\Carbon::parse($rw->created_at)->translatedFormat('d F Y, H:i') }} WIB</strong></p>
                                        <p><span class="text-slate-400 font-bold">Produk Utama:</span> <strong class="text-slate-800">{{ $rw->produk_diproduksi ?: '-' }}</strong></p>
                                        <p><span class="text-slate-400 font-bold">Alamat Usaha:</span> <strong class="text-slate-800">{{ $rw->alamat_usaha }}, Kel. {{ $rw->kelurahan }}, Kec. {{ $rw->kecamatan }}</strong></p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    @else
                        <div class="bg-amber-50/70 border border-amber-200 rounded-3xl p-6 text-center space-y-3">
                            <span class="text-3xl">📭</span>
                            <h5 class="text-sm font-extrabold text-amber-900">Belum Memiliki Riwayat Peserta Lolos Pelatihan</h5>
                            <p class="text-xs text-amber-800 font-medium max-w-md mx-auto">Pelaku usaha ini belum pernah diloloskan untuk kegiatan pelatihan manapun. Anda dapat memasukkannya langsung ke salah satu kegiatan aktif di bawah.</p>
                        </div>
                    @endif
                </div>
            </div>
        @endif
    </div>

    <!-- SECTION 2: DAFTAR LIST KEGIATAN & PELATIHAN IKM (DARI /admin/kegiatan) -->
    <div class="bg-white rounded-[35px] border border-slate-200 p-8 shadow-sm space-y-6">
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 border-b border-slate-100 pb-5">
            <div>
                <span class="text-[10px] font-black text-indigo-600 uppercase tracking-widest bg-indigo-50 px-3 py-1 rounded-full border border-indigo-100">Sumber Data: /admin/kegiatan</span>
                <h3 class="text-lg font-black text-slate-900 tracking-tight mt-2">Daftar Kegiatan & Peserta Lolos Pelatihan</h3>
                <p class="text-xs text-slate-500 font-semibold mt-1">Pilih kegiatan pelatihan di bawah untuk melihat rincian peserta lolos, meloloskan peserta baru via NIB/NIK, atau mengunduh laporan Excel (.xlsx).</p>
            </div>
            <a href="{{ route('admin.kegiatan.index') }}" target="_blank" class="px-5 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-2xl text-xs font-bold transition flex items-center gap-2 shrink-0">
                <span>⚙️ Kelola Master Kegiatan</span>
            </a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            @forelse($kegiatanList as $keg)
                <div class="bg-slate-50/70 border border-slate-200 rounded-[30px] p-6 space-y-5 flex flex-col justify-between hover:shadow-md transition">
                    <div class="space-y-3">
                        <div class="flex justify-between items-start gap-2">
                            <span class="px-3 py-1 rounded-full text-[10px] font-black uppercase {{ $keg->status === 'aktif' || $keg->is_active ? 'bg-emerald-100 text-emerald-700 border border-emerald-200' : 'bg-slate-200 text-slate-700' }}">
                                {{ $keg->status ?? 'Aktif' }}
                            </span>
                            <span class="text-[11px] font-bold text-slate-400 font-mono">ID #{{ $keg->id }}</span>
                        </div>

                        <div>
                            <h4 class="text-base font-black text-slate-900 leading-snug">{{ $keg->nama_kegiatan }}</h4>
                            <p class="text-xs text-slate-500 font-semibold mt-1">📌 {{ $keg->sub_pelaksana ?: 'Dinas Tenaga Kerja, KUKM Kota Madiun' }}</p>
                        </div>

                        <div class="space-y-1.5 text-xs text-slate-600 pt-2 border-t border-slate-200/60">
                            <div class="flex items-center gap-2">
                                <span class="text-slate-400 font-bold w-20 shrink-0">Pelaksanaan:</span>
                                <span class="font-bold text-slate-800">
                                    {{ $keg->tgl_mulai ? \Carbon\Carbon::parse($keg->tgl_mulai)->translatedFormat('d M Y') : 'Jadwal Ditentukan' }}
                                    @if($keg->tgl_selesai && $keg->tgl_selesai !== $keg->tgl_mulai)
                                        s/d {{ \Carbon\Carbon::parse($keg->tgl_selesai)->translatedFormat('d M Y') }}
                                    @endif
                                </span>
                            </div>
                            <div class="flex items-center gap-2">
                                <span class="text-slate-400 font-bold w-20 shrink-0">Tempat:</span>
                                <span class="font-semibold text-slate-700 truncate">{{ $keg->tempat_kegiatan ?: 'Kota Madiun' }}</span>
                            </div>
                        </div>

                        <!-- PROGRESS BAR KUOTA PESERTA LOLOS -->
                        <div class="space-y-1.5 pt-2">
                            <div class="flex justify-between text-xs font-black">
                                <span class="text-slate-600">Peserta Lolos: <strong class="text-emerald-600">{{ $keg->terisi }}</strong> / {{ $keg->kuota_peserta ?: '∞' }} Peserta</span>
                                <span class="text-indigo-600">{{ $keg->persentase }}%</span>
                            </div>
                            <div class="w-full bg-slate-200 h-2.5 rounded-full overflow-hidden">
                                <div class="bg-emerald-500 h-full transition-all duration-500" style="width: {{ min(100, $keg->persentase) }}%"></div>
                            </div>
                        </div>
                    </div>

                    <!-- ACTION BUTTONS -->
                    <div class="pt-4 border-t border-slate-200/60 flex flex-col gap-2">
                        <button type="button" @click="openPesertaModal('{{ addslashes($keg->nama_kegiatan) }}')" class="w-full py-2.5 bg-indigo-600 hover:bg-indigo-700 active:scale-95 text-white font-bold rounded-2xl text-xs shadow-md shadow-indigo-600/20 transition flex items-center justify-center gap-1.5">
                            <span>👥 Lihat Peserta Lolos ({{ $keg->terisi }})</span>
                        </button>
                        <button type="button" @click="openInputModal('{{ addslashes($keg->nama_kegiatan) }}')" class="w-full py-2.5 bg-emerald-600 hover:bg-emerald-700 active:scale-95 text-white font-bold rounded-2xl text-xs shadow-md shadow-emerald-600/20 transition flex items-center justify-center gap-1.5">
                            <span>➕ Input Peserta Lolos (NIB/NIK)</span>
                        </button>
                    </div>
                </div>
            @empty
                <div class="col-span-full py-12 text-center space-y-3">
                    <span class="text-4xl">📭</span>
                    <h4 class="text-base font-black text-slate-800">Belum Ada Master Kegiatan Pelatihan</h4>
                    <p class="text-xs text-slate-500">Tambahkan kegiatan pelatihan terlebih dahulu di menu /admin/kegiatan.</p>
                </div>
            @endforelse
        </div>
    </div>

    <!-- MODAL POPUP: INPUT PESERTA PELATIHAN VIA NIB/NIK -->
    <div x-show="showInputModal" x-transition class="fixed inset-0 bg-slate-950/70 backdrop-blur-md z-[9999] flex items-center justify-center p-4 overflow-y-auto" style="display: none;">
        <div class="bg-white rounded-[35px] max-w-xl w-full p-8 shadow-2xl space-y-6 relative overflow-hidden border border-slate-200" @click.outside="showInputModal = false">
            
            <div class="flex justify-between items-start bg-gradient-to-r from-emerald-800 to-teal-900 -m-8 p-8 mb-4 text-white">
                <div>
                    <span class="text-[10px] font-black text-emerald-300 uppercase tracking-widest bg-emerald-400/10 px-3 py-1 rounded-full border border-emerald-400/20">Input Peserta Lolos Pelatihan</span>
                    <h3 class="text-xl font-black mt-2" x-text="targetKegiatan"></h3>
                    <p class="text-xs text-slate-200 font-medium mt-1">Cari NIB/NIK pelaku usaha untuk meloloskan dan melengkapi data peserta.</p>
                </div>
                <button type="button" @click="showInputModal = false" class="w-10 h-10 rounded-2xl bg-white/10 hover:bg-white/20 text-white flex items-center justify-center font-bold text-xl transition">
                    ✕
                </button>
            </div>

            <!-- SEARCH LIVE LOOKUP NIB/NIK -->
            <div class="space-y-2 pt-2">
                <label class="block text-xs font-extrabold uppercase tracking-wider text-slate-700">Cari Pelaku Usaha (NIB / NIK / Nama Pemilik)</label>
                <div class="flex gap-2">
                    <input type="text" x-model="searchKey" @keydown.enter.prevent="lookupIkm()" placeholder="Ketik NIB atau NIK..." class="flex-1 px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-mono font-bold text-slate-800 outline-none focus:ring-2 focus:ring-emerald-500 transition">
                    <button type="button" @click="lookupIkm()" class="px-5 py-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-bold shadow-md transition">
                        Cari Data
                    </button>
                </div>
                <p x-show="lookupMsg" class="text-xs font-bold" :class="lookupSuccess ? 'text-emerald-600' : 'text-rose-500'" x-text="lookupMsg"></p>
            </div>

            <form action="{{ route('dukungan.daftarpeserta.store') }}" method="POST" class="space-y-4 pt-2">
                @csrf
                <input type="hidden" name="nama_kegiatan" :value="targetKegiatan">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-xs">
                    <div>
                        <label class="block font-bold text-slate-700 mb-1">NIB <span class="text-rose-500">*</span></label>
                        <input type="text" name="nib" x-model="inputForm.nib" required placeholder="13 digit NIB..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-mono font-bold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block font-bold text-slate-700 mb-1">NIK Pemilik <span class="text-rose-500">*</span></label>
                        <input type="text" name="nik" x-model="inputForm.nik" required maxlength="16" minlength="16" placeholder="16 digit NIK..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-mono font-bold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block font-bold text-slate-700 mb-1">Nama Lengkap Pemilik <span class="text-rose-500">*</span></label>
                        <input type="text" name="nama_lengkap" x-model="inputForm.nama_lengkap" required placeholder="Nama pemilik..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-semibold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block font-bold text-slate-700 mb-1">Nama Usaha / Perusahaan <span class="text-rose-500">*</span></label>
                        <input type="text" name="nama_usaha" x-model="inputForm.nama_usaha" required placeholder="Nama usaha..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-semibold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block font-bold text-slate-700 mb-1">No. WhatsApp / HP <span class="text-rose-500">*</span></label>
                        <input type="text" name="whatsapp" x-model="inputForm.whatsapp" required placeholder="08xxxxxxxxxx" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-semibold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block font-bold text-slate-700 mb-1">Produk Utama</label>
                        <input type="text" name="produk_diproduksi" x-model="inputForm.produk" placeholder="Nama produk..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-semibold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block font-bold text-slate-700 mb-1">Kecamatan <span class="text-rose-500">*</span></label>
                        <input type="text" name="kecamatan" x-model="inputForm.kecamatan" required placeholder="Kecamatan..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-semibold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block font-bold text-slate-700 mb-1">Kelurahan <span class="text-rose-500">*</span></label>
                        <input type="text" name="kelurahan" x-model="inputForm.kelurahan" required placeholder="Kelurahan..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-semibold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div class="col-span-full">
                        <label class="block font-bold text-slate-700 mb-1">Alamat Jalan Usaha <span class="text-rose-500">*</span></label>
                        <input type="text" name="alamat_usaha" x-model="inputForm.alamat_usaha" required placeholder="Alamat jalan..." class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl font-semibold outline-none focus:ring-2 focus:ring-emerald-500">
                    </div>
                </div>

                <div class="pt-4 border-t border-slate-100 flex items-center justify-end gap-3">
                    <button type="button" @click="showInputModal = false" class="px-6 py-3 bg-slate-100 text-slate-700 font-bold rounded-2xl text-xs hover:bg-slate-200 transition">
                        Batal
                    </button>
                    <button type="submit" class="px-8 py-3 bg-emerald-600 hover:bg-emerald-700 text-white font-extrabold rounded-2xl text-xs shadow-lg shadow-emerald-600/20 transition">
                        🚀 Loloskan & Tambah Peserta
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- MODAL POPUP: LIHAT PESERTA LOLOS PER KEGIATAN + EXPORT EXCEL + HAPUS PESERTA -->
    <div x-show="showPesertaModal" x-transition class="fixed inset-0 bg-slate-950/70 backdrop-blur-md z-[9999] flex items-center justify-center p-4 overflow-y-auto" style="display: none;">
        <div class="bg-white rounded-[35px] max-w-5xl w-full p-8 shadow-2xl space-y-6 relative overflow-hidden border border-slate-200" @click.outside="showPesertaModal = false">
            
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center bg-gradient-to-r from-slate-900 to-indigo-950 -m-8 p-8 mb-4 text-white gap-4">
                <div>
                    <span class="text-[10px] font-black text-indigo-300 uppercase tracking-widest bg-indigo-400/10 px-3 py-1 rounded-full border border-indigo-400/20">Daftar Peserta Lolos Pelatihan</span>
                    <h3 class="text-xl font-black mt-2" x-text="selectedKegiatan"></h3>
                    <p class="text-xs text-slate-300 font-medium mt-1">Daftar seluruh peserta yang telah diloloskan oleh Admin Dinas pada kegiatan pelatihan ini.</p>
                </div>
                <div class="flex items-center gap-3 shrink-0">
                    <!-- TOMBOL EXPORT EXCEL (.XLSX) -->
                    <a :href="'/dukungan/daftarpeserta/export-kegiatan?nama_kegiatan=' + encodeURIComponent(selectedKegiatan)" 
                       class="px-5 py-2.5 bg-emerald-500 hover:bg-emerald-600 active:scale-95 text-white font-black rounded-2xl text-xs shadow-md shadow-emerald-500/30 transition flex items-center gap-2">
                        <span>📊 Export Excel (.xlsx)</span>
                    </a>

                    <button type="button" @click="showPesertaModal = false" class="w-10 h-10 rounded-2xl bg-white/10 hover:bg-white/20 text-white flex items-center justify-center font-bold text-xl transition">
                        ✕
                    </button>
                </div>
            </div>

            <div class="space-y-4 max-h-[60vh] overflow-y-auto custom-scrollbar pr-2">
                <template x-if="getPesertaList(selectedKegiatan).length > 0">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left text-xs border-collapse">
                            <thead>
                                <tr class="text-[10px] font-black text-slate-400 uppercase tracking-widest border-b border-slate-100">
                                    <th class="py-3 px-3">No</th>
                                    <th class="py-3 px-3">Nama Pemilik / Usaha</th>
                                    <th class="py-3 px-3">NIB & NIK</th>
                                    <th class="py-3 px-3">Kontak WA</th>
                                    <th class="py-3 px-3">Alamat Usaha</th>
                                    <th class="py-3 px-3">Tgl Lolos</th>
                                    <th class="py-3 px-3 text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-100 font-medium text-slate-700">
                                <template x-for="(p, idx) in getPesertaList(selectedKegiatan)" :key="p.id">
                                    <tr class="hover:bg-slate-50">
                                        <td class="py-3 px-3 font-mono font-bold text-slate-400" x-text="idx + 1"></td>
                                        <td class="py-3 px-3">
                                            <strong class="text-slate-900 block text-xs" x-text="p.nama_lengkap"></strong>
                                            <span class="text-[11px] text-slate-500 font-semibold" x-text="p.nama_usaha"></span>
                                        </td>
                                        <td class="py-3 px-3 font-mono text-[11px]">
                                            <span class="block text-slate-800 font-bold" x-text="'NIB: ' + p.nib"></span>
                                            <span class="text-slate-400 block" x-text="'NIK: ' + p.nik"></span>
                                        </td>
                                        <td class="py-3 px-3 font-mono text-emerald-600 font-bold">
                                            <a :href="'https://wa.me/' + (p.whatsapp ? p.whatsapp.replace(/[^0-9]/g, '') : '')" target="_blank" class="hover:underline flex items-center gap-1">
                                                <span>📱</span> <span x-text="p.whatsapp"></span>
                                            </a>
                                        </td>
                                        <td class="py-3 px-3 text-[11px]" x-text="p.alamat_usaha + ', ' + p.kelurahan + ', ' + p.kecamatan"></td>
                                        <td class="py-3 px-3 text-[11px] text-slate-400" x-text="p.created_at ? p.created_at.substring(0, 10) : '-'"></td>
                                        <td class="py-3 px-3 text-center">
                                            <!-- FORM HAPUS HIDDEN & INTERACTIVE TRIGGER BUTTON -->
                                            <form :action="'/dukungan/daftarpeserta/destroy/' + p.id" method="POST" :id="'delete-peserta-form-' + p.id" class="inline">
                                                @csrf
                                                @method('DELETE')
                                                <button type="button" @click="openDeleteModal(p.id, p.nama_lengkap, p.nama_usaha, selectedKegiatan)" class="px-3 py-1.5 bg-rose-50 hover:bg-rose-100 text-rose-600 border border-rose-200 rounded-xl text-[11px] font-extrabold transition inline-flex items-center gap-1 shadow-2xs active:scale-95">
                                                    <span>🗑️ Hapus</span>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </template>
                            </tbody>
                        </table>
                    </div>
                </template>

                <template x-if="getPesertaList(selectedKegiatan).length === 0">
                    <div class="py-12 text-center space-y-2">
                        <span class="text-3xl">📭</span>
                        <p class="text-xs font-bold text-slate-500">Belum ada peserta yang diloloskan untuk kegiatan ini.</p>
                        <p class="text-[11px] text-slate-400">Gunakan tombol "Input Peserta Lolos (NIB/NIK)" pada kartu kegiatan untuk memasukkan peserta.</p>
                    </div>
                </template>
            </div>

            <div class="pt-4 border-t border-slate-100 flex justify-between items-center">
                <span class="text-xs font-bold text-slate-400" x-text="'Total Peserta Lolos: ' + getPesertaList(selectedKegiatan).length + ' Orang'"></span>
                <button type="button" @click="showPesertaModal = false" class="px-6 py-3 bg-slate-100 text-slate-700 font-bold rounded-2xl text-xs hover:bg-slate-200 transition">
                    Tutup Pop-up
                </button>
            </div>
        </div>
    </div>

    <!-- MODAL POPUP: KONFIRMASI HAPUS PESERTA LOLOS INTERAKTIF DENGAN COUNTDOWN 5 DETIK -->
    <div x-show="showDeleteModal" x-transition class="fixed inset-0 bg-slate-950/80 backdrop-blur-md z-[10000] flex items-center justify-center p-4 overflow-y-auto" style="display: none;">
        <div class="bg-white rounded-[35px] max-w-md w-full p-8 shadow-2xl space-y-5 text-center border border-rose-100 relative overflow-hidden" @click.outside="closeDeleteModal()">
            
            <!-- TOP ACCENT BADGE ICON -->
            <div class="w-16 h-16 bg-rose-100 text-rose-600 rounded-3xl flex items-center justify-center mx-auto text-2xl shadow-inner border border-rose-200 animate-bounce">
                🗑️
            </div>

            <div>
                <div class="inline-flex items-center gap-1.5 bg-rose-50 text-rose-700 px-3.5 py-1 rounded-full text-[10px] font-black uppercase tracking-wider mb-2 border border-rose-200">
                    <span class="w-2 h-2 rounded-full bg-rose-500 animate-ping"></span>
                    <span>Konfirmasi Hapus Peserta Lolos</span>
                </div>
                <h3 class="text-xl font-black text-slate-900 leading-snug">Hapus Peserta Pelatihan?</h3>
                <p class="text-xs text-slate-500 font-semibold mt-1">
                    Apakah Anda yakin ingin menghapus peserta ini dari daftar peserta yang diloloskan?
                </p>
            </div>

            <!-- DETAILS SUMMARY CARD -->
            <div class="bg-slate-50 rounded-2xl p-4 text-left border border-slate-200 text-xs space-y-1.5">
                <div>
                    <span class="text-slate-400 font-bold block text-[10px] uppercase">Nama Pemilik:</span>
                    <strong class="text-slate-900 font-extrabold text-sm" x-text="deleteTarget.nama"></strong>
                </div>
                <div>
                    <span class="text-slate-400 font-bold block text-[10px] uppercase">Nama Usaha / Perusahaan:</span>
                    <span class="text-indigo-600 font-bold" x-text="deleteTarget.usaha"></span>
                </div>
                <div>
                    <span class="text-slate-400 font-bold block text-[10px] uppercase">Kegiatan Pelatihan:</span>
                    <span class="text-slate-700 font-semibold truncate block" x-text="deleteTarget.kegiatan"></span>
                </div>
            </div>

            <!-- COUNTDOWN TIMER BADGE & PROGRESS BAR -->
            <div class="bg-rose-50 border border-rose-200/80 rounded-2xl p-3.5 space-y-2">
                <div class="flex justify-between items-center text-[11px] font-black text-rose-800">
                    <span>⏱️ Pop-up otomatis batal dalam:</span>
                    <span class="bg-rose-600 text-white px-2.5 py-0.5 rounded-md text-xs font-mono font-black animate-pulse" x-text="deleteTimer + ' Detik'"></span>
                </div>
                <div class="w-full bg-rose-200/70 h-2.5 rounded-full overflow-hidden">
                    <div class="bg-rose-600 h-full transition-all duration-1000 ease-linear" :style="'width: ' + ((deleteTimer / 5) * 100) + '%'"></div>
                </div>
            </div>

            <!-- ACTION BUTTONS -->
            <div class="grid grid-cols-2 gap-3 pt-2">
                <button type="button" @click="closeDeleteModal()" class="w-full py-3.5 bg-slate-100 hover:bg-slate-200 active:scale-95 text-slate-700 font-extrabold rounded-2xl text-xs transition">
                    Batal / Urungkan
                </button>
                <button type="button" @click="executeDelete()" class="w-full py-3.5 bg-rose-600 hover:bg-rose-700 active:scale-95 text-white font-black rounded-2xl text-xs shadow-lg shadow-rose-600/30 transition flex items-center justify-center gap-1.5">
                    <span>🗑️ Ya, Hapus</span>
                </button>
            </div>
        </div>
    </div>

</div>

<script>
function daftarPesertaHandler() {
    return {
        showInputModal: false,
        showPesertaModal: false,
        showDeleteModal: false,
        deleteTarget: { id: null, nama: '', usaha: '', kegiatan: '' },
        deleteTimer: 5,
        deleteInterval: null,
        targetKegiatan: '',
        selectedKegiatan: '',
        searchKey: '',
        lookupMsg: '',
        lookupSuccess: false,
        pesertaGroupMap: @json($pesertaByKegiatan ?? []),
        inputForm: {
            nib: '',
            nik: '',
            nama_lengkap: '',
            nama_usaha: '',
            whatsapp: '',
            produk: '',
            kecamatan: '',
            kelurahan: '',
            alamat_usaha: ''
        },

        openDeleteModal(id, nama, usaha, kegiatan) {
            this.deleteTarget = { id: id, nama: nama, usaha: usaha, kegiatan: kegiatan };
            this.deleteTimer = 5;
            this.showDeleteModal = true;

            if (this.deleteInterval) clearInterval(this.deleteInterval);

            this.deleteInterval = setInterval(() => {
                if (this.deleteTimer > 1) {
                    this.deleteTimer--;
                } else {
                    this.closeDeleteModal();
                }
            }, 1000);
        },

        closeDeleteModal() {
            if (this.deleteInterval) {
                clearInterval(this.deleteInterval);
                this.deleteInterval = null;
            }
            this.showDeleteModal = false;
        },

        executeDelete() {
            if (this.deleteTarget.id) {
                const form = document.getElementById('delete-peserta-form-' + this.deleteTarget.id);
                if (form) {
                    this.closeDeleteModal();
                    form.submit();
                }
            }
        },

        openInputModal(namaKegiatan) {
            this.targetKegiatan = namaKegiatan;
            this.searchKey = '';
            this.lookupMsg = '';
            this.inputForm = {
                nib: '',
                nik: '',
                nama_lengkap: '',
                nama_usaha: '',
                whatsapp: '',
                produk: '',
                kecamatan: '',
                kelurahan: '',
                alamat_usaha: ''
            };
            this.showInputModal = true;
        },

        openPesertaModal(namaKegiatan) {
            this.selectedKegiatan = namaKegiatan;
            this.showPesertaModal = true;
        },

        getPesertaList(namaKegiatan) {
            return this.pesertaGroupMap[namaKegiatan] || [];
        },

        lookupIkm() {
            const q = (this.searchKey || '').trim();
            if (!q) {
                this.lookupMsg = 'Ketik NIB atau NIK terlebih dahulu.';
                this.lookupSuccess = false;
                return;
            }

            this.lookupMsg = 'Mencari data pelaku usaha...';
            this.lookupSuccess = true;

            fetch(`/dukungan/daftarpeserta/find-ikm?query=${encodeURIComponent(q)}&kegiatan=${encodeURIComponent(this.targetKegiatan)}`)
                .then(res => res.json())
                .then(res => {
                    if (res.success && res.data) {
                        this.inputForm.nib = res.data.nib || '';
                        this.inputForm.nik = res.data.nik || '';
                        this.inputForm.nama_lengkap = res.data.nama_lengkap || '';
                        this.inputForm.nama_usaha = res.data.nama_usaha || '';
                        this.inputForm.whatsapp = res.data.whatsapp || '';
                        this.inputForm.produk = res.data.produk || '';
                        this.inputForm.kecamatan = res.data.kecamatan || 'Kartoharjo';
                        this.inputForm.kelurahan = res.data.kelurahan || 'Kartoharjo';
                        this.inputForm.alamat_usaha = res.data.alamat_usaha || '';
                        this.lookupMsg = res.message || '✓ Data pendaftar ditemukan dan berhasil diisikan otomatis!';
                        this.lookupSuccess = true;
                    } else {
                        this.lookupMsg = res.message || 'Data pelaku usaha tidak ditemukan pada database.';
                        this.lookupSuccess = false;
                    }
                })
                .catch(() => {
                    this.lookupMsg = 'Terjadi kesalahan koneksi saat mencari data.';
                    this.lookupSuccess = false;
                });
        }
    };
}
</script>
@endsection
