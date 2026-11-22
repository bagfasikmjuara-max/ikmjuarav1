@extends('layouts.dukungan')

@section('title', 'Layanan Konsultasi & Pembinaan')

@section('content')
<script>
function konsultasiApp() {
    return {
        openReplyModal: false,
        openKategoriModal: false,
        activeMessage: {},
        activeTab: 'umum',
        statusFilter: 'semua',
        pollInterval: null,
        showEndConfirmation: false,
        endCountdown: 3,
        endCountdownTimer: null,
        pageUmum: 1,
        pageIkm: 1,
        perPage: 10,
        kategoriList: @json($kategoriList ?? []),

        allUmum: @json($konsultasi->where('sumber', 'Umum')->values()).map(i => {
            let d = new Date(i.created_at);
            i.tanggal = !isNaN(d) ? d.toLocaleDateString('id-ID', {day:'numeric', month:'long', year:'numeric'}) + ', ' + d.toLocaleTimeString('id-ID', {hour:'2-digit', minute:'2-digit'}) : i.created_at;
            return i;
        }),

        allIkm: @json($konsultasi->where('sumber', 'IKM Juara')->values()).map(i => {
            let d = new Date(i.created_at);
            i.tanggal = !isNaN(d) ? d.toLocaleDateString('id-ID', {day:'numeric', month:'long', year:'numeric'}) + ', ' + d.toLocaleTimeString('id-ID', {hour:'2-digit', minute:'2-digit'}) : i.created_at;
            return i;
        }),

        init() {
            this.$watch('openReplyModal', value => {
                if (value) this.startPolling();
                else this.stopPolling();
            });
            this.$watch('statusFilter', () => {
                this.pageUmum = 1;
                this.pageIkm = 1;
            });
        },

        startPolling() {
            this.stopPolling();
            this.pollInterval = setInterval(() => {
                if (!this.openReplyModal || !this.activeMessage.id) {
                    this.stopPolling();
                    return;
                }
                fetch('/api/konsultasi/' + this.activeMessage.id + '/pesan')
                    .then(res => res.json())
                    .then(res => {
                        if (res.success) {
                            if (JSON.stringify(this.activeMessage.messages) !== JSON.stringify(res.messages) || this.activeMessage.status !== res.status) {
                                this.activeMessage.messages = res.messages;
                                this.activeMessage.status = res.status;
                                this.activeMessage.updated_at = res.updated_at;
                            }
                        }
                    })
                    .catch(err => console.error(err));
            }, 3000);
        },

        stopPolling() {
            if (this.pollInterval) {
                clearInterval(this.pollInterval);
                this.pollInterval = null;
            }
        },

        triggerEndSession() {
            this.showEndConfirmation = true;
            this.endCountdown = 3;
            if (this.endCountdownTimer) clearInterval(this.endCountdownTimer);
            this.endCountdownTimer = setInterval(() => {
                this.endCountdown--;
                if (this.endCountdown <= 0) {
                    this.cancelEndSession();
                }
            }, 1000);
        },

        cancelEndSession() {
            this.showEndConfirmation = false;
            if (this.endCountdownTimer) {
                clearInterval(this.endCountdownTimer);
                this.endCountdownTimer = null;
            }
        },

        confirmEndSession() {
            this.showEndConfirmation = false;
            if (this.endCountdownTimer) {
                clearInterval(this.endCountdownTimer);
                this.endCountdownTimer = null;
            }
            this.$refs.endForm.submit();
        },

        filteredUmum() {
            return this.allUmum.filter(item => {
                if (this.statusFilter === 'pending') return item.status === 'Belum Dijawab';
                if (this.statusFilter === 'selesai') return item.status !== 'Belum Dijawab';
                return true;
            });
        },

        paginatedUmum() {
            const start = (this.pageUmum - 1) * this.perPage;
            return this.filteredUmum().slice(start, start + this.perPage);
        },

        totalPagesUmum() {
            return Math.ceil(this.filteredUmum().length / this.perPage) || 1;
        },

        filteredIkm() {
            return this.allIkm.filter(item => {
                if (this.statusFilter === 'pending') return item.status === 'Belum Dijawab';
                if (this.statusFilter === 'selesai') return item.status !== 'Belum Dijawab';
                return true;
            });
        },

        paginatedIkm() {
            const start = (this.pageIkm - 1) * this.perPage;
            return this.filteredIkm().slice(start, start + this.perPage);
        },

        totalPagesIkm() {
            return Math.ceil(this.filteredIkm().length / this.perPage) || 1;
        }
    };
}
</script>

