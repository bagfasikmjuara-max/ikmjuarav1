<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Pendaftar Pelatihan IKM</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .custom-scrollbar::-webkit-scrollbar { height: 8px; width: 8px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: #f1f5f9; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 4px; }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover { background: #94a3b8; }
    </style>
</head>
<body class="bg-slate-100 p-4 min-h-screen text-slate-800" x-data="{ activeDetail: null }">
    <div class="max-w-full mx-auto space-y-6">
        
        {{-- HEADER BANNER --}}
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 bg-white p-6 rounded-3xl border border-slate-200 shadow-sm">
            <div>
                <span class="text-xs font-black text-indigo-600 uppercase tracking-widest bg-indigo-50 px-3 py-1 rounded-full border border-indigo-100">DisnakerKUKM Kota Madiun</span>
                <h2 class="text-2xl font-black text-slate-900 mt-2 tracking-tight">Database Pendaftar Pelatihan IKM</h2>
                <p class="text-xs text-slate-500 font-medium mt-0.5">Penampung data pendaftaran peserta pelatihan terintegrasi secara real-time.</p>
            </div>
            
            <div class="flex flex-wrap items-center gap-3">
                <a href="{{ route('admin.dashboard') }}" class="px-4 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-2xl text-xs font-extrabold transition flex items-center shadow-xs">
                    <i class="fas fa-arrow-left mr-2"></i> Kembali ke Dashboard
                </a>
                <span class="bg-indigo-600 text-white px-4 py-2.5 rounded-2xl text-xs font-black shadow-md flex items-center gap-2">
                    <i class="fas fa-users"></i> Total: {{ count($pendaftar) }} Peserta
                </span>
            </div>
        </div>

        {{-- METRICS SUMMARY CARDS PER KEGIATAN --}}
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            @foreach($statistik as $stat)
            <div class="bg-white p-5 rounded-3xl shadow-xs border border-slate-200 flex flex-col justify-between hover:shadow-md transition">
                <div class="flex justify-between items-start mb-2">
                    <div class="flex-1 pr-2">
                        <h4 class="text-[10px] font-black text-slate-400 uppercase tracking-wider truncate" title="{{ $stat->nama }}">{{ $stat->nama }}</h4>
                        <p class="text-2xl font-black text-indigo-600 mt-1">{{ $stat->terisi }} <span class="text-xs text-slate-400 font-normal">/ {{ $stat->kuota }} Peserta</span></p>
                    </div>
                    <div class="bg-indigo-50 text-indigo-700 px-2.5 py-1 rounded-full text-[10px] font-black border border-indigo-100 shrink-0">
                        {{ $stat->persentase }}% Terisi
                    </div>
                </div>
                
                <div class="w-full bg-slate-100 rounded-full h-2 mb-2 overflow-hidden">
                    <div class="bg-indigo-600 h-2 rounded-full transition-all duration-700" style="width: {{ $stat->persentase }}%"></div>
                </div>
                
                <p class="text-[10px] {{ $stat->sisa <= 5 ? 'text-rose-600 font-black' : 'text-slate-500 font-bold' }}">
                    {!! $stat->sisa <= 0 ? '<i class="fas fa-exclamation-triangle mr-1"></i> KUOTA HABIS' : '⚡ Sisa Kuota: ' . $stat->sisa . ' Kursi' !!}
                </p>
            </div>
            @endforeach
        </div>

        {{-- TOOLBAR & FILTER --}}
        <div class="bg-white p-6 rounded-3xl shadow-xs border border-slate-200">
            <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
                <form action="{{ route('admin.pendaftar') }}" method="GET" class="flex flex-wrap items-center gap-3">
                    <div class="flex items-center gap-2 bg-slate-50 p-2 rounded-2xl border border-slate-200">
                        <span class="text-[10px] font-black text-slate-400 uppercase pl-2">Filter Kegiatan:</span>
                        <select name="kegiatan" class="bg-white border border-slate-200 rounded-xl px-3 py-2 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 transition min-w-[200px]">
                            <option value="">-- Semua Kegiatan --</option>
                            @foreach($list_kegiatan as $keg)
                                <option value="{{ $keg }}" {{ request('kegiatan') == $keg ? 'selected' : '' }}>{{ $keg }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="flex gap-2">
                        <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-2.5 rounded-2xl text-xs font-black transition flex items-center shadow-xs">
                            <i class="fas fa-filter mr-2"></i> Filter
                        </button>
                        <a href="{{ route('admin.pendaftar') }}" class="bg-slate-100 hover:bg-slate-200 text-slate-700 px-4 py-2.5 rounded-2xl text-xs font-bold transition">Reset</a>
                    </div>
                </form>

                <div class="flex flex-wrap items-center gap-3">
                    <a href="{{ route('admin.kegiatan.index') }}" class="inline-flex items-center px-4 py-2.5 bg-slate-800 hover:bg-slate-900 text-white text-xs font-bold rounded-2xl shadow-xs transition">
                        <i class="fas fa-cog mr-2"></i> Pengaturan Kegiatan
                    </a>
                    <a href="{{ route('admin.recycle') }}" class="bg-slate-100 hover:bg-slate-200 text-slate-700 px-4 py-2.5 rounded-2xl text-xs font-bold flex items-center gap-2 transition border border-slate-200">
                        <i class="fas fa-trash-alt text-rose-500"></i> <span>Sampah</span>
                    </a>
                    <a href="{{ route('admin.pendaftar.export', ['kegiatan' => request('kegiatan')]) }}" class="bg-emerald-600 hover:bg-emerald-700 text-white px-4 py-2.5 rounded-2xl text-xs font-black shadow-xs flex items-center gap-2 transition">
                        <i class="fas fa-file-excel"></i> <span>Export Excel</span>
                    </a>
                </div>
            </div>
        </div>
        
        {{-- MAIN TABLE PENDAFTAR --}}
        <div class="bg-white shadow-md rounded-3xl overflow-hidden border border-slate-200">
            <div class="overflow-x-auto custom-scrollbar">
                <table class="min-w-full table-auto border-collapse text-left">
                    <thead>
                        <tr class="bg-slate-900 text-white text-[10px] uppercase font-black tracking-widest">
                            <th class="px-4 py-4 border-r border-slate-800 text-center">No</th>
                            <th class="px-4 py-4 border-r border-slate-800 text-center">Foto KTP</th>
                            <th class="px-4 py-4 border-r border-slate-800 text-center">Foto Produk</th>
                            <th class="px-4 py-4 border-r border-slate-800">Biodata Peserta</th>
                            <th class="px-4 py-4 border-r border-slate-800">NIK & Status NIB</th>
                            <th class="px-4 py-4 border-r border-slate-800">Kontak & WA</th>
                            <th class="px-4 py-4 border-r border-slate-800">Usaha & Produk</th>
                            <th class="px-4 py-4 border-r border-slate-800">Alamat Lokasi</th>
                            <th class="px-4 py-4 border-r border-slate-800">Omzet & Pemasaran</th>
                            <th class="px-4 py-4 border-r border-slate-800">Digitalisasi</th>
                            <th class="px-4 py-4 border-r border-slate-800">Pelatihan Diikuti</th>
                            <th class="px-4 py-4 text-center">Aksi & Detail</th>
                        </tr>
                    </thead>
                    <tbody class="text-slate-700 text-xs divide-y divide-slate-100 font-medium">
                        @forelse($pendaftar as $index => $item)
                        <tr class="hover:bg-indigo-50/20 transition-colors">
                            <td class="px-4 py-4 text-center font-black bg-slate-50 border-r border-slate-100">{{ $index + 1 }}</td>
                            
                            {{-- FOTO KTP --}}
                            <td class="px-4 py-4 border-r border-slate-100 text-center">
                                @if($item->foto_ktp)
                                    <div class="flex flex-col items-center gap-1">
                                        <img src="{{ $item->foto_ktp }}" 
                                             class="h-12 w-20 object-cover rounded-xl shadow-xs border border-slate-200 bg-slate-100 cursor-zoom-in hover:scale-105 transition"
                                             onclick="window.open(this.src)"
                                             onerror="this.onerror=null;this.src='https://placehold.co/100x60/e2e8f0/475569?text=Error';">
                                        <a href="{{ $item->foto_ktp }}" target="_blank" class="text-[9px] bg-indigo-50 text-indigo-700 px-2 py-0.5 rounded-md font-bold hover:bg-indigo-600 hover:text-white transition">
                                            📄 KTP
                                        </a>
                                    </div>
                                @else
                                    <span class="text-slate-400 italic text-[11px]">Tanpa KTP</span>
                                @endif
                            </td>

                            {{-- FOTO PRODUK / USAHA --}}
                            <td class="px-4 py-4 border-r border-slate-100 text-center min-w-[130px]">
                                @php
                                    $fotoProdukArr = [];
                                    if (!empty($item->foto_produk)) {
                                        $decoded = json_decode($item->foto_produk, true);
                                        if (is_array($decoded)) {
                                            $fotoProdukArr = $decoded;
                                        } else {
                                            $fotoProdukArr = [$item->foto_produk];
                                        }
                                    }
                                @endphp
                                @if(count($fotoProdukArr) > 0)
                                    <div class="flex items-center justify-center gap-1.5 flex-wrap">
                                        @foreach($fotoProdukArr as $pIndex => $pUrl)
                                            <img src="{{ $pUrl }}" 
                                                 class="h-10 w-10 object-cover rounded-xl border border-slate-200 shadow-xs cursor-zoom-in hover:scale-110 transition"
                                                 title="Foto Produk {{ $pIndex + 1 }}"
                                                 onclick="window.open(this.src)">
                                        @endforeach
                                    </div>
                                    <span class="text-[9px] font-bold text-slate-400 block mt-1">{{ count($fotoProdukArr) }} Foto Usaha</span>
                                @else
                                    <span class="text-slate-400 italic text-[11px]">Tanpa Foto</span>
                                @endif
                            </td>

                            {{-- BIODATA PESERTA --}}
                            <td class="px-4 py-4 border-r border-slate-100 min-w-[150px]">
                                <div class="font-black text-slate-900 leading-snug uppercase">{{ $item->nama_lengkap }}</div>
                                <div class="text-xs font-bold text-indigo-600 mt-0.5">👤 {{ $item->jenis_kelamin }}</div>
                                <div class="text-[10px] text-slate-500 mt-1 font-medium">🎂 {{ $item->tanggal_lahir }}</div>
                            </td>

                            {{-- LEGALITAS (NIK / NIB) --}}
                            <td class="px-4 py-4 border-r border-slate-100 whitespace-nowrap min-w-[150px]">
                                <div class="text-[11px] font-mono font-bold text-slate-700">NIK: {{ $item->nik }}</div>
                                <div class="mt-1">
                                    @if(str_contains($item->nib, 'Belum'))
                                        <span class="inline-block text-[10px] font-bold px-2 py-0.5 rounded-full bg-amber-50 text-amber-800 border border-amber-200">
                                            ⚠️ {{ $item->nib }}
                                        </span>
                                    @else
                                        <span class="inline-block text-[11px] font-mono font-bold text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded-lg border border-emerald-100">
                                            NIB: {{ $item->nib }}
                                        </span>
                                    @endif
                                </div>
                            </td>

                            {{-- KONTAK & WA --}}
                            <td class="px-4 py-4 border-r border-slate-100 min-w-[140px]">
                                <a href="https://wa.me/{{ preg_replace('/[^0-9]/', '', $item->whatsapp) }}" target="_blank" class="inline-flex items-center gap-1 text-emerald-700 font-bold hover:underline">
                                    📞 {{ $item->whatsapp }}
                                </a>
                                <div class="text-slate-500 text-[10px] truncate max-w-[130px] mt-0.5" title="{{ $item->email }}">✉️ {{ $item->email }}</div>
                            </td>

                            {{-- DETAIL USAHA & PRODUK --}}
                            <td class="px-4 py-4 border-r border-slate-100 min-w-[160px]">
                                <div class="font-black text-slate-900 leading-snug uppercase">{{ $item->nama_usaha }}</div>
                                @if(!empty($item->produk_diproduksi))
                                    <div class="text-[10px] font-bold text-indigo-700 mt-1">
                                        📦 {{ $item->produk_diproduksi }}
                                    </div>
                                @endif
                                <div class="flex flex-wrap gap-1 mt-1.5">
                                    <span class="bg-slate-100 text-slate-700 px-2 py-0.5 rounded-md text-[9px] font-bold border border-slate-200">{{ $item->jenis_usaha }}</span>
                                    <span class="bg-amber-50 text-amber-800 px-2 py-0.5 rounded-md text-[9px] font-bold border border-amber-200">{{ $item->skala_usaha }}</span>
                                </div>
                            </td>

                            {{-- ALAMAT LENGKAP --}}
                            <td class="px-4 py-4 border-r border-slate-100 min-w-[180px]">
                                <div class="text-xs font-bold text-slate-800 leading-snug line-clamp-2" title="{{ $item->alamat_usaha }}">
                                    📍 {{ $item->alamat_usaha }}
                                </div>
                                <div class="mt-1 text-[10px] font-bold text-indigo-600">
                                    Kel. {{ $item->kelurahan }}, Kec. {{ $item->kecamatan }}
                                </div>
                            </td>

                            {{-- FINANSIAL & PEMASARAN --}}
                            <td class="px-4 py-4 border-r border-slate-100 min-w-[160px]">
                                @php
                                    $rawOmzet = $item->omzet_bulanan ?? '';
                                    if (is_numeric($rawOmzet)) {
                                        $displayOmzet = 'Rp ' . number_format((float)$rawOmzet, 0, ',', '.');
                                    } elseif (!empty($rawOmzet)) {
                                        $displayOmzet = (str_starts_with(strtolower($rawOmzet), 'rp') ? '' : 'Rp ') . $rawOmzet;
                                    } else {
                                        $displayOmzet = '-';
                                    }
                                @endphp
                                <div class="text-indigo-700 font-black text-sm">{{ $displayOmzet }}</div>
                                <div class="text-[10px] text-slate-500 font-bold">Stabilitas: <span class="text-slate-800">{{ $item->stabilitas_omzet ?: '-' }}</span></div>
                                
                                {{-- CAKUPAN PEMASARAN --}}
                                @php
                                    $cakupanArr = [];
                                    if (!empty($item->cakupan_pemasaran)) {
                                        $cDecoded = json_decode($item->cakupan_pemasaran, true);
                                        if (is_array($cDecoded)) $cakupanArr = $cDecoded;
                                    }
                                @endphp
                                @if(count($cakupanArr) > 0)
                                    <div class="flex flex-wrap gap-1 mt-1">
                                        @foreach($cakupanArr as $cak)
                                            <span class="text-[9px] font-black px-1.5 py-0.5 bg-blue-50 text-blue-700 rounded border border-blue-100">
                                                🌐 {{ str_contains($cak, 'Lokal') ? 'Lokal' : 'Regional' }}
                                            </span>
                                        @endforeach
                                    </div>
                                @endif
                            </td>

                            {{-- DIGITALISASI --}}
                            <td class="px-4 py-4 border-r border-slate-100 min-w-[150px]">
                                <span class="inline-block text-[10px] font-bold px-2 py-0.5 bg-indigo-50 text-indigo-700 rounded-full border border-indigo-100 mb-1">
                                    💻 {{ $item->level_digital }}
                                </span>
                                <div class="text-[10px] text-slate-500 line-clamp-1" title="{{ $item->harapan_pelatihan }}">
                                    🎯 {{ $item->harapan_pelatihan }}
                                </div>
                            </td>

                            {{-- KEGIATAN --}}
                            <td class="px-4 py-4 border-r border-slate-100 min-w-[150px]">
                                <span class="text-slate-900 font-bold text-xs leading-snug block">
                                    🎓 {{ $item->nama_kegiatan }}
                                </span>
                            </td>

                            {{-- AKSI & DETAIL --}}
                            <td class="px-4 py-4 text-center whitespace-nowrap">
                                <div class="flex items-center justify-center gap-2">
                                    <button type="button" 
                                            @click="activeDetail = {{ json_encode($item) }}" 
                                            class="px-3 py-1.5 bg-indigo-600 hover:bg-indigo-700 text-white font-black text-xs rounded-xl shadow-xs transition flex items-center gap-1 shrink-0">
                                        <span>👁️ Detail</span>
                                    </button>

                                    <form id="delete-form-{{ $item->id }}" action="{{ route('admin.pendaftar.destroy', $item->id) }}" method="POST" class="inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" onclick="confirmDelete('{{ $item->id }}', '{{ addslashes($item->nama_lengkap) }}')" class="h-8 w-8 flex items-center justify-center rounded-xl bg-rose-50 text-rose-600 hover:bg-rose-600 hover:text-white transition shadow-xs" title="Pindahkan ke Sampah">
                                            <i class="fas fa-trash-alt text-xs"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="12" class="text-center py-16 text-slate-400 font-medium">
                                📭 Belum ada data pendaftar pelatihan yang masuk.
                            </td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    {{-- MODAL DETAIL INTERAKTIF FULL COLOUR --}}
    <div x-show="activeDetail" 
         x-transition 
         class="fixed inset-0 bg-slate-950/70 backdrop-blur-md z-50 flex items-center justify-center p-4 overflow-y-auto" 
         style="display: none;">
        <div class="bg-white rounded-[35px] max-w-4xl w-full p-8 shadow-2xl space-y-6 relative overflow-hidden border border-slate-200" @click.outside="activeDetail = null">
            
            {{-- MODAL HEADER BANNER --}}
            <div class="flex justify-between items-start bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 -m-8 p-8 mb-4 text-white">
                <div>
                    <span class="text-[10px] font-black text-amber-400 uppercase tracking-widest bg-amber-400/10 px-3 py-1 rounded-full border border-amber-400/20">Detail Lengkap Pendaftar Pelatihan</span>
                    <h3 class="text-2xl font-black mt-2" x-text="activeDetail ? activeDetail.nama_lengkap : ''"></h3>
                    <p class="text-xs text-slate-300 font-medium mt-1">Usaha: <span class="font-bold text-amber-300" x-text="activeDetail ? activeDetail.nama_usaha : ''"></span> | Kegiatan: <span class="font-bold text-indigo-300" x-text="activeDetail ? activeDetail.nama_kegiatan : ''"></span></p>
                </div>
                <button type="button" @click="activeDetail = null" class="w-10 h-10 rounded-2xl bg-white/10 hover:bg-white/20 text-white flex items-center justify-center font-bold text-xl transition">
                    ✕
                </button>
            </div>

            {{-- DETAIL GRID CONTENT --}}
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 pt-4 max-h-[70vh] overflow-y-auto custom-scrollbar pr-2">
                
                {{-- SECTION 1: BIODATA & LEGALITAS --}}
                <div class="md:col-span-2 bg-indigo-50/60 p-5 rounded-3xl border border-indigo-100 space-y-4">
                    <h4 class="text-xs font-black text-indigo-900 uppercase tracking-wider flex items-center gap-2 border-b border-indigo-100 pb-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-indigo-600"></span>
                        <span>1. Biodata & Legalitas Peserta</span>
                    </h4>
                    
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">NIK (16 Digit)</span>
                            <span class="text-xs font-mono font-bold text-slate-800" x-text="activeDetail ? activeDetail.nik : ''"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">NIB / Status Legalitas</span>
                            <span class="text-xs font-mono font-bold text-emerald-700" x-text="activeDetail ? activeDetail.nib : ''"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Jenis Kelamin & Tgl Lahir</span>
                            <span class="text-xs font-bold text-slate-800" x-text="activeDetail ? activeDetail.jenis_kelamin + ' (' + activeDetail.tanggal_lahir + ')' : ''"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Nomor WhatsApp</span>
                            <a :href="activeDetail ? 'https://wa.me/' + activeDetail.whatsapp.replace(/[^0-9]/g, '') : '#'" target="_blank" class="text-xs font-bold text-emerald-600 hover:underline" x-text="activeDetail ? '📞 ' + activeDetail.whatsapp : ''"></a>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Email Aktif</span>
                            <span class="text-xs font-bold text-slate-800" x-text="activeDetail ? activeDetail.email : ''"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Lampiran Foto KTP</span>
                            <template x-if="activeDetail && activeDetail.foto_ktp">
                                <a :href="activeDetail.foto_ktp" target="_blank" class="inline-block mt-1 px-3 py-1 bg-white border border-slate-200 text-indigo-700 font-bold text-xs rounded-xl shadow-xs hover:bg-indigo-600 hover:text-white transition">
                                    📄 Buka Foto KTP
                                </a>
                            </template>
                        </div>
                    </div>
                </div>

                {{-- SECTION 2: INFORMASI USAHA & ALAMAT --}}
                <div class="md:col-span-2 bg-slate-50 p-5 rounded-3xl border border-slate-200 space-y-4">
                    <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider flex items-center gap-2 border-b border-slate-200 pb-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-amber-500"></span>
                        <span>2. Informasi Usaha & Lokasi Usaha</span>
                    </h4>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Nama Usaha / Merek</span>
                            <span class="text-xs font-black text-slate-900" x-text="activeDetail ? activeDetail.nama_usaha : ''"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Produk Diproduksi</span>
                            <span class="text-xs font-bold text-indigo-700" x-text="activeDetail && activeDetail.produk_diproduksi ? activeDetail.produk_diproduksi : '-'"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Jenis, Tahun, & Skala</span>
                            <span class="text-xs font-bold text-slate-800" x-text="activeDetail ? activeDetail.jenis_usaha + ' | Mulai ' + activeDetail.tahun_mulai + ' | ' + activeDetail.skala_usaha : ''"></span>
                        </div>
                        <div class="md:col-span-2">
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Alamat Usaha & Kelurahan/Kecamatan</span>
                            <p class="text-xs font-bold text-slate-800 leading-relaxed" x-text="activeDetail ? activeDetail.alamat_usaha + ' (Kel. ' + activeDetail.kelurahan + ', Kec. ' + activeDetail.kecamatan + ', ' + activeDetail.kota + ')' : ''"></p>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Foto Produk / Usaha</span>
                            <template x-if="activeDetail && activeDetail.foto_produk">
                                <div class="flex flex-wrap gap-1.5 mt-1">
                                    <template x-for="(fUrl, fIdx) in (typeof activeDetail.foto_produk === 'string' && activeDetail.foto_produk.startsWith('[') ? JSON.parse(activeDetail.foto_produk) : [activeDetail.foto_produk])" :key="fIdx">
                                        <a :href="fUrl" target="_blank" class="px-2 py-1 bg-amber-100 text-amber-800 border border-amber-200 text-[10px] font-bold rounded-lg hover:bg-amber-500 hover:text-white transition">
                                            🖼️ Foto <span x-text="fIdx + 1"></span>
                                        </a>
                                    </template>
                                </div>
                            </template>
                        </div>
                    </div>
                </div>

                {{-- SECTION 3: KONDISI BISNIS & PEMASARAN --}}
                <div class="md:col-span-2 bg-slate-50 p-5 rounded-3xl border border-slate-200 space-y-4">
                    <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider flex items-center gap-2 border-b border-slate-200 pb-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-emerald-500"></span>
                        <span>3. Kondisi Bisnis & Pemasaran Produk</span>
                    </h4>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Omzet Bulanan & Stabilitas</span>
                            <span class="text-xs font-black text-emerald-700" x-text="activeDetail ? 'Rp ' + new Intl.NumberFormat('id-ID').format(activeDetail.omzet_bulanan) + ' (' + activeDetail.stabilitas_omzet + ')' : ''"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Jumlah Karyawan</span>
                            <span class="text-xs font-bold text-slate-800" x-text="activeDetail ? 'Tetap: ' + activeDetail.karyawan_tetap + ' | Tidak Tetap: ' + activeDetail.karyawan_tidak_tetap : ''"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Cakupan Wilayah Pemasaran</span>
                            <span class="text-xs font-bold text-blue-700" x-text="activeDetail && activeDetail.cakupan_pemasaran ? activeDetail.cakupan_pemasaran : 'Belum ditentukan'"></span>
                        </div>
                        <div class="md:col-span-3 grid grid-cols-1 md:grid-cols-2 gap-4 pt-2 border-t border-slate-200">
                            <div>
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block mb-1">Tantangan Utama Usaha</span>
                                <p class="text-xs font-bold text-slate-800 bg-white p-3 rounded-2xl border border-slate-200" x-text="activeDetail && activeDetail.tantangan_usaha ? activeDetail.tantangan_usaha : '-'"></p>
                            </div>
                            <div>
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block mb-1">Media Penjualan Yang Digunakan</span>
                                <p class="text-xs font-bold text-slate-800 bg-white p-3 rounded-2xl border border-slate-200" x-text="activeDetail && activeDetail.media_penjualan ? activeDetail.media_penjualan : '-'"></p>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- SECTION 4: DIGITALISASI & HARAPAN --}}
                <div class="md:col-span-2 bg-indigo-50/60 p-5 rounded-3xl border border-indigo-100 space-y-4">
                    <h4 class="text-xs font-black text-indigo-900 uppercase tracking-wider flex items-center gap-2 border-b border-indigo-100 pb-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-indigo-600"></span>
                        <span>4. Tingkat Digitalisasi & Harapan Peserta</span>
                    </h4>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Tingkat Digital Marketing</span>
                            <span class="text-xs font-bold text-indigo-800" x-text="activeDetail ? activeDetail.level_digital : ''"></span>
                        </div>
                        <div>
                            <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block">Pernah Pelatihan Sebelumnya</span>
                            <span class="text-xs font-bold text-slate-800" x-text="activeDetail ? activeDetail.pernah_pelatihan : ''"></span>
                        </div>
                        <div class="md:col-span-2 space-y-3">
                            <div>
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block mb-1">Harapan Setelah Pelatihan</span>
                                <p class="text-xs font-bold text-slate-800 bg-white p-3.5 rounded-2xl border border-indigo-100 leading-relaxed" x-text="activeDetail && activeDetail.harapan_pelatihan ? activeDetail.harapan_pelatihan : '-'"></p>
                            </div>
                            <div>
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-wider block mb-1">Target Usaha Dalam 6 Bulan Ke Depan</span>
                                <p class="text-xs font-bold text-slate-800 bg-white p-3.5 rounded-2xl border border-indigo-100 leading-relaxed" x-text="activeDetail && activeDetail.target_6_bulan ? activeDetail.target_6_bulan : '-'"></p>
                            </div>
                        </div>
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

    <script>
        function confirmDelete(id, nama) {
            Swal.fire({
                title: 'Pindahkan ke Sampah?',
                text: "Apakah Anda yakin ingin memindahkan data pendaftar '" + nama + "' ke Recycle Bin?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#ef4444',
                cancelButtonColor: '#64748b',
                confirmButtonText: 'Ya, Pindahkan!',
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
</body> 
</html>