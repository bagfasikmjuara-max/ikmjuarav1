<!DOCTYPE html>
<html lang="id" class="scroll-smooth">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
        content="Cek Legalitas Mandiri IKM JUARA - Periksa Status & Diagnosa Kebutuhan NIB, Halal, BPOM, HKI Merek Usaha IKM Kota Madiun secara Mandiri.">
    <title>Cek Legalitas Mandiri IKM — IKM JUARA Kota Madiun</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        [x-cloak] {
            display: none !important;
        }

        .grid-pattern {
            background-size: 40px 40px;
            background-image:
                linear-gradient(to right, rgba(16, 185, 129, 0.04) 1px, transparent 1px),
                linear-gradient(to bottom, rgba(16, 185, 129, 0.04) 1px, transparent 1px);
        }

        @keyframes float-slow {
            0%, 100% { transform: translateY(0px) scale(1); }
            50% { transform: translateY(-16px) scale(1.03); }
        }

        .anim-float { animation: float-slow 7s ease-in-out infinite; }
    </style>
</head>

<body class="bg-slate-50 overflow-x-hidden min-h-screen flex flex-col relative text-slate-800" x-data="cekMandiriApp()" x-init="init()">

    {{-- Background Ambient Lights --}}
    <div class="absolute inset-0 overflow-hidden pointer-events-none z-0">
        <div class="absolute -top-32 -left-32 w-96 h-96 bg-emerald-500/10 rounded-full blur-[130px] anim-float"></div>
        <div class="absolute top-1/3 -right-20 w-[450px] h-[450px] bg-teal-500/10 rounded-full blur-[140px]"></div>
        <div class="absolute -bottom-20 left-1/4 w-80 h-80 bg-indigo-500/10 rounded-full blur-[110px]"></div>
        <div class="absolute inset-0 grid-pattern opacity-80"></div>
    </div>

    {{-- NAVBAR --}}
    <nav class="bg-white/85 backdrop-blur-xl sticky top-0 z-50 border-b border-slate-100 shadow-sm shadow-slate-100/50">
        <div class="max-w-7xl mx-auto flex justify-between items-center px-6 lg:px-8 py-4">
            <a href="{{ route('home') }}" class="flex items-center gap-3 group relative z-10">
                <div class="w-10 h-10 rounded-xl overflow-hidden flex items-center justify-center bg-white shadow-sm border border-slate-100">
                    <img src="{{ asset('logo-ikm.png') }}" alt="Logo IKM" class="w-full object-contain group-hover:scale-110 transition-transform duration-300">
                </div>
                <div>
                    <span class="text-xl font-black tracking-tight text-slate-800 uppercase">IKM<span class="text-amber-500">JUARA</span></span>
                    <p class="text-[9px] font-bold text-emerald-600 tracking-[0.15em] uppercase -mt-1">Cek Legalitas Mandiri</p>
                </div>
            </a>

            <div class="hidden md:flex items-center gap-3 text-[13px] font-bold">
                <a href="{{ route('dashboard.ikm.juara') }}"
                    class="bg-slate-100 hover:bg-slate-200 text-slate-700 px-5 py-2.5 rounded-xl transition duration-300 flex items-center gap-2 border border-slate-200">
                    <i class="bi bi-speedometer2"></i>
                    <span>Dashboard Pembinaan</span>
                </a>
                <a href="{{ url('/') }}"
                    class="bg-[#0B1229] hover:bg-indigo-600 text-white px-5 py-2.5 rounded-xl transition duration-300 shadow-md flex items-center gap-2">
                    <i class="bi bi-house-door"></i>
                    <span>Utama</span>
                </a>
            </div>
        </div>
    </nav>

    {{-- MAIN CONTAINER --}}
    <main class="flex-grow max-w-7xl w-full mx-auto px-6 lg:px-8 py-10 relative z-10 space-y-10">

        {{-- HERO BANNER --}}
        <div class="bg-gradient-to-br from-slate-900 via-emerald-950 to-teal-900 rounded-[40px] p-8 lg:p-12 text-white relative overflow-hidden shadow-2xl border border-emerald-500/20">
            <div class="absolute right-0 top-0 opacity-10 pointer-events-none transform translate-x-12 -translate-y-8">
                <i class="bi bi-shield-check text-[320px]"></i>
            </div>
            
            <div class="max-w-3xl relative z-10 space-y-4">
                <div class="inline-flex items-center gap-2 bg-emerald-500/20 border border-emerald-400/30 px-4 py-1.5 rounded-full text-xs font-black text-emerald-300 uppercase tracking-widest backdrop-blur-md">
                    <span class="w-2 h-2 rounded-full bg-emerald-400 animate-ping"></span>
                    Fast & Free Legal Guidance • Disnaker KUKM Madiun
                </div>
                
                <h1 class="text-3xl lg:text-5xl font-black tracking-tight leading-tight uppercase">
                    Cek & Diagnosa <span class="text-emerald-400">Legalitas Usahamu</span> Secara Mandiri!
                </h1>

                <p class="text-slate-300 text-sm lg:text-base font-medium leading-relaxed">
                    Halo Pelaku Usaha IKM Kota Madiun! 👋 Periksa status NIB, Progres Sertifikat Halal, HKI Merek Usaha Anda di sini secara mandiri dan aman.
                </p>
            </div>
        </div>

        {{-- NAVIGATION TABS --}}
        <div class="flex flex-wrap gap-3 bg-white p-2 rounded-3xl border border-slate-200 shadow-sm">
            <button @click="activeTab = 'cari'" :class="activeTab === 'cari' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20 font-black' : 'text-slate-600 font-bold hover:bg-slate-100'" class="flex-1 min-w-[200px] px-6 py-4 rounded-2xl text-xs uppercase tracking-wider transition-all duration-300 flex items-center justify-center gap-2">
                <i class="bi bi-search text-base"></i>
                <span>Lacak Legalitas Saya</span>
            </button>
            <button @click="activeTab = 'wizard'" :class="activeTab === 'wizard' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20 font-black' : 'text-slate-600 font-bold hover:bg-slate-100'" class="flex-1 min-w-[200px] px-6 py-4 rounded-2xl text-xs uppercase tracking-wider transition-all duration-300 flex items-center justify-center gap-2">
                <i class="bi bi-ui-checks-grid text-base"></i>
                <span>Diagnosa Mandiri (Wizard)</span>
            </button>
            <button @click="activeTab = 'panduan'" :class="activeTab === 'panduan' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20 font-black' : 'text-slate-600 font-bold hover:bg-slate-100'" class="flex-1 min-w-[200px] px-6 py-4 rounded-2xl text-xs uppercase tracking-wider transition-all duration-300 flex items-center justify-center gap-2">
                <i class="bi bi-journal-text text-base"></i>
                <span>Panduan & Syarat Legalitas</span>
            </button>
        </div>

        {{-- TAB 1: LACAK LEGALITAS SAYA (SEARCH REALTIME) --}}
        <div x-show="activeTab === 'cari'" x-transition class="space-y-8">
            <div class="bg-white rounded-[36px] p-8 border border-slate-200 shadow-sm space-y-6">
                <div class="max-w-2xl">
                    <h3 class="text-xl font-black text-slate-800 uppercase tracking-tight">Pencarian Legalitas IKM Kota Madiun</h3>
                    <p class="text-slate-500 text-xs font-medium mt-1">Demi menjaga kerahasiaan data personal, silakan masukkan <b>13-Digit NIB</b> atau <b>16-Digit NIK Pemilik</b> secara lengkap & identik.</p>
                </div>

                <div class="relative">
                    <input type="text" x-model="searchQuery" @input.debounce.300ms="doSearch()"
                        placeholder="Masukkan 13-Digit NIB atau 16-Digit NIK Pemilik Usaha Anda..."
                        class="w-full bg-slate-50 border-2 border-slate-200 focus:border-emerald-500 rounded-2xl pl-12 pr-12 py-4 text-sm font-bold text-slate-800 outline-none transition duration-300 font-mono">
                    <div class="absolute left-4 top-4 text-emerald-600 text-lg">
                        <i class="bi bi-search"></i>
                    </div>
                    <button x-show="searchQuery.length > 0" @click="searchQuery = ''; searchResults = []; selectedIkm = null;" class="absolute right-4 top-4 text-slate-400 hover:text-slate-600 text-lg">
                        <i class="bi bi-x-circle-fill"></i>
                    </button>
                </div>

                {{-- Warning Box if digits < 13 or not 13/16 --}}
                <div x-show="!isSearching && searchQuery.length > 0 && searchQuery.replace(/[^0-9]/g, '').length !== 13 && searchQuery.replace(/[^0-9]/g, '').length !== 16"
                    class="py-4 px-6 bg-amber-50 border border-amber-200 text-amber-800 rounded-2xl text-xs font-semibold flex items-center gap-3">
                    <i class="bi bi-info-circle-fill text-amber-600 text-lg flex-shrink-0"></i>
                    <span>Masukkan <b>13 digit NIB</b> atau <b>16 digit NIK Pemilik</b> secara lengkap & identik. Demi keamanan data personal pelaku usaha, penelusuran berdasarkan nama tidak diperbolehkan.</span>
                </div>
                    <div class="absolute left-4 top-4 text-emerald-600 text-lg">
                        <i class="bi bi-search"></i>
                    </div>
                    <button x-show="searchQuery.length > 0" @click="searchQuery = ''; searchResults = []; selectedIkm = null;" class="absolute right-4 top-4 text-slate-400 hover:text-slate-600 text-lg">
                        <i class="bi bi-x-circle-fill"></i>
                    </button>
                </div>

                {{-- Loading Spinner --}}
                <div x-show="isSearching" class="py-8 text-center text-slate-400 font-bold text-xs flex items-center justify-center gap-2">
                    <svg class="animate-spin h-5 w-5 text-emerald-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>
                    <span>Mencari data di database Peta Sebaran IKM...</span>
                </div>

                {{-- Empty Search Prompt --}}
                <div x-show="!isSearching && searchQuery.length === 0 && searchResults.length === 0" class="py-12 text-center bg-slate-50/50 rounded-3xl border border-dashed border-slate-200 p-8 space-y-3">
                    <div class="w-16 h-16 bg-emerald-50 text-emerald-600 rounded-2xl flex items-center justify-center mx-auto text-3xl shadow-sm">
                        <i class="bi bi-shield-check"></i>
                    </div>
                    <h4 class="text-sm font-black text-slate-700 uppercase">Ketik Data Usahamu Di Atas</h4>
                    <p class="text-xs text-slate-400 font-medium max-w-md mx-auto">Sistem akan secara otomatis mendeteksi keberadaan profil usaha Anda dan menyajikan skor kelengkapan legalitas beserta panduan selanjutnya.</p>
                </div>

                {{-- Search Results List --}}
                <div x-show="!isSearching && searchResults.length > 0" class="space-y-4">
                    <p class="text-xs font-black text-slate-400 uppercase tracking-widest">Ditemukan <span class="text-emerald-600" x-text="searchResults.length"></span> Data IKM Cocok:</p>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <template x-for="ikm in searchResults" :key="ikm.id">
                            <div @click="selectIkm(ikm)" 
                                :class="selectedIkm && selectedIkm.id === ikm.id ? 'border-emerald-500 bg-emerald-50/30 ring-2 ring-emerald-500/20' : 'border-slate-200 bg-white hover:border-emerald-300'"
                                class="p-6 rounded-3xl border transition cursor-pointer shadow-sm hover:shadow-md space-y-3">
                                
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h4 class="font-black text-slate-800 text-base" x-text="ikm.nama_usaha"></h4>
                                        <p class="text-xs font-medium text-slate-500"><i class="bi bi-person text-emerald-600"></i> Pemilik: <span class="font-bold text-slate-700" x-text="ikm.pemilik"></span></p>
                                    </div>
                                </div>

                                <div class="text-xs text-slate-600 space-y-1 font-mono">
                                    <div class="flex justify-between">
                                        <span class="text-slate-400">NIB:</span>
                                        <span class="font-bold text-slate-700" x-text="ikm.nib"></span>
                                    </div>
                                    <div class="flex justify-between">
                                        <span class="text-slate-400">Kategori:</span>
                                        <span class="font-bold text-slate-700" x-text="ikm.kategori"></span>
                                    </div>
                                </div>

                                <div class="pt-2 border-t border-slate-100 flex justify-between items-center text-xs">
                                    <span class="text-[11px] font-bold text-slate-400" x-text="'📍 Kel. ' + ikm.kelurahan + ', Kec. ' + ikm.kecamatan"></span>
                                    <span class="font-extrabold text-emerald-600 flex items-center gap-1">Rincian Legalitas <i class="bi bi-arrow-right"></i></span>
                                </div>
                            </div>
                        </template>
                    </div>
                </div>

                {{-- Not Found Notice --}}
                <div x-show="!isSearching && searchQuery.length > 2 && searchResults.length === 0" class="py-8 text-center bg-rose-50/50 border border-rose-200 rounded-3xl p-6 space-y-3">
                    <div class="text-rose-500 text-3xl"><i class="bi bi-exclamation-triangle"></i></div>
                    <h4 class="text-sm font-black text-rose-800 uppercase">Data Usaha Tidak Ditemukan</h4>
                    <p class="text-xs text-rose-600 max-w-md mx-auto">Nomor NIB atau NIK yang Anda masukkan tidak tercatat dalam Peta Sebaran IKM Juara.</p>
                    <div class="pt-2">
                        <a href="{{ route('dashboard.ikm.juara') }}" class="inline-flex items-center gap-2 bg-emerald-600 text-white px-5 py-2.5 rounded-xl font-bold text-xs shadow-md hover:bg-emerald-700 transition">
                            <i class="bi bi-plus-circle"></i> Daftarkan Usahamu Baru Di Sini
                        </a>
                    </div>
                </div>
            </div>

            {{-- DETAILED BREAKDOWN CARD (If an IKM is selected) --}}
            <template x-if="selectedIkm">
                <div class="bg-white rounded-[40px] p-8 lg:p-10 border-2 border-emerald-500/20 shadow-xl space-y-8">
                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 pb-6 border-b border-slate-100">
                        <div>
                            <div class="inline-flex items-center gap-2 bg-emerald-100 text-emerald-800 px-3.5 py-1.5 rounded-full text-xs font-black uppercase mb-2">
                                <i class="bi bi-info-circle-fill text-emerald-600"></i> Informasi Status Legalitas Usaha Anda
                            </div>
                            <h2 class="text-2xl font-black text-slate-800 uppercase tracking-tight" x-text="selectedIkm.nama_usaha"></h2>
                            <p class="text-xs text-slate-500 font-medium mt-1">Pemilik: <b class="text-slate-700" x-text="selectedIkm.pemilik"></b> • Produk: <b class="text-slate-700" x-text="selectedIkm.produk"></b> • Alamat: <b class="text-slate-700" x-text="selectedIkm.alamat_jalan + ' Kel. ' + selectedIkm.kelurahan"></b></p>
                        </div>
                    </div>

                    {{-- GRID 3 LEGALITAS UTAMA (NIB, SERTIFIKAT HALAL, HKI MEREK) --}}
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        
                        {{-- 1. NIB OSS --}}
                        <div class="p-6 rounded-3xl border space-y-3" :class="selectedIkm.legalitas.nib.is_valid ? 'border-emerald-200 bg-emerald-50/20' : 'border-slate-200 bg-slate-50/50'">
                            <div class="flex justify-between items-center">
                                <span class="text-xs font-black text-slate-700 uppercase flex items-center gap-1.5">
                                    <i class="bi bi-file-earmark-text text-base text-emerald-600"></i> NIB OSS RBA
                                </span>
                                <span class="px-2.5 py-0.5 rounded-full text-[9px] font-black uppercase" :class="selectedIkm.legalitas.nib.is_valid ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-600'" x-text="selectedIkm.legalitas.nib.status"></span>
                            </div>
                            <div>
                                <span class="text-[10px] text-slate-400 font-bold block uppercase">Nomor NIB:</span>
                                <span class="text-sm font-mono font-bold text-slate-800" x-text="selectedIkm.legalitas.nib.value"></span>
                            </div>
                            <div x-show="selectedIkm.legalitas.nib.link_gdrive" class="pt-2 border-t border-slate-100">
                                <a :href="selectedIkm.legalitas.nib.link_gdrive" target="_blank" class="inline-flex items-center gap-1.5 text-xs font-bold text-emerald-600 hover:text-emerald-700 bg-emerald-50 px-3 py-1.5 rounded-xl border border-emerald-200 transition">
                                    <i class="bi bi-google-drive text-amber-500"></i> Lihat Berkas NIB (Google Drive)
                                </a>
                            </div>
                            <p x-show="!selectedIkm.legalitas.nib.link_gdrive" class="text-[11px] text-slate-500 font-medium">Identitas legalitas usaha resmi dari Pemerintah yang telah terdaftar.</p>
                        </div>

                        {{-- 2. SERTIFIKAT HALAL --}}
                        <div class="p-6 rounded-3xl border space-y-3" :class="selectedIkm.legalitas.halal.is_valid ? 'border-emerald-200 bg-emerald-50/20' : 'border-amber-200 bg-amber-50/20'">
                            <div class="flex justify-between items-center">
                                <span class="text-xs font-black text-slate-700 uppercase flex items-center gap-1.5">
                                    <i class="bi bi-patch-check text-base text-amber-500"></i> Sertifikat Halal
                                </span>
                                <span class="px-2.5 py-0.5 rounded-full text-[9px] font-black uppercase" :class="selectedIkm.legalitas.halal.is_valid ? 'bg-emerald-100 text-emerald-700' : 'bg-amber-100 text-amber-700'" x-text="selectedIkm.legalitas.halal.status"></span>
                            </div>
                            <div>
                                <span class="text-[10px] text-slate-400 font-bold block uppercase">Nomor Sertifikat Halal:</span>
                                <span class="text-sm font-mono font-bold text-slate-800" x-text="selectedIkm.legalitas.halal.value"></span>
                            </div>
                            <div x-show="selectedIkm.legalitas.halal.link_gdrive" class="pt-2 border-t border-slate-100">
                                <a :href="selectedIkm.legalitas.halal.link_gdrive" target="_blank" class="inline-flex items-center gap-1.5 text-xs font-bold text-emerald-600 hover:text-emerald-700 bg-emerald-50 px-3 py-1.5 rounded-xl border border-emerald-200 transition">
                                    <i class="bi bi-google-drive text-amber-500"></i> Lihat Berkas Sertifikat Halal
                                </a>
                            </div>
                            <p x-show="!selectedIkm.legalitas.halal.link_gdrive" class="text-[11px] text-slate-500 font-medium">Disnaker KUKM Kota Madiun menyediakan fasilitasi pendampingan Sertifikat Halal Gratis.</p>
                        </div>

                        {{-- 3. HKI MEREK --}}
                        <div class="p-6 rounded-3xl border space-y-3" :class="selectedIkm.legalitas.hki.is_valid ? 'border-emerald-200 bg-emerald-50/20' : 'border-purple-200 bg-purple-50/20'">
                            <div class="flex justify-between items-center">
                                <span class="text-xs font-black text-slate-700 uppercase flex items-center gap-1.5">
                                    <i class="bi bi-award text-base text-purple-600"></i> HKI Merek
                                </span>
                                <span class="px-2.5 py-0.5 rounded-full text-[9px] font-black uppercase" :class="selectedIkm.legalitas.hki.is_valid ? 'bg-emerald-100 text-emerald-700' : 'bg-purple-100 text-purple-700'" x-text="selectedIkm.legalitas.hki.status"></span>
                            </div>
                            <div class="space-y-2 text-xs">
                                <div>
                                    <span class="text-[10px] text-slate-400 font-bold block uppercase">Nama Merek Terdaftar:</span>
                                    <span class="text-sm font-bold text-slate-800" x-text="selectedIkm.legalitas.hki.nama_merek"></span>
                                </div>
                                <div>
                                    <span class="text-[10px] text-slate-400 font-bold block uppercase">Nomor Pendaftaran HKI:</span>
                                    <span class="font-mono font-bold text-slate-800" x-text="selectedIkm.legalitas.hki.value"></span>
                                </div>
                                <div x-show="selectedIkm.legalitas.hki.tgl_berakhir">
                                    <span class="text-[10px] text-slate-400 font-bold block uppercase">Tanggal Berakhir Sertifikat:</span>
                                    <span class="font-mono font-bold text-slate-700" x-text="selectedIkm.legalitas.hki.tgl_berakhir"></span>
                                </div>
                            </div>
                            <div x-show="selectedIkm.legalitas.hki.link_gdrive" class="pt-2 border-t border-slate-100">
                                <a :href="selectedIkm.legalitas.hki.link_gdrive" target="_blank" class="inline-flex items-center gap-1.5 text-xs font-bold text-purple-600 hover:text-purple-700 bg-purple-50 px-3 py-1.5 rounded-xl border border-purple-200 transition">
                                    <i class="bi bi-google-drive text-amber-500"></i> Lihat Berkas Sertifikat HKI / Bukti Daftar
                                </a>
                            </div>
                        </div>

                    </div>

                    {{-- REKOMENDASI TINDAK LANJUT --}}
                    <div class="bg-gradient-to-r from-emerald-50 to-teal-50 border border-emerald-200 p-6 rounded-3xl flex flex-col md:flex-row justify-between items-center gap-4">
                        <div class="space-y-1 text-center md:text-left">
                            <h4 class="font-black text-slate-800 text-sm uppercase">Butuh Bantuan Pengurusan Legalitas Usaha?</h4>
                            <p class="text-xs text-slate-600 font-medium">Tim fasilitasi pendampingan Disnaker KUKM Kota Madiun siap membantumu secara gratis!</p>
                        </div>

                        <a :href="'https://wa.me/{{ $adminWaFormatted }}?text=Halo%20Admin%20Dukungan%20Disnaker%20Madiun,%20saya%20pemilik%20IKM%20' + encodeURIComponent(selectedIkm.nama_usaha) + '%20(NIB:%20' + encodeURIComponent(selectedIkm.nib) + ')%20ingin%20berkonsultasi%20mengenai%20pengurusan%20legalitas.'"
                            target="_blank"
                            class="bg-emerald-600 hover:bg-emerald-700 text-white px-6 py-3.5 rounded-2xl font-extrabold text-xs shadow-lg shadow-emerald-600/20 transition duration-300 flex items-center gap-2 whitespace-nowrap">
                            <i class="bi bi-whatsapp text-base"></i> Konsultasi Gratis via WhatsApp
                        </a>
                    </div>
                </div>
            </template>
        </div>

        {{-- TAB 2: WIZARD DIAGNOSA MANDIRI INTERAKTIF --}}
        <div x-show="activeTab === 'wizard'" x-transition class="space-y-8">
            <div class="bg-white rounded-[40px] p-8 lg:p-12 border border-slate-200 shadow-sm space-y-8">
                
                {{-- Wizard Header --}}
                <div class="text-center max-w-2xl mx-auto space-y-2">
                    <span class="bg-emerald-100 text-emerald-700 px-3 py-1 rounded-full text-[10px] font-black uppercase tracking-wider">Kuesioner Diagnosa Legalitas (3 Menit)</span>
                    <h3 class="text-2xl font-black text-slate-800 uppercase tracking-tight">Ketahui Legalitas Apa Saja Yang Wajib Kamu Miliki!</h3>
                    <p class="text-xs text-slate-500 font-medium">Jawab 4 pertanyaan sederhana berikut untuk mendapatkan peta rekomendasi pengurusan izin & legalitas usaha Anda.</p>
                </div>

                {{-- Wizard Stepper Bar --}}
                <div class="flex justify-center items-center gap-3 max-w-md mx-auto">
                    <template x-for="s in [1, 2, 3, 4]" :key="s">
                        <div class="flex items-center gap-2">
                            <div class="w-8 h-8 rounded-full font-black text-xs flex items-center justify-center transition-all duration-300"
                                :class="wizardStep === s ? 'bg-emerald-600 text-white ring-4 ring-emerald-100' : (wizardStep > s ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-400')"
                                x-text="s">
                            </div>
                            <div x-show="s < 4" class="w-8 sm:w-12 h-1 rounded-full" :class="wizardStep > s ? 'bg-emerald-500' : 'bg-slate-100'"></div>
                        </div>
                    </template>
                </div>

                {{-- STEP 1: Kategori Produk --}}
                <div x-show="wizardStep === 1" class="space-y-6 max-w-2xl mx-auto">
                    <h4 class="font-black text-slate-800 text-sm uppercase text-center">1. Apa Kategori Utama Produk Usahamu?</h4>
                    
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <template x-for="kat in ['Pangan (Makanan / Minuman)', 'Sandang (Fashion / Pakaian)', 'Kerajinan (Kriya / Handcraft)', 'Kimia & Furnitur (Kosmetik / Sabun / Mebel)', 'Logam & Mesin (Otomotif / Bengkel)']" :key="kat">
                            <button @click="wizardData.kategori = kat; wizardStep = 2"
                                :class="wizardData.kategori === kat ? 'border-emerald-500 bg-emerald-50/50 text-emerald-800 font-black' : 'border-slate-200 bg-slate-50/50 text-slate-700 font-bold hover:bg-slate-100'"
                                class="p-5 rounded-2xl border text-left text-xs transition duration-200 flex items-center justify-between gap-3 shadow-sm">
                                <span x-text="kat"></span>
                                <i class="bi bi-chevron-right text-slate-400"></i>
                            </button>
                        </template>
                    </div>
                </div>

                {{-- STEP 2: Kemasan & Daya Tahan --}}
                <div x-show="wizardStep === 2" class="space-y-6 max-w-2xl mx-auto">
                    <h4 class="font-black text-slate-800 text-sm uppercase text-center">2. Bagaimana Karakteristik Daya Tahan Produk / Pelayananmu?</h4>
                    
                    <div class="grid grid-cols-1 gap-4">
                        <button @click="wizardData.kemasan = 'Kemasan Tahan > 7 Hari'; wizardStep = 3" class="p-5 rounded-2xl border border-slate-200 bg-slate-50/50 text-left hover:bg-slate-100 transition space-y-1">
                            <span class="font-black text-xs text-slate-800 block">📦 Produk Dikemas Dalam Wadah Rapat & Tahan > 7 Hari</span>
                            <span class="text-[11px] text-slate-500 block">Contoh: Keripik, Sambel Kemasan Botol, Kopi Bubuk, Minuman Botol Hermetis.</span>
                        </button>
                        <button @click="wizardData.kemasan = 'Siap Saji / Langsung Konsumsi'; wizardStep = 3" class="p-5 rounded-2xl border border-slate-200 bg-slate-50/50 text-left hover:bg-slate-100 transition space-y-1">
                            <span class="font-black text-xs text-slate-800 block">🍲 Makanan Siap Saji / Dijual & Dikonsumsi Langsung (< 7 Hari)</span>
                            <span class="text-[11px] text-slate-500 block">Contoh: Warung Makan, Catering Harian, Kue Basah Roti Segar.</span>
                        </button>
                        <button @click="wizardData.kemasan = 'Bukan Makanan (Non-Pangan)'; wizardStep = 3" class="p-5 rounded-2xl border border-slate-200 bg-slate-50/50 text-left hover:bg-slate-100 transition space-y-1">
                            <span class="font-black text-xs text-slate-800 block">👕 Produk Non-Pangan / Jasa & Manufaktur</span>
                            <span class="text-[11px] text-slate-500 block">Contoh: Pakaian, Kerajinan Kayu, Furnitur, Bengkel, Konveksi.</span>
                        </button>
                    </div>
                </div>

                {{-- STEP 3: Merek --}}
                <div x-show="wizardStep === 3" class="space-y-6 max-w-2xl mx-auto">
                    <h4 class="font-black text-slate-800 text-sm uppercase text-center">3. Apakah Usahamu Menggunakan Nama Merek / Logo Sendiri?</h4>
                    
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <button @click="wizardData.merek = 'Punya Merek Sendiri'; wizardStep = 4" class="p-6 rounded-2xl border border-slate-200 bg-slate-50/50 text-left hover:bg-slate-100 transition space-y-1">
                            <span class="font-black text-xs text-slate-800 block">🏷️ Ya, Memiliki Nama Merek & Logo Unik</span>
                            <span class="text-[11px] text-slate-500 block">Ingin mendaftarkan hak cipta merek ke Kemenkumham agar tidak ditiru orang lain.</span>
                        </button>
                        <button @click="wizardData.merek = 'Belum Punya Merek'; wizardStep = 4" class="p-6 rounded-2xl border border-slate-200 bg-slate-50/50 text-left hover:bg-slate-100 transition space-y-1">
                            <span class="font-black text-xs text-slate-800 block">⚪ Belum Memiliki Merek Khusus</span>
                            <span class="text-[11px] text-slate-500 block">Masih menggunakan nama umum / belum fokus pada branding merek.</span>
                        </button>
                    </div>
                </div>

                {{-- STEP 4: Target Pasar --}}
                <div x-show="wizardStep === 4" class="space-y-6 max-w-2xl mx-auto">
                    <h4 class="font-black text-slate-800 text-sm uppercase text-center">4. Di Mana Target Pasar Utama Produk/Jasamu?</h4>
                    
                    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        <button @click="wizardData.pasar = 'Lokal / Warung'; finishWizard()" class="p-5 rounded-2xl border border-slate-200 bg-slate-50/50 text-left hover:bg-slate-100 transition space-y-1">
                            <span class="font-black text-xs text-slate-800 block">🏡 Pasar Lokal Madiun</span>
                            <span class="text-[10px] text-slate-500 block">Penjualan sekitar lingkungan rumah / kota.</span>
                        </button>
                        <button @click="wizardData.pasar = 'Supermarket / Toko Modern'; finishWizard()" class="p-5 rounded-2xl border border-slate-200 bg-slate-50/50 text-left hover:bg-slate-100 transition space-y-1">
                            <span class="font-black text-xs text-slate-800 block">🛒 Supermarket / Pusat Oleh-oleh</span>
                            <span class="text-[10px] text-slate-500 block">Masuk ke toko ritel modern & resto.</span>
                        </button>
                        <button @click="wizardData.pasar = 'Nasional & Ekspor'; finishWizard()" class="p-5 rounded-2xl border border-slate-200 bg-slate-50/50 text-left hover:bg-slate-100 transition space-y-1">
                            <span class="font-black text-xs text-slate-800 block">🚀 E-Commerce & Ekspor</span>
                            <span class="text-[10px] text-slate-400 block">Pengadaan barang & pasar luar kota.</span>
                        </button>
                    </div>
                </div>

                {{-- WIZARD RESULT CARD --}}
                <div x-show="wizardResult" class="bg-gradient-to-br from-slate-900 to-emerald-950 text-white rounded-[36px] p-8 lg:p-10 space-y-6 shadow-2xl border border-emerald-500/30">
                    <div class="flex items-center gap-3">
                        <div class="w-12 h-12 rounded-2xl bg-emerald-500/20 text-emerald-400 flex items-center justify-center text-2xl border border-emerald-500/30">
                            <i class="bi bi-magic"></i>
                        </div>
                        <div>
                            <span class="text-[10px] text-emerald-400 font-black uppercase tracking-wider">Hasil Rekomendasi Diagnosa Mandiri</span>
                            <h4 class="text-xl font-black uppercase tracking-tight">Peta Kebutuhan Legalitas Usahamu</h4>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="bg-white/5 border border-white/10 p-5 rounded-2xl space-y-2">
                            <span class="text-xs font-black text-emerald-400 uppercase tracking-wider block">1. NIB OSS RBA (Wajib Utama)</span>
                            <p class="text-xs text-slate-300">Merupakan legalitas standar wajib usaha di Indonesia. Pengurusan gratis 100% secara online melalui OSS.</p>
                        </div>

                        <div class="bg-white/5 border border-white/10 p-5 rounded-2xl space-y-2" x-show="wizardData.kategori && wizardData.kategori.includes('Pangan')">
                            <span class="text-xs font-black text-amber-400 uppercase tracking-wider block">2. Sertifikasi Halal (Wajib Pangan)</span>
                            <p class="text-xs text-slate-300">Wajib untuk seluruh produk makanan/minuman. Disnaker Kota Madiun memberikan pendampingan Sertifikasi Halal Self-Declare gratis!</p>
                        </div>

                        <div class="bg-white/5 border border-white/10 p-5 rounded-2xl space-y-2" x-show="wizardData.kemasan && wizardData.kemasan.includes('Tahan > 7 Hari')">
                            <span class="text-xs font-black text-indigo-400 uppercase tracking-wider block">3. Izin P-IRT / BPOM CPPOB</span>
                            <p class="text-xs text-slate-300">Diperlukan agar makanan dalam kemasan rapat tahan lama aman dijual di toko modern & supermarket.</p>
                        </div>

                        <div class="bg-white/5 border border-white/10 p-5 rounded-2xl space-y-2" x-show="wizardData.merek && wizardData.merek.includes('Punya Merek')">
                            <span class="text-xs font-black text-purple-400 uppercase tracking-wider block">4. HKI Merek Kemenkumham</span>
                            <p class="text-xs text-slate-300">Melindungi nama & logo usahamu dari pemalsuan. Dapatkan fasilitas kuota fasilitasi pendaftaran merek gratis dari Disnaker Kota Madiun!</p>
                        </div>
                    </div>

                    <div class="pt-4 border-t border-white/10 flex flex-col sm:flex-row justify-between items-center gap-4">
                        <button @click="resetWizard()" class="text-xs text-slate-400 font-bold hover:text-white transition">
                            🔄 Ulangi Diagnosa
                        </button>
                        <a href="https://wa.me/6285655480223?text=Halo%20Admin%20Disnaker%20Madiun,%20saya%20telah%20mengikuti%20Diagnosa%20Legalitas%20Mandiri%20untuk%20sektor%20" target="_blank"
                            class="bg-emerald-500 hover:bg-emerald-600 text-slate-950 font-black px-6 py-3.5 rounded-2xl text-xs shadow-lg transition flex items-center gap-2">
                            <i class="bi bi-whatsapp text-base"></i> Ajukan Pendampingan Gratis Ke Disnaker
                        </a>
                    </div>
                </div>

            </div>
        </div>

        {{-- TAB 3: PANDUAN & SYARAT LEGALITAS --}}
        <div x-show="activeTab === 'panduan'" x-transition class="space-y-8">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                
                {{-- NIB --}}
                <div class="bg-white rounded-[32px] p-8 border border-slate-200 shadow-sm space-y-4">
                    <div class="w-12 h-12 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center text-2xl font-black">
                        <i class="bi bi-file-earmark-text"></i>
                    </div>
                    <h4 class="font-black text-slate-800 text-base uppercase">NIB (Nomor Induk Berusaha)</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">Identitas resmi pelaku usaha yang diterbitkan oleh Lembaga OSS RBA. Berlaku sebagai TDP, NPIK, dan Hak Akses Kepabeanan.</p>
                    <ul class="text-xs text-slate-600 font-semibold space-y-2 border-t border-slate-100 pt-3">
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-emerald-500"></i> Syarat: KTP, Email & No HP Aktif</li>
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-emerald-500"></i> Biaya: Gratis 100%</li>
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-emerald-500"></i> Proses: Instan (Langsung Terbit)</li>
                    </ul>
                </div>

                {{-- HALAL --}}
                <div class="bg-white rounded-[32px] p-8 border border-slate-200 shadow-sm space-y-4">
                    <div class="w-12 h-12 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center text-2xl font-black">
                        <i class="bi bi-patch-check"></i>
                    </div>
                    <h4 class="font-black text-slate-800 text-base uppercase">Sertifikat Halal (BPJPH)</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">Penjaminan kehalalan produk makanan, minuman, kosmetik, dan bahan konsumsi lainnya sesuai undang-undang.</p>
                    <ul class="text-xs text-slate-600 font-semibold space-y-2 border-t border-slate-100 pt-3">
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-amber-500"></i> Syarat: NIB, Foto Produk, Komposisi</li>
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-amber-500"></i> Pendampingan: Gratis via Disnaker</li>
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-amber-500"></i> Proses: 1-3 Minggu</li>
                    </ul>
                </div>

                {{-- HKI MEREK --}}
                <div class="bg-white rounded-[32px] p-8 border border-slate-200 shadow-sm space-y-4">
                    <div class="w-12 h-12 rounded-2xl bg-purple-50 text-purple-600 flex items-center justify-center text-2xl font-black">
                        <i class="bi bi-award"></i>
                    </div>
                    <h4 class="font-black text-slate-800 text-base uppercase">HKI Merek (Kemenkumham)</h4>
                    <p class="text-xs text-slate-500 font-medium leading-relaxed">Perlindungan hukum atas nama & logo usahamu agar memiliki hak eksklusif dan tidak disalahgunakan orang lain.</p>
                    <ul class="text-xs text-slate-600 font-semibold space-y-2 border-t border-slate-100 pt-3">
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-purple-500"></i> Syarat: E-KTP, Logo Merek, Surat IKM</li>
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-purple-500"></i> Fasilitasi: Gratis (Disnaker Kota Madiun)</li>
                        <li class="flex items-center gap-2"><i class="bi bi-check-circle-fill text-purple-500"></i> Perlindungan: 10 Tahun</li>
                    </ul>
                </div>

            </div>
        </div>

    </main>

    {{-- FOOTER --}}
    <footer class="bg-slate-900 text-slate-400 py-10 px-6 lg:px-8 border-t border-slate-800 relative z-10 text-xs">
        <div class="max-w-7xl mx-auto flex flex-col sm:flex-row justify-between items-center gap-4">
            <div>
                <span class="text-white font-black text-sm uppercase">IKM JUARA • KOTA MADIUN</span>
                <p class="mt-1 font-medium text-slate-500">Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun.</p>
            </div>
            <div class="text-center sm:text-right font-medium">
                <p>&copy; 2026 Pemerintah Kota Madiun. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    {{-- ALPINE JS APP CODE --}}
    <script>
        function cekMandiriApp() {
            return {
                activeTab: 'cari',
                searchQuery: '',
                isSearching: false,
                searchResults: [],
                selectedIkm: null,

                // Wizard State
                wizardStep: 1,
                wizardResult: false,
                wizardData: {
                    kategori: '',
                    kemasan: '',
                    merek: '',
                    pasar: ''
                },

                init() {
                    const params = new URLSearchParams(window.location.search);
                    if (params.has('q')) {
                        this.searchQuery = params.get('q');
                        this.doSearch();
                    }
                },

                doSearch() {
                    let cleaned = this.searchQuery.replace(/[^0-9]/g, '');
                    if (cleaned.length !== 13 && cleaned.length !== 16) {
                        this.searchResults = [];
                        this.selectedIkm = null;
                        return;
                    }

                    this.isSearching = true;
                    fetch(`/api/cek-legalitas-mandiri?q=${encodeURIComponent(cleaned)}`)
                        .then(res => res.json())
                        .then(res => {
                            this.isSearching = false;
                            if (res.success && res.data && res.data.length > 0) {
                                this.searchResults = res.data;
                                this.selectedIkm = res.data[0];
                            } else {
                                this.searchResults = [];
                                this.selectedIkm = null;
                            }
                        })
                        .catch(err => {
                            this.isSearching = false;
                            console.error(err);
                        });
                },

                selectIkm(ikm) {
                    this.selectedIkm = ikm;
                },

                finishWizard() {
                    this.wizardResult = true;
                },

                resetWizard() {
                    this.wizardStep = 1;
                    this.wizardResult = false;
                    this.wizardData = { kategori: '', kemasan: '', merek: '', pasar: '' };
                }
            }
        }
    </script>
</body>

</html>
