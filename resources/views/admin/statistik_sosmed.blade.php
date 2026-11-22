@extends('layouts.dukungan')

@section('title', 'Pengaturan Statistik & Sosmed')

@section('content')
@php
    $firstStat = $firstStat ?? DB::table('statistik_kecamatan')->first();
    $rawSosmed = json_decode($firstStat->sosial_media ?? '[]', true);
    if (!is_array($rawSosmed) || empty($rawSosmed)) {
        $rawSosmed = [
            ['platform' => 'Instagram', 'username' => '@disnakerkukm.madiunkota', 'url' => 'https://www.instagram.com/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn'],
            ['platform' => 'Instagram', 'username' => '@perindustrian.kotamadiun', 'url' => 'https://www.instagram.com/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs'],
            ['platform' => 'Facebook', 'username' => 'Disnakerkukm Kota Madiun', 'url' => 'https://www.facebook.com/share/19RgNeZgVq/'],
            ['platform' => 'TikTok', 'username' => '@disnakerkukmkotamadiun', 'url' => 'https://vm.tiktok.com/ZS9hYefCLguks-CQgR6/'],
            ['platform' => 'X', 'username' => '@DisnakerKUKM', 'url' => 'https://x.com/DisnakerKUKM'],
        ];
    }
@endphp
<div class="max-w-6xl">
    {{-- Notifikasi --}}
    @if(session('success'))
    <div class="mb-8 p-5 bg-emerald-500 text-white rounded-[2rem] shadow-xl shadow-emerald-200 flex items-center gap-4 animate-bounce">
        <div class="bg-white/20 p-2 rounded-full">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7" />
            </svg>
        </div>
        <span class="font-bold tracking-wide">{{ session('success') }}</span>
    </div>
    @endif

    {{-- Card Utama --}}
    <div class="bg-white rounded-[2.5rem] shadow-sm border border-slate-100 p-10">
        <div class="flex justify-between items-start mb-10">
            <div>
                <h3 class="text-xl font-bold text-slate-800 mb-1">Update Statistik Landing Page</h3>
                <p class="text-slate-400 text-sm">Input data statistik untuk ditampilkan di halaman utama (landing page).</p>
            </div>
            <div class="bg-emerald-50 px-4 py-2 rounded-xl text-emerald-600 font-bold text-xs uppercase tracking-tighter">
                Live Preview Mode
            </div>
        </div>

        <form action="{{ route('dukungan.statistik-sosmed.update') }}" method="POST" x-data="statsSosmedManager()">
            @csrf

            <!-- Grid Visitor Stats Input (4 fields) -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
                <div class="space-y-3">
                    <label class="flex items-center gap-2 font-bold text-slate-700 text-sm">
                        <span class="w-2 h-2 bg-emerald-500 rounded-full"></span>
                        Pengunjung Hari Ini
                    </label>
                    <div class="relative group">
                        <input type="number" 
                               name="kunjungan_hari_ini" 
                               x-model.number="hariIni"
                               class="w-full p-5 bg-slate-50 border-2 border-transparent rounded-3xl focus:bg-white focus:border-emerald-500 focus:ring-4 focus:ring-emerald-50 outline-none font-black text-2xl text-emerald-600 transition-all duration-300 group-hover:bg-slate-100"
                               required>
                        <span class="absolute right-5 top-1/2 -translate-y-1/2 text-[10px] font-black text-slate-300 uppercase tracking-widest group-focus-within:text-emerald-200 transition-colors">Orang</span>
                    </div>
                </div>

                <div class="space-y-3">
                    <label class="flex items-center gap-2 font-bold text-slate-700 text-sm">
                        <span class="w-2 h-2 bg-emerald-500 rounded-full"></span>
                        Pengunjung Bulan Ini
                    </label>
                    <div class="relative group">
                        <input type="number" 
                               name="kunjungan_bulan_ini" 
                               x-model.number="bulanIni"
                               class="w-full p-5 bg-slate-50 border-2 border-transparent rounded-3xl focus:bg-white focus:border-emerald-500 focus:ring-4 focus:ring-emerald-50 outline-none font-black text-2xl text-emerald-600 transition-all duration-300 group-hover:bg-slate-100"
                               required>
                        <span class="absolute right-5 top-1/2 -translate-y-1/2 text-[10px] font-black text-slate-300 uppercase tracking-widest group-focus-within:text-emerald-200 transition-colors">Orang</span>
                    </div>
                </div>

                <div class="space-y-3">
                    <label class="flex items-center gap-2 font-bold text-slate-700 text-sm">
                        <span class="w-2 h-2 bg-emerald-500 rounded-full"></span>
                        Pengunjung Tahun Ini
                    </label>
                    <div class="relative group">
                        <input type="number" 
                               name="kunjungan_tahun_ini" 
                               x-model.number="tahunIni"
                               class="w-full p-5 bg-slate-50 border-2 border-transparent rounded-3xl focus:bg-white focus:border-emerald-500 focus:ring-4 focus:ring-emerald-50 outline-none font-black text-2xl text-emerald-600 transition-all duration-300 group-hover:bg-slate-100"
                               required>
                        <span class="absolute right-5 top-1/2 -translate-y-1/2 text-[10px] font-black text-slate-300 uppercase tracking-widest group-focus-within:text-emerald-200 transition-colors">Orang</span>
                    </div>
                </div>

                <div class="space-y-3">
                    <label class="flex items-center justify-between font-bold text-slate-700 text-sm">
                        <span class="flex items-center gap-2">
                            <span class="w-2 h-2 bg-amber-500 rounded-full"></span>
                            Pengunjung Tahun N-1
                        </span>
                        <span class="text-[10px] text-amber-600 bg-amber-50 px-2 py-0.5 rounded-full font-bold">Tidak Tayang Depan</span>
                    </label>
                    <div class="relative group">
                        <input type="number" 
                               name="kunjungan_tahun_lalu" 
                               x-model.number="tahunN1"
                               class="w-full p-5 bg-slate-50 border-2 border-transparent rounded-3xl focus:bg-white focus:border-amber-500 focus:ring-4 focus:ring-amber-50 outline-none font-black text-2xl text-amber-600 transition-all duration-300 group-hover:bg-slate-100"
                               required>
                        <span class="absolute right-5 top-1/2 -translate-y-1/2 text-[10px] font-black text-slate-300 uppercase tracking-widest group-focus-within:text-amber-200 transition-colors">Orang</span>
                    </div>
                    <p class="text-[10px] text-slate-400 font-medium">Akumulasi tahun sebelumnya yang tidak terekam.</p>
                </div>
            </div>

            <!-- Grid Akumulasi & Hasil Otomatis -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8 p-6 bg-slate-50/80 rounded-3xl border border-slate-100">
                <div class="space-y-3">
                    <label class="flex items-center justify-between font-bold text-slate-700 text-sm">
                        <span class="flex items-center gap-2">
                            <span class="w-2 h-2 bg-indigo-500 rounded-full"></span>
                            Total Pengunjung
                        </span>
                        <span class="text-[10px] bg-indigo-100 text-indigo-700 px-2.5 py-0.5 rounded-full font-black">⚡ Otomatis Terakumulasi</span>
                    </label>
                    <div class="relative group">
                        <input type="number" 
                               name="kunjungan_total" 
                               :value="totalKunjungan"
                               readonly
                               class="w-full p-5 bg-white border-2 border-indigo-100 rounded-3xl font-black text-2xl text-indigo-600 shadow-sm outline-none cursor-not-allowed">
                        <span class="absolute right-5 top-1/2 -translate-y-1/2 text-[10px] font-black text-slate-400 uppercase tracking-widest">Orang</span>
                    </div>
                    <p class="text-[10px] text-slate-400 font-medium">Hari Ini + Bulan Ini + Tahun Ini + Tahun N-1</p>
                </div>

                <div class="space-y-3">
                    <label class="flex items-center justify-between font-bold text-slate-700 text-sm">
                        <span class="flex items-center gap-2">
                            <span class="w-2 h-2 bg-emerald-500 rounded-full"></span>
                            Pengunjung Aktif
                        </span>
                        <span class="text-[10px] bg-emerald-100 text-emerald-700 px-2.5 py-0.5 rounded-full font-black">⚡ Otomatis 30% Hari Ini</span>
                    </label>
                    <div class="relative group">
                        <input type="number" 
                               name="pengunjung_aktif" 
                               :value="pengunjungAktif"
                               readonly
                               class="w-full p-5 bg-white border-2 border-emerald-100 rounded-3xl font-black text-2xl text-emerald-600 shadow-sm outline-none cursor-not-allowed">
                        <span class="absolute right-5 top-1/2 -translate-y-1/2 text-[10px] font-black text-slate-400 uppercase tracking-widest">Aktif</span>
                    </div>
                    <p class="text-[10px] text-slate-400 font-medium">Pembulatan otomatis: round(30% &times; Hari Ini)</p>
                </div>

                <div class="space-y-3">
                    <label class="flex items-center gap-2 font-bold text-slate-700 text-sm">
                        <span class="w-2 h-2 bg-purple-500 rounded-full"></span>
                        IKM Terdaftar (Hero)
                    </label>
                    <div class="relative group">
                        <input type="number" 
                               name="ikm_terdaftar" 
                               value="{{ $firstStat->ikm_terdaftar ?? 560 }}" 
                               class="w-full p-5 bg-white border-2 border-purple-100 rounded-3xl focus:border-purple-500 focus:ring-4 focus:ring-purple-50 outline-none font-black text-2xl text-purple-600 shadow-sm transition-all duration-300"
                               required>
                        <span class="absolute right-5 top-1/2 -translate-y-1/2 text-[10px] font-black text-slate-400 uppercase tracking-widest">IKM</span>
                    </div>
                    <p class="text-[10px] text-slate-400 font-medium">Jumlah IKM binaan tampil di section banner hero.</p>
                </div>
            </div>

            <!-- Tombol Simpan Cepat Khusus Bagian Statistik -->
            <div class="flex flex-col sm:flex-row items-center justify-between gap-4 p-5 bg-gradient-to-r from-emerald-50 via-teal-50 to-indigo-50 border-2 border-emerald-200/80 rounded-3xl mb-8 shadow-sm">
                <div class="flex items-center gap-3">
                    <div class="w-11 h-11 rounded-2xl bg-emerald-500 text-white flex items-center justify-center font-black text-xl shadow-md shadow-emerald-500/25">
                        ⚡
                    </div>
                    <div>
                        <h4 class="font-bold text-slate-800 text-sm">Simpan Pembaruan Statistik</h4>
                        <p class="text-xs text-slate-500">Klik tombol ini untuk langsung menyimpan data statistik. Nilai di Halaman Landing utama akan otomatis langsung terupdate.</p>
                    </div>
                </div>
                <button type="submit" 
                        class="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-8 py-3.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl font-black text-sm shadow-lg shadow-emerald-600/20 hover:scale-[1.02] active:scale-95 transition-all cursor-pointer shrink-0">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                    </svg>
                    <span>SIMPAN PERUBAHAN STATISTIK</span>
                </button>
            </div>

            <!-- Grid Kontak Dinas (2 fields) -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-8">
                <div class="space-y-4">
                    <label class="flex items-center gap-2 font-bold text-slate-700 text-sm">
                        <span class="w-2 h-2 bg-pink-500 rounded-full"></span>
                        Nomor Telepon Dinas
                    </label>
                    <div class="relative group">
                        <input type="text" 
                               name="telp_dinas" 
                               value="{{ $firstStat->telp_dinas ?? '(0351) 454288' }}" 
                               class="w-full p-6 bg-slate-50 border border-slate-200 rounded-3xl focus:bg-white focus:border-emerald-500 focus:ring-4 focus:ring-emerald-50 outline-none font-bold text-lg text-slate-800 transition-all duration-300 group-hover:bg-slate-100"
                               required>
                    </div>
                </div>

                <div class="space-y-4">
                    <label class="flex items-center gap-2 font-bold text-slate-700 text-sm">
                        <span class="w-2 h-2 bg-teal-500 rounded-full"></span>
                        Email Dinas
                    </label>
                    <div class="relative group">
                        <input type="email" 
                               name="email_dinas" 
                               value="{{ $firstStat->email_dinas ?? 'disnaker@madiunkota.go.id' }}" 
                               class="w-full p-6 bg-slate-50 border border-slate-200 rounded-3xl focus:bg-white focus:border-emerald-500 focus:ring-4 focus:ring-emerald-50 outline-none font-bold text-lg text-slate-800 transition-all duration-300 group-hover:bg-slate-100"
                               required>
                    </div>
                </div>
            </div>

            <!-- Hidden input for total kunjungan fallback logic (for old code safety) -->
            <input type="hidden" name="total_kunjungan" value="{{ $firstStat->total_kunjungan ?? 12840 }}">

            <!-- Gateway WhatsApp Fonnte Section -->
            <div class="my-10 border-t border-slate-100"></div>

            <div class="flex justify-between items-start mb-6">
                <div>
                    <h3 class="text-xl font-bold text-slate-800 mb-1">Pengaturan WhatsApp Gateway Fonnte</h3>
                    <p class="text-slate-400 text-sm">Kelola Token Fonnte dan Nomor WhatsApp HP Admin untuk menerima notifikasi pengingat pesan secara langsung.</p>
                </div>
                <div class="bg-indigo-50 border border-indigo-100 px-4 py-2 rounded-xl text-indigo-600 font-bold text-xs uppercase tracking-wider">
                    📲 WA Notif Gateway
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 bg-emerald-50/50 p-6 rounded-3xl border border-emerald-100 mb-10">
                <div class="space-y-2">
                    <label class="block text-xs font-black uppercase tracking-wider text-emerald-900 flex items-center gap-1.5">
                        <span>💬 Nomor WhatsApp Floating Chat (Landing Page http://127.0.0.1:8000/)</span>
                    </label>
                    <input type="text" 
                           name="admin_wa_number" 
                           value="{{ $firstStat->admin_wa_number ?? '08123456789' }}" 
                           placeholder="Contoh: 08123456789 atau 628123456789" 
                           class="w-full px-5 py-3.5 bg-white border border-emerald-200 rounded-2xl focus:ring-2 focus:ring-emerald-400 outline-none text-slate-900 text-sm font-extrabold shadow-sm">
                    <p class="text-[11px] text-slate-500 font-semibold">Nomor WhatsApp ini akan terhubung langsung saat pengunjung mengeklik tombol ikon WhatsApp melayang (floating button) di pojok kanan bawah halaman utama.</p>
                </div>

                <div class="space-y-2">
                    <label class="block text-xs font-bold uppercase tracking-wider text-indigo-900">Token Fonnte API Gateway</label>
                    <input type="text" 
                           name="fonnte_token" 
                           value="{{ $firstStat->fonnte_token ?? 'TqK5aiZZSwXPEqmRu411' }}" 
                           placeholder="Masukkan Token API Fonnte" 
                           class="w-full px-5 py-3.5 bg-white border border-indigo-200 rounded-2xl focus:ring-2 focus:ring-indigo-300 outline-none text-slate-800 text-sm font-mono font-bold">
                    <p class="text-[11px] text-slate-400 font-medium">Token API resmi dari dashboard Fonnte.com Anda.</p>
                </div>
            </div>

            <div class="my-10 border-t border-slate-100"></div>

            <!-- Social Media Accounts Section -->
            <div class="flex justify-between items-start mb-6">
                <div>
                    <h3 class="text-xl font-bold text-slate-800 mb-1">Update Akun Media Sosial</h3>
                    <p class="text-slate-400 text-sm">Kelola tautan media sosial yang akan ditampilkan pada bagian "Hubungi Kami" / Footer.</p>
                </div>
                <button type="button" @click="addSosmed()" 
                        class="bg-emerald-50 text-emerald-600 px-6 py-3 rounded-2xl font-bold text-xs hover:bg-emerald-100 transition flex items-center gap-2 shadow-sm cursor-pointer">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" /></svg>
                    TAMBAH SOSMED
                </button>
            </div>

            <!-- Hidden Input for social media JSON serialization -->
            <input type="hidden" name="sosial_media" :value="JSON.stringify(sosialMedia)">

            <!-- Dynamic Social Media Rows -->
            <div class="space-y-4">
                <template x-for="(item, index) in sosialMedia" :key="index">
                    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 bg-slate-50 p-6 rounded-3xl border border-slate-100 items-end">
                        <div class="space-y-2">
                            <label class="block text-xs font-bold uppercase tracking-wider text-slate-500">Platform</label>
                            <select x-model="item.platform" 
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-xl focus:ring-2 focus:ring-emerald-50 outline-none text-slate-800 text-sm font-semibold">
                                <option value="Instagram">Instagram</option>
                                <option value="Facebook">Facebook</option>
                                <option value="TikTok">TikTok</option>
                                <option value="X">X (Twitter)</option>
                                <option value="YouTube">YouTube</option>
                            </select>
                        </div>
                        <div class="space-y-2 md:col-span-1">
                            <label class="block text-xs font-bold uppercase tracking-wider text-slate-500">Username / Label</label>
                            <input type="text" x-model="item.username" placeholder="Contoh: @ikm_madiun" required
                                   class="w-full px-4 py-3 bg-white border border-slate-200 rounded-xl focus:ring-2 focus:ring-emerald-50 outline-none text-slate-800 text-sm font-semibold">
                        </div>
                        <div class="space-y-2 md:col-span-1">
                            <label class="block text-xs font-bold uppercase tracking-wider text-slate-500">Tautan / URL</label>
                            <input type="url" x-model="item.url" placeholder="Contoh: https://instagram.com/..." required
                                   class="w-full px-4 py-3 bg-white border border-slate-200 rounded-xl focus:ring-2 focus:ring-emerald-50 outline-none text-slate-800 text-sm font-semibold">
                        </div>
                        <div>
                            <button type="button" @click="removeSosmed(index)" 
                                    class="w-full px-4 py-3 bg-rose-500 hover:bg-rose-600 text-white rounded-xl text-xs font-bold transition flex items-center justify-center gap-2 shadow-md shadow-rose-500/20 cursor-pointer">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
                                HAPUS
                            </button>
                        </div>
                    </div>
                </template>
                
                <div x-show="sosialMedia.length === 0" class="p-8 text-center text-slate-400 font-semibold italic bg-slate-50 rounded-3xl border border-dashed border-slate-200">
                    Belum ada akun media sosial yang ditambahkan. Klik "TAMBAH SOSMED" untuk mulai.
                </div>
            </div>

            <div class="mt-10 border-t border-slate-100 pt-8">
                <button type="submit" class="bg-emerald-600 text-white px-10 py-4 rounded-2xl font-bold hover:bg-emerald-700 transition-all shadow-lg shadow-emerald-500/20 cursor-pointer">
                    SIMPAN SEMUA PERUBAHAN
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    function statsSosmedManager() {
        return {
            sosialMedia: {!! json_encode($rawSosmed) !!},
            hariIni: {{ (int)($firstStat->kunjungan_hari_ini ?? 26) }},
            bulanIni: {{ (int)($firstStat->kunjungan_bulan_ini ?? 148) }},
            tahunIni: {{ (int)($firstStat->kunjungan_tahun_ini ?? 4423) }},
            tahunN1: {{ (int)($firstStat->kunjungan_tahun_lalu ?? 1768) }},
            get pengunjungAktif() {
                return Math.round(Number(this.hariIni || 0) * 0.30);
            },
            get totalKunjungan() {
                return Number(this.hariIni || 0) + Number(this.bulanIni || 0) + Number(this.tahunIni || 0) + Number(this.tahunN1 || 0);
            },
            addSosmed() {
                this.sosialMedia.push({ platform: 'Instagram', username: '', url: '' });
            },
            removeSosmed(index) {
                this.sosialMedia.splice(index, 1);
            }
        };
    }
</script>
@endsection
