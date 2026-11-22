@extends('layouts.dukungan')

@section('title', 'Dasbor Rekap & Tools Admin — TNA Digital')
@section('hide_header_title', true)

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div x-data="adminTnaManager()" class="space-y-8 pb-12">
    
    {{-- Header Banner Card Admin Eksekutif --}}
    <div class="bg-gradient-to-r from-emerald-800 via-emerald-900 to-slate-900 rounded-[32px] p-8 text-white shadow-2xl relative overflow-hidden">
        <div class="absolute -right-12 -top-12 w-64 h-64 rounded-full bg-emerald-500/10 blur-3xl pointer-events-none"></div>
        <div class="absolute right-32 -bottom-16 w-48 h-48 rounded-full bg-amber-500/10 blur-2xl pointer-events-none"></div>

        <div class="relative z-10 flex flex-col md:flex-row justify-between items-start md:items-center gap-6">
            <div class="space-y-2">
                <div class="inline-flex items-center gap-2 px-3 py-1 bg-emerald-500/20 border border-emerald-400/30 rounded-full text-xs font-black text-emerald-300 uppercase tracking-widest">
                    <span>🛡️ Dasbor Rekapitulasi & Tools Pengelolaan Admin</span>
                </div>
                <h2 class="text-3xl md:text-4xl font-black tracking-tight">REKAP TNA <span class="text-emerald-400">DIGITAL</span> IKM JUARA</h2>
                <p class="text-slate-300 text-sm font-medium max-w-2xl leading-relaxed">
                    Pengelolaan antrean pembinaan terpadu, rekapitulasi kebutuhan pelatihan, dan analisis kendala operasional IKM Kota Madiun.
                </p>
            </div>
            
            {{-- Primary Action Button --}}
            <div class="flex items-center gap-3 shrink-0">
                <a href="{{ route('dukungan.tnadigital.export', request()->query()) }}" class="px-5 py-3 bg-amber-500 hover:bg-amber-600 text-slate-950 font-black rounded-2xl text-xs transition shadow-lg flex items-center gap-2">
                    <span>📥 Export Rekap Excel (.xlsx)</span>
                </a>
                <button type="button" @click="openPertanyaanModal = true" class="px-5 py-3 bg-indigo-600 hover:bg-indigo-700 text-white font-black rounded-2xl text-xs transition shadow-lg flex items-center gap-2">
                    <span>⚙️ Kelola Pertanyaan & Opsi TNA</span>
                </button>
                <button type="button" @click="openAddModal = true" class="px-5 py-3 bg-emerald-500 hover:bg-emerald-600 text-white font-black rounded-2xl text-xs transition shadow-lg flex items-center gap-2">
                    <span>➕ Input Form TNA Baru</span>
                </button>
            </div>
        </div>
    </div>

    {{-- Session Success Banner Alert --}}
    @if(session('success'))
        <div x-data="{ open: true }" x-show="open" class="bg-emerald-50 border-2 border-emerald-300 p-5 rounded-3xl shadow-md flex items-center justify-between gap-4">
            <div class="flex items-center gap-3">
                <span class="text-2xl">🎉</span>
                <p class="text-xs font-bold text-emerald-900">{{ session('success') }}</p>
            </div>
            <button @click="open = false" class="text-emerald-500 hover:text-emerald-700 text-lg font-bold">&times;</button>
        </div>
    @endif

    {{-- 4 KPI Executive Stat Cards --}}
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
        {{-- Card 1: Total Responden --}}
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-sm relative overflow-hidden group hover:border-emerald-300 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">Total Responden TNA</span>
                <span class="w-2.5 h-2.5 rounded-full bg-emerald-500"></span>
            </div>
            <div class="mt-3">
                <div class="flex items-baseline gap-2">
                    <h3 class="text-3xl font-black text-slate-900 tracking-tight">{{ number_format($totalResponden) }}</h3>
                    <span class="text-xs font-bold text-emerald-600">IKM</span>
                </div>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="text-[11px] font-bold text-slate-500">📊 Assessment Terisi</span>
                    <span class="text-[11px] font-black text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded-md">100% Aktif</span>
                </div>
            </div>
        </div>

        {{-- Card 2: Top Topic Demand #1 --}}
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-sm relative overflow-hidden group hover:border-amber-300 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">Topik Pelatihan #1 Demand</span>
                <span class="w-2.5 h-2.5 rounded-full bg-amber-500"></span>
            </div>
            <div class="mt-3">
                <h3 class="text-base font-black text-slate-900 tracking-tight truncate" title="{{ $topTopicName }}">{{ $topTopicName }}</h3>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="text-[11px] font-bold text-slate-500">🏆 Permintaan Terbanyak:</span>
                    <span class="text-[11px] font-black text-amber-800 bg-amber-50 px-2 py-0.5 rounded-md">{{ number_format($topTopicCount) }} IKM</span>
                </div>
            </div>
        </div>

        {{-- Card 3: Top Kendala Operasional --}}
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-sm relative overflow-hidden group hover:border-rose-300 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">Kendala Utama Usaha</span>
                <span class="w-2.5 h-2.5 rounded-full bg-rose-500"></span>
            </div>
            <div class="mt-3">
                <h3 class="text-base font-black text-slate-900 tracking-tight truncate" title="{{ $topKendalaName }}">{{ $topKendalaName }}</h3>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="text-[11px] font-bold text-slate-500">⚠️ Faktor Penghambat</span>
                    <span class="text-[11px] font-black text-rose-700 bg-rose-50 px-2 py-0.5 rounded-md">Prioritas 1</span>
                </div>
            </div>
        </div>

        {{-- Card 4: Tingkat Komitmen --}}
        <div class="bg-white rounded-3xl p-5 border border-slate-200 shadow-sm relative overflow-hidden group hover:border-purple-300 transition-all">
            <div class="flex items-center justify-between">
                <span class="text-[10px] font-extrabold uppercase tracking-wider text-slate-400">Tingkat Komitmen</span>
                <span class="w-2.5 h-2.5 rounded-full bg-purple-500"></span>
            </div>
            <div class="mt-3">
                <div class="flex items-baseline gap-2">
                    <h3 class="text-3xl font-black text-slate-900 tracking-tight">{{ $komitmenRate }}%</h3>
                    <span class="text-xs font-bold text-purple-600">Bersedia Melapor</span>
                </div>
                <div class="mt-2 pt-2 border-t border-slate-100 flex items-center justify-between">
                    <span class="text-[11px] font-bold text-slate-500">🤝 Komitmen Pembinaan</span>
                    <span class="text-[11px] font-black text-purple-700 bg-purple-50 px-2 py-0.5 rounded-md">Tinggi</span>
                </div>
            </div>
        </div>
    </div>

    {{-- Filter & Tools Admin Bar --}}
    <div class="bg-white rounded-[28px] border border-slate-200 p-6 shadow-sm space-y-4">
        <form method="GET" action="{{ route('dukungan.tnadigital.index') }}" class="grid grid-cols-1 md:grid-cols-4 gap-4 items-center">
            
            {{-- Filter Topik Pelatihan --}}
            <div>
                <label class="block text-[11px] font-black text-slate-500 uppercase tracking-wider mb-1">Topik Pelatihan</label>
                <select name="topik" @change="$el.form.submit()" class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500">
                    <option value="">Semua Topik Pelatihan</option>
                    @foreach($topicStats as $tName => $tVal)
                        <option value="{{ $tName }}" {{ request('topik') === $tName ? 'selected' : '' }}>{{ $tName }} ({{ $tVal }})</option>
                    @endforeach
                </select>
            </div>

            {{-- Filter Kecamatan --}}
            <div>
                <label class="block text-[11px] font-black text-slate-500 uppercase tracking-wider mb-1">Kecamatan</label>
                <select name="kecamatan" @change="$el.form.submit()" class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500">
                    <option value="">Semua Kecamatan</option>
                    @foreach($kecamatanList as $kec)
                        <option value="{{ $kec }}" {{ request('kecamatan') === $kec ? 'selected' : '' }}>{{ $kec }}</option>
                    @endforeach
                </select>
            </div>

            {{-- Search Bar --}}
            <div class="md:col-span-2">
                <label class="block text-[11px] font-black text-slate-500 uppercase tracking-wider mb-1">Cari IKM (NIB / NIK / Nama Usaha)</label>
                <div class="flex gap-2">
                    <input type="text" name="search" value="{{ request('search') }}" placeholder="Ketik kata kunci pencarian..." class="flex-1 px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500">
                    <button type="submit" class="px-5 py-2.5 bg-slate-900 hover:bg-slate-800 text-white rounded-xl text-xs font-black transition shrink-0">
                        🔍 Cari
                    </button>
                    @if(request('topik') || request('kecamatan') || request('search'))
                        <a href="{{ route('dukungan.tnadigital.index') }}" class="px-4 py-2.5 bg-rose-50 text-rose-700 hover:bg-rose-100 rounded-xl text-xs font-extrabold transition shrink-0 flex items-center">
                            ✕ Reset Filter
                        </a>
                    @endif
                </div>
            </div>
        </form>
    </div>

    {{-- Main Table Rekapitulasi TNA Digital --}}
    <div class="bg-white rounded-[32px] border border-slate-200 p-6 shadow-sm space-y-4">
        <div class="flex justify-between items-center border-b border-slate-100 pb-4">
            <div>
                <h3 class="text-base font-black text-slate-900">Rekapitulasi Data Assessment TNA Digital</h3>
                <p class="text-xs text-slate-400 font-medium">Daftar lengkap hasil survei kebutuhan pelatihan IKM Kota Madiun</p>
            </div>
            <span class="text-xs font-black text-emerald-800 bg-emerald-50 px-3 py-1 rounded-full border border-emerald-200">
                Total: {{ number_format($tnaList->total()) }} Data
            </span>
        </div>

        <div class="overflow-x-auto rounded-2xl border border-slate-200">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-slate-900 text-white text-[11px] font-black uppercase tracking-wider">
                        <th class="py-4 px-4 text-center w-12">No</th>
                        <th class="py-4 px-4">IKM & Pemilik</th>
                        <th class="py-4 px-4">Kendala Utama</th>
                        <th class="py-4 px-4">Topik Prioritas (Max 3)</th>
                        <th class="py-4 px-4">Tag Antrean Pelatihan</th>
                        <th class="py-4 px-4">Metode & Komitmen</th>
                        <th class="py-4 px-4 text-center w-36">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-200 text-xs font-medium text-slate-700">
                    @forelse($tnaList as $idx => $row)
                        <tr class="hover:bg-slate-50 transition">
                            <td class="py-4 px-4 text-center font-bold text-slate-400">
                                {{ $tnaList->firstItem() + $idx }}
                            </td>
                            <td class="py-4 px-4">
                                <div class="font-extrabold text-slate-900 text-sm">{{ $row->nama_usaha }}</div>
                                <div class="text-[11px] text-slate-500 font-semibold">{{ $row->pemilik }} • Kec. {{ $row->kecamatan }}</div>
                                @if($row->nib)
                                    <span class="text-[10px] font-mono text-slate-500 bg-slate-100 px-1.5 py-0.5 rounded">NIB: {{ $row->nib }}</span>
                                @endif
                                @if($row->no_hp)
                                    <a href="https://wa.me/{{ preg_replace('/[^0-9]/', '', $row->no_hp) }}?text=Halo%20{{ urlencode($row->pemilik) }}%20dari%20IKM%20{{ urlencode($row->nama_usaha) }}%2C%20kami%20dari%20Dinas%20Naker%20KUKM%20Kota%20Madiun..." target="_blank" class="text-[10px] text-emerald-700 font-bold block mt-1 hover:underline">
                                        📲 WA: {{ $row->no_hp }}
                                    </a>
                                @endif
                            </td>
                            <td class="py-4 px-4 max-w-xs">
                                @if(is_array($row->kendala_operasional))
                                    <ul class="list-disc list-inside space-y-0.5 text-[11px] text-slate-700">
                                        @foreach(array_slice($row->kendala_operasional, 0, 2) as $k)
                                            <li class="truncate" title="{{ $k }}">{{ $k }}</li>
                                        @endforeach
                                        @if(count($row->kendala_operasional) > 2)
                                            <li class="text-[10px] text-slate-400 font-bold">+{{ count($row->kendala_operasional) - 2 }} kendala lainnya</li>
                                        @endif
                                    </ul>
                                @else
                                    <span class="text-slate-400">-</span>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                @if(is_array($row->topik_pelatihan_prioritas))
                                    <div class="space-y-1">
                                        @foreach($row->topik_pelatihan_prioritas as $tp)
                                            <span class="inline-block px-2.5 py-0.5 bg-amber-100 text-amber-900 rounded-md text-[10px] font-extrabold mr-1 mb-1 border border-amber-300">
                                                🎯 {{ $tp }}
                                            </span>
                                        @endforeach
                                    </div>
                                @else
                                    <span class="text-slate-400">-</span>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                @if(is_array($row->tag_antrean_pelatihan))
                                    <div class="space-y-1">
                                        @foreach($row->tag_antrean_pelatihan as $tagItem)
                                            <span class="inline-block px-2 py-0.5 bg-emerald-100 text-emerald-900 rounded-md text-[10px] font-black mr-1 mb-1 border border-emerald-300">
                                                🏷️ {{ $tagItem }}
                                            </span>
                                        @endforeach
                                    </div>
                                @else
                                    <span class="text-slate-400">-</span>
                                @endif
                            </td>
                            <td class="py-4 px-4">
                                <div class="font-bold text-slate-800">{{ $row->metode_efektif }}</div>
                                <span class="inline-block px-2 py-0.5 rounded text-[10px] font-extrabold mt-1 {{ $row->komitmen_penerapan === 'Ya' ? 'bg-emerald-100 text-emerald-800' : 'bg-rose-100 text-rose-800' }}">
                                    {{ $row->komitmen_penerapan === 'Ya' ? '✅ Komitmen Ya' : '❌ Belum Komitmen' }}
                                </span>
                            </td>
                            <td class="py-4 px-4 text-center">
                                <div class="flex items-center justify-center gap-1.5">
                                    <button type="button" @click="openDetailModal({{ json_encode($row) }})" class="px-2.5 py-1.5 bg-indigo-50 hover:bg-indigo-100 text-indigo-700 rounded-xl text-[11px] font-black transition">
                                        👁️ Detail
                                    </button>
                                    <button type="button" @click="openDeleteModal('{{ route('dukungan.tnadigital.destroy', $row->id) }}', '{{ $row->nama_usaha }}')" class="px-2 py-1.5 bg-rose-50 hover:bg-rose-100 text-rose-700 rounded-xl text-[11px] font-black transition">
                                        🗑️ Hapus
                                    </button>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center py-10 text-slate-400 font-bold">
                                Belum ada data assessment TNA Digital yang sesuai dengan filter.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="pt-2">
            {{ $tnaList->links() }}
        </div>
    </div>

    {{-- MODAL DETAIL ASSESSMENT IKM (FULL COLOUR) --}}
    <div x-show="detailModalOpen" x-cloak class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4" style="display:none;">
        <div class="bg-white rounded-[32px] max-w-2xl w-full p-6 md:p-8 space-y-6 shadow-2xl border border-slate-200 relative overflow-hidden" @click.away="detailModalOpen = false">
            <div class="flex justify-between items-start border-b border-slate-100 pb-4">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-2xl bg-emerald-600 text-white flex items-center justify-center font-black text-lg">
                        📋
                    </div>
                    <div>
                        <h3 class="text-lg font-black text-slate-900" x-text="detailData.nama_usaha"></h3>
                        <p class="text-xs text-slate-500 font-bold" x-text="'Pemilik: ' + detailData.pemilik + ' • Kec. ' + (detailData.kecamatan || '-')"></p>
                    </div>
                </div>
                <button type="button" @click="detailModalOpen = false" class="text-slate-400 hover:text-slate-600 text-2xl font-bold">&times;</button>
            </div>

            <div class="space-y-4 max-h-[70vh] overflow-y-auto pr-1">
                {{-- Identitas Profil --}}
                <div class="p-4 bg-slate-50 rounded-2xl grid grid-cols-2 gap-3 text-xs">
                    <div>
                        <span class="text-slate-400 font-bold uppercase block text-[10px]">NIK Pemilik</span>
                        <strong class="text-slate-800" x-text="detailData.nik || '-'"></strong>
                    </div>
                    <div>
                        <span class="text-slate-400 font-bold uppercase block text-[10px]">NIB Usaha</span>
                        <strong class="text-slate-800" x-text="detailData.nib || '-'"></strong>
                    </div>
                    <div>
                        <span class="text-slate-400 font-bold uppercase block text-[10px]">No. WhatsApp</span>
                        <strong class="text-emerald-700" x-text="detailData.no_hp || '-'"></strong>
                    </div>
                    <div>
                        <span class="text-slate-400 font-bold uppercase block text-[10px]">Kelurahan</span>
                        <strong class="text-slate-800" x-text="detailData.kelurahan || '-'"></strong>
                    </div>
                </div>

                {{-- Bagian 1 --}}
                <div class="space-y-2">
                    <h4 class="text-xs font-black text-emerald-800 uppercase tracking-wider">1. Kendala Operasional Utama</h4>
                    <div class="flex flex-wrap gap-1.5">
                        <template x-for="k in (detailData.kendala_operasional || [])" :key="k">
                            <span class="px-2.5 py-1 bg-rose-50 text-rose-700 border border-rose-200 rounded-xl text-xs font-bold" x-text="k"></span>
                        </template>
                    </div>
                </div>

                <div class="space-y-2">
                    <h4 class="text-xs font-black text-emerald-800 uppercase tracking-wider">2. Keterampilan Teknis Kurang</h4>
                    <div class="flex flex-wrap gap-1.5">
                        <template x-for="kt in (detailData.keterampilan_kurang || [])" :key="kt">
                            <span class="px-2.5 py-1 bg-indigo-50 text-indigo-700 border border-indigo-200 rounded-xl text-xs font-bold" x-text="kt"></span>
                        </template>
                    </div>
                </div>

                {{-- Bagian 2 --}}
                <div class="space-y-2">
                    <h4 class="text-xs font-black text-amber-800 uppercase tracking-wider">3. Topik Pelatihan Prioritas (Max 3)</h4>
                    <div class="flex flex-wrap gap-1.5">
                        <template x-for="tp in (detailData.topik_pelatihan_prioritas || [])" :key="tp">
                            <span class="px-3 py-1 bg-amber-100 text-amber-900 border border-amber-300 rounded-xl text-xs font-black" x-text="'🎯 ' + tp"></span>
                        </template>
                    </div>
                </div>

                <div class="space-y-1">
                    <h4 class="text-xs font-black text-slate-700">4. Materi Praktik Spesifik yang Diinginkan</h4>
                    <p class="text-xs text-slate-700 bg-slate-50 p-3 rounded-xl border border-slate-200 font-medium" x-text="detailData.materi_praktik_spesifik || 'Tidak diisi'"></p>
                </div>

                <div class="space-y-1">
                    <h4 class="text-xs font-black text-slate-700">5. Kebutuhan Ilmu / Kebutuhan Baru</h4>
                    <p class="text-xs text-slate-700 bg-slate-50 p-3 rounded-xl border border-slate-200 font-medium" x-text="detailData.kebutuhan_ilmu_baru || 'Tidak diisi'"></p>
                </div>

                {{-- Bagian 3 --}}
                <div class="p-4 bg-emerald-50/70 border border-emerald-200 rounded-2xl space-y-2">
                    <div class="flex justify-between items-center">
                        <span class="text-xs font-bold text-slate-700">Metode Pembinaan:</span>
                        <strong class="text-xs font-black text-emerald-900" x-text="detailData.metode_efektif || '-'"></strong>
                    </div>
                    <div class="flex justify-between items-center">
                        <span class="text-xs font-bold text-slate-700">Komitmen Penerapan:</span>
                        <span class="text-xs font-black px-2.5 py-0.5 rounded-md" :class="detailData.komitmen_penerapan === 'Ya' ? 'bg-emerald-200 text-emerald-900' : 'bg-rose-200 text-rose-900'" x-text="detailData.komitmen_penerapan === 'Ya' ? '✅ Ya Bersedia' : '❌ Tidak'"></span>
                    </div>
                </div>

                {{-- Tag Antrean Pelatihan --}}
                <div class="space-y-2">
                    <h4 class="text-xs font-black text-slate-900 uppercase tracking-wider">🏷️ Tag Antrean Pelatihan Otomatis</h4>
                    <div class="flex flex-wrap gap-1.5">
                        <template x-for="tag in (detailData.tag_antrean_pelatihan || [])" :key="tag">
                            <span class="px-3 py-1 bg-emerald-100 text-emerald-900 border border-emerald-300 rounded-xl text-xs font-black" x-text="tag"></span>
                        </template>
                    </div>
                </div>
            </div>

            <div class="flex justify-end pt-2 border-t border-slate-100">
                <button type="button" @click="detailModalOpen = false" class="px-6 py-2.5 bg-slate-900 text-white rounded-xl text-xs font-black">Tutup Detail</button>
            </div>
        </div>
    </div>

    {{-- MODAL INPUT FORM TNA BARU BY ADMIN --}}
    <div x-show="openAddModal" x-cloak class="fixed inset-0 z-50 overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4" style="display:none;">
        <div class="bg-white rounded-[32px] max-w-3xl w-full p-6 md:p-8 space-y-6 shadow-2xl border border-slate-200 relative overflow-hidden" @click.away="openAddModal = false">
            <div class="flex justify-between items-center border-b border-slate-100 pb-4">
                <h3 class="text-lg font-black text-slate-900">➕ Input Assessment TNA Baru</h3>
                <button type="button" @click="openAddModal = false" class="text-slate-400 hover:text-slate-600 text-2xl font-bold">&times;</button>
            </div>

            <form action="{{ route('dukungan.tnadigital.store') }}" method="POST" class="space-y-6 max-h-[75vh] overflow-y-auto pr-1">
                @csrf
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nama IKM / Usaha <span class="text-rose-500">*</span></label>
                        <input type="text" name="nama_usaha" required placeholder="Nama IKM..." class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-semibold text-slate-800">
                    </div>
                    <div>
                        <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">Nama Pemilik <span class="text-rose-500">*</span></label>
                        <input type="text" name="pemilik" required placeholder="Nama Pemilik..." class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-semibold text-slate-800">
                    </div>
                    <div>
                        <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">NIB Usaha</label>
                        <input type="text" name="nib" placeholder="13 digit NIB..." class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-semibold text-slate-800">
                    </div>
                    <div>
                        <label class="block text-[11px] font-bold text-slate-700 uppercase mb-1">No. WhatsApp</label>
                        <input type="text" name="no_hp" placeholder="08123..." class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-semibold text-slate-800">
                    </div>
                </div>

                {{-- Checkboxes Topik --}}
                <div class="space-y-2 pt-2 border-t border-slate-100">
                    <label class="block text-xs font-extrabold text-slate-800">Pilih Maksimal 3 Topik Pelatihan Prioritas:</label>
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-2">
                        @foreach(['Pemasaran Digital', 'Fasilitasi Sertifikasi (Halal/BPOM/SNI)', 'Manajemen Keuangan', 'Desain Kemasan', 'Manajemen Ekspor'] as $tp)
                            <label class="flex items-center gap-2 p-2.5 bg-slate-50 rounded-xl border border-slate-200 text-xs font-bold text-slate-800 cursor-pointer">
                                <input type="checkbox" name="topik_pelatihan_prioritas[]" value="{{ $tp }}" class="rounded text-emerald-600 w-4 h-4">
                                <span>{{ $tp }}</span>
                            </label>
                        @endforeach
                    </div>
                </div>

                <div class="flex justify-end gap-3 pt-4 border-t border-slate-100">
                    <button type="button" @click="openAddModal = false" class="px-5 py-2.5 bg-slate-100 text-slate-600 rounded-xl text-xs font-bold">Batal</button>
                    <button type="submit" class="px-6 py-2.5 bg-emerald-600 text-white rounded-xl text-xs font-black shadow-md">Simpan Data TNA</button>
                </div>
            </form>
        </div>
    </div>

    {{-- MODAL KONFIRMASI HAPUS DATA TNA (3 DETIK COUNTDOWN) --}}
    <div x-show="deleteModalOpen" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/70 backdrop-blur-md" style="display:none;">
        <div class="bg-gradient-to-br from-rose-500 via-rose-600 to-rose-700 text-white rounded-[32px] max-w-md w-full p-6 text-center space-y-6 shadow-2xl relative overflow-hidden" @click.away="closeDeleteModal()">
            <div class="w-16 h-16 bg-white/20 rounded-full flex items-center justify-center mx-auto text-3xl font-black">
                🗑️
            </div>
            <div class="space-y-2">
                <h3 class="text-xl font-black">Konfirmasi Hapus Data TNA</h3>
                <p class="text-xs text-rose-100 font-medium">
                    Apakah Anda yakin ingin menghapus data assessment TNA dari <strong class="text-white font-black" x-text="deleteNama"></strong>?
                </p>
            </div>

            <form :action="deleteActionUrl" method="POST" class="space-y-4">
                @csrf
                <div class="flex justify-center gap-3">
                    <button type="button" @click="closeDeleteModal()" class="px-5 py-2.5 bg-white/20 hover:bg-white/30 text-white rounded-xl text-xs font-black transition">
                        Batal
                    </button>
                    <button type="submit" :disabled="countdown > 0" class="px-6 py-2.5 bg-white text-rose-700 hover:bg-rose-50 rounded-xl text-xs font-black transition shadow-lg disabled:opacity-50">
                        <span x-show="countdown > 0" x-text="'Hapus (' + countdown + 's)'"></span>
                        <span x-show="countdown === 0">Oke, Hapus Sekarang</span>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Modal Kelola Pertanyaan & Opsi TNA Digital -->
    <div x-show="openPertanyaanModal" 
         class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/80 backdrop-blur-md"
         x-transition:enter="transition ease-out duration-200"
         x-transition:enter-start="opacity-0 scale-95"
         x-transition:enter-end="opacity-100 scale-100"
         x-transition:leave="transition ease-in duration-150"
         x-transition:leave-start="opacity-100 scale-100"
         x-transition:leave-end="opacity-0 scale-95"
         x-cloak>
        <div class="bg-white rounded-[32px] max-w-4xl w-full p-6 sm:p-8 shadow-2xl space-y-6 max-h-[90vh] overflow-y-auto border border-indigo-100">
            <div class="flex justify-between items-start border-b pb-4">
                <div class="space-y-1">
                    <div class="inline-flex items-center gap-2 px-3 py-1 bg-indigo-50 border border-indigo-200 rounded-full text-[10px] font-black text-indigo-700 uppercase tracking-wider">
                        <span>⚙️ Configurator Pertanyaan & Opsi</span>
                    </div>
                    <h3 class="text-xl font-black text-slate-900">Kelola Pertanyaan & Opsi Jawaban TNA Digital</h3>
                    <p class="text-xs text-slate-500 font-medium">Atur judul pertanyaan dan pilihan opsi (checkbox/radio) untuk Bagian 1, 2, dan 3 yang tampil di portal IKM JUARA.</p>
                </div>
                <button type="button" @click="openPertanyaanModal = false" class="text-slate-400 hover:text-slate-600 p-2 rounded-xl hover:bg-slate-100 transition">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg>
                </button>
            </div>

            <form action="{{ route('dukungan.tnadigital.pertanyaan.update') }}" method="POST" class="space-y-8">
                @csrf
                
                @if(isset($pertanyaanList))
                    @foreach($pertanyaanList->groupBy('bagian') as $bagianNum => $soalGroup)
                        <div class="p-6 rounded-3xl space-y-6 border {{ $bagianNum == 1 ? 'bg-slate-50 border-slate-200' : ($bagianNum == 2 ? 'bg-amber-50/60 border-amber-200' : 'bg-purple-50/60 border-purple-200') }}">
                            <div class="flex justify-between items-center border-b pb-3 border-slate-200/80">
                                <h4 class="text-sm font-black uppercase text-slate-900 tracking-wider">
                                    Bagian {{ $bagianNum }}: 
                                    @if($bagianNum == 1) Identifikasi Kendala Usaha
                                    @elseif($bagianNum == 2) Kebutuhan Pelatihan Mendatang
                                    @else Komitmen & Preferensi Pelatihan
                                    @endif
                                </h4>
                                <span class="text-[10px] font-black px-2.5 py-1 rounded-full uppercase bg-white border border-slate-300 text-slate-700">
                                    {{ $soalGroup->count() }} Pertanyaan
                                </span>
                            </div>

                            <div class="space-y-6">
                                @foreach($soalGroup as $soal)
                                    <div class="p-4 bg-white rounded-2xl border border-slate-200 shadow-sm space-y-3">
                                        <div class="flex items-center justify-between gap-2">
                                            <label class="block text-xs font-extrabold text-slate-800">
                                                Soal Nomor {{ $soal->nomor_soal }} <span class="text-slate-400 font-normal">({{ strtoupper($soal->jenis_soal) }})</span>
                                            </label>
                                        </div>

                                        <div>
                                            <span class="block text-[10px] font-bold uppercase text-slate-500 mb-1">Teks Judul Pertanyaan</span>
                                            <input type="text" name="soal[{{ $soal->nomor_soal }}][teks_pertanyaan]" value="{{ $soal->teks_pertanyaan }}" required class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-semibold text-slate-900 outline-none focus:border-indigo-600 focus:bg-white transition">
                                        </div>

                                        @if($soal->jenis_soal !== 'text' && $soal->jenis_soal !== 'textarea')
                                            <div>
                                                <div class="flex items-center justify-between mb-1.5">
                                                    <span class="block text-[10px] font-bold uppercase text-slate-500">Pilihan Opsi Jawaban (Satu opsi per baris / pisahkan dengan Enter)</span>
                                                </div>
                                                <textarea name="soal[{{ $soal->nomor_soal }}][opsi_jawaban]" rows="4" class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs font-medium text-slate-800 outline-none focus:border-indigo-600 focus:bg-white transition font-mono leading-relaxed" placeholder="Ketik pilihan jawaban per baris...">{{ is_array($soal->opsi_jawaban) ? implode("\n", $soal->opsi_jawaban) : '' }}</textarea>
                                                <p class="text-[10px] text-slate-400 font-medium mt-1">💡 Setiap baris teks di atas akan dikonversi menjadi satu pilihan opsi {{ $soal->jenis_soal === 'checkbox' ? 'centang (checkbox)' : 'pilihan radio' }}.</p>
                                            </div>
                                        @endif
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endforeach
                @endif

                <div class="flex flex-col sm:flex-row justify-between items-center gap-4 pt-4 border-t border-slate-200">
                    <button type="button" onclick="confirmResetTnaPertanyaan()" class="w-full sm:w-auto px-5 py-3 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-2xl text-xs font-black transition flex items-center justify-center gap-2">
                        <span>🔄 Reset ke Default Dinas</span>
                    </button>

                    <div class="flex items-center gap-3 w-full sm:w-auto">
                        <button type="button" @click="openPertanyaanModal = false" class="flex-1 sm:flex-none px-6 py-3 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-2xl text-xs font-black transition">
                            Batal
                        </button>
                        <button type="submit" class="flex-1 sm:flex-none px-8 py-3.5 bg-indigo-600 hover:bg-indigo-700 text-white rounded-2xl text-xs font-black shadow-lg shadow-indigo-600/30 transition flex items-center justify-center gap-2">
                            <span>💾 Simpan Perubahan Pertanyaan</span>
                        </button>
                    </div>
                </div>
            </form>

            <form id="resetTnaForm" action="{{ route('dukungan.tnadigital.pertanyaan.reset') }}" method="POST" class="hidden">
                @csrf
            </form>
        </div>
    </div>

</div>

<script>
function confirmResetTnaPertanyaan() {
    Swal.fire({
        title: 'Kembalikan ke Default?',
        text: "Semua teks pertanyaan dan opsi jawaban akan dikembalikan ke teks awal standar dinas.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#4f46e5',
        cancelButtonColor: '#64748b',
        confirmButtonText: 'Ya, Reset Sekarang!',
        cancelButtonText: 'Batal'
    }).then((result) => {
        if (result.isConfirmed) {
            document.getElementById('resetTnaForm').submit();
        }
    });
}

function adminTnaManager() {
    return {
        openAddModal: false,
        openPertanyaanModal: false,
        detailModalOpen: false,
        detailData: {},
        deleteModalOpen: false,
        deleteActionUrl: '',
        deleteNama: '',
        countdown: 3,
        timer: null,

        openDetailModal(data) {
            this.detailData = data;
            this.detailModalOpen = true;
        },
        openDeleteModal(url, nama) {
            this.deleteActionUrl = url;
            this.deleteNama = nama;
            this.countdown = 3;
            this.deleteModalOpen = true;
            
            if (this.timer) clearInterval(this.timer);
            this.timer = setInterval(() => {
                if (this.countdown > 0) {
                    this.countdown--;
                } else {
                    clearInterval(this.timer);
                }
            }, 1000);
        },
        closeDeleteModal() {
            this.deleteModalOpen = false;
            if (this.timer) clearInterval(this.timer);
        }
    };
}
</script>
@endsection
