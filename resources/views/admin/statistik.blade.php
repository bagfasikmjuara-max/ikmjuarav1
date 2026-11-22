@extends('layouts.admin')

@section('title', 'Manajemen Statistik Wilayah')

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>

@php
    $firstStat = $firstStat ?? DB::table('statistik_kecamatan')->first();
    $statsList = DB::table('statistik_kecamatan')->get();
    
    // Initial JSON payload for Alpine.js state management
    $initialCounts = [];
    $dbCountsArr = isset($dbCounts) ? $dbCounts->toArray() : [];
    
    foreach($statsList as $st) {
        $initialCounts[$st->id] = (int)$st->jumlah_ikm;
    }
@endphp

<div class="space-y-8" x-data="{ 
    counts: {{ json_encode($initialCounts) }},
    dbCounts: {{ json_encode($dbCountsArr) }},
    
    getTotal() {
        return Object.values(this.counts).reduce((a, b) => (parseInt(a) || 0) + (parseInt(b) || 0), 0);
    },
    getPercent(id) {
        const total = this.getTotal();
        if (total <= 0) return 0;
        const val = parseInt(this.counts[id]) || 0;
        return ((val / total) * 100).toFixed(1);
    },
    syncDb(id, keyName) {
        if (this.dbCounts[keyName] !== undefined) {
            this.counts[id] = this.dbCounts[keyName];
        }
    },
    syncAllDb() {
        const mapping = { 1: 'Kartoharjo', 2: 'Manguharjo', 3: 'Taman' };
        for (let id in mapping) {
            const keyName = mapping[id];
            if (this.dbCounts[keyName] !== undefined) {
                this.counts[id] = this.dbCounts[keyName];
            }
        }
    }
}">
    
    {{-- HEADER BAR BANNER --}}
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 p-8 rounded-[35px] text-white shadow-xl relative overflow-hidden">
        <div class="relative z-10">
            <span class="text-xs font-black text-indigo-400 uppercase tracking-[0.2em] bg-indigo-900/50 px-3 py-1 rounded-full border border-indigo-700/50">Dashboard Modul Publik</span>
            <h2 class="text-3xl lg:text-4xl font-black mt-2 tracking-tight">Manajemen <span class="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 via-indigo-300 to-indigo-400">Statistik Wilayah IKM</span></h2>
            <p class="text-slate-300 text-sm mt-1 max-w-xl font-medium">Input agregat jumlah Pelaku Usaha IKM per Kecamatan Kota Madiun secara presisi untuk grafik dan peta dashboard publik.</p>
        </div>
        
        <div class="relative z-10 flex flex-wrap gap-3">
            <button type="button" @click="syncAllDb()" class="inline-flex items-center gap-2 bg-slate-800/80 hover:bg-slate-700 text-emerald-400 border border-emerald-500/30 px-5 py-3 rounded-2xl font-bold text-xs shadow-lg transition">
                <span>🔄 Sinkronkan Semua ke Data DB</span>
            </button>
        </div>

        {{-- BACKGROUND DECORATION GLOW --}}
        <div class="absolute -right-16 -bottom-16 w-64 h-64 bg-indigo-600/30 rounded-full blur-3xl pointer-events-none"></div>
        <div class="absolute -left-16 -top-16 w-64 h-64 bg-amber-500/20 rounded-full blur-3xl pointer-events-none"></div>
    </div>

    {{-- METRICS SUMMARY CARDS --}}
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        {{-- TOTAL AGREGAT --}}
        <div class="bg-gradient-to-br from-indigo-600 to-indigo-800 p-6 rounded-3xl text-white shadow-lg shadow-indigo-600/20 flex items-center justify-between">
            <div>
                <span class="text-xs font-bold text-indigo-200 uppercase tracking-wider block">Total Agregat IKM</span>
                <div class="text-4xl font-black mt-1" x-text="getTotal().toLocaleString('id-ID')">0</div>
                <span class="text-[10px] font-bold text-indigo-200 mt-1 block">3 Kecamatan Kota Madiun</span>
            </div>
            <div class="w-14 h-14 rounded-2xl bg-white/10 flex items-center justify-center text-2xl backdrop-blur-sm">
                🏬
            </div>
        </div>

        {{-- KECAMATAN KARTOHARJO --}}
        <div class="bg-white p-6 rounded-3xl border border-blue-100 shadow-sm flex items-center justify-between hover:shadow-md transition">
            <div>
                <span class="text-xs font-extrabold text-blue-600 uppercase tracking-wider block">Kec. Kartoharjo</span>
                <div class="text-3xl font-black text-slate-800 mt-1" x-text="(parseInt(counts[1]) || 0).toLocaleString('id-ID')">0</div>
                <span class="text-[10px] font-bold text-slate-400 mt-1 block" x-text="getPercent(1) + '% dari total'">0%</span>
            </div>
            <div class="w-12 h-12 rounded-2xl bg-blue-50 text-blue-600 flex items-center justify-center font-black text-lg">
                📍
            </div>
        </div>

        {{-- KECAMATAN MANGUHARJO --}}
        <div class="bg-white p-6 rounded-3xl border border-amber-100 shadow-sm flex items-center justify-between hover:shadow-md transition">
            <div>
                <span class="text-xs font-extrabold text-amber-600 uppercase tracking-wider block">Kec. Manguharjo</span>
                <div class="text-3xl font-black text-slate-800 mt-1" x-text="(parseInt(counts[2]) || 0).toLocaleString('id-ID')">0</div>
                <span class="text-[10px] font-bold text-slate-400 mt-1 block" x-text="getPercent(2) + '% dari total'">0%</span>
            </div>
            <div class="w-12 h-12 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center font-black text-lg">
                📍
            </div>
        </div>

        {{-- KECAMATAN TAMAN --}}
        <div class="bg-white p-6 rounded-3xl border border-emerald-100 shadow-sm flex items-center justify-between hover:shadow-md transition">
            <div>
                <span class="text-xs font-extrabold text-emerald-600 uppercase tracking-wider block">Kec. Taman</span>
                <div class="text-3xl font-black text-slate-800 mt-1" x-text="(parseInt(counts[3]) || 0).toLocaleString('id-ID')">0</div>
                <span class="text-[10px] font-bold text-slate-400 mt-1 block" x-text="getPercent(3) + '% dari total'">0%</span>
            </div>
            <div class="w-12 h-12 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center font-black text-lg">
                📍
            </div>
        </div>
    </div>

    {{-- INTERACTIVE VISUALIZER BAR SHARE SHARE BOARD --}}
    <div class="bg-white p-8 rounded-[35px] border border-slate-200 shadow-sm">
        <h3 class="text-base font-black text-slate-800 uppercase tracking-wider mb-2 flex items-center gap-2">
            <span>📊 Proporsi Distribusi IKM Per Wilayah</span>
        </h3>
        <p class="text-xs text-slate-400 font-medium mb-6">Persentase kontribusi jumlah usaha per kecamatan yang dihitung secara real-time saat Anda mengetik data.</p>

        {{-- PROGRESS BAR STACKED --}}
        <div class="w-full h-5 bg-slate-100 rounded-full overflow-hidden flex gap-1 p-1">
            <div class="h-full bg-blue-500 rounded-full transition-all duration-500" :style="'width: ' + getPercent(1) + '%'" :title="'Kartoharjo: ' + getPercent(1) + '%'"></div>
            <div class="h-full bg-amber-500 rounded-full transition-all duration-500" :style="'width: ' + getPercent(2) + '%'" :title="'Manguharjo: ' + getPercent(2) + '%'"></div>
            <div class="h-full bg-emerald-500 rounded-full transition-all duration-500" :style="'width: ' + getPercent(3) + '%'" :title="'Taman: ' + getPercent(3) + '%'"></div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 mt-6 pt-4 border-t border-slate-100">
            <div class="flex items-center gap-3">
                <span class="w-3.5 h-3.5 rounded-full bg-blue-500 shrink-0"></span>
                <div>
                    <span class="text-xs font-bold text-slate-700 block">Kec. Kartoharjo</span>
                    <span class="text-[11px] font-extrabold text-blue-600" x-text="getPercent(1) + '% (' + (parseInt(counts[1])||0) + ' Unit)'">0%</span>
                </div>
            </div>

            <div class="flex items-center gap-3">
                <span class="w-3.5 h-3.5 rounded-full bg-amber-500 shrink-0"></span>
                <div>
                    <span class="text-xs font-bold text-slate-700 block">Kec. Manguharjo</span>
                    <span class="text-[11px] font-extrabold text-amber-600" x-text="getPercent(2) + '% (' + (parseInt(counts[2])||0) + ' Unit)'">0%</span>
                </div>
            </div>

            <div class="flex items-center gap-3">
                <span class="w-3.5 h-3.5 rounded-full bg-emerald-500 shrink-0"></span>
                <div>
                    <span class="text-xs font-bold text-slate-700 block">Kec. Taman</span>
                    <span class="text-[11px] font-extrabold text-emerald-600" x-text="getPercent(3) + '% (' + (parseInt(counts[3])||0) + ' Unit)'">0%</span>
                </div>
            </div>
        </div>
    </div>

    {{-- MAIN FORM EDITOR CARD --}}
    <div class="bg-white rounded-[35px] border border-slate-200 shadow-sm overflow-hidden p-8 lg:p-10">
        <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-8 pb-6 border-b border-slate-100">
            <div>
                <h3 class="text-xl font-black text-slate-800 uppercase tracking-tight">Form Pemutakhiran Jumlah IKM</h3>
                <p class="text-slate-400 text-xs font-medium mt-1">Ubah angka di bawah ini secara manual atau gunakan tombol sinkronisasi data asli dari database.</p>
            </div>
            <div class="bg-indigo-50 border border-indigo-100 px-4 py-2 rounded-2xl text-indigo-700 font-extrabold text-xs uppercase tracking-wider flex items-center gap-2">
                <span class="w-2.5 h-2.5 rounded-full bg-indigo-600 animate-ping"></span>
                <span>Mode Edit Aktif</span>
            </div>
        </div>

        <form action="{{ route('admin.statistik.update') }}" method="POST" class="space-y-8">
            @csrf
            
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                @foreach($statsList as $item)
                @php
                    $colorClass = match($item->id) {
                        1 => 'from-blue-50 to-indigo-50/30 border-blue-200 text-blue-700',
                        2 => 'from-amber-50 to-orange-50/30 border-amber-200 text-amber-700',
                        3 => 'from-emerald-50 to-teal-50/30 border-emerald-200 text-emerald-700',
                        default => 'from-slate-50 to-indigo-50/30 border-slate-200 text-slate-700'
                    };
                    $btnColor = match($item->id) {
                        1 => 'bg-blue-600 hover:bg-blue-700 text-white',
                        2 => 'bg-amber-500 hover:bg-amber-600 text-white',
                        3 => 'bg-emerald-600 hover:bg-emerald-700 text-white',
                        default => 'bg-indigo-600 hover:bg-indigo-700 text-white'
                    };
                    $realDbCount = $dbCountsArr[$item->kecamatan] ?? 0;
                @endphp
                
                <div class="bg-gradient-to-b {{ $colorClass }} p-6 rounded-[30px] border relative group space-y-4 shadow-sm hover:shadow-md transition duration-300">
                    <div class="flex justify-between items-center">
                        <label class="font-black text-sm uppercase tracking-wider flex items-center gap-2">
                            <span>📍 Kec. {{ $item->kecamatan }}</span>
                        </label>
                        
                        <button type="button" 
                                @click="syncDb({{ $item->id }}, '{{ $item->kecamatan }}')"
                                class="text-[10px] font-bold px-2.5 py-1 rounded-full bg-white border border-slate-200 shadow-2xs hover:bg-indigo-50 hover:text-indigo-600 transition"
                                title="Tarik angka asli dari tabel Pelaku Usaha ({{ $realDbCount }} Unit)">
                            ⚡ DB Real: {{ $realDbCount }}
                        </button>
                    </div>

                    {{-- INPUT NUMBER DENGAN STEP BUTTONS --}}
                    <div class="relative flex items-center">
                        <button type="button" 
                                @click="counts[{{ $item->id }}] = Math.max(0, (parseInt(counts[{{ $item->id }}]) || 0) - 1)" 
                                class="absolute left-3 w-9 h-9 rounded-xl bg-white border border-slate-200 text-slate-600 font-black text-base flex items-center justify-center hover:bg-slate-100 transition shadow-xs z-10">
                            -
                        </button>

                        <input type="number" 
                               name="stats[{{ $item->id }}]" 
                               x-model.number="counts[{{ $item->id }}]"
                               min="0"
                               class="w-full py-5 px-14 bg-white border-2 border-slate-200/80 rounded-2xl focus:border-indigo-500 focus:ring-4 focus:ring-indigo-100 outline-none font-black text-3xl text-center text-slate-800 transition-all duration-300 shadow-inner"
                               required>

                        <button type="button" 
                                @click="counts[{{ $item->id }}] = (parseInt(counts[{{ $item->id }}]) || 0) + 1" 
                                class="absolute right-3 w-9 h-9 rounded-xl bg-white border border-slate-200 text-slate-600 font-black text-base flex items-center justify-center hover:bg-slate-100 transition shadow-xs z-10">
                            +
                        </button>
                    </div>

                    <div class="flex justify-between items-center text-[10px] font-bold uppercase tracking-wider px-1">
                        <span class="text-slate-400">Kontribusi: <strong x-text="getPercent({{ $item->id }}) + '%'">0%</strong></span>
                        <span class="text-slate-400">Diperbarui: {{ \Carbon\Carbon::parse($item->updated_at)->diffForHumans() }}</span>
                    </div>
                </div>
                @endforeach
            </div>

            {{-- ACTION BUTTONS --}}
            <div class="flex flex-col sm:flex-row justify-end gap-4 pt-6 border-t border-slate-100">
                <button type="button" onclick="location.reload()" class="px-8 py-4 rounded-2xl font-extrabold text-slate-500 hover:bg-slate-100 transition text-sm">
                    Reset Form
                </button>
                
                <button type="submit" class="bg-gradient-to-r from-indigo-600 to-indigo-700 text-white px-10 py-4 rounded-2xl font-black text-sm shadow-xl shadow-indigo-600/30 hover:from-indigo-700 hover:to-indigo-800 transition transform hover:scale-[1.02] active:scale-95 flex items-center justify-center gap-3">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                    </svg>
                    <span>SIMPAN PERUBAHAN STATISTIK</span>
                </button>
            </div>
        </form>
    </div>
</div>

<script>
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