<div class="space-y-8" x-data="konsultasiApp()">
    
    {{-- Header Action Bar --}}
    <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 bg-white p-6 rounded-[32px] border border-slate-100 shadow-sm">
        <div>
            <h2 class="text-xl font-black text-slate-900 tracking-tight">Layanan Konsultasi & Pembinaan IKM</h2>
            <p class="text-xs text-slate-500 font-medium mt-0.5">Pusat pengaduan, pendampingan usaha, dan obrolan real-time</p>
        </div>
        <button type="button" @click="openKategoriModal = true" class="px-5 py-3 bg-indigo-600 hover:bg-indigo-700 text-white font-black text-xs rounded-2xl shadow-lg shadow-indigo-600/20 active:scale-95 transition flex items-center gap-2">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
            </svg>
            <span>📂 Kelola Topik Kategori Pengaduan</span>
        </button>
    </div>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        @php
            $totalPesan = $konsultasi->count();
            $belumDijawab = $konsultasi->where('status', 'Belum Dijawab')->count();
            $sudahDijawab = $konsultasi->whereIn('status', ['Sudah Dijawab', 'Selesai'])->count();
        @endphp

        <!-- Card 1: Total Pesan -->
        <div class="bg-white p-8 rounded-[32px] shadow-sm border border-slate-100 flex flex-col justify-between group transition hover:shadow-lg">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-blue-50 rounded-2xl flex items-center justify-center text-blue-600">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0a2 2 0 01-2 2H6a2 2 0 01-2-2m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5" />
                    </svg>
                </div>
                <span class="text-[10px] font-black text-slate-300 uppercase tracking-widest">Database</span>
            </div>
            <div>
                <h3 class="text-4xl font-black text-slate-800 tracking-tighter mb-1">{{ $totalPesan }}</h3>
                <p class="text-slate-400 text-[10px] font-bold uppercase tracking-[0.2em]">TOTAL PESAN MASUK</p>
            </div>
        </div>

        <!-- Card 2: Belum Dijawab -->
        <div class="bg-white p-8 rounded-[32px] shadow-sm border border-slate-100 flex flex-col justify-between group transition hover:shadow-lg">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-rose-50 rounded-2xl flex items-center justify-center text-rose-600">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                </div>
                <span class="text-[10px] font-black text-slate-300 uppercase tracking-widest">Status Pending</span>
            </div>
            <div>
                <h3 class="text-4xl font-black text-rose-600 tracking-tighter mb-1">{{ $belumDijawab }}</h3>
                <p class="text-slate-400 text-[10px] font-bold uppercase tracking-[0.2em]">BELUM DIJAWAB</p>
            </div>
        </div>

        <!-- Card 3: Sudah Dijawab -->
        <div class="bg-white p-8 rounded-[32px] shadow-sm border border-slate-100 flex flex-col justify-between group transition hover:shadow-lg">
            <div class="flex justify-between items-start mb-4">
                <div class="h-12 w-12 bg-green-50 rounded-2xl flex items-center justify-center text-green-600">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                </div>
                <span class="text-[10px] font-black text-slate-300 uppercase tracking-widest">Status Terlayani</span>
            </div>
            <div>
                <h3 class="text-4xl font-black text-emerald-600 tracking-tighter mb-1">{{ $sudahDijawab }}</h3>
                <p class="text-slate-400 text-[10px] font-bold uppercase tracking-[0.2em]">TELAH DIJAWAB / SELESAI</p>
            </div>
        </div>
    </div>

    {{-- Alert Messages --}}
    @if(session('success'))
        <div class="p-4 bg-green-50 border border-green-200 text-green-700 font-semibold rounded-2xl flex items-center gap-2">
            <svg class="w-5 h-5 text-green-500 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            {{ session('success') }}
        </div>
    @endif
    @if(session('error'))
        <div class="p-4 bg-rose-50 border border-rose-200 text-rose-700 font-semibold rounded-2xl flex items-center gap-2">
            <svg class="w-5 h-5 text-rose-500 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            {{ session('error') }}
        </div>
    @endif

    <!-- Tab & Filter Control Bar -->
    <div class="flex flex-col lg:flex-row justify-between items-stretch lg:items-center gap-4">
        {{-- Tab Selector (Glassmorphic style) --}}
        <div class="flex bg-slate-100 p-1.5 rounded-2xl border border-slate-200/50 max-w-md gap-1">
            <button type="button" @click="activeTab = 'umum'" :class="activeTab === 'umum' ? 'bg-white text-emerald-600 shadow-sm' : 'text-slate-400 hover:text-slate-600'" class="flex-1 py-3 px-4 text-xs font-black uppercase tracking-wider rounded-xl transition-all duration-300">
                Kritik & Saran Umum
            </button>
            <button type="button" @click="activeTab = 'ikmjuara'" :class="activeTab === 'ikmjuara' ? 'bg-white text-emerald-600 shadow-sm' : 'text-slate-400 hover:text-slate-600'" class="flex-1 py-3 px-4 text-xs font-black uppercase tracking-wider rounded-xl transition-all duration-300">
                Konsultasi IKM Juara
            </button>
        </div>

        {{-- Status Filter Pills --}}
        <div class="flex bg-slate-100 p-1.5 rounded-2xl border border-slate-200/50 gap-1 items-center self-start lg:self-auto">
            <span class="text-[10px] font-black uppercase text-slate-400 px-3 tracking-wider">Filter Status:</span>
            <button type="button" @click="statusFilter = 'semua'" 
                    :class="statusFilter === 'semua' ? 'bg-white text-slate-800 shadow-sm font-black' : 'text-slate-400 hover:text-slate-600 font-bold'" 
                    class="py-2.5 px-4 text-xs rounded-xl transition-all duration-200 flex items-center gap-2">
                Semua
            </button>
            <button type="button" @click="statusFilter = 'pending'" 
                    :class="statusFilter === 'pending' ? 'bg-rose-500 text-white shadow-sm font-black' : 'text-slate-400 hover:text-rose-600 font-bold'" 
                    class="py-2.5 px-4 text-xs rounded-xl transition-all duration-200 flex items-center gap-1.5">
                <span>Belum Dijawab</span>
                <span class="px-2 py-0.5 text-[9px] rounded-full" :class="statusFilter === 'pending' ? 'bg-white/20 text-white' : 'bg-rose-100 text-rose-600'">{{ $belumDijawab }}</span>
            </button>
            <button type="button" @click="statusFilter = 'selesai'" 
                    :class="statusFilter === 'selesai' ? 'bg-emerald-600 text-white shadow-sm font-black' : 'text-slate-400 hover:text-emerald-600 font-bold'" 
                    class="py-2.5 px-4 text-xs rounded-xl transition-all duration-200 flex items-center gap-1.5">
                <span>Terjawab & Selesai</span>
                <span class="px-2 py-0.5 text-[9px] rounded-full" :class="statusFilter === 'selesai' ? 'bg-white/20 text-white' : 'bg-emerald-100 text-emerald-700'">{{ $sudahDijawab }}</span>
            </button>
        </div>
    </div>

    {{-- Main Content Table Box - Kritik & Saran Umum --}}
    <div x-show="activeTab === 'umum'" x-transition class="bg-white rounded-[40px] shadow-sm border border-slate-100 overflow-hidden">
        <div class="p-10 border-b border-slate-50">
            <h4 class="text-xl font-bold text-slate-800">Daftar Kritik & Saran Umum</h4>
            <p class="text-xs text-slate-400 font-bold uppercase tracking-wider mt-1">Dikirim oleh Masyarakat Umum melalui Beranda</p>
        </div>
        
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-slate-50 text-slate-400 font-bold uppercase text-[10px] tracking-widest border-b border-slate-100">
                        <th class="p-6 w-16">NO</th>
                        <th class="p-6">Pengirim (Email)</th>
                        <th class="p-6">Tanggal Masuk</th>
                        <th class="p-6">Kritik & Saran</th>
                        <th class="p-6 text-center">Status</th>
                        <th class="p-6 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100 text-slate-700 text-sm">
                    <template x-for="(item, index) in paginatedUmum()" :key="item.id">
                        <tr class="hover:bg-slate-50/50 transition">
                            <td class="p-6 font-bold text-slate-400 text-xs" x-text="(pageUmum - 1) * perPage + index + 1"></td>
                            <td class="p-6 font-bold text-slate-800" x-text="item.email"></td>
                            <td class="p-6 text-slate-400 font-semibold" x-text="item.tanggal + ' WIB'"></td>
                            <td class="p-6 max-w-xs"><div class="line-clamp-2 font-medium" x-text="item.keluhan"></div></td>
                            <td class="p-6 text-center">
                                <span x-show="item.status === 'Selesai'" class="inline-block bg-slate-100 text-slate-700 text-[10px] font-black px-3 py-1 rounded-full uppercase">Selesai</span>
                                <span x-show="item.status === 'Sudah Dijawab'" class="inline-block bg-green-50 text-green-700 text-[10px] font-black px-3 py-1 rounded-full uppercase">Terjawab</span>
                                <span x-show="item.status === 'Belum Dijawab'" class="inline-block bg-rose-50 text-rose-700 text-[10px] font-black px-3 py-1 rounded-full uppercase">Pending</span>
                            </td>
                            <td class="p-6 text-center">
                                <button @click="openReplyModal = true; activeMessage = item;" class="px-5 py-2.5 bg-emerald-50 text-emerald-600 hover:bg-emerald-600 hover:text-white rounded-2xl text-xs font-bold transition shadow-sm" x-text="item.status === 'Belum Dijawab' ? 'Jawab Pesan' : 'Lihat Chat'">
                                </button>
                            </td>
                        </tr>
                    </template>
                    <tr x-show="filteredUmum().length === 0">
                        <td colspan="6" class="p-12 text-center text-slate-400 font-semibold italic">Belum ada kritik & saran masuk.</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Pagination UI - Table Umum -->
        <div class="px-8 py-5 border-t border-slate-100 bg-slate-50/50 flex flex-col sm:flex-row items-center justify-between gap-4">
            <div class="text-xs font-bold text-slate-400">
                Menampilkan <span class="text-slate-800 font-black" x-text="filteredUmum().length ? (pageUmum - 1) * perPage + 1 : 0"></span> - 
                <span class="text-slate-800 font-black" x-text="Math.min(pageUmum * perPage, filteredUmum().length)"></span> 
                dari <span class="text-slate-800 font-black" x-text="filteredUmum().length"></span> Aduan
            </div>

            <div class="flex items-center gap-1.5" x-show="totalPagesUmum() > 1">
                <!-- Previous Button -->
                <button type="button" @click="if(pageUmum > 1) pageUmum--" 
                        :disabled="pageUmum === 1"
                        :class="pageUmum === 1 ? 'opacity-40 cursor-not-allowed bg-white text-slate-300' : 'bg-white text-emerald-600 hover:bg-emerald-600 hover:text-white shadow-xs'"
                        class="p-2 rounded-xl border border-slate-200 transition-all font-bold text-xs flex items-center justify-center">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7"/>
                    </svg>
                </button>

                <!-- Page Numbers -->
                <template x-for="p in totalPagesUmum()" :key="p">
                    <button type="button" @click="pageUmum = p"
                            :class="pageUmum === p ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20 font-black' : 'bg-white text-slate-600 hover:bg-slate-100 font-bold'"
                            class="h-9 w-9 rounded-xl border border-slate-200 text-xs transition-all flex items-center justify-center"
                            x-text="p"></button>
                </template>

                <!-- Next Button -->
                <button type="button" @click="if(pageUmum < totalPagesUmum()) pageUmum++" 
                        :disabled="pageUmum === totalPagesUmum()"
                        :class="pageUmum === totalPagesUmum() ? 'opacity-40 cursor-not-allowed bg-white text-slate-300' : 'bg-white text-emerald-600 hover:bg-emerald-600 hover:text-white shadow-xs'"
                        class="p-2 rounded-xl border border-slate-200 transition-all font-bold text-xs flex items-center justify-center">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    {{-- Main Content Table Box - Konsultasi IKM Juara --}}
    <div x-show="activeTab === 'ikmjuara'" x-transition class="bg-white rounded-[40px] shadow-sm border border-slate-100 overflow-hidden" style="display:none;">
        <div class="p-10 border-b border-slate-50">
            <h4 class="text-xl font-bold text-slate-800">Daftar Konsultasi IKM Juara</h4>
            <p class="text-xs text-slate-400 font-bold uppercase tracking-wider mt-1">Diajukan secara Mandiri oleh Pelaku Usaha Terdaftar</p>
        </div>
        
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-slate-50 text-slate-400 font-bold uppercase text-[10px] tracking-widest border-b border-slate-100">
                        <th class="p-6 w-16">NO</th>
                        <th class="p-6">NIK</th>
                        <th class="p-6">Nama IKM / Email</th>
                        <th class="p-6">Kategori Layanan</th>
                        <th class="p-6">Tanggal Masuk</th>
                        <th class="p-6">Keluhan / Masalah</th>
                        <th class="p-6 text-center">Status</th>
                        <th class="p-6 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100 text-slate-700 text-sm">
                    <template x-for="(item, index) in paginatedIkm()" :key="item.id">
                        <tr class="hover:bg-slate-50/50 transition">
                            <td class="p-6 font-bold text-slate-400 text-xs" x-text="(pageIkm - 1) * perPage + index + 1"></td>
                            <td class="p-6 font-mono font-bold text-slate-600" x-text="item.nik || '-'"></td>
                            <td class="p-6">
                                <span class="font-bold text-slate-800 block" x-text="item.nama_ikm"></span>
                                <span class="text-slate-400 text-xs font-semibold" x-text="item.email"></span>
                            </td>
                            <td class="p-6 text-xs font-bold text-emerald-600" x-text="item.jenis_usaha"></td>
                            <td class="p-6 text-slate-400 font-semibold" x-text="item.tanggal + ' WIB'"></td>
                            <td class="p-6 max-w-xs"><div class="line-clamp-2 font-medium" x-text="item.keluhan"></div></td>
                            <td class="p-6 text-center">
                                <span x-show="item.status === 'Selesai'" class="inline-block bg-slate-100 text-slate-700 text-[10px] font-black px-3 py-1 rounded-full uppercase">Selesai</span>
                                <span x-show="item.status === 'Sudah Dijawab'" class="inline-block bg-green-50 text-green-700 text-[10px] font-black px-3 py-1 rounded-full uppercase">Terjawab</span>
                                <span x-show="item.status === 'Belum Dijawab'" class="inline-block bg-rose-50 text-rose-700 text-[10px] font-black px-3 py-1 rounded-full uppercase">Pending</span>
                            </td>
                            <td class="p-6 text-center">
                                <button @click="openReplyModal = true; activeMessage = item;" class="px-5 py-2.5 bg-emerald-50 text-emerald-600 hover:bg-emerald-600 hover:text-white rounded-2xl text-xs font-bold transition shadow-sm" x-text="item.status === 'Belum Dijawab' ? 'Jawab Pesan' : 'Lihat Chat'">
                                </button>
                            </td>
                        </tr>
                    </template>
                    <tr x-show="filteredIkm().length === 0">
                        <td colspan="8" class="p-12 text-center text-slate-400 font-semibold italic">Belum ada data konsultasi IKM Juara.</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Pagination UI - Table IKM Juara -->
        <div class="px-8 py-5 border-t border-slate-100 bg-slate-50/50 flex flex-col sm:flex-row items-center justify-between gap-4">
            <div class="text-xs font-bold text-slate-400">
                Menampilkan <span class="text-slate-800 font-black" x-text="filteredIkm().length ? (pageIkm - 1) * perPage + 1 : 0"></span> - 
                <span class="text-slate-800 font-black" x-text="Math.min(pageIkm * perPage, filteredIkm().length)"></span> 
                dari <span class="text-slate-800 font-black" x-text="filteredIkm().length"></span> Aduan
            </div>

            <div class="flex items-center gap-1.5" x-show="totalPagesIkm() > 1">
                <!-- Previous Button -->
                <button type="button" @click="if(pageIkm > 1) pageIkm--" 
                        :disabled="pageIkm === 1"
                        :class="pageIkm === 1 ? 'opacity-40 cursor-not-allowed bg-white text-slate-300' : 'bg-white text-emerald-600 hover:bg-emerald-600 hover:text-white shadow-xs'"
                        class="p-2 rounded-xl border border-slate-200 transition-all font-bold text-xs flex items-center justify-center">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7"/>
                    </svg>
                </button>

                <!-- Page Numbers -->
                <template x-for="p in totalPagesIkm()" :key="p">
                    <button type="button" @click="pageIkm = p"
                            :class="pageIkm === p ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20 font-black' : 'bg-white text-slate-600 hover:bg-slate-100 font-bold'"
                            class="h-9 w-9 rounded-xl border border-slate-200 text-xs transition-all flex items-center justify-center"
                            x-text="p"></button>
                </template>

                <!-- Next Button -->
                <button type="button" @click="if(pageIkm < totalPagesIkm()) pageIkm++" 
                        :disabled="pageIkm === totalPagesIkm()"
                        :class="pageIkm === totalPagesIkm() ? 'opacity-40 cursor-not-allowed bg-white text-slate-300' : 'bg-white text-emerald-600 hover:bg-emerald-600 hover:text-white shadow-xs'"
                        class="p-2 rounded-xl border border-slate-200 transition-all font-bold text-xs flex items-center justify-center">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    {{-- Reply Dialog Modal (Alpine.js) --}}
    <div x-show="openReplyModal" 
         class="fixed inset-0 z-[999] flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm"
         x-transition:enter="transition ease-out duration-300"
         x-transition:enter-start="opacity-0"
         x-transition:enter-end="opacity-100"
         x-transition:leave="transition ease-in duration-200"
         x-transition:leave-start="opacity-100"
         x-transition:leave-end="opacity-0"
         x-cloak>
        
        <!-- Modal Content Container -->
        <div @click.away="openReplyModal = false" 
             class="bg-white rounded-[2.5rem] max-w-lg w-full overflow-hidden relative shadow-2xl p-8 border border-slate-100 flex flex-col"
             x-transition:enter="transition ease-out duration-300"
             x-transition:enter-start="scale-95 translate-y-4"
             x-transition:enter-end="scale-100 translate-y-0"
             x-transition:leave="transition ease-in duration-200"
             x-transition:leave-start="scale-100 translate-y-0"
             x-transition:leave-end="scale-95 translate-y-4">
            
            <!-- Close Button -->
            <button @click="openReplyModal = false" 
                    class="absolute top-6 right-6 w-10 h-10 flex items-center justify-center bg-slate-100 hover:bg-rose-500 hover:text-white rounded-full transition duration-300 text-slate-500">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M6 18L18 6M6 6l12 12"></svg>
            </button>

            <h3 class="text-xl font-bold text-slate-800 mb-6">Percakapan Konsultasi</h3>

            <div class="space-y-5 flex-1 flex flex-col max-h-[75vh] overflow-y-auto">
                <!-- Info Sender -->
                <div class="bg-slate-50 p-4 rounded-2xl border border-slate-100 text-[10px] text-slate-500 font-semibold space-y-1">
                    <div class="flex justify-between" x-show="activeMessage.nik">
                        <span>NIK Pelaku Usaha:</span>
                        <span class="text-slate-800 font-mono font-bold" x-text="activeMessage.nik"></span>
                    </div>
                    <div class="flex justify-between">
                        <span>Pengirim:</span>
                        <span class="text-slate-800" x-text="activeMessage.email"></span>
                    </div>
                    <div class="flex justify-between">
                        <span>Sesi Dimulai:</span>
                        <span class="text-slate-800" x-text="activeMessage.tanggal + ' WIB'"></span>
                    </div>
                </div>

                <!-- Chat Column (Thread) -->
                <div>
                    <h4 class="text-xs font-bold uppercase tracking-wider text-slate-400 mb-2 text-left">Histori Obrolan</h4>
                    <div class="bg-slate-50 border border-slate-100 rounded-2xl p-4 space-y-4 max-h-[220px] overflow-y-auto">
                        {{-- First User Message --}}
                        <div class="flex flex-col items-start text-left max-w-[85%]">
                            <div class="bg-white p-3 rounded-2xl rounded-tl-none border border-slate-100 shadow-sm">
                                <p class="text-xs text-slate-700 font-semibold leading-relaxed" x-text="activeMessage.keluhan"></p>
                            </div>
                            <span class="text-[8px] font-bold text-slate-405 uppercase tracking-wider mt-1" x-text="'Pelaku Usaha • ' + activeMessage.tanggal"></span>
                        </div>

                        {{-- Subsequent Messages --}}
                        <template x-for="msg in activeMessage.messages" :key="msg.id">
                            <div class="flex flex-col gap-1 max-w-[85%]" :class="msg.sender === 'admin' ? 'ml-auto items-end text-right' : 'items-start text-left'">
                                <div class="p-3 rounded-2xl shadow-sm border" 
                                     :class="msg.sender === 'admin' ? 'bg-emerald-600 text-white border-emerald-700 rounded-tr-none' : 'bg-white text-slate-700 border-slate-100 rounded-tl-none'">
                                    <p class="text-xs font-semibold leading-relaxed" x-text="msg.pesan"></p>
                                </div>
                                <span class="text-[8px] font-bold text-slate-400 uppercase tracking-wider" 
                                      x-text="(msg.sender === 'admin' ? 'Dinas' : 'Pelaku Usaha') + ' • ' + new Date(msg.created_at).toLocaleDateString('id-ID', {day: 'numeric', month: 'short'}) + ' ' + new Date(msg.created_at).toLocaleTimeString('id-ID', {hour: '2-digit', minute:'2-digit'})"></span>
                            </div>
                        </template>
                    </div>
                </div>

                <!-- Status Selesai banner -->
                <div x-show="activeMessage.status === 'Selesai'" class="p-4 bg-emerald-50 border border-emerald-200 text-emerald-700 text-xs font-bold text-center rounded-2xl">
                    Sesi konsultasi ini telah resmi diakhiri dan ditutup.
                </div>

                <!-- Form Balas (Hanya tampil jika belum kedaluwarsa & belum diakhiri) -->
                <div x-show="activeMessage.status !== 'Selesai' && new Date() - new Date(activeMessage.updated_at) >= 24 * 60 * 60 * 1000" class="p-4 bg-slate-100 border border-slate-200 text-slate-500 text-xs font-bold text-center rounded-2xl">
                    Sesi obrolan ditutup otomatis karena sudah 24 jam tidak ada interaksi.
                </div>

                <form x-show="activeMessage.status !== 'Selesai' && new Date() - new Date(activeMessage.updated_at) < 24 * 60 * 60 * 1000" :action="'{{ url('dukungan/konsultasi') }}/' + activeMessage.id + '/jawab'" method="POST" class="space-y-4">
                    @csrf
                    <div class="text-left">
                        <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-2">Tulis Jawaban Balasan <span class="text-rose-500">*</span></label>
                        <textarea name="jawaban" required rows="3" placeholder="Tulis tanggapan atau jawaban resmi..." 
                                  class="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-2 focus:ring-emerald-500 focus:bg-white transition outline-none text-slate-800 text-sm font-semibold resize-none"></textarea>
                    </div>

                    <div class="flex justify-between items-center pt-2">
                        <button type="button" @click="triggerEndSession()" 
                                class="px-6 py-3 bg-rose-500 hover:bg-rose-600 text-white rounded-2xl text-sm font-bold transition flex items-center gap-2 shadow-lg shadow-rose-500/20">
                            Akhiri Konsultasi
                        </button>
                        <div class="flex gap-3">
                            <button type="button" @click="openReplyModal = false" 
                                    class="px-6 py-3 border border-slate-200 text-slate-500 hover:bg-slate-50 rounded-2xl text-sm font-bold transition">
                                Batal
                            </button>
                            <button type="submit" 
                                    class="px-6 py-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-sm font-bold transition flex items-center gap-2 shadow-lg shadow-emerald-500/20">
                                Kirim Jawaban
                            </button>
                        </div>
                    </div>
                </form>

                <form x-ref="endForm" :action="'{{ url('dukungan/konsultasi') }}/' + activeMessage.id + '/akhiri'" method="POST" class="hidden">
                    @csrf
                </form>
            </div>
        </div>
    </div>
    <!-- Custom Akhiri Sesi Confirmation Modal (Alpine.js) -->
    <div x-show="showEndConfirmation" 
         class="fixed inset-0 z-[1000] flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm"
         x-transition:enter="transition ease-out duration-300"
         x-transition:enter-start="opacity-0"
         x-transition:enter-end="opacity-100"
         x-transition:leave="transition ease-in duration-200"
         x-transition:leave-start="opacity-100"
         x-transition:leave-end="opacity-0"
         x-cloak>
        
        <div @click.away="cancelEndSession()" 
             class="bg-white rounded-[2.5rem] max-w-md w-full overflow-hidden relative shadow-2xl p-8 border border-slate-100 flex flex-col items-center text-center animate-fade-in"
             x-transition:enter="transition ease-out duration-300"
             x-transition:enter-start="scale-95 translate-y-4"
             x-transition:enter-end="scale-100 translate-y-0"
             x-transition:leave="transition ease-in duration-200"
             x-transition:leave-start="scale-100 translate-y-0"
             x-transition:leave-end="scale-95 translate-y-4">
             
             <!-- Warning Pulsing Icon -->
             <div class="h-20 w-20 bg-rose-50 rounded-full flex items-center justify-center text-rose-500 mb-6 relative">
                 <span class="absolute inset-0 rounded-full bg-rose-400/20 animate-ping"></span>
                 <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10 relative z-10 animate-bounce" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                     <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                 </svg>
             </div>

             <h3 class="text-2xl font-black text-slate-800 mb-2">Akhiri Sesi Konsultasi?</h3>
             <p class="text-sm text-slate-500 font-semibold leading-relaxed mb-6">
                 Apakah Anda yakin ingin mengakhiri sesi konsultasi ini? Sesi pelaku usaha juga akan langsung terputus.
             </p>

             <!-- Countdown indicator -->
             <div class="w-full bg-slate-100 h-2 rounded-full overflow-hidden mb-8 relative">
                 <div class="bg-rose-500 h-full transition-all duration-1000 ease-linear" :style="'width: ' + (endCountdown / 3 * 100) + '%'"></div>
             </div>

             <div class="flex gap-4 w-full">
                 <button type="button" @click="cancelEndSession()" 
                         class="flex-1 py-4 border border-slate-200 text-slate-500 hover:bg-slate-50 rounded-2xl text-sm font-bold transition">
                     Batal
                 </button>
                 <button type="button" @click="confirmEndSession()" 
                         class="flex-1 py-4 bg-gradient-to-r from-rose-500 to-pink-600 hover:from-rose-600 hover:to-pink-700 text-white rounded-2xl text-sm font-extrabold transition shadow-lg shadow-rose-500/25">
                     Ya, Akhiri (<span x-text="endCountdown"></span>s)
                 </button>
             </div>
        </div>
    </div>

    <!-- Modal Kelola Topik Kategori Pengaduan -->
    <div x-show="openKategoriModal" 
         class="fixed inset-0 z-[1000] flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm"
         x-transition:enter="transition ease-out duration-300"
         x-transition:enter-start="opacity-0"
         x-transition:enter-end="opacity-100"
         x-transition:leave="transition ease-in duration-200"
         x-transition:leave-start="opacity-100"
         x-transition:leave-end="opacity-0"
         x-cloak>
        <div class="bg-white rounded-[36px] max-w-2xl w-full p-8 shadow-2xl space-y-6 relative border border-slate-100 max-h-[90vh] overflow-y-auto">
            <div class="flex justify-between items-center border-b border-slate-100 pb-4">
                <div>
                    <h3 class="text-xl font-black text-slate-900">📂 Kelola Topik Kategori Pengaduan</h3>
                    <p class="text-xs text-slate-500 font-semibold mt-0.5">Tambah atau hapus opsi kategori konsultasi yang tampil bagi pelaku usaha</p>
                </div>
                <button type="button" @click="openKategoriModal = false" class="text-slate-400 hover:text-slate-600 p-2 rounded-xl hover:bg-slate-100 transition">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/></svg>
                </button>
            </div>

            <!-- Form Tambah Topik Baru -->
            <form action="{{ route('dukungan.konsultasi.kategori.tambah') }}" method="POST" class="p-6 bg-indigo-50/60 border border-indigo-100 rounded-3xl space-y-4">
                @csrf
                <h4 class="text-xs font-black uppercase text-indigo-900 tracking-wider">➕ Tambah Topik Kategori Baru</h4>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    <div>
                        <label class="block text-[10px] font-bold uppercase text-indigo-800 tracking-wider mb-1">Nama Topik Kategori <span class="text-rose-500">*</span></label>
                        <input type="text" name="nama_kategori" required placeholder="Contoh: Fasilitasi Sertifikasi Halal" class="w-full px-4 py-3 bg-white border border-indigo-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-indigo-600">
                    </div>
                    <div>
                        <label class="block text-[10px] font-bold uppercase text-indigo-800 tracking-wider mb-1">Deskripsi Singkat</label>
                        <input type="text" name="deskripsi" placeholder="Pendampingan perizinan halal IKM..." class="w-full px-4 py-3 bg-white border border-indigo-200 rounded-2xl text-xs font-semibold text-slate-700 outline-none focus:border-indigo-600">
                    </div>
                </div>
                <div class="flex justify-end pt-1">
                    <button type="submit" class="px-6 py-3 bg-indigo-600 hover:bg-indigo-700 text-white rounded-2xl text-xs font-black shadow-lg shadow-indigo-600/30 transition">Simpan Topik Kategori</button>
                </div>
            </form>

            <!-- Tabel Daftar Topik -->
            <div class="space-y-3">
                <h4 class="text-xs font-black uppercase text-slate-500 tracking-wider">Daftar Topik Kategori Aktif (<span x-text="kategoriList.length"></span>)</h4>
                <div class="divide-y divide-slate-100 border border-slate-100 rounded-3xl overflow-hidden shadow-sm">
                    <template x-for="item in kategoriList" :key="item.id">
                        <div class="p-4 bg-white flex justify-between items-center gap-4 hover:bg-slate-50 transition">
                            <div class="space-y-0.5">
                                <p class="text-xs font-black text-slate-800" x-text="item.nama_kategori"></p>
                                <p class="text-[11px] text-slate-400 font-medium" x-text="item.deskripsi || 'Tidak ada deskripsi'"></p>
                            </div>
                            <form :action="'{{ url('dukungan/konsultasi/kategori') }}/' + item.id" method="POST" onsubmit="return confirm('Yakin ingin menghapus topik kategori ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="px-3.5 py-2 bg-rose-50 hover:bg-rose-100 text-rose-600 rounded-xl text-[10px] font-extrabold transition flex items-center gap-1">
                                    <span>🗑️ Hapus</span>
                                </button>
                            </form>
                        </div>
                    </template>
                    <div x-show="kategoriList.length === 0" class="p-6 text-center text-xs text-slate-400 font-bold">
                        Belum ada topik kategori pengaduan tersimpan.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
