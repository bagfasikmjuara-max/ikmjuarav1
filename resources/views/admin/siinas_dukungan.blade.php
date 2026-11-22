@extends('layouts.dukungan')

@section('title', 'Integrator Pelaporan SIINas')

@section('content')
<script>
window.hapusSiinasPerusahaan = function(id, name, item) {
    if (window.siinasAppRef) {
        window.siinasAppRef.openDeleteModal(item || { id: id, nama_perusahaan: name });
    } else {
        var form = document.getElementById('delete-form-' + id);
        if (form) {
            form.submit();
        }
    }
};

function initSiinasApp() {
    return {
        showUploadModal: false,
        uploadStep: 1, 
        uploadPreviewResult: { total_rows: 0, valid_count: 0, invalid_count: 0, valid_data: [], invalid_data: [] },
        isUploading: false,

        showAddModal: false, 
        showEditModal: false, 
        showDetailModal: false,
        showDeleteModal: false,
        selectedIndustry: {},
        deleteItem: {},
        isDeletingCountdown: false,
        deleteCountdown: 3,

        openDeleteModal(item) {
            this.deleteItem = item;
            this.isDeletingCountdown = false;
            this.deleteCountdown = 3;
            this.showDeleteModal = true;
        },

        startDeleteCountdown() {
            this.isDeletingCountdown = true;
            this.deleteCountdown = 3;
            const timer = setInterval(() => {
                this.deleteCountdown--;
                if (this.deleteCountdown <= 0) {
                    clearInterval(timer);
                    const form = document.getElementById('delete-form-' + this.deleteItem.id);
                    if (form) {
                        form.submit();
                    }
                }
            }, 1000);
        },
        
        // Add Form State
        addBidangUsaha: '',
        addKbliQuery: '',
        addKbliResults: [],
        addSelectedKblis: [],

        // Edit Form State
        editIndustry: {},
        editKbliQuery: '',
        editKbliResults: [],
        editSelectedKblis: [],

        searchKbli(query, target) {
            if (!query || query.length < 2) {
                if (target === 'add') this.addKbliResults = [];
                if (target === 'edit') this.editKbliResults = [];
                return;
            }
            fetch('/api/cari-kbli?q=' + encodeURIComponent(query))
                .then(res => res.json())
                .then(data => {
                    if (target === 'add') this.addKbliResults = data;
                    if (target === 'edit') this.editKbliResults = data;
                });
        },

        addKbliTag(item, target) {
            if (target === 'add') {
                if (!this.addSelectedKblis.some(k => k.kode === item.kode)) {
                    this.addSelectedKblis.push(item);
                }
                this.addKbliQuery = '';
                this.addKbliResults = [];
                this.syncBidangUsaha('add');
            } else {
                if (!this.editSelectedKblis.some(k => k.kode === item.kode)) {
                    this.editSelectedKblis.push(item);
                }
                this.editKbliQuery = '';
                this.editKbliResults = [];
                this.syncBidangUsaha('edit');
            }
        },

        removeKbliTag(index, target) {
            if (target === 'add') {
                this.addSelectedKblis.splice(index, 1);
                this.syncBidangUsaha('add');
            } else {
                this.editSelectedKblis.splice(index, 1);
                this.syncBidangUsaha('edit');
            }
        },

        syncBidangUsaha(target) {
            let list = target === 'add' ? this.addSelectedKblis : this.editSelectedKblis;
            let titles = list.map(k => k.judul).filter(j => j && j.trim() !== '');
            let combined = titles.join(', ');
            if (target === 'add') {
                this.addBidangUsaha = combined;
            } else {
                this.editIndustry.bidang_usaha = combined;
            }
        },

        getJoinedKbli(target) {
            let list = target === 'add' ? this.addSelectedKblis : this.editSelectedKblis;
            return list.map(k => k.kode).join(', ');
        },

        prepareEdit(item) {
            this.editIndustry = Object.assign({}, item);
            this.editSelectedKblis = [];
            
            if (item.kbli) {
                let codes = item.kbli.split(',').map(c => c.trim()).filter(c => c !== '');
                codes.forEach(code => {
                    fetch('/api/cari-kbli?q=' + encodeURIComponent(code))
                        .then(res => res.json())
                        .then(data => {
                            let found = data.find(d => d.kode === code);
                            let title = found ? found.judul : code;
                            let versi = found ? (found.versi || 'KBLI 2020/2025') : 'KBLI 2020/2025';
                            if (!this.editSelectedKblis.some(k => k.kode === code)) {
                                this.editSelectedKblis.push({
                                    kode: code,
                                    judul: title,
                                    versi: versi
                                });
                            }
                        })
                        .catch(() => {
                            if (!this.editSelectedKblis.some(k => k.kode === code)) {
                                this.editSelectedKblis.push({
                                    kode: code,
                                    judul: code,
                                    versi: 'KBLI 2020/2025'
                                });
                            }
                        });
                });
            }
            this.showEditModal = true;
        },

        handleUploadPreview(event) {
            event.preventDefault();
            let form = event.target;
            let formData = new FormData(form);
            this.isUploading = true;

            fetch('/dukungan/siinas/upload-preview', {
                method: 'POST',
                body: formData,
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                }
            })
            .then(res => res.json())
            .then(data => {
                this.isUploading = false;
                if (data.success) {
                    this.uploadPreviewResult = data;
                    this.uploadStep = 2;
                } else {
                    alert(data.message || 'Gagal memproses pratinjau unggahan file.');
                }
            })
            .catch(err => {
                this.isUploading = false;
                alert('Terjadi kesalahan koneksi saat mengunggah file.');
            });
        }
    };
}
</script>

<div x-data="initSiinasApp()" x-init="window.siinasAppRef = $data" class="space-y-8">


    {{-- Banner Top --}}
    <div class="relative overflow-hidden rounded-3xl bg-gradient-to-r from-slate-900 via-emerald-950 to-slate-900 p-8 md:p-10 text-white shadow-2xl border border-emerald-500/20">
        <div class="absolute -right-10 -bottom-10 w-96 h-96 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none"></div>
        <div class="relative z-10 flex flex-col md:flex-row md:items-center justify-between gap-6">
            <div class="space-y-3 max-w-3xl">
                <div class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-emerald-500/20 border border-emerald-400/30 text-emerald-300 text-xs font-semibold tracking-wide uppercase">
                    <span class="w-2 h-2 rounded-full bg-emerald-400 animate-ping"></span>
                    Sistem Informasi Industri Nasional (SIINas)
                </div>
                <h1 class="text-3xl md:text-4xl font-extrabold tracking-tight">
                    Integrator Pelaporan <span class="text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 via-teal-300 to-amber-300">SIINas Kota Madiun</span>
                </h1>
                <p class="text-slate-300 text-sm md:text-base leading-relaxed">
                    Pusat integrasi, sinkronisasi data unggahan masal, autokomplit rujukan KBLI 2020 & 2025, serta verifikasi pelaporan industri manufaktur Kota Madiun.
                </p>
            </div>

            <div class="flex flex-wrap items-center gap-3">
                <button @click="uploadStep = 1; showUploadModal = true" 
                        class="inline-flex items-center gap-2 px-5 py-3 rounded-2xl bg-emerald-500 hover:bg-emerald-600 text-white font-bold text-sm shadow-lg shadow-emerald-500/30 transition-all duration-200 hover:scale-[1.02]">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12" />
                    </svg>
                    Unggah Data Masal
                </button>
                
                <a href="{{ asset('downloads/Template_SIINas_Kota_Madiun.xlsx') }}" 
                   download="Template_SIINas_Kota_Madiun.xlsx"
                   class="inline-flex items-center gap-2 px-4 py-3 rounded-2xl bg-amber-500/20 hover:bg-amber-500/30 text-amber-300 font-bold text-sm border border-amber-400/40 transition-all">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                    </svg>
                    Unduh Format (.xlsx)
                </a>

                <a href="{{ route('dukungan.siinas.export') }}" 
                   download="Data_Pelaporan_SIINas_Kota_Madiun.xlsx"
                   class="inline-flex items-center gap-2 px-4 py-3 rounded-2xl bg-slate-800/80 hover:bg-slate-800 text-slate-200 font-bold text-sm border border-slate-700 transition-all duration-200 hover:text-white">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-emerald-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                    </svg>
                    Export Excel
                </a>
            </div>
        </div>
    </div>

    {{-- Alert Flash Messages --}}
    @if(session('success'))
        <div class="p-4 rounded-2xl bg-emerald-50 border border-emerald-200 text-emerald-800 flex items-center gap-3 shadow-sm">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-emerald-600 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span class="font-bold text-sm">{{ session('success') }}</span>
        </div>
    @endif

    @if(session('error'))
        <div class="p-4 rounded-2xl bg-rose-50 border border-rose-200 text-rose-800 flex items-center gap-3 shadow-sm">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-rose-600 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span class="font-bold text-sm">{{ session('error') }}</span>
        </div>
    @endif

    {{-- Cards KPI Statistics --}}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5">
        <div class="bg-white rounded-3xl p-6 border border-slate-100 shadow-sm hover:shadow-md transition-all">
            <div class="flex items-center justify-between mb-4">
                <span class="text-xs font-extrabold text-slate-400 uppercase tracking-wider">Total Perusahaan</span>
                <div class="w-12 h-12 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center font-bold">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                    </svg>
                </div>
            </div>
            <div class="text-3xl font-black text-slate-800">{{ number_format($totalPerusahaan) }}</div>
            <p class="text-xs text-slate-400 mt-2 font-medium">Terdaftar di SIINas Kota Madiun</p>
        </div>

        <div class="bg-white rounded-3xl p-6 border border-slate-100 shadow-sm hover:shadow-md transition-all">
            <div class="flex items-center justify-between mb-4">
                <span class="text-xs font-extrabold text-slate-400 uppercase tracking-wider">Skala Besar & Menengah</span>
                <div class="w-12 h-12 rounded-2xl bg-teal-50 text-teal-600 flex items-center justify-center font-bold">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M13 10V3L4 14h7v7l9-11h-7z" />
                    </svg>
                </div>
            </div>
            <div class="text-3xl font-black text-slate-800">{{ number_format($totalBesarMenengah) }}</div>
            <p class="text-xs text-teal-600 font-semibold mt-2">Pabrik & Manufaktur Utama</p>
        </div>

        <div class="bg-white rounded-3xl p-6 border border-slate-100 shadow-sm hover:shadow-md transition-all">
            <div class="flex items-center justify-between mb-4">
                <span class="text-xs font-extrabold text-slate-400 uppercase tracking-wider">Skala Kecil</span>
                <div class="w-12 h-12 rounded-2xl bg-sky-50 text-sky-600 flex items-center justify-center font-bold">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                </div>
            </div>
            <div class="text-3xl font-black text-slate-800">{{ number_format($totalKecil) }}</div>
            <p class="text-xs text-sky-600 font-semibold mt-2">IKM Binaan Produktif</p>
        </div>

        <div class="bg-white rounded-3xl p-6 border border-slate-100 shadow-sm hover:shadow-md transition-all">
            <div class="flex items-center justify-between mb-4">
                <span class="text-xs font-extrabold text-slate-400 uppercase tracking-wider">Belum Melapor</span>
                <div class="w-12 h-12 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center font-bold">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                    </svg>
                </div>
            </div>
            <div class="text-3xl font-black text-amber-600">{{ number_format($totalBelumMelapor) }}</div>
            <p class="text-xs text-amber-600 font-semibold mt-2">Perlu Pembinaan & Pelaporan</p>
        </div>
    </div>

    {{-- Filter & Action Controls --}}
    <div class="bg-white rounded-3xl p-6 border border-slate-100 shadow-sm space-y-4">
        <form method="GET" action="{{ route('dukungan.siinas.index') }}" class="grid grid-cols-1 md:grid-cols-12 gap-4">
            <div class="md:col-span-5 relative">
                <input type="text" name="search" value="{{ $search }}" 
                       placeholder="Cari Perusahaan, KBLI, Alamat, atau Bidang Usaha..." 
                       class="w-full pl-11 pr-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-sm font-medium focus:bg-white focus:outline-none focus:ring-2 focus:ring-emerald-500/20 focus:border-emerald-500 transition-all">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-400 absolute left-4 top-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
            </div>

            <div class="md:col-span-3">
                <select name="skala" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-sm font-semibold text-slate-700 focus:bg-white focus:outline-none focus:ring-2 focus:ring-emerald-500/20 focus:border-emerald-500 transition-all">
                    <option value="">Semua Skala Usaha</option>
                    <option value="Besar" {{ $skala === 'Besar' ? 'selected' : '' }}>Skala Besar</option>
                    <option value="Menengah" {{ $skala === 'Menengah' ? 'selected' : '' }}>Skala Menengah</option>
                    <option value="Kecil" {{ $skala === 'Kecil' ? 'selected' : '' }}>Skala Kecil</option>
                    <option value="Belum Melapor" {{ $skala === 'Belum Melapor' ? 'selected' : '' }}>Belum Melapor Investasi</option>
                </select>
            </div>

            <div class="md:col-span-2">
                <select name="kecamatan" class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-sm font-semibold text-slate-700 focus:bg-white focus:outline-none focus:ring-2 focus:ring-emerald-500/20 focus:border-emerald-500 transition-all">
                    <option value="">Semua Wilayah</option>
                    <option value="Kartoharjo" {{ $kecamatan === 'Kartoharjo' ? 'selected' : '' }}>Kartoharjo</option>
                    <option value="Manguharjo" {{ $kecamatan === 'Manguharjo' ? 'selected' : '' }}>Manguharjo</option>
                    <option value="Taman" {{ $kecamatan === 'Taman' ? 'selected' : '' }}>Taman</option>
                </select>
            </div>

            <div class="md:col-span-2 flex items-center gap-2">
                <button type="submit" class="flex-1 py-3 px-4 rounded-2xl bg-emerald-600 hover:bg-emerald-700 text-white font-bold text-sm shadow-md shadow-emerald-600/20 transition-all">
                    Filter
                </button>
                @if(!empty($search) || !empty($skala) || !empty($kecamatan))
                    <a href="{{ route('dukungan.siinas.index') }}" class="py-3 px-4 rounded-2xl bg-slate-100 hover:bg-slate-200 text-slate-600 font-bold text-xs">
                        Reset
                    </a>
                @endif
            </div>
        </form>

        <div class="pt-4 border-t border-slate-100 flex flex-wrap items-center justify-between gap-3">
            <span class="text-xs font-bold text-slate-500">
                Menampilkan <span class="text-slate-800 font-extrabold">{{ $industries->total() }}</span> entitas industri SIINas
            </span>

            <div class="flex items-center gap-3">
                <button @click="showAddModal = true; addSelectedKblis = []; addBidangUsaha = ''" 
                        class="inline-flex items-center gap-2 px-4 py-2.5 rounded-xl bg-slate-900 hover:bg-slate-800 text-white text-xs font-bold transition-all">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                    </svg>
                    Tambah Manual
                </button>
            </div>
        </div>
    </div>

    {{-- Data Table --}}
    <div class="bg-white rounded-3xl border border-slate-100 shadow-sm overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-slate-900 text-white text-[11px] font-extrabold uppercase tracking-wider">
                        <th class="py-4 px-6">No</th>
                        <th class="py-4 px-6">Nama Perusahaan</th>
                        <th class="py-4 px-6">Alamat Pabrik & Kantor</th>
                        <th class="py-4 px-6">KBLI & Bidang Usaha</th>
                        <th class="py-4 px-6">Tgl Registrasi</th>
                        <th class="py-4 px-6">Skala Usaha</th>
                        <th class="py-4 px-6 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100 text-xs font-medium text-slate-700">
                    @forelse($industries as $index => $item)
                        <tr class="hover:bg-slate-50/80 transition-colors">
                            <td class="py-4 px-6 font-bold text-slate-400">
                                {{ $industries->firstItem() + $index }}
                            </td>
                            <td class="py-4 px-6">
                                <div class="font-extrabold text-slate-900 text-sm leading-snug">{{ $item->nama_perusahaan }}</div>
                                <div class="inline-flex items-center gap-1 mt-1 text-[10px] font-bold text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded-md">
                                    <span class="w-1.5 h-1.5 rounded-full bg-emerald-500"></span>
                                    {{ $item->status_pelaporan ?? 'Terverifikasi SIINas' }}
                                </div>
                            </td>
                            <td class="py-4 px-6 max-w-xs">
                                <div class="text-slate-800 font-semibold line-clamp-2" title="{{ $item->alamat_pabrik }}">
                                    {{ $item->alamat_pabrik ?? $item->alamat_kantor_pusat }}
                                </div>
                            </td>
                            <td class="py-4 px-6 max-w-xs space-y-1.5">
                                @if($item->kbli)
                                    <div class="flex flex-wrap gap-1 mb-1">
                                        @foreach(explode(',', $item->kbli) as $kCode)
                                            @php $kTrim = trim($kCode); @endphp
                                            @if($kTrim)
                                                <span class="inline-block bg-slate-100 text-slate-800 font-mono text-[11px] px-2 py-0.5 rounded font-extrabold border border-slate-200">
                                                    {{ $kTrim }}
                                                </span>
                                            @endif
                                        @endforeach
                                    </div>
                                @endif
                                <div class="text-slate-700 text-xs leading-relaxed font-normal">
                                    {{ $item->bidang_usaha ?? '-' }}
                                </div>
                            </td>
                            <td class="py-4 px-6 font-bold text-slate-500 whitespace-nowrap">
                                {{ $item->tanggal_registrasi ?? '-' }}
                            </td>
                            <td class="py-4 px-6 whitespace-nowrap">
                                @if(str_contains($item->skala_usaha, 'Besar'))
                                    <span class="px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider bg-emerald-100 text-emerald-800 border border-emerald-200">
                                        Industri Besar
                                    </span>
                                @elseif(str_contains($item->skala_usaha, 'Menengah'))
                                    <span class="px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider bg-teal-100 text-teal-800 border border-teal-200">
                                        Industri Menengah
                                    </span>
                                @elseif(str_contains($item->skala_usaha, 'Kecil'))
                                    <span class="px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider bg-sky-100 text-sky-800 border border-sky-200">
                                        Industri Kecil
                                    </span>
                                @else
                                    <span class="px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider bg-amber-100 text-amber-800 border border-amber-200">
                                        Belum Melapor
                                    </span>
                                @endif
                            </td>
                            <td class="py-4 px-6 text-center whitespace-nowrap">
                                <div class="flex items-center justify-center gap-1.5">
                                    {{-- Detail Button --}}
                                    <button @click="selectedIndustry = {{ json_encode($item) }}; showDetailModal = true"
                                            class="p-2 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-700 transition-all"
                                            title="Lihat Detail">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                        </svg>
                                    </button>

                                    {{-- Edit Button --}}
                                    <button @click="prepareEdit({{ json_encode($item) }})"
                                            class="p-2 rounded-xl bg-emerald-50 hover:bg-emerald-100 text-emerald-700 transition-all"
                                            title="Edit Data">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                        </svg>
                                    </button>

                                    {{-- Fullcolour Modal Delete Button --}}
                                    <button type="button" 
                                            @click="openDeleteModal({{ json_encode($item) }})"
                                            class="p-2 rounded-xl bg-rose-50 hover:bg-rose-100 text-rose-600 transition-all cursor-pointer shadow-sm hover:scale-105" 
                                            title="Hapus Data SIINas">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                        </svg>
                                    </button>

                                    
                                    <form id="delete-form-{{ $item->id }}" action="{{ route('dukungan.siinas.destroy', $item->id) }}" method="POST" class="hidden">
                                        @csrf
                                        @method('DELETE')
                                    </form>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="py-12 text-center text-slate-400 font-bold">
                                Tidak ada data pelaporan SIINas yang cocok dengan pencarian / filter Anda.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="p-6 border-t border-slate-100 bg-slate-50/50">
            {{ $industries->links() }}
        </div>
    </div>

    {{-- MODAL UPLOAD EXCEL (TWO-STEP PREVIEW & CONFIRMATION) --}}
    <div x-show="showUploadModal" x-cloak 
         class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
        <div @click.away="showUploadModal = false" class="bg-white rounded-3xl max-w-3xl w-full p-8 shadow-2xl space-y-6">
            <div class="flex justify-between items-center pb-4 border-b border-slate-100">
                <div>
                    <h3 class="text-xl font-black text-slate-900">Unggah Data SIINas Masal</h3>
                    <p class="text-xs text-slate-400 font-semibold mt-1">Gunakan format file Excel .xlsx asli agar tidak terjadi kesalahan struktur data.</p>
                </div>
                <button @click="showUploadModal = false" class="text-slate-400 hover:text-slate-600">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
                </button>
            </div>

            <template x-if="uploadStep === 1">
                <form @submit.prevent="handleUploadPreview($event)" class="space-y-6">
                    <div class="flex items-center justify-between p-4 bg-amber-50 border border-amber-200/80 rounded-2xl text-xs font-semibold text-amber-900">
                        <div class="flex items-center gap-3">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-amber-600 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" /></svg>
                            <span>Unduh format standar Excel resmi SIINas sebelum mengisi data.</span>
                        </div>
                        <a href="{{ asset('downloads/Template_SIINas_Kota_Madiun.xlsx') }}" download="Template_SIINas_Kota_Madiun.xlsx" class="px-4 py-2 bg-amber-600 hover:bg-amber-700 text-white rounded-xl font-bold shadow-sm transition-all whitespace-nowrap">
                            Unduh Template .xlsx
                        </a>
                    </div>

                    <div class="border-2 border-dashed border-emerald-300 bg-emerald-50/40 hover:bg-emerald-50 rounded-3xl p-8 text-center transition-all cursor-pointer">
                        <input type="file" name="file" required accept=".xlsx,.xls,.csv" class="hidden" id="siinas_file_input_modal" onchange="document.getElementById('file-name-display').innerText = this.files[0].name">
                        <label for="siinas_file_input_modal" class="cursor-pointer space-y-3 block">
                            <div class="w-16 h-16 bg-emerald-100 text-emerald-600 rounded-2xl flex items-center justify-center mx-auto shadow-inner">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                                </svg>
                            </div>
                            <div id="file-name-display" class="text-sm font-bold text-slate-800">Pilih atau Drag & Drop File Excel (.xlsx, .csv)</div>
                            <p class="text-xs text-slate-400">File akan diuji & diperiksa sebelum disimpan ke database</p>
                        </label>
                    </div>

                    <div class="flex items-center justify-end gap-3 pt-2">
                        <button type="button" @click="showUploadModal = false" class="px-5 py-3 rounded-2xl bg-slate-100 hover:bg-slate-200 text-slate-600 font-bold text-sm">
                            Batal
                        </button>
                        <button type="submit" :disabled="isUploading" class="px-6 py-3 rounded-2xl bg-emerald-600 hover:bg-emerald-700 text-white font-bold text-sm shadow-lg shadow-emerald-600/30 flex items-center gap-2">
                            <span x-show="isUploading" class="w-4 h-4 rounded-full border-2 border-white border-t-transparent animate-spin"></span>
                            <span x-text="isUploading ? 'Memeriksa File...' : 'Pratinjau & Validasi Data'"></span>
                        </button>
                    </div>
                </form>
            </template>

            <template x-if="uploadStep === 2">
                <div class="space-y-6">
                    <div class="grid grid-cols-2 gap-4">
                        <div class="p-4 rounded-2xl bg-emerald-50 border border-emerald-200 text-emerald-800">
                            <span class="text-xs font-bold uppercase tracking-wide">Data Berhasil Diunggah</span>
                            <div class="text-3xl font-black text-emerald-700 mt-1" x-text="uploadPreviewResult.valid_count"></div>
                            <p class="text-[11px] font-semibold text-emerald-600 mt-1">Siap dimasukkan ke database</p>
                        </div>
                        <div class="p-4 rounded-2xl bg-rose-50 border border-rose-200 text-rose-800">
                            <span class="text-xs font-bold uppercase tracking-wide">Data Tidak Berhasil / Error</span>
                            <div class="text-3xl font-black text-rose-700 mt-1" x-text="uploadPreviewResult.invalid_count"></div>
                            <p class="text-[11px] font-semibold text-rose-600 mt-1">Dilewati karena data tidak lengkap</p>
                        </div>
                    </div>

                    <template x-if="uploadPreviewResult.invalid_count > 0">
                        <div class="space-y-2">
                            <h4 class="text-xs font-black text-rose-700 uppercase tracking-wider">Rincian Data Yang Gagal / Error:</h4>
                            <div class="max-h-40 overflow-y-auto border border-rose-100 rounded-2xl bg-rose-50/50 p-3 space-y-2">
                                <template x-for="err in uploadPreviewResult.invalid_data" :key="err.row">
                                    <div class="text-xs flex items-center justify-between p-2 bg-white rounded-xl border border-rose-200">
                                        <div>
                                            <span class="font-bold text-slate-800" x-text="'Baris #' + err.row + ': ' + err.nama_perusahaan"></span>
                                        </div>
                                        <span class="text-[11px] font-bold text-rose-600 bg-rose-100 px-2 py-0.5 rounded-md" x-text="err.reason"></span>
                                    </div>
                                </template>
                            </div>
                        </div>
                    </template>

                    <div class="space-y-2">
                        <h4 class="text-xs font-black text-slate-700 uppercase tracking-wider">Pratinjau Data Valid (Contoh 10 Baris Pertama):</h4>
                        <div class="max-h-48 overflow-y-auto border border-slate-200 rounded-2xl overflow-hidden">
                            <table class="w-full text-left text-xs">
                                <thead class="bg-slate-100 text-slate-600 font-extrabold">
                                    <tr>
                                        <th class="p-3">Nama Perusahaan</th>
                                        <th class="p-3">KBLI</th>
                                        <th class="p-3">Skala</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-100 font-medium">
                                    <template x-for="row in uploadPreviewResult.valid_data" :key="row.no_urut">
                                        <tr>
                                            <td class="p-3 font-bold text-slate-800" x-text="row.nama_perusahaan"></td>
                                            <td class="p-3 font-mono text-slate-600" x-text="row.kbli || '-'"></td>
                                            <td class="p-3 font-bold text-emerald-700" x-text="row.skala_usaha"></td>
                                        </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <form action="{{ route('dukungan.siinas.commit-import') }}" method="POST" class="flex items-center justify-end gap-3 pt-4 border-t border-slate-100">
                        @csrf
                        <button type="button" @click="uploadStep = 1" class="px-5 py-3 rounded-2xl bg-slate-100 hover:bg-slate-200 text-slate-600 font-bold text-sm">
                            Kembali Pilih File
                        </button>
                        <button type="submit" :disabled="uploadPreviewResult.valid_count === 0" class="px-6 py-3 rounded-2xl bg-emerald-600 hover:bg-emerald-700 text-white font-bold text-sm shadow-lg shadow-emerald-600/30">
                            Konfirmasi & Simpan ke Database (OK)
                        </button>
                    </form>
                </div>
            </template>
        </div>
    </div>

    {{-- MODAL TAMBAH DATA (WITH CLEAN MULTI-KBLI AUTOCOMPLETE) --}}
    <div x-show="showAddModal" x-cloak 
         class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
        <div @click.away="showAddModal = false" class="bg-white rounded-3xl max-w-2xl w-full p-8 shadow-2xl space-y-6">
            <div class="flex justify-between items-center pb-4 border-b border-slate-100">
                <h3 class="text-xl font-black text-slate-900">Tambah Data Perusahaan SIINas</h3>
                <button @click="showAddModal = false" class="text-slate-400 hover:text-slate-600">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
                </button>
            </div>

            <form action="{{ route('dukungan.siinas.store') }}" method="POST" class="space-y-4 text-xs font-semibold text-slate-700">
                @csrf
                <div>
                    <label class="block mb-1">Nama Perusahaan / Industri *</label>
                    <input type="text" name="nama_perusahaan" required placeholder="Contoh: PT Industri Kereta Api (Persero)" class="w-full p-3 bg-slate-50 border rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block mb-1">Alamat Kantor Pusat</label>
                        <input type="text" name="alamat_kantor_pusat" placeholder="Jl. Yos Sudarso No. 71..." class="w-full p-3 bg-slate-50 border rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                    </div>
                    <div>
                        <label class="block mb-1">Alamat Pabrik</label>
                        <input type="text" name="alamat_pabrik" placeholder="Jl. Yos Sudarso No. 71..." class="w-full p-3 bg-slate-50 border rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                    </div>
                </div>

                {{-- Multi-KBLI Autocomplete Picker --}}
                <div class="relative space-y-2">
                    <label class="block mb-1">Kode & Uraian KBLI (Transisi KBLI 2020 / KBLI 2025)</label>
                    
                    {{-- Selected KBLI Badges --}}
                    <div class="flex flex-wrap gap-2 mb-2" x-show="addSelectedKblis.length > 0">
                        <template x-for="(kItem, idx) in addSelectedKblis" :key="kItem.kode">
                            <span class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-slate-900 text-white font-bold text-xs shadow-sm">
                                <span class="font-mono text-emerald-400" x-text="kItem.kode"></span>
                                <span x-text="kItem.judul" class="max-w-[220px] truncate text-slate-200 text-[11px]" :title="kItem.judul"></span>
                                <button type="button" @click="removeKbliTag(idx, 'add')" class="text-slate-400 hover:text-white font-black ml-1 text-sm">&times;</button>
                            </span>
                        </template>
                    </div>

                    <input type="hidden" name="kbli" :value="getJoinedKbli('add')">

                    <input type="text" 
                           x-model="addKbliQuery" 
                           @input.debounce.200ms="searchKbli(addKbliQuery, 'add')"
                           placeholder="Ketik kode atau uraian KBLI (contoh: 28193, 10710, roti, batik...)" 
                           class="w-full p-3 bg-slate-50 border rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-500/20">

                    {{-- Autocomplete Dropdown --}}
                    <div x-show="addKbliResults.length > 0" x-cloak 
                         class="absolute z-30 left-0 right-0 top-full mt-1 bg-white border border-slate-200 rounded-2xl shadow-xl max-h-56 overflow-y-auto divide-y divide-slate-100">
                        <template x-for="res in addKbliResults" :key="res.kode + (res.versi || '')">
                            <div @click="addKbliTag(res, 'add')" class="p-3 hover:bg-emerald-50 cursor-pointer flex items-center justify-between transition-colors">
                                <div>
                                    <span class="font-mono font-black text-emerald-700" x-text="res.kode"></span>
                                    <span class="font-bold text-slate-800 ml-2" x-text="res.judul"></span>
                                </div>
                                <span class="text-[10px] font-extrabold px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-800" x-text="res.versi || 'KBLI 2020'"></span>
                            </div>
                        </template>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block mb-1">Skala Usaha *</label>
                        <select name="skala_usaha" required class="w-full p-3 bg-slate-50 border rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-500/20">
                            <option value="Besar">Besar</option>
                            <option value="Menengah">Menengah</option>
                            <option value="Kecil" selected>Kecil</option>
                            <option value="Belum Melapor/Mengisi Investasi">Belum Melapor/Mengisi Investasi</option>
                        </select>
                    </div>
                    <div>
                        <label class="block mb-1">Tanggal Registrasi</label>
                        <input type="text" name="tanggal_registrasi" value="{{ date('d/m/Y H:i') }}" class="w-full p-3 bg-slate-50 border rounded-xl">
                    </div>
                </div>

                <div>
                    <label class="block mb-1">Deskripsi / Uraian Bidang Usaha (Terisi Otomatis Dari KBLI)</label>
                    <textarea name="bidang_usaha" x-model="addBidangUsaha" rows="3" placeholder="Uraian bidang usaha akan terisi otomatis saat KBLI dipilih..." class="w-full p-3 bg-slate-50 border rounded-xl focus:outline-none focus:ring-2 focus:ring-emerald-500/20 leading-relaxed"></textarea>
                </div>

                <div class="flex items-center justify-end gap-3 pt-4">
                    <button type="button" @click="showAddModal = false" class="px-5 py-3 rounded-2xl bg-slate-100 hover:bg-slate-200 text-slate-600 font-bold">
                        Batal
                    </button>
                    <button type="submit" class="px-6 py-3 rounded-2xl bg-slate-900 hover:bg-slate-800 text-white font-bold">
                        Simpan Data
                    </button>
                </div>
            </form>
        </div>
    </div>

    {{-- MODAL EDIT DATA (WITH CLEAN MULTI-KBLI AUTOCOMPLETE) --}}
    <div x-show="showEditModal" x-cloak 
         class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
        <div @click.away="showEditModal = false" class="bg-white rounded-3xl max-w-2xl w-full p-8 shadow-2xl space-y-6">
            <div class="flex justify-between items-center pb-4 border-b border-slate-100">
                <h3 class="text-xl font-black text-slate-900">Edit Data Perusahaan SIINas</h3>
                <button @click="showEditModal = false" class="text-slate-400 hover:text-slate-600">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
                </button>
            </div>

            <form :action="'{{ url('dukungan/siinas/update') }}/' + editIndustry.id" method="POST" class="space-y-4 text-xs font-semibold text-slate-700">
                @csrf
                @method('PUT')
                <div>
                    <label class="block mb-1">Nama Perusahaan</label>
                    <input type="text" name="nama_perusahaan" x-model="editIndustry.nama_perusahaan" required class="w-full p-3 bg-slate-50 border rounded-xl">
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block mb-1">Alamat Kantor Pusat</label>
                        <input type="text" name="alamat_kantor_pusat" x-model="editIndustry.alamat_kantor_pusat" class="w-full p-3 bg-slate-50 border rounded-xl">
                    </div>
                    <div>
                        <label class="block mb-1">Alamat Pabrik</label>
                        <input type="text" name="alamat_pabrik" x-model="editIndustry.alamat_pabrik" class="w-full p-3 bg-slate-50 border rounded-xl">
                    </div>
                </div>

                {{-- Multi-KBLI Autocomplete Picker for Edit --}}
                <div class="relative space-y-2">
                    <label class="block mb-1">Kode & Uraian KBLI (KBLI 2020 / KBLI 2025)</label>
                    
                    <div class="flex flex-wrap gap-2 mb-2" x-show="editSelectedKblis.length > 0">
                        <template x-for="(kItem, idx) in editSelectedKblis" :key="kItem.kode">
                            <span class="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl bg-slate-900 text-white font-bold text-xs shadow-sm">
                                <span class="font-mono text-emerald-400" x-text="kItem.kode"></span>
                                <span x-text="kItem.judul" class="max-w-[220px] truncate text-slate-200 text-[11px]" :title="kItem.judul"></span>
                                <button type="button" @click="removeKbliTag(idx, 'edit')" class="text-slate-400 hover:text-white font-black ml-1 text-sm">&times;</button>
                            </span>
                        </template>
                    </div>

                    <input type="hidden" name="kbli" :value="getJoinedKbli('edit')">

                    <input type="text" 
                           x-model="editKbliQuery" 
                           @input.debounce.200ms="searchKbli(editKbliQuery, 'edit')"
                           placeholder="Ketik kode/nama untuk mengubah atau menambah KBLI..." 
                           class="w-full p-3 bg-slate-50 border rounded-xl">

                    <div x-show="editKbliResults.length > 0" x-cloak 
                         class="absolute z-30 left-0 right-0 top-full mt-1 bg-white border border-slate-200 rounded-2xl shadow-xl max-h-56 overflow-y-auto divide-y divide-slate-100">
                        <template x-for="res in editKbliResults" :key="res.kode + (res.versi || '')">
                            <div @click="addKbliTag(res, 'edit')" class="p-3 hover:bg-emerald-50 cursor-pointer flex items-center justify-between transition-colors">
                                <div>
                                    <span class="font-mono font-black text-emerald-700" x-text="res.kode"></span>
                                    <span class="font-bold text-slate-800 ml-2" x-text="res.judul"></span>
                                </div>
                                <span class="text-[10px] font-extrabold px-2 py-0.5 rounded-full bg-emerald-100 text-emerald-800" x-text="res.versi || 'KBLI 2020'"></span>
                            </div>
                        </template>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block mb-1">Skala Usaha</label>
                        <select name="skala_usaha" x-model="editIndustry.skala_usaha" required class="w-full p-3 bg-slate-50 border rounded-xl">
                            <option value="Besar">Besar</option>
                            <option value="Menengah">Menengah</option>
                            <option value="Kecil">Kecil</option>
                            <option value="Belum Melapor/Mengisi Investasi">Belum Melapor/Mengisi Investasi</option>
                        </select>
                    </div>
                    <div>
                        <label class="block mb-1">Tanggal Registrasi</label>
                        <input type="text" name="tanggal_registrasi" x-model="editIndustry.tanggal_registrasi" class="w-full p-3 bg-slate-50 border rounded-xl">
                    </div>
                </div>

                <div>
                    <label class="block mb-1">Bidang Usaha</label>
                    <textarea name="bidang_usaha" rows="3" x-model="editIndustry.bidang_usaha" class="w-full p-3 bg-slate-50 border rounded-xl leading-relaxed"></textarea>
                </div>

                <div class="flex items-center justify-end gap-3 pt-4">
                    <button type="button" @click="showEditModal = false" class="px-5 py-3 rounded-2xl bg-slate-100 hover:bg-slate-200 text-slate-600 font-bold">
                        Batal
                    </button>
                    <button type="submit" class="px-6 py-3 rounded-2xl bg-emerald-600 hover:bg-emerald-700 text-white font-bold">
                        Perbarui Data
                    </button>
                </div>
            </form>
        </div>
    </div>

    {{-- MODAL DETAIL --}}
    <div x-show="showDetailModal" x-cloak 
         class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
        <div @click.away="showDetailModal = false" class="bg-white rounded-3xl max-w-xl w-full p-8 shadow-2xl space-y-6">
            <div class="flex justify-between items-center pb-4 border-b border-slate-100">
                <div>
                    <h3 class="text-xl font-black text-slate-900" x-text="selectedIndustry.nama_perusahaan"></h3>
                    <span class="text-xs font-bold text-emerald-600" x-text="selectedIndustry.status_pelaporan"></span>
                </div>
                <button @click="showDetailModal = false" class="text-slate-400 hover:text-slate-600">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
                </button>
            </div>

            <div class="space-y-4 text-xs font-medium text-slate-700">
                <div class="p-4 bg-slate-50 rounded-2xl space-y-2">
                    <span class="text-[10px] font-extrabold uppercase text-slate-400 tracking-wider">Skala Usaha SIINas</span>
                    <div class="font-extrabold text-sm text-slate-900" x-text="selectedIndustry.skala_usaha"></div>
                </div>

                <div class="space-y-1">
                    <span class="text-[10px] font-bold uppercase text-slate-400">Alamat Pabrik</span>
                    <p class="font-bold text-slate-800" x-text="selectedIndustry.alamat_pabrik || '-'"></p>
                </div>

                <div class="space-y-1">
                    <span class="text-[10px] font-bold uppercase text-slate-400">Alamat Kantor Pusat</span>
                    <p class="font-bold text-slate-800" x-text="selectedIndustry.alamat_kantor_pusat || '-'"></p>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div class="space-y-1">
                        <span class="text-[10px] font-bold uppercase text-slate-400">KBLI</span>
                        <p class="font-bold text-slate-900 font-mono text-emerald-700" x-text="selectedIndustry.kbli || '-'"></p>
                    </div>
                    <div class="space-y-1">
                        <span class="text-[10px] font-bold uppercase text-slate-400">Tanggal Registrasi</span>
                        <p class="font-bold text-slate-900" x-text="selectedIndustry.tanggal_registrasi || '-'"></p>
                    </div>
                </div>

                <div class="space-y-1">
                    <span class="text-[10px] font-bold uppercase text-slate-400">Bidang Usaha</span>
                    <p class="text-slate-800 leading-relaxed font-semibold" x-text="selectedIndustry.bidang_usaha || '-'"></p>
                </div>
            </div>

            <div class="pt-4 border-t border-slate-100 flex justify-end">
                <button @click="showDetailModal = false" class="px-6 py-2.5 rounded-2xl bg-slate-900 text-white font-bold text-xs">
                    Tutup
                </button>
            </div>
        </div>
    </div>

    {{-- MODAL KONFIRMASI HAPUS DATA SIINAS (FULL COLOUR THEME ROSE / MERAH GRADIENT) --}}
    <div x-show="showDeleteModal" x-cloak x-transition
         class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4" style="display:none;">
        <div @click.away="if(!isDeletingCountdown) showDeleteModal = false" class="bg-white rounded-[32px] border border-rose-100 shadow-2xl max-w-md w-full overflow-hidden flex flex-col">
            
            {{-- Header Gradien Rose / Red / Slate --}}
            <div class="bg-gradient-to-r from-rose-700 via-rose-800 to-slate-900 px-6 py-5 text-white flex justify-between items-center shrink-0">
                <div class="flex items-center gap-3">
                    <div class="w-11 h-11 rounded-2xl bg-rose-500/20 border border-rose-400/30 flex items-center justify-center text-2xl shadow-inner">
                        🗑️
                    </div>
                    <div>
                        <h3 class="text-lg font-black tracking-tight">Konfirmasi Hapus Data SIINas</h3>
                        <p class="text-xs text-rose-200 font-medium">Penghapusan permanen entitas industri SIINas</p>
                    </div>
                </div>
                <button type="button" x-show="!isDeletingCountdown" @click="showDeleteModal = false" class="w-8 h-8 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white font-bold text-xl transition">&times;</button>
            </div>

            <div class="p-6 space-y-4">
                <div class="p-4 bg-rose-50/70 border border-rose-200 rounded-2xl space-y-2">
                    <p class="text-xs font-extrabold text-slate-800">Apakah Anda yakin ingin menghapus data perusahaan ini?</p>
                    <p class="text-[11px] text-rose-700 font-bold">⚠️ Data pelaporan industri ini akan dicabut secara permanen dari database SIINas.</p>
                    
                    <div class="mt-3 pt-2.5 border-t border-rose-200/80 space-y-2 text-xs text-slate-600">
                        <div class="flex justify-between items-start">
                            <span class="font-bold text-slate-400">Nama Perusahaan:</span>
                            <span class="font-black text-slate-900 text-right max-w-[200px]" x-text="deleteItem.nama_perusahaan || '-'"></span>
                        </div>
                        <template x-if="deleteItem.kbli">
                            <div class="flex justify-between items-center">
                                <span class="font-bold text-slate-400">Kode KBLI:</span>
                                <span class="font-mono font-extrabold text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded text-[11px]" x-text="deleteItem.kbli"></span>
                            </div>
                        </template>
                        <template x-if="deleteItem.skala_usaha">
                            <div class="flex justify-between items-center">
                                <span class="font-bold text-slate-400">Skala Usaha:</span>
                                <span class="font-extrabold text-slate-800 text-[11px]" x-text="deleteItem.skala_usaha"></span>
                            </div>
                        </template>
                    </div>
                </div>

                {{-- State Countdown 3 Detik --}}
                <div x-show="isDeletingCountdown" class="p-4 bg-amber-50 border border-amber-200 rounded-2xl text-center space-y-2 animate-pulse">
                    <div class="text-2xl font-black text-amber-700">⏳ <span x-text="deleteCountdown"></span> detik</div>
                    <p class="text-xs font-extrabold text-amber-800">Menghapus data & mensinkronkan ulang database SIINas...</p>
                </div>

                <div x-show="!isDeletingCountdown" class="flex justify-end gap-3 pt-2">
                    <button type="button" @click="showDeleteModal = false" class="px-5 py-2.5 border border-slate-200 text-slate-600 rounded-xl text-xs font-bold hover:bg-slate-50 transition">
                        ❌ Batal
                    </button>
                    <button type="button" @click="startDeleteCountdown()" class="px-6 py-2.5 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-extrabold transition shadow-md shadow-rose-600/20 flex items-center gap-1.5 hover:scale-[1.02]">
                        <span>🗑️ Ya, Hapus Data Perusahaan</span>
                    </button>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection

