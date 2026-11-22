<!DOCTYPE html>
<html lang="id" class="scroll-smooth">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
        content="Dashboard IKM JUARA - Pusat Kendali Pembinaan IKM Kota Madiun Berbasis Data. Satu Data, Satu Kendali, IKM Kota Madiun Naik Kelas!">
    <title>Registrasi & Pemutakhiran Profil — IKM JUARA</title>

    <link rel="icon" type="image/png" href="{{ asset('favicon.png') }}?v=1">
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('favicon.ico') }}?v=1">
    <link rel="apple-touch-icon" href="{{ asset('logo-ikm.png') }}?v=1">

    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">

    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        [x-cloak] {
            display: none !important;
        }

        /* Floating background animations */
        @keyframes float-slow {

            0%,
            100% {
                transform: translateY(0px) scale(1);
            }

            50% {
                transform: translateY(-20px) scale(1.05);
            }
        }

        @keyframes float-delayed {

            0%,
            100% {
                transform: translateY(0px) scale(1);
            }

            50% {
                transform: translateY(20px) scale(0.95);
            }
        }

        .anim-float-1 {
            animation: float-slow 8s ease-in-out infinite;
        }

        .anim-float-2 {
            animation: float-delayed 10s ease-in-out infinite;
        }

        /* Tech grid background overlay */
        .grid-pattern {
            background-size: 40px 40px;
            background-image:
                linear-gradient(to right, rgba(99, 102, 241, 0.03) 1px, transparent 1px),
                linear-gradient(to bottom, rgba(99, 102, 241, 0.03) 1px, transparent 1px);
        }

        /* Custom pulse ring */
        .pulse-ring-indigo {
            animation: pulseRingIndigo 2s ease-out infinite;
        }

        @keyframes pulseRingIndigo {
            0% {
                box-shadow: 0 0 0 0 rgba(79, 70, 229, 0.4);
            }

            70% {
                box-shadow: 0 0 0 12px rgba(79, 70, 229, 0);
            }

            100% {
                box-shadow: 0 0 0 0 rgba(79, 70, 229, 0);
            }
        }
    </style>
</head>

<body class="bg-slate-50 overflow-x-hidden min-h-screen flex flex-col relative" x-data="dashboardApp()" x-init="init()">

    {{-- Ambient light glow elements --}}
    <div class="absolute inset-0 overflow-hidden pointer-events-none z-0">
        <div class="absolute -top-40 -left-40 w-96 h-96 bg-indigo-500/10 rounded-full blur-[120px] anim-float-1"></div>
        <div
            class="absolute top-1/3 -right-20 w-[450px] h-[450px] bg-purple-500/10 rounded-full blur-[140px] anim-float-2">
        </div>
        <div class="absolute -bottom-20 left-10 w-80 h-80 bg-blue-500/10 rounded-full blur-[100px] anim-float-1"></div>
        <div class="absolute inset-0 grid-pattern opacity-80"></div>
    </div>

    {{-- NAVBAR --}}
    <nav class="bg-white/80 backdrop-blur-xl sticky top-0 z-50 border-b border-slate-100 shadow-sm shadow-slate-100/50">
        <div class="max-w-7xl mx-auto flex justify-between items-center px-6 lg:px-8 py-4">
            <a href="{{ route('home') }}" class="flex items-center gap-3 group relative z-10">
                <div
                    class="w-10 h-10 rounded-xl overflow-hidden flex items-center justify-center bg-white shadow-sm border border-slate-100">
                    <img src="{{ asset('logo-ikm.png') }}" alt="Logo IKM"
                        class="w-full object-contain group-hover:scale-110 transition-transform duration-300">
                </div>
                <div>
                    <span class="text-xl font-black tracking-tight text-slate-800 uppercase">IKM<span
                            class="text-amber-500">JUARA</span></span>
                    <p class="text-[9px] font-bold text-slate-400 tracking-[0.15em] uppercase -mt-1">Dashboard Pembinaan
                    </p>
                </div>
            </a>

            <div class="hidden md:flex items-center gap-3 text-[13px] font-bold text-slate-500">
                <a href="{{ route('dashboard.ikm.juara.cekmandiri') }}"
                    class="bg-gradient-to-r from-emerald-600 via-teal-600 to-emerald-700 hover:from-emerald-500 hover:to-teal-500 text-white px-5 py-2.5 rounded-xl transition-all duration-300 shadow-md shadow-emerald-600/20 hover:scale-105 active:scale-95 flex items-center gap-2 font-bold">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-emerald-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                    </svg>
                    <span>Cek Legalitas Mandiri</span>
                </a>
                <a href="{{ url('/') }}"
                    class="bg-[#0B1229] hover:bg-indigo-600 text-white px-5 py-2.5 rounded-xl transition-all duration-300 shadow-md hover:shadow-indigo-200 hover:scale-105 active:scale-95 flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24"
                        stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"
                            d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    <span>Kembali ke Dashboard Utama</span>
                </a>
            </div>

            <button id="mobile-nav-btn" class="md:hidden p-2 text-slate-700 relative z-10">
                <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
            </button>
        </div>
        <div id="mobile-nav-menu"
            class="hidden md:hidden bg-white border-t border-slate-100 px-6 py-4 space-y-3 relative z-50">
            <a href="{{ route('dashboard.ikm.juara.cekmandiri') }}" class="block w-full bg-gradient-to-r from-emerald-600 to-teal-600 text-white px-5 py-3 rounded-xl font-bold text-center flex items-center justify-center gap-2">
                🛡️ Cek Legalitas Mandiri
            </a>
            <a href="{{ url('/') }}"
                class="block w-full bg-[#0B1229] text-white px-5 py-3 rounded-xl font-bold text-center">← Kembali ke
                Dashboard Utama</a>
        </div>
    </nav>

    {{-- MAIN CONTENT --}}
    <main class="flex-grow flex items-center justify-center py-16 px-6 lg:px-8 relative z-10"
        x-data="pemutakhiranHandler()">

        <!-- Modern Fullcolor Centered Modal Alert -->
        <div x-show="toast.show" x-transition:enter="transition ease-out duration-300"
            x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
            x-transition:leave="transition ease-in duration-200" x-transition:leave-start="opacity-100"
            x-transition:leave-end="opacity-0" class="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[9998]"
            style="display: none;" @click="closeToast()">
        </div>

        <!-- Pop-up Card -->
        <div x-show="toast.show" x-transition:enter="transition ease-out duration-300 transform"
            x-transition:enter-start="opacity-0 -translate-x-1/2 -translate-y-1/2 scale-90"
            x-transition:enter-end="opacity-100 -translate-x-1/2 -translate-y-1/2 scale-100"
            x-transition:leave="transition ease-in duration-200 transform"
            x-transition:leave-start="opacity-100 -translate-x-1/2 -translate-y-1/2 scale-100"
            x-transition:leave-end="opacity-0 -translate-x-1/2 -translate-y-1/2 scale-90"
            class="fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 z-[9999] max-w-sm w-[90%] sm:w-full rounded-3xl p-6 shadow-2xl text-white overflow-hidden flex flex-col items-center text-center border border-white/10"
            :class="{
                 'bg-gradient-to-br from-emerald-500 via-emerald-600 to-teal-600': toast.type === 'success',
                 'bg-gradient-to-br from-rose-500 via-rose-600 to-pink-600': toast.type === 'danger',
                 'bg-gradient-to-br from-amber-500 via-amber-600 to-orange-500': toast.type === 'warning'
             }" style="display: none;">

            <div class="absolute -right-10 -top-10 w-24 h-24 bg-white/10 rounded-full blur-2xl pointer-events-none">
            </div>
            <div class="absolute -left-10 -bottom-10 w-24 h-24 bg-white/10 rounded-full blur-2xl pointer-events-none">
            </div>

            <div
                class="w-16 h-16 rounded-full bg-white/20 backdrop-blur-md flex items-center justify-center mb-4 shadow-inner">
                <template x-if="toast.type === 'success'">
                    <svg class="w-8 h-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        stroke-width="3">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                    </svg>
                </template>
                <template x-if="toast.type === 'danger'">
                    <svg class="w-8 h-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        stroke-width="3">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </template>
                <template x-if="toast.type === 'warning'">
                    <svg class="w-8 h-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        stroke-width="3">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                    </svg>
                </template>
            </div>

            <h3 class="text-xl font-bold tracking-tight mb-2"
                x-text="toast.type === 'success' ? 'Berhasil' : (toast.type === 'danger' ? 'Gagal' : 'Peringatan')">
            </h3>
            <p class="text-sm text-white/90 font-medium leading-relaxed mb-6" x-text="toast.message"></p>

            <div class="w-full flex flex-col items-center gap-3">
                <button @click="closeToast()"
                    class="w-full py-3 bg-white text-slate-800 hover:bg-white/90 active:scale-98 font-bold rounded-2xl shadow-lg transition duration-200 text-sm tracking-wide">
                    Tutup
                </button>
                <span class="text-[10px] text-white/60 font-bold uppercase tracking-widest flex items-center gap-1.5">
                    <span class="w-1.5 h-1.5 bg-white/80 rounded-full animate-ping"></span>
                    Menutup otomatis dalam 3 detik
                </span>
            </div>

            <div class="absolute bottom-0 left-0 h-1 bg-white/40 transition-all duration-[10ms] ease-linear"
                :style="'width: ' + toast.progressWidth + '%'"></div>
        </div>

        <!-- MODAL REGISTRASI PELAKU USAHA BARU -->
        <div x-show="showRegisterModal" x-transition
            class="fixed inset-0 bg-slate-950/70 backdrop-blur-md z-[9999] flex items-center justify-center p-4 overflow-y-auto"
            style="display: none;">
            <div class="bg-white rounded-[35px] max-w-3xl w-full p-8 shadow-2xl space-y-6 relative overflow-hidden border border-slate-200"
                @click.outside="showRegisterModal = false">

                <!-- HEADER MODAL BANNER -->
                <div
                    class="flex justify-between items-start bg-gradient-to-r from-indigo-900 via-indigo-950 to-slate-900 -m-8 p-8 mb-4 text-white">
                    <div>
                        <span
                            class="text-[10px] font-black text-amber-400 uppercase tracking-widest bg-amber-400/10 px-3 py-1 rounded-full border border-amber-400/20">Registrasi
                            IKM Terintegrasi</span>
                        <h3 class="text-2xl font-black mt-2">Formulir Pendaftaran Pelaku Usaha Baru</h3>
                        <p class="text-xs text-slate-300 font-medium mt-1">Daftarkan profil usaha Anda untuk masuk ke
                            Database IKM JUARA & Antrean Verifikasi Admin Dinas.</p>
                    </div>
                    <button type="button" @click="showRegisterModal = false"
                        class="w-10 h-10 rounded-2xl bg-white/10 hover:bg-white/20 text-white flex items-center justify-center font-bold text-xl transition">
                        ✕
                    </button>
                </div>

                <form @submit.prevent="submitRegistration()"
                    class="space-y-6 pt-4 max-h-[70vh] overflow-y-auto custom-scrollbar pr-2">

                    <!-- 1. LEGITIMASI & IDENTITAS PELAKU USAHA -->
                    <div class="space-y-4 bg-indigo-50/40 p-5 rounded-3xl border border-indigo-100">
                        <h4
                            class="text-xs font-black text-indigo-900 uppercase tracking-wider flex items-center gap-2 border-b border-indigo-100 pb-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-indigo-600"></span>
                            <span>1. Legitimasi & Identitas Pelaku Usaha</span>
                        </h4>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">NIB
                                    (Nomor Induk Berusaha) <span class="text-rose-500">*</span></label>
                                <input type="text" x-model="registerForm.nib" required maxlength="13"
                                    placeholder="Contoh: 1234567890123"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-mono font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">NIK
                                    Pemilik (16 Digit) <span class="text-rose-500">*</span></label>
                                <input type="text" x-model="registerForm.nik" required maxlength="16" minlength="16"
                                    placeholder="3577xxxxxxxxxxxx"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-mono font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Nama
                                    Perusahaan / Usaha <span class="text-rose-500">*</span></label>
                                <input type="text" x-model="registerForm.nama_usaha" required
                                    placeholder="Contoh: Bengkel Las Jaya"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Nama
                                    Pemilik <span class="text-rose-500">*</span></label>
                                <input type="text" x-model="registerForm.pemilik" required
                                    placeholder="Contoh: Hendra Gunawan"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">No.
                                    WhatsApp / HP <span class="text-rose-500">*</span></label>
                                <input type="text" x-model="registerForm.no_hp" required
                                    placeholder="Contoh: 081234567897"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Jenis
                                    Produk Utama / Komoditas <span class="text-rose-500">*</span></label>
                                <input type="text" x-model="registerForm.produk" required
                                    placeholder="Contoh: Pagar dan Teralis"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                        </div>
                    </div>

                    <!-- 2. KLASIFIKASI USAHA & KBLI 2025 -->
                    <div class="space-y-4 bg-purple-50/40 p-5 rounded-3xl border border-purple-100">
                        <h4
                            class="text-xs font-black text-purple-900 uppercase tracking-wider flex items-center gap-2 border-b border-purple-100 pb-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-purple-600"></span>
                            <span>2. Klasifikasi Usaha & KBLI 2025</span>
                        </h4>

                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Kategori
                                    Usaha <span class="text-rose-500">*</span></label>
                                <select x-model="registerForm.kategori" required
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                                    <option value="Pangan">Pangan</option>
                                    <option value="Sandang">Sandang</option>
                                    <option value="Kerajinan">Kerajinan</option>
                                    <option value="Logam dan Mesin">Logam dan Mesin</option>
                                    <option value="Metal dan Mesin">Metal dan Mesin</option>
                                    <option value="Kimia dan Bahan Bangunan">Kimia dan Bahan Bangunan</option>
                                    <option value="Jasa / Lainnya">Jasa / Lainnya</option>
                                </select>
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Skala
                                    Usaha</label>
                                <select x-model="registerForm.skala_usaha"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                                    <option value="Mikro">Mikro</option>
                                    <option value="Kecil">Kecil</option>
                                    <option value="Menengah">Menengah</option>
                                </select>
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Tingkat
                                    Risiko OSS</label>
                                <select x-model="registerForm.tingkat_risiko"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                                    <option value="Rendah">Rendah</option>
                                    <option value="Menengah Rendah">Menengah Rendah</option>
                                    <option value="Menengah Tinggi">Menengah Tinggi</option>
                                    <option value="Tinggi">Tinggi</option>
                                </select>
                            </div>

                            <div class="relative">
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">KBLI
                                    2025</label>
                                <input type="text" x-model="registerForm.kbli" @input="onRegisterKbliInput()"
                                    placeholder="Ketik kode KBLI (mis: 10795)..."
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-mono font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">

                                <div x-show="showRegisterKbliSuggestions"
                                    @click.outside="showRegisterKbliSuggestions = false"
                                    class="absolute left-0 right-0 top-full mt-1 bg-white border border-slate-200 rounded-2xl shadow-xl z-50 max-h-48 overflow-y-auto"
                                    style="display:none;">
                                    <template x-for="item in registerKbliSuggestions" :key="item.kode">
                                        <div @click="selectRegisterKbli(item)"
                                            class="p-3 hover:bg-indigo-50 cursor-pointer border-b border-slate-100 last:border-0">
                                            <span class="font-bold text-xs text-indigo-600 font-mono"
                                                x-text="item.kode"></span>
                                            <p class="text-[11px] text-slate-600 truncate" x-text="item.judul"></p>
                                        </div>
                                    </template>
                                </div>
                            </div>
                            <div class="md:col-span-2">
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Uraian
                                    KBLI 2025</label>
                                <input type="text" x-model="registerForm.uraian_kbli"
                                    placeholder="Otomatis terisi atau isi uraian KBLI..."
                                    class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                        </div>
                    </div>

                    <!-- 3. ALAMAT WILAYAH & LOKASI USAHA -->
                    <div class="space-y-4 bg-emerald-50/40 p-5 rounded-3xl border border-emerald-100">
                        <h4
                            class="text-xs font-black text-emerald-900 uppercase tracking-wider flex items-center gap-2 border-b border-emerald-100 pb-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-emerald-600"></span>
                            <span>3. Alamat Wilayah & Lokasi Usaha</span>
                        </h4>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Kecamatan
                                    <span class="text-rose-500">*</span></label>
                                <select x-model="registerForm.kecamatan" @change="onRegisterKecamatanChange()" required
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                                    <option value="Kartoharjo">Kartoharjo</option>
                                    <option value="Manguharjo">Manguharjo</option>
                                    <option value="Taman">Taman</option>
                                </select>
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Kelurahan
                                    <span class="text-rose-500">*</span></label>
                                <select x-model="registerForm.kelurahan" required
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                                    <template x-for="kel in getKelurahanOptions(registerForm.kecamatan)" :key="kel">
                                        <option :value="kel" x-text="kel"></option>
                                    </template>
                                </select>
                            </div>
                            <div class="md:col-span-2">
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Alamat
                                    Jalan Usaha <span class="text-rose-500">*</span></label>
                                <textarea x-model="registerForm.alamat_jalan" required rows="2"
                                    placeholder="Contoh: Jl. Thamrin No. 45"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- 4. KAPASITAS OPERASIONAL & KOORDINAT SPASIAL -->
                    <div class="space-y-4 bg-amber-50/40 p-5 rounded-3xl border border-amber-100">
                        <h4
                            class="text-xs font-black text-amber-900 uppercase tracking-wider flex items-center gap-2 border-b border-amber-100 pb-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-amber-500"></span>
                            <span>4. Kapasitas Operasional & Koordinat Spasial (Lat, Lng)</span>
                        </h4>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Nilai
                                    Investasi (RP)</label>
                                <input type="number" min="0" x-model="registerForm.investasi"
                                    placeholder="Contoh: 3300067800"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-mono font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Jumlah
                                    Tenaga Kerja (Orang)</label>
                                <input type="number" min="1" x-model="registerForm.tenaga_kerja"
                                    placeholder="Contoh: 10"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Latitude
                                    (Lintang)</label>
                                <input type="text" x-model="registerForm.latitude" placeholder="Contoh: -7.6270"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-mono font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                            <div>
                                <label
                                    class="block text-[11px] font-bold uppercase tracking-wider text-slate-600 mb-1">Longitude
                                    (Bujur)</label>
                                <input type="text" x-model="registerForm.longitude" placeholder="Contoh: 111.5320"
                                    class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-mono font-semibold outline-none focus:ring-2 focus:ring-indigo-500 transition">
                            </div>
                        </div>
                    </div>

                    <!-- BUTTON ACTIONS -->
                    <div class="pt-4 border-t border-slate-100 flex items-center justify-end gap-3">
                        <button type="button" @click="showRegisterModal = false"
                            class="px-6 py-3 bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold rounded-2xl text-xs transition">
                            Batal
                        </button>
                        <button type="submit" :disabled="isSubmittingRegister"
                            class="px-8 py-3 bg-indigo-600 hover:bg-indigo-700 active:scale-95 text-white font-extrabold rounded-2xl text-xs shadow-lg shadow-indigo-600/20 transition flex items-center gap-2">
                            <span x-show="!isSubmittingRegister">🚀 Kirim Pendaftaran Pelaku Usaha Baru</span>
                            <span x-show="isSubmittingRegister" class="flex items-center gap-2">
                                <span
                                    class="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></span>
                                <span>Mengirimkan Usulan...</span>
                            </span>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="max-w-4xl w-full">

            <div class="text-center mb-10 transition-all duration-500">
                <div
                    class="inline-flex items-center gap-2 px-4 py-2 bg-indigo-50 border border-indigo-100 rounded-full mb-5 shadow-sm shadow-indigo-100/30 hover:scale-105 transition-transform">
                    <svg class="w-4 h-4 text-indigo-600" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                    </svg>
                    <span class="text-xs font-extrabold text-indigo-600 tracking-wider uppercase">Pemutakhiran Profil &
                        Assessment</span>
                </div>
                <h1 class="text-4xl font-extrabold text-slate-900 tracking-tight mb-3">Registrasi & Pemutakhiran Profil
                </h1>
                <p class="text-slate-500 max-w-xl mx-auto text-sm sm:text-base leading-relaxed">
                    Cari data IKM Anda menggunakan NIB, NIK, atau Nama Pelaku Usaha untuk melihat detail profil,
                    konsultasi, atau mengisi form TNA Digital.
                </p>
            </div>

            {{-- Universal Search Card --}}
            <div
                class="bg-white rounded-3xl p-6 border border-slate-100 shadow-xl shadow-slate-200/40 mb-8 hover:shadow-2xl transition-all duration-500 relative overflow-hidden group">
                <div class="flex flex-wrap items-center justify-center gap-2 mb-5 relative z-10">
                    <span class="text-xs font-bold text-slate-400 mr-1 uppercase tracking-wider text-[10px]">Cari
                        Berdasarkan:</span>
                    <button type="button" @click="setSearchMode('all')"
                        class="px-4 py-2 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5"
                        :class="searchMode === 'all' ? 'bg-indigo-600 text-white shadow-md shadow-indigo-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'">
                        <span>🔍 Otomatis (Semua)</span>
                    </button>
                    <button type="button" @click="setSearchMode('nib')"
                        class="px-4 py-2 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5"
                        :class="searchMode === 'nib' ? 'bg-indigo-600 text-white shadow-md shadow-indigo-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'">
                        <span>NIB (13 Digit)</span>
                    </button>
                    <button type="button" @click="setSearchMode('nik')"
                        class="px-4 py-2 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5"
                        :class="searchMode === 'nik' ? 'bg-indigo-600 text-white shadow-md shadow-indigo-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'">
                        <span>NIK (16 Digit)</span>
                    </button>
                    <button type="button" @click="setSearchMode('nama')"
                        class="px-4 py-2 rounded-xl text-xs font-bold transition-all flex items-center gap-1.5"
                        :class="searchMode === 'nama' ? 'bg-indigo-600 text-white shadow-md shadow-indigo-600/20' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'">
                        <span>Nama Pelaku Usaha / Usaha</span>
                    </button>
                </div>

                <div class="flex flex-col sm:flex-row gap-3 relative z-10">
                    <div class="flex-1 relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-slate-400 group-focus-within:text-indigo-500 transition-colors"
                                fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            </svg>
                        </div>
                        <input type="text" x-model="searchQuery" @input="handleSearchInput()"
                            @keydown.enter.prevent="search()" maxlength="255" :placeholder="getSearchPlaceholder()"
                            class="w-full pl-12 pr-5 py-4 bg-slate-50 border border-slate-200 rounded-2xl focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 focus:bg-white transition-all outline-none text-slate-800 text-sm font-semibold shadow-inner placeholder-slate-400">
                    </div>
                    <button type="button" @click="search()" :disabled="isLoading"
                        class="bg-indigo-600 hover:bg-indigo-700 active:scale-98 text-white font-bold px-8 py-4 rounded-2xl shadow-lg shadow-indigo-600/20 transition-all duration-300 disabled:opacity-50 flex items-center justify-center gap-2 pulse-ring-indigo cursor-pointer shrink-0">
                        <span x-show="!isLoading" class="tracking-wide">Cari Data</span>
                        <span x-show="isLoading"
                            class="w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin"></span>
                    </button>
                </div>
                <p x-show="errorMessage" class="text-rose-500 text-xs font-bold mt-3 pl-2 flex items-center gap-1.5"
                    x-text="errorMessage" style="display:none;" x-transition></p>

                <!-- Registration Option -->
                <div x-show="showRegisterOption" x-transition
                    class="mt-4 p-4 bg-indigo-50/50 border border-indigo-100/60 rounded-2xl flex flex-col sm:flex-row items-center justify-between gap-3 text-left"
                    style="display:none;">
                    <div>
                        <p class="text-sm font-bold text-slate-800">Pelaku usaha belum terdaftar?</p>
                        <p class="text-xs text-slate-500 font-semibold mt-0.5">Daftarkan pelaku usaha baru secara
                            mandiri menggunakan NIB/NIK ini.</p>
                    </div>
                    <button @click="startRegistration()"
                        class="px-5 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl text-xs font-bold transition shadow-md shadow-indigo-600/10 shrink-0">
                        Daftar Pelaku Usaha Baru
                    </button>
                </div>
            </div>

            {{-- Result & Proposed Edit Form (3 TABS: Profil, Konsultasi, TNA Digital) --}}
            <div x-show="ikmData" x-transition:enter="transition ease-out duration-300"
                x-transition:enter-start="opacity-0 translate-y-4" x-transition:enter-end="opacity-100 translate-y-0"
                class="bg-white rounded-3xl p-8 border border-slate-100 shadow-2xl relative overflow-hidden"
                style="display:none;">

                <div class="relative z-10">
                    {{-- 3 TABS NAVIGATION --}}
                    <div class="flex border-b border-slate-100 mb-8 gap-4 md:gap-8 overflow-x-auto pb-1"
                        x-show="!isNewRegistration">
                        <button type="button" @click="activeTab = 'profil'"
                            :class="activeTab === 'profil' ? 'border-b-2 border-indigo-600 text-indigo-600 font-black' : 'text-slate-400 hover:text-slate-600 font-bold'"
                            class="pb-3.5 text-xs md:text-sm tracking-wide transition-all duration-300 shrink-0">
                            📋 PROFIL USAHA
                        </button>
                        <button type="button" @click="activeTab = 'konsultasi'"
                            :class="activeTab === 'konsultasi' ? 'border-b-2 border-indigo-600 text-indigo-600 font-black' : 'text-slate-400 hover:text-slate-600 font-bold'"
                            class="pb-3.5 text-xs md:text-sm tracking-wide transition-all duration-300 flex items-center gap-2 shrink-0">
                            <span>💬 KONSULTASI & PEMBINAAN</span>
                            <span x-show="consultations.length > 0"
                                class="bg-indigo-100 text-indigo-700 text-[10px] font-black px-2 py-0.5 rounded-full"
                                x-text="consultations.length" style="display:none;"></span>
                        </button>
                        <button type="button" @click="activeTab = 'tna'"
                            :class="activeTab === 'tna' ? 'border-b-2 border-emerald-600 text-emerald-600 font-black' : 'text-slate-400 hover:text-slate-600 font-bold'"
                            class="pb-3.5 text-xs md:text-sm tracking-wide transition-all duration-300 flex items-center gap-2 shrink-0">
                            <span>✨ TNA DIGITAL (ASSESSMENT PELATIHAN)</span>
                            <span
                                class="bg-emerald-100 text-emerald-700 text-[9px] font-black px-2 py-0.5 rounded-full uppercase">Form
                                & Antrean</span>
                        </button>
                    </div>

                    {{-- TAB 1: PROFIL USAHA (FULL DATASET PETASEBARAN) --}}
                    <div x-show="activeTab === 'profil' || isNewRegistration" x-transition class="space-y-6">

                        {{-- Status Alert Notice --}}
                        <div class="space-y-3">
                            {{-- Antrian Verifikasi --}}
                            <div x-show="proposalStatus === 'pending'"
                                class="p-4 bg-amber-50 border border-amber-200 text-amber-800 text-xs rounded-2xl flex items-start gap-3 shadow-sm"
                                style="display:none;">
                                <svg class="w-5 h-5 text-amber-500 shrink-0 mt-0.5" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                                <div>
                                    <strong class="font-extrabold text-sm block">⏳ Usulan Perubahan Masih Dalam Antrean
                                        Verifikasi</strong>
                                    <span class="font-medium">Usulan data Anda telah dikirim dan sedang dalam tahap
                                        antrian verifikasi oleh Admin Dinas Tenaga Kerja, KUKM Kota Madiun di halaman
                                        verifikasi.</span>
                                </div>
                            </div>

                            {{-- Ditolak --}}
                            <div x-show="proposalStatus === 'ditolak'"
                                class="p-4 bg-rose-50 border border-rose-200 text-rose-800 text-xs rounded-2xl flex items-start gap-3 shadow-sm"
                                style="display:none;">
                                <svg class="w-5 h-5 text-rose-500 shrink-0 mt-0.5" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                                <div>
                                    <strong class="font-extrabold text-sm block text-rose-900">Usulan Perubahan
                                        Ditolak</strong>
                                    <span class="font-medium"
                                        x-text="'Catatan Admin: ' + (adminNote || 'Usulan belum memenuhi ketentuan data.')"></span>
                                </div>
                            </div>

                            {{-- Mode Info Banner --}}
                            <div x-show="!isEditMode && !isNewRegistration"
                                class="p-3.5 bg-indigo-50/70 border border-indigo-100 rounded-2xl text-xs font-semibold text-indigo-900 flex items-center justify-between gap-3">
                                <div class="flex items-center gap-2">
                                    <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                                    <span>Tampilan data di bawah bersifat <strong>Tetap & Terdaftar Resmi</strong> di
                                        Peta Sebaran.</span>
                                </div>
                                <span
                                    class="text-[10px] font-black uppercase text-indigo-600 bg-indigo-100 px-2.5 py-1 rounded-full">Database
                                    Peta Sebaran</span>
                            </div>

                            <div x-show="isEditMode"
                                class="p-3.5 bg-amber-50 border border-amber-200 rounded-2xl text-xs font-semibold text-amber-900 flex items-center gap-2"
                                style="display:none;">
                                <span>✍️ <strong>Mode Pengajuan Ubah Data Aktif</strong>. NIB, NIK, dan Uraian KBLI
                                    bersifat tetap. Silakan perbarui data lainnya lalu klik Kirim Perubahan Data.</span>
                            </div>
                        </div>

                        {{-- Header Title --}}
                        <div class="flex justify-between items-center border-b border-slate-100 pb-4">
                            <div>
                                <h3 class="text-xl font-black text-slate-900"
                                    x-text="form.nama_usaha || 'Profil Pelaku Usaha'"></h3>
                                <p class="text-xs text-slate-500 font-semibold"
                                    x-text="'Pemilik: ' + (form.pemilik || '-') + ' • NIK: ' + (form.nik || '-')"></p>
                            </div>
                            <span class="px-3 py-1 bg-emerald-100 text-emerald-800 rounded-full text-xs font-black"
                                x-text="isEditMode ? 'Mode Edit Data' : 'Aktif'"></span>
                        </div>

                        {{-- Form Data Full Peta Sebaran --}}
                        <form @submit.prevent="submitProposal()" class="space-y-6">
                            <input type="hidden" x-model="form.peta_sebaran_id">

                            {{-- SECTION 1: LEGITIMASI & IDENTITAS USAHA --}}
                            <div class="space-y-4">
                                <h4
                                    class="text-xs font-black text-indigo-600 uppercase tracking-widest border-b border-slate-100 pb-2">
                                    1. Legitimasi & Identitas Pelaku Usaha</h4>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">NIB
                                            (Nomor Induk Berusaha) <span class="text-slate-400 text-[10px]">(Tetap /
                                                Locked)</span></label>
                                        <input type="text" x-model="form.nib" disabled
                                            class="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-2xl text-slate-500 text-xs font-semibold cursor-not-allowed">
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">NIK
                                            Pemilik <span class="text-slate-400 text-[10px]">(Tetap /
                                                Locked)</span></label>
                                        <input type="text" x-model="form.nik" disabled
                                            class="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-2xl text-slate-500 text-xs font-semibold cursor-not-allowed">
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Nama
                                            Perusahaan / Usaha <span class="text-rose-500">*</span></label>
                                        <input type="text" x-model="form.nama_usaha" required
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Nama
                                            Pemilik <span class="text-rose-500">*</span></label>
                                        <input type="text" x-model="form.pemilik" required
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">No.
                                            WhatsApp / HP <span class="text-rose-500">*</span></label>
                                        <input type="text" x-model="form.no_hp" required
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Jenis
                                            Produk Utama / Komoditas</label>
                                        <input type="text" x-model="form.produk"
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                    </div>
                                </div>
                            </div>

                            {{-- SECTION 2: KLASIFIKASI INDUSTRY & KBLI 2025 --}}
                            <div class="space-y-4 pt-2">
                                <h4
                                    class="text-xs font-black text-indigo-600 uppercase tracking-widest border-b border-slate-100 pb-2">
                                    2. Klasifikasi Usaha & KBLI 2025</h4>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Kategori
                                            Usaha <span class="text-rose-500">*</span></label>
                                        <select x-model="form.kategori" required
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                            <option value="">Pilih Kategori</option>
                                            <option value="Pangan">Pangan</option>
                                            <option value="Sandang">Sandang</option>
                                            <option value="Kerajinan (Kriya)">Kerajinan (Kriya)</option>
                                            <option value="Kimia dan Furnitur">Kimia dan Furnitur</option>
                                            <option value="Logam dan Mesin">Logam dan Mesin</option>
                                        </select>
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Skala
                                            Usaha</label>
                                        <select x-model="form.skala_usaha" :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                            <option value="Mikro">Mikro</option>
                                            <option value="Kecil">Kecil</option>
                                            <option value="Menengah">Menengah</option>
                                            <option value="Besar">Besar</option>
                                        </select>
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Tingkat
                                            Risiko OSS</label>
                                        <select x-model="form.tingkat_risiko"
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                            <option value="Rendah">Rendah</option>
                                            <option value="Menengah Rendah">Menengah Rendah</option>
                                            <option value="Menengah Tinggi">Menengah Tinggi</option>
                                            <option value="Tinggi">Tinggi</option>
                                        </select>
                                    </div>
                                </div>

                                {{-- KBLI 2025 Lookup & Uraian --}}
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 relative">
                                    <div class="relative">
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">
                                            KBLI 2025
                                            <span x-show="isEditMode"
                                                class="text-indigo-600 text-[10px] lowercase font-semibold ml-1">(ketik
                                                kode/nama untuk autocomplete)</span>
                                        </label>
                                        <input type="text" x-model="form.kbli" @input="onKbliInput()"
                                            @focus="if(isEditMode) showKbliSuggestions = true"
                                            :disabled="!isEditMode && !isNewRegistration" placeholder="Contoh: 14111"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition font-mono">

                                        <!-- KBLI Autocomplete Dropdown -->
                                        <div x-show="showKbliSuggestions && kbliSuggestions.length > 0"
                                            @click.outside="showKbliSuggestions = false"
                                            class="absolute left-0 right-0 mt-1 bg-white border border-slate-200 rounded-2xl shadow-xl z-50 max-h-48 overflow-y-auto divide-y divide-slate-100"
                                            style="display:none;">
                                            <template x-for="item in kbliSuggestions" :key="item.kode">
                                                <div @click="selectKbli(item)"
                                                    class="p-3 hover:bg-indigo-50 cursor-pointer text-xs transition">
                                                    <span class="font-bold text-indigo-600 font-mono"
                                                        x-text="item.kode"></span>
                                                    <span class="text-slate-700 font-medium ml-2"
                                                        x-text="item.judul"></span>
                                                </div>
                                            </template>
                                        </div>
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">
                                            Uraian KBLI 2025
                                            <span class="text-slate-400 text-[10px]">(Otomatis Terisi / Locked)</span>
                                        </label>
                                        <input type="text" x-model="form.uraian_kbli" disabled
                                            placeholder="Uraian KBLI terisi otomatis saat KBLI dipilih"
                                            class="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-2xl text-slate-600 text-xs font-semibold cursor-not-allowed">
                                    </div>
                                </div>
                            </div>

                            {{-- SECTION 3: ALAMAT & LOKASI USABA --}}
                            <div class="space-y-4 pt-2">
                                <h4
                                    class="text-xs font-black text-indigo-600 uppercase tracking-widest border-b border-slate-100 pb-2">
                                    3. Alamat Wilayah & Lokasi Usaha</h4>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Kecamatan
                                            <span class="text-rose-500">*</span></label>
                                        <select x-model="form.kecamatan" required
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                            <option value="Kartoharjo">Kartoharjo</option>
                                            <option value="Manguharjo">Manguharjo</option>
                                            <option value="Taman">Taman</option>
                                        </select>
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Kelurahan
                                            <span class="text-rose-500">*</span></label>
                                        <input type="text" x-model="form.kelurahan" required
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                    </div>
                                    <div class="md:col-span-2">
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Alamat
                                            Jalan Usaha <span class="text-rose-500">*</span></label>
                                        <textarea x-model="form.alamat_jalan" rows="2" required
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition"></textarea>
                                    </div>
                                </div>
                            </div>

                            {{-- SECTION 4: KAPASITAS PRODUKSI & KOORDINAT SPASIAL --}}
                            <div class="space-y-4 pt-2">
                                <h4
                                    class="text-xs font-black text-indigo-600 uppercase tracking-widest border-b border-slate-100 pb-2">
                                    4. Kapasitas Operasional & Koordinat Spasial (Lat, Lng)</h4>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Nilai
                                            Investasi (Rp)</label>
                                        <input type="number" x-model="form.investasi"
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Jumlah
                                            Tenaga Kerja (Orang)</label>
                                        <input type="number" x-model="form.tenaga_kerja"
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition">
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Latitude
                                            (Lintang)</label>
                                        <input type="text" x-model="form.latitude" placeholder="-7.627..."
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition font-mono">
                                    </div>
                                    <div>
                                        <label
                                            class="block text-[11px] font-bold uppercase tracking-wider text-slate-500 mb-1">Longitude
                                            (Bujur)</label>
                                        <input type="text" x-model="form.longitude" placeholder="111.527..."
                                            :disabled="!isEditMode && !isNewRegistration"
                                            :class="(!isEditMode && !isNewRegistration) ? 'bg-slate-100 text-slate-700 cursor-not-allowed' : 'bg-slate-50 text-slate-900 focus:bg-white focus:border-indigo-500'"
                                            class="w-full px-4 py-3 border border-slate-200 rounded-2xl text-xs font-semibold outline-none transition font-mono">
                                    </div>
                                </div>
                            </div>

                            {{-- BUTTON BAR --}}
                            <div
                                class="flex flex-col sm:flex-row justify-end items-center gap-3 pt-4 border-t border-slate-100">

                                {{-- When in Fixed Read-Only View --}}
                                <template x-if="!isEditMode && !isNewRegistration">
                                    <button type="button" @click="enableEditMode()"
                                        :disabled="proposalStatus === 'pending'"
                                        :class="proposalStatus === 'pending' ? 'bg-slate-300 text-slate-500 cursor-not-allowed' : 'bg-indigo-600 hover:bg-indigo-700 text-white shadow-lg shadow-indigo-600/20 active:scale-98'"
                                        class="w-full sm:w-auto px-8 py-3.5 rounded-2xl text-xs font-black transition flex items-center justify-center gap-2">
                                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                            stroke-width="2.5">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 210.3H3v-3.572L16.732 3.732z" />
                                        </svg>
                                        <span
                                            x-text="proposalStatus === 'pending' ? 'Usulan Masih Dalam Antrean' : 'Usulkan Ubah Data'"></span>
                                    </button>
                                </template>

                                {{-- When in Edit Mode --}}
                                <template x-if="isEditMode || isNewRegistration">
                                    <div class="flex items-center gap-3 w-full sm:w-auto">
                                        <button type="button" @click="cancelEditMode()"
                                            class="flex-1 sm:flex-none px-6 py-3.5 bg-slate-100 hover:bg-slate-200 text-slate-600 rounded-2xl text-xs font-bold transition">
                                            ❌ Batal
                                        </button>
                                        <button type="submit"
                                            class="flex-1 sm:flex-none px-8 py-3.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-black transition shadow-lg shadow-emerald-600/20 flex items-center justify-center gap-2">
                                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                                stroke-width="2.5">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M5 13l4 4L19 7" />
                                            </svg>
                                            <span>🚀 Kirim Perubahan Data</span>
                                        </button>
                                    </div>
                                </template>
                            </div>
                        </form>
                    </div>

                    {{-- TAB 2: KONSULTASI & PEMBINAAN (WHATSAPP CHAT STYLE) --}}
                    <div x-show="activeTab === 'konsultasi' && !isNewRegistration" x-transition class="space-y-6"
                        style="display:none;">
                        <!-- Top Header Bar -->
                        <div
                            class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 bg-gradient-to-r from-emerald-800 via-teal-900 to-slate-900 p-6 rounded-3xl text-white shadow-xl">
                            <div class="space-y-1">
                                <div class="flex items-center gap-2">
                                    <span class="text-xl">💬</span>
                                    <h3 class="text-lg font-black tracking-tight">Ruang Konsultasi & Pembinaan (WhatsApp
                                        Style)</h3>
                                </div>
                                <p class="text-xs text-emerald-200/90 font-medium">Diskusi obrolan langsung & real-time
                                    dengan Tim Pembina Dinas Tenaga Kerja, KUKM Kota Madiun</p>
                            </div>
                            <button type="button" @click="showNewConsultationForm = !showNewConsultationForm"
                                class="px-5 py-3 bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-black rounded-2xl text-xs shadow-lg transition active:scale-95 flex items-center gap-2">
                                <span
                                    x-text="showNewConsultationForm ? '❌ Tutup Form' : '➕ Sesi Konsultasi Baru'"></span>
                            </button>
                        </div>

                        {{-- Form Ajukan Konsultasi Baru --}}
                        <div x-show="showNewConsultationForm" x-transition
                            class="p-6 bg-slate-50 border border-slate-200 rounded-3xl space-y-4 shadow-sm"
                            style="display:none;">
                            <h4 class="text-xs font-black uppercase tracking-wider text-slate-700">➕ Buka Sesi
                                Konsultasi Pengaduan Baru</h4>
                            <div class="space-y-3">
                                <div>
                                    <label class="block text-xs font-bold text-slate-700 uppercase mb-1">Topik Kategori
                                        Pengaduan / Konsultasi <span class="text-rose-500">*</span></label>
                                    <select x-model="consultationForm.jenis_usaha"
                                        class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-bold text-slate-800 outline-none focus:border-emerald-500 transition">
                                        <template x-for="opt in kategoriOptions" :key="opt.id">
                                            <option :value="opt.nama_kategori" x-text="opt.nama_kategori"></option>
                                        </template>
                                    </select>
                                </div>
                                <div>
                                    <label class="block text-xs font-bold text-slate-700 uppercase mb-1">Deskripsi
                                        Keluhan / Kebutuhan Pendampingan <span class="text-rose-500">*</span></label>
                                    <textarea x-model="consultationForm.keluhan" rows="3"
                                        placeholder="Tuliskan detail pertanyaan atau keluhan operasional usaha Anda..."
                                        class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500 transition"></textarea>
                                </div>
                                <div class="flex justify-end">
                                    <button type="button" @click="submitConsultation()"
                                        class="px-6 py-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-black shadow-lg shadow-emerald-600/20 transition">🚀
                                        Kirim & Buka Obrolan</button>
                                </div>
                            </div>
                        </div>

                        {{-- Layout WhatsApp Chat Grid --}}
                        <div x-show="consultations.length > 0"
                            class="grid grid-cols-1 lg:grid-cols-12 gap-6 bg-slate-900/5 rounded-3xl p-2 border border-slate-200/60">

                            <!-- Left Sidebar: Session List (4 Cols) -->
                            <div
                                class="lg:col-span-4 bg-white rounded-2xl border border-slate-200 p-4 space-y-3 shadow-sm flex flex-col max-h-[550px]">
                                <div class="flex justify-between items-center pb-2 border-b border-slate-100">
                                    <h4 class="text-xs font-black uppercase text-slate-500 tracking-wider">Daftar Sesi
                                        Konsultasi</h4>
                                    <span
                                        class="px-2 py-0.5 bg-slate-100 text-slate-600 rounded-full text-[10px] font-bold"
                                        x-text="consultations.length + ' Sesi'"></span>
                                </div>

                                <div class="space-y-2 overflow-y-auto flex-1 pr-1">
                                    <template x-for="item in consultations" :key="item.id">
                                        <button type="button" @click="selectConsultation(item)"
                                            :class="activeConsultation && activeConsultation.id === item.id ? 'bg-emerald-50 border-emerald-500 shadow-sm' : 'bg-slate-50 hover:bg-slate-100 border-slate-200'"
                                            class="w-full text-left p-3.5 rounded-2xl border transition flex flex-col gap-1.5 group">
                                            <div class="flex justify-between items-start">
                                                <span class="text-xs font-black text-slate-900 line-clamp-1"
                                                    x-text="item.jenis_usaha"></span>
                                                <span class="px-2 py-0.5 rounded-full text-[9px] font-black shrink-0"
                                                    :class="{
                                                        'bg-amber-100 text-amber-800': item.status === 'Belum Dijawab',
                                                        'bg-emerald-100 text-emerald-800': item.status === 'Sudah Dijawab',
                                                        'bg-slate-200 text-slate-600': item.status === 'Selesai'
                                                    }" x-text="item.status"></span>
                                            </div>
                                            <p class="text-[11px] text-slate-600 line-clamp-2 font-medium"
                                                x-text="item.keluhan"></p>
                                        </button>
                                    </template>
                                </div>
                            </div>

                            <!-- Right Main: WhatsApp Chat Room (8 Cols) -->
                            <div
                                class="lg:col-span-8 bg-white rounded-2xl border border-slate-200 shadow-sm flex flex-col overflow-hidden max-h-[550px]">
                                <template x-if="activeConsultation">
                                    <div class="flex flex-col h-full">
                                        <!-- Chat Header -->
                                        <div
                                            class="p-4 bg-slate-900 text-white flex justify-between items-center shadow-md">
                                            <div class="flex items-center gap-3">
                                                <div
                                                    class="w-10 h-10 rounded-2xl bg-emerald-500/20 border border-emerald-400/40 flex items-center justify-center text-emerald-400 font-bold text-lg">
                                                    💬
                                                </div>
                                                <div>
                                                    <h4 class="text-sm font-black tracking-tight"
                                                        x-text="activeConsultation.jenis_usaha"></h4>
                                                    <div class="flex items-center gap-2 text-[10px] text-emerald-300">
                                                        <span
                                                            class="w-2 h-2 rounded-full bg-emerald-400 animate-ping"></span>
                                                        <span>Real-time Sync Active (3s)</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <span class="px-3 py-1 rounded-xl text-xs font-black" :class="{
                                                    'bg-amber-500/20 text-amber-300 border border-amber-500/30': activeConsultation.status === 'Belum Dijawab',
                                                    'bg-emerald-500/20 text-emerald-300 border border-emerald-500/30': activeConsultation.status === 'Sudah Dijawab',
                                                    'bg-slate-700 text-slate-300 border border-slate-600': activeConsultation.status === 'Selesai'
                                                }" x-text="activeConsultation.status"></span>
                                        </div>

                                        <!-- WhatsApp Messages Area -->
                                        <div id="userChatBox"
                                            class="flex-1 p-5 overflow-y-auto space-y-4 bg-[#efeae2]/40"
                                            style="background-image: radial-gradient(#cbd5e1 0.75px, transparent 0.75px); background-size: 16px 16px;">

                                            <!-- Initial Question Bubble from User -->
                                            <div class="flex flex-col items-end">
                                                <div
                                                    class="max-w-[85%] bg-emerald-700 text-white p-3.5 rounded-2xl rounded-tr-none shadow-md space-y-1">
                                                    <span
                                                        class="text-[9px] font-black uppercase text-emerald-200 tracking-wider">Permohonan
                                                        Awal Anda</span>
                                                    <p class="text-xs font-semibold leading-relaxed"
                                                        x-text="activeConsultation.keluhan"></p>
                                                </div>
                                            </div>

                                            <!-- Chat Messages Thread -->
                                            <template x-for="msg in activeConsultation.messages" :key="msg.id">
                                                <div class="flex flex-col"
                                                    :class="msg.sender === 'user' ? 'items-end' : 'items-start'">
                                                    <div class="max-w-[85%] p-3.5 rounded-2xl shadow-sm border space-y-1"
                                                        :class="msg.sender === 'user' ? 'bg-emerald-700 text-white border-emerald-800 rounded-tr-none' : 'bg-white text-slate-800 border-slate-200 rounded-tl-none'">
                                                        <div class="flex items-center gap-2 border-b pb-1 mb-1"
                                                            :class="msg.sender === 'user' ? 'border-emerald-600/50' : 'border-slate-100'">
                                                            <span class="text-[10px] font-black"
                                                                :class="msg.sender === 'user' ? 'text-emerald-200' : 'text-indigo-600'"
                                                                x-text="msg.sender === 'user' ? 'Anda (Pelaku Usaha)' : '🏛️ Admin Dinas Tenaga Kerja & KUKM'"></span>
                                                        </div>
                                                        <p class="text-xs font-semibold leading-relaxed whitespace-pre-wrap"
                                                            x-text="msg.pesan"></p>
                                                        <div class="text-[9px] text-right font-medium opacity-70 pt-0.5"
                                                            x-text="new Date(msg.created_at).toLocaleTimeString('id-ID', {hour: '2-digit', minute:'2-digit'})">
                                                        </div>
                                                    </div>
                                                </div>
                                            </template>

                                            <!-- If status is Selesai -->
                                            <div x-show="activeConsultation.status === 'Selesai'"
                                                class="p-3 bg-slate-200/80 border border-slate-300 text-slate-700 text-xs font-bold text-center rounded-2xl">
                                                🔒 Sesi konsultasi ini telah diakhiri secara resmi oleh Admin Dinas.
                                            </div>
                                        </div>

                                        <!-- Bottom Reply Bar -->
                                        <div x-show="activeConsultation.status !== 'Selesai'"
                                            class="p-3 bg-white border-t border-slate-200 flex gap-2 items-center">
                                            <input type="text" x-model="userReplyText"
                                                @keydown.enter.prevent="sendUserChatMessage()"
                                                placeholder="Ketik pesan balasan..."
                                                class="flex-1 px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-600 focus:bg-white transition">
                                            <button type="button" @click="sendUserChatMessage()"
                                                class="px-5 py-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-black shadow-md transition active:scale-95 flex items-center gap-1.5 shrink-0">
                                                <span>Kirim</span>
                                                <span>🚀</span>
                                            </button>
                                        </div>
                                    </div>
                                </template>

                                <template x-if="!activeConsultation">
                                    <div
                                        class="flex flex-col items-center justify-center h-full p-8 text-center text-slate-400 space-y-3">
                                        <span class="text-4xl">💬</span>
                                        <p class="text-xs font-bold">Pilih salah satu sesi konsultasi di sebelah kiri
                                            atau buat sesi baru.</p>
                                    </div>
                                </template>
                            </div>
                        </div>

                        <!-- Empty State if no consultations exist -->
                        <div x-show="consultations.length === 0 && !showNewConsultationForm"
                            class="p-10 bg-slate-50 border border-slate-200 rounded-3xl text-center space-y-3">
                            <span class="text-4xl">💬</span>
                            <h4 class="text-sm font-black text-slate-800">Belum Ada Sesi Konsultasi</h4>
                            <p class="text-xs text-slate-500 font-medium max-w-md mx-auto">Anda dapat membuat pengaduan
                                atau konsultasi pendampingan usaha langsung ke Tim Dinas.</p>
                            <button type="button" @click="showNewConsultationForm = true"
                                class="px-6 py-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-black shadow-lg shadow-emerald-600/20 transition">
                                🚀 Buat Sesi Konsultasi Pertama
                            </button>
                        </div>
                    </div>

                    {{-- TAB 3: TNA DIGITAL (ASSESSMENT PELATIHAN) --}}
                    <div x-show="activeTab === 'tna' && !isNewRegistration" x-transition class="space-y-6"
                        style="display:none;">
                        <div
                            class="bg-gradient-to-r from-emerald-800 via-emerald-900 to-slate-900 rounded-3xl p-6 text-white shadow-xl space-y-2">
                            <div
                                class="inline-flex items-center gap-2 px-3 py-1 bg-emerald-500/20 border border-emerald-400/30 rounded-full text-xs font-black text-emerald-300 uppercase tracking-wider">
                                <span>✨ Assessment Kebutuhan Pelatihan</span>
                            </div>
                            <h3 class="text-2xl font-black">TNA Digital <span class="text-emerald-400">IKM JUARA</span>
                            </h3>
                            <p class="text-xs text-slate-300 font-medium leading-relaxed">
                                Form khusus bagi pelaku IKM Kota Madiun untuk mengidentifikasi kendala usaha & memilih
                                prioritas topik pelatihan mendesak tahun depan.
                            </p>
                            <div class="pt-2 flex flex-wrap gap-3 text-xs font-bold text-emerald-200">
                                <span>Usaha: <strong class="text-white font-black"
                                        x-text="form.nama_usaha"></strong></span>
                                <span>• Pemilik: <strong class="text-white font-black"
                                        x-text="form.pemilik"></strong></span>
                                <span x-show="form.nib">• NIB: <strong class="text-emerald-300 font-mono"
                                        x-text="form.nib"></strong></span>
                            </div>
                        </div>

                        {{-- CONDITION 1: TNA ALREADY SUBMITTED & NOT OPTED TO RE-FILL AGAIN & NOT DECLINED --}}
                        <div x-show="hasSubmittedTna && !showTnaFormAgain && !tnaDeclined"
                            class="p-8 bg-gradient-to-br from-emerald-50 via-teal-50 to-emerald-100/60 border border-emerald-200 rounded-3xl text-center space-y-5 shadow-sm">
                            <div
                                class="w-16 h-16 bg-emerald-600 text-white rounded-2xl flex items-center justify-center mx-auto text-3xl shadow-lg shadow-emerald-600/30">
                                ✅
                            </div>
                            <div class="space-y-2 max-w-lg mx-auto">
                                <h4 class="text-lg font-black text-emerald-950 tracking-tight">
                                    Anda Telah Melakukan Pengisian TNA Digital
                                </h4>
                                <div
                                    class="inline-flex items-center gap-2 text-xs font-bold text-emerald-800 bg-emerald-200/60 px-4 py-2 rounded-2xl border border-emerald-300">
                                    <span>📅 Pada tanggal</span>
                                    <span x-text="tnaSubmittedAt" class="font-extrabold text-emerald-950"></span>
                                </div>
                                <p class="text-xs text-slate-600 font-semibold pt-1 leading-relaxed">
                                    Data assessment kebutuhan pelatihan Anda telah berhasil tercatat dalam antrean
                                    prioritas pembinaan Dinas Tenaga Kerja, KUKM Kota Madiun.
                                </p>
                            </div>

                            <!-- Interactive prompt: Ingin mengirimkan TNA Digital lagi? -->
                            <div class="pt-5 border-t border-emerald-200/80 max-w-md mx-auto space-y-4">
                                <p class="text-xs font-black uppercase text-emerald-900 tracking-wider">
                                    Ingin mengirimkan TNA Digital lagi?
                                </p>
                                <div class="flex items-center justify-center gap-3">
                                    <button type="button" @click="showTnaFormAgain = true; tnaDeclined = false"
                                        class="px-6 py-3.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-black shadow-lg shadow-emerald-600/20 transition active:scale-95 flex items-center gap-2">
                                        <span>Ya, Kirim Lagi</span>
                                        <span>📝</span>
                                    </button>
                                    <button type="button" @click="tnaDeclined = true; showTnaFormAgain = false"
                                        class="px-6 py-3.5 bg-white border border-slate-300 hover:bg-slate-100 text-slate-700 rounded-2xl text-xs font-black shadow-sm transition active:scale-95">
                                        <span>Tidak</span>
                                    </button>
                                </div>
                            </div>
                        </div>

                        {{-- CONDITION 2: USER CLICKED "TIDAK" --}}
                        <div x-show="tnaDeclined && !showTnaFormAgain"
                            class="p-8 bg-slate-50 border border-slate-200 rounded-3xl text-center space-y-4 shadow-sm">
                            <div
                                class="w-14 h-14 bg-emerald-100 text-emerald-600 rounded-2xl flex items-center justify-center mx-auto text-2xl">
                                🙏
                            </div>
                            <div class="space-y-1">
                                <h4 class="text-base font-black text-slate-800">Terima kasih telah mengisi TNA Digital.
                                </h4>
                                <p class="text-xs text-slate-500 font-medium">Partisipasi Anda sangat berharga untuk
                                    peningkatan mutu & sasaran pelatihan IKM Kota Madiun.</p>
                            </div>
                            <div class="pt-3">
                                <button type="button" @click="showTnaFormAgain = true; tnaDeclined = false"
                                    class="text-xs font-bold text-emerald-600 hover:text-emerald-800 underline">
                                    🔄 Klik di sini apabila Anda ingin mengubah jawaban atau mengisi TNA Digital lagi
                                </button>
                            </div>
                        </div>

                        {{-- CONDITION 3: NOT YET SUBMITTED OR OPTED TO FILL AGAIN --}}
                        <div x-show="!hasSubmittedTna || showTnaFormAgain">
                            <form id="tnaForm" @submit.prevent="submitTnaDigital()" class="space-y-6">
                                @csrf
                                <input type="hidden" name="ikm_id" :value="form.peta_sebaran_id || ''">
                                <input type="hidden" name="nama_usaha" :value="form.nama_usaha">
                                <input type="hidden" name="pemilik" :value="form.pemilik">
                                <input type="hidden" name="nik" :value="form.nik">
                                <input type="hidden" name="nib" :value="form.nib">
                                <input type="hidden" name="no_hp" :value="form.no_hp">
                                <input type="hidden" name="kecamatan" :value="form.kecamatan || 'Manguharjo'">
                                <input type="hidden" name="kelurahan" :value="form.kelurahan || ''">

                                {{-- Bagian 1 --}}
                                <div class="p-6 bg-slate-50 border border-slate-200 rounded-3xl space-y-4">
                                    <div class="flex items-center gap-3 border-b border-slate-200/80 pb-3">
                                        <span
                                            class="w-7 h-7 rounded-xl bg-emerald-600 text-white flex items-center justify-center font-black text-xs">1</span>
                                        <h4 class="text-sm font-black text-slate-900">Bagian 1: Identifikasi Kendala
                                            Usaha</h4>
                                    </div>

                                    <div class="space-y-2">
                                        <label class="block text-xs font-extrabold text-slate-800"
                                            x-text="'1. ' + getQuestionText(1, 'Apa kendala operasional terbesar yang paling menghambat perkembangan usaha Anda saat ini?')">
                                        </label>
                                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-2 pt-1">
                                            <template
                                                x-for="opsi in getQuestionOptions(1, ['Pemasaran/penjualan rendah', 'Kesulitan akses permodalan', 'Kualitas/kapasitas produksi terbatas', 'Belum memiliki legalitas/sertifikasi', 'Pembukuan keuangan berantakan'])"
                                                :key="opsi">
                                                <label
                                                    class="flex items-center gap-2.5 p-3 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 hover:border-emerald-400 cursor-pointer">
                                                    <input type="checkbox" name="kendala_operasional[]" :value="opsi"
                                                        class="rounded text-emerald-600 focus:ring-emerald-500 w-4 h-4">
                                                    <span x-text="opsi"></span>
                                                </label>
                                            </template>
                                        </div>
                                    </div>

                                    <div class="space-y-2 pt-3 border-t border-slate-200/60">
                                        <label class="block text-xs font-extrabold text-slate-800"
                                            x-text="'2. ' + getQuestionText(2, 'Keterampilan teknis apa yang saat ini dirasa paling kurang dan sangat Anda butuhkan?')">
                                        </label>
                                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-2 pt-1">
                                            <template
                                                x-for="opsi in getQuestionOptions(2, ['Penggunaan media sosial/marketplace', 'Cara produksi sesuai standar mutu', 'Manajemen kas', 'Prosedur izin usaha', 'Strategi pengemasan/packaging'])"
                                                :key="opsi">
                                                <label
                                                    class="flex items-center gap-2.5 p-3 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 hover:border-emerald-400 cursor-pointer">
                                                    <input type="checkbox" name="keterampilan_kurang[]" :value="opsi"
                                                        class="rounded text-emerald-600 focus:ring-emerald-500 w-4 h-4">
                                                    <span x-text="opsi"></span>
                                                </label>
                                            </template>
                                        </div>
                                    </div>
                                </div>

                                {{-- Bagian 2 --}}
                                <div class="p-6 bg-amber-50/50 border border-amber-200 rounded-3xl space-y-4">
                                    <div class="flex items-center justify-between border-b border-amber-200/80 pb-3">
                                        <div class="flex items-center gap-3">
                                            <span
                                                class="w-7 h-7 rounded-xl bg-amber-500 text-white flex items-center justify-center font-black text-xs">2</span>
                                            <h4 class="text-sm font-black text-slate-900">Bagian 2: Kebutuhan Pelatihan
                                                Mendatang</h4>
                                        </div>
                                        <span
                                            class="text-[10px] font-black text-amber-800 bg-amber-100 px-2.5 py-1 rounded-full uppercase">Pilih
                                            Maksimal 3</span>
                                    </div>

                                    <div class="space-y-2">
                                        <label class="block text-xs font-extrabold text-slate-800"
                                            x-text="'3. ' + getQuestionText(3, 'Topik pelatihan apa yang paling mendesak dan relevan untuk usaha Anda tahun depan?')">
                                        </label>
                                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-2 pt-1">
                                            <template
                                                x-for="opsi in getQuestionOptions(3, ['Fasilitasi Sertifikasi (Halal/BPOM/SNI)', 'Digital Marketing & TikTok Shop', 'Manajemen Keuangan & Pembukuan', 'Desain Kemasan & Branding Produk', 'Peningkatan Kualitas & Inovasi Produk'])"
                                                :key="opsi">
                                                <label
                                                    class="flex items-center gap-2.5 p-3 bg-white border border-amber-200 rounded-xl text-xs font-semibold text-slate-800 hover:border-amber-400 cursor-pointer">
                                                    <input type="checkbox" name="topik_pelatihan_prioritas[]"
                                                        :value="opsi"
                                                        class="rounded text-amber-600 focus:ring-amber-500 w-4 h-4">
                                                    <span x-text="opsi"></span>
                                                </label>
                                            </template>
                                        </div>
                                    </div>

                                    <div
                                        class="grid grid-cols-1 sm:grid-cols-2 gap-4 pt-3 border-t border-amber-200/60">
                                        <div>
                                            <label class="block text-xs font-extrabold text-slate-800 mb-1"
                                                x-text="'4. ' + getQuestionText(4, 'Materi praktik spesifik yang paling ingin Anda pelajari secara langsung?')">
                                            </label>
                                            <input type="text" name="materi_praktik_spesifik"
                                                placeholder="Contoh: Cara membuat iklan FB/TikTok Ads..."
                                                class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-amber-500">
                                        </div>
                                        <div>
                                            <label class="block text-xs font-extrabold text-slate-800 mb-1"
                                                x-text="'5. ' + getQuestionText(5, 'Kebutuhan ilmu baru dalam menghadapi persaingan bisnis saat ini?')">
                                            </label>
                                            <input type="text" name="kebutuhan_ilmu_baru"
                                                placeholder="Contoh: Penggunaan AI untuk desain promosi..."
                                                class="w-full px-4 py-3 bg-white border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-amber-500">
                                        </div>
                                    </div>
                                </div>

                                {{-- Bagian 3 --}}
                                <div class="p-6 bg-slate-50 border border-slate-200 rounded-3xl space-y-4">
                                    <div class="flex items-center gap-3 border-b border-slate-200/80 pb-3">
                                        <span
                                            class="w-7 h-7 rounded-xl bg-slate-800 text-white flex items-center justify-center font-black text-xs">3</span>
                                        <h4 class="text-sm font-black text-slate-900">Bagian 3: Komitmen & Preferensi
                                            Pelatihan</h4>
                                    </div>

                                    <div class="space-y-2">
                                        <label class="block text-xs font-extrabold text-slate-800"
                                            x-text="'6. ' + getQuestionText(6, 'Metode pelatihan apa yang paling efektif bagi Anda?')">
                                        </label>
                                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-2 pt-1">
                                            <template
                                                x-for="(opsi, idx) in getQuestionOptions(6, ['Kelas tatap muka', 'Pelatihan daring/Zoom', 'Pendampingan langsung (On-site)'])"
                                                :key="opsi">
                                                <label
                                                    class="flex items-center gap-2.5 p-3 bg-white border border-slate-200 rounded-xl text-xs font-semibold text-slate-800 cursor-pointer">
                                                    <input type="radio" name="metode_efektif" :value="opsi"
                                                        :checked="idx === 0"
                                                        class="text-emerald-600 focus:ring-emerald-500 w-4 h-4">
                                                    <span x-text="opsi"></span>
                                                </label>
                                            </template>
                                        </div>
                                    </div>

                                    <div class="space-y-2 pt-3 border-t border-slate-200/60">
                                        <label class="block text-xs font-extrabold text-slate-800"
                                            x-text="'7. ' + getQuestionText(7, 'Apakah Anda berkomitmen menerapkan hasil pelatihan demi kemajuan usaha?')">
                                        </label>
                                        <div class="flex gap-4 pt-1">
                                            <template x-for="(opsi, idx) in getQuestionOptions(7, ['Ya', 'Tidak'])"
                                                :key="opsi">
                                                <label
                                                    class="flex-1 flex items-center gap-2.5 p-3 bg-white border rounded-xl text-xs font-black text-slate-900 cursor-pointer"
                                                    :class="opsi.toLowerCase().includes('ya') ? 'border-emerald-300' : 'border-slate-200'">
                                                    <input type="radio" name="komitmen_penerapan" :value="opsi"
                                                        :checked="idx === 0"
                                                        class="text-emerald-600 focus:ring-emerald-500 w-4 h-4">
                                                    <span
                                                        x-text="opsi.toLowerCase().includes('ya') ? '✅ ' + opsi : (opsi.toLowerCase().includes('tidak') ? '❌ ' + opsi : opsi)"></span>
                                                </label>
                                            </template>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex justify-end pt-2">
                                    <button type="button" @click="submitTnaDigital()"
                                        class="w-full sm:w-auto px-8 py-3.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl font-black text-xs transition shadow-lg shadow-emerald-600/30 flex items-center justify-center gap-2">
                                        <span>🚀 Kirim Assessment & Masuk Antrean Pelatihan</span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Success Pop-Up TNA Digital (5 Seconds Auto-Close) -->
        <div x-show="showTnaModal"
            class="fixed inset-0 z-[2000] flex items-center justify-center p-4 bg-black/70 backdrop-blur-md"
            x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0 scale-95"
            x-transition:enter-end="opacity-100 scale-100" x-transition:leave="transition ease-in duration-200"
            x-transition:leave-start="opacity-100 scale-100" x-transition:leave-end="opacity-0 scale-95" x-cloak>
            <div
                class="bg-white rounded-[36px] max-w-lg w-full p-8 shadow-2xl space-y-6 text-center relative border border-emerald-100">
                <div
                    class="w-20 h-20 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto shadow-inner text-4xl animate-bounce">
                    🎉
                </div>

                <div class="space-y-2">
                    <h3 class="text-2xl font-black text-slate-900 tracking-tight">TNA Digital Berhasil Dikirim!</h3>
                    <p class="text-xs font-bold text-slate-600 leading-relaxed">
                        TNA Digital telah berhasil dikirim, Terima kasih dan sampai bertemu kembali di pelatihan
                        lainnya.
                    </p>
                </div>

                <!-- Progress countdown bar -->
                <div class="space-y-2 pt-2">
                    <div
                        class="w-full bg-slate-100 h-2.5 rounded-full overflow-hidden relative border border-slate-200/60">
                        <div class="bg-emerald-500 h-full transition-all duration-1000 ease-linear"
                            :style="'width: ' + (tnaCountdown / 5 * 100) + '%'"></div>
                    </div>
                    <p class="text-[10px] font-black uppercase tracking-wider text-slate-400">
                        Menutup otomatis dalam <span class="text-emerald-600 font-bold" x-text="tnaCountdown"></span>
                        detik
                    </p>
                </div>

                <button type="button" @click="closeTnaModal()"
                    class="w-full py-3.5 bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl text-xs font-black shadow-lg shadow-emerald-600/30 transition">
                    Tutup & Kembali
                </button>
            </div>
        </div>
    </main>

    {{-- Simple Minimal Footer --}}
    <footer class="bg-white border-t border-slate-100 py-6 relative z-10">
        <div
            class="max-w-7xl mx-auto px-6 lg:px-8 flex flex-col sm:flex-row justify-between items-center gap-4 text-xs text-slate-400 font-medium">
            <p>© {{ date('Y') }} Pemerintah Kota Madiun — Dashboard IKM JUARA.</p>
            <p>Developed by Bidang Perindustrian, Dinas Tenaga Kerja, KUKM Kota Madiun.</p>
        </div>
    </footer>

    {{-- SCRIPTS --}}
    <script>
        function dashboardApp() {
            return {
                init() {
                    this.initMobileNav();
                },
                initMobileNav() {
                    const btn = document.getElementById('mobile-nav-btn');
                    const menu = document.getElementById('mobile-nav-menu');
                    if (btn && menu) {
                        btn.addEventListener('click', () => menu.classList.toggle('hidden'));
                    }
                }
            };
        }

        function pemutakhiranHandler() {
            return {
                searchQuery: '',
                searchMode: 'all',
                isLoading: false,
                errorMessage: '',
                ikmData: null,
                proposalStatus: null,
                adminNote: '',
                isNewRegistration: false,
                isEditMode: false,
                showRegisterOption: false,
                showRegisterModal: false,
                isSubmittingRegister: false,
                registerForm: {
                    nama_usaha: '',
                    pemilik: '',
                    nik: '',
                    nib: '',
                    no_hp: '',
                    kategori: 'Pangan',
                    produk: '',
                    skala_usaha: 'Mikro',
                    tingkat_risiko: 'Rendah',
                    kbli: '',
                    uraian_kbli: '',
                    alamat_jalan: '',
                    kecamatan: 'Kartoharjo',
                    kelurahan: 'Kartoharjo',
                    investasi: 0,
                    tenaga_kerja: 1,
                    latitude: '',
                    longitude: ''
                },
                registerKbliSuggestions: [],
                showRegisterKbliSuggestions: false,
                madiunKelurahanMap: {
                    'Kartoharjo': ['Kartoharjo', 'Kanigoro', 'Kelun', 'Klegen', 'Oro-Oro Ombo', 'Tawangrejo', 'Rejomulyo', 'Sukosari', 'Pilangbango'],
                    'Manguharjo': ['Manguharjo', 'Pangerangan', 'Nambangan Lor', 'Nambangan Kidul', 'Yosomulyo', 'Sogaten', 'Staboro', 'Winongo', 'Madiun Lor'],
                    'Taman': ['Taman', 'Pandean', 'Banjarejosari', 'Demangan', 'Josenan', 'Kejuron', 'Kuncen', 'Mojorejo', 'Manisrejo']
                },
                getKelurahanOptions(kec) {
                    return this.madiunKelurahanMap[kec] || ['Kartoharjo'];
                },
                onRegisterKecamatanChange() {
                    const list = this.getKelurahanOptions(this.registerForm.kecamatan);
                    if (list && list.length > 0) {
                        this.registerForm.kelurahan = list[0];
                    }
                },
                onRegisterKbliInput() {
                    const q = (this.registerForm.kbli || '').trim();
                    if (q.length < 2) {
                        this.registerKbliSuggestions = [];
                        this.showRegisterKbliSuggestions = false;
                        return;
                    }
                    fetch(`/api/cari-kbli?q=${encodeURIComponent(q)}`)
                        .then(res => res.json())
                        .then(data => {
                            this.registerKbliSuggestions = data || [];
                            this.showRegisterKbliSuggestions = this.registerKbliSuggestions.length > 0;
                        })
                        .catch(() => {
                            this.registerKbliSuggestions = [];
                            this.showRegisterKbliSuggestions = false;
                        });
                },
                selectRegisterKbli(item) {
                    this.registerForm.kbli = item.kode;
                    this.registerForm.uraian_kbli = item.judul;
                    this.showRegisterKbliSuggestions = false;
                },
                startRegistration() {
                    this.showRegisterModal = true;
                    const q = (this.searchQuery || '').trim();
                    if (/^\d{16}$/.test(q)) {
                        this.registerForm.nik = q;
                    } else if (/^\d{13}$/.test(q)) {
                        this.registerForm.nib = q;
                    } else if (q) {
                        this.registerForm.nama_usaha = q;
                    }
                },
                submitRegistration() {
                    if (!this.registerForm.nama_usaha || !this.registerForm.pemilik || !this.registerForm.nik || !this.registerForm.nib || !this.registerForm.alamat_jalan || !this.registerForm.produk) {
                        this.showToast('Mohon lengkapi seluruh kolom wajib bertanda (*)', 'danger');
                        return;
                    }
                    if (!/^\d{16}$/.test(this.registerForm.nik)) {
                        this.showToast('Nomor NIK harus berupa tepat 16 digit angka.', 'danger');
                        return;
                    }
                    if (!/^\d{13}$/.test(this.registerForm.nib)) {
                        this.showToast('Nomor NIB harus berupa tepat 13 digit angka.', 'danger');
                        return;
                    }
                    this.isSubmittingRegister = true;
                    const payload = {
                        peta_sebaran_id: null,
                        nib: this.registerForm.nib,
                        nik: this.registerForm.nik,
                        nama_usaha: this.registerForm.nama_usaha,
                        pemilik: this.registerForm.pemilik,
                        no_hp: this.registerForm.no_hp,
                        produk: this.registerForm.produk,
                        alamat_jalan: this.registerForm.alamat_jalan,
                        kecamatan: this.registerForm.kecamatan,
                        kelurahan: this.registerForm.kelurahan,
                        kategori: this.registerForm.kategori,
                        skala_usaha: this.registerForm.skala_usaha,
                        tingkat_risiko: this.registerForm.tingkat_risiko,
                        kbli: this.registerForm.kbli,
                        uraian_kbli: this.registerForm.uraian_kbli,
                        investasi: this.registerForm.investasi,
                        tenaga_kerja: this.registerForm.tenaga_kerja,
                        latitude: this.registerForm.latitude,
                        longitude: this.registerForm.longitude,
                        tipe_usulan: 'baru'
                    };
                    fetch('/usul-ubah-ikm', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body: JSON.stringify(payload)
                    })
                        .then(async res => {
                            const data = await res.json();
                            this.isSubmittingRegister = false;
                            if (res.ok && data.success) {
                                this.showRegisterModal = false;
                                this.showToast('Terima Kasih! Data Pendaftaran Pelaku Usaha Baru telah berhasil dikirim dan menunggu verifikasi Admin Dinas.', 'success', 5000);
                                this.registerForm = {
                                    nama_usaha: '',
                                    pemilik: '',
                                    nik: '',
                                    nib: '',
                                    no_hp: '',
                                    kategori: 'Pangan',
                                    produk: '',
                                    skala_usaha: 'Mikro',
                                    tingkat_risiko: 'Rendah',
                                    kbli: '',
                                    uraian_kbli: '',
                                    alamat_jalan: '',
                                    kecamatan: 'Kartoharjo',
                                    kelurahan: 'Kartoharjo',
                                    investasi: 0,
                                    tenaga_kerja: 1,
                                    latitude: '',
                                    longitude: ''
                                };
                            } else {
                                const errText = data.message || (data.errors ? Object.values(data.errors).flat().join(', ') : 'Gagal mengirimkan pendaftaran pelaku usaha baru.');
                                this.showToast(errText, 'danger');
                            }
                        })
                        .catch(err => {
                            this.isSubmittingRegister = false;
                            this.showToast('Terjadi kesalahan jaringan saat mengirimkan usulan.', 'danger');
                        });
                },
                activeTab: 'profil',
                consultations: [],
                activeConsultation: null,
                userReplyText: '',
                chatPollInterval: null,
                kategoriOptions: [],
                showNewConsultationForm: false,
                kbliSuggestions: [],
                showKbliSuggestions: false,
                consultationForm: {
                    jenis_usaha: 'Pendampingan Manajemen Usaha',
                    keluhan: ''
                },
                selectedTnaTopics: [],
                showTnaModal: false,
                tnaCountdown: 5,
                tnaTimer: null,
                hasSubmittedTna: false,
                tnaSubmittedAt: '',
                showTnaFormAgain: false,
                tnaDeclined: false,
                tnaQuestions: @json($tnaPertanyaanList ?? []),
                originalFormData: {},

                init() {
                    this.fetchKategoriOptions();
                    this.fetchTnaQuestions();
                },

                fetchTnaQuestions() {
                    fetch('/api/tnadigital/pertanyaan')
                        .then(res => res.json())
                        .then(res => {
                            if (res.success && res.data && res.data.length > 0) {
                                this.tnaQuestions = res.data;
                            }
                        })
                        .catch(() => { });
                },

                getQuestionText(nomor, defaultVal) {
                    if (!this.tnaQuestions || this.tnaQuestions.length === 0) return defaultVal;
                    const q = this.tnaQuestions.find(item => item.nomor_soal == nomor);
                    return (q && q.teks_pertanyaan) ? q.teks_pertanyaan : defaultVal;
                },

                getQuestionOptions(nomor, defaultArr) {
                    if (!this.tnaQuestions || this.tnaQuestions.length === 0) return defaultArr;
                    const q = this.tnaQuestions.find(item => item.nomor_soal == nomor);
                    return (q && Array.isArray(q.opsi_jawaban) && q.opsi_jawaban.length > 0) ? q.opsi_jawaban : defaultArr;
                },

                formatTnaDate(dateObj) {
                    if (!dateObj) return '';
                    const d = new Date(dateObj);
                    if (isNaN(d.getTime())) return String(dateObj);
                    const months = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
                    const day = d.getDate();
                    const month = months[d.getMonth()];
                    const year = d.getFullYear();
                    const hours = String(d.getHours()).padStart(2, '0');
                    const minutes = String(d.getMinutes()).padStart(2, '0');
                    return `${day} ${month} ${year} jam ${hours}:${minutes} WIB`;
                },

                submitTnaDigital() {
                    const formEl = document.getElementById('tnaForm');
                    if (!formEl) return;
                    const formData = new FormData(formEl);

                    if (!formData.get('nama_usaha')) {
                        formData.set('nama_usaha', this.form.nama_usaha || this.form.pemilik || 'Pelaku IKM JUARA');
                    }
                    if (!formData.get('pemilik')) {
                        formData.set('pemilik', this.form.pemilik || this.form.nama_usaha || 'Pelaku IKM JUARA');
                    }

                    fetch('/api/tnadigital/store', {
                        method: 'POST',
                        headers: {
                            'Accept': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body: formData
                    })
                        .then(res => res.json())
                        .then(res => {
                            if (res.success) {
                                this.hasSubmittedTna = true;
                                this.tnaSubmittedAt = this.formatTnaDate(new Date());
                                this.showTnaFormAgain = false;
                                this.tnaDeclined = false;
                                this.triggerTnaSuccessModal();
                            } else {
                                this.showToast(res.message || 'Gagal mengirimkan assessment TNA Digital.', 'danger');
                            }
                        })
                        .catch(err => {
                            this.showToast('Terjadi kesalahan jaringan saat mengirimkan assessment.', 'danger');
                        });
                },

                triggerTnaSuccessModal() {
                    this.showTnaModal = true;
                    this.tnaCountdown = 5;
                    if (this.tnaTimer) clearInterval(this.tnaTimer);

                    this.tnaTimer = setInterval(() => {
                        this.tnaCountdown--;
                        if (this.tnaCountdown <= 0) {
                            this.closeTnaModal();
                        }
                    }, 1000);
                },

                closeTnaModal() {
                    this.showTnaModal = false;
                    if (this.tnaTimer) {
                        clearInterval(this.tnaTimer);
                        this.tnaTimer = null;
                    }
                },

                init() {
                    this.fetchKategoriOptions();
                },

                fetchKategoriOptions() {
                    fetch('/api/kategori-konsultasi')
                        .then(res => res.json())
                        .then(res => {
                            if (res.success && res.data && res.data.length > 0) {
                                this.kategoriOptions = res.data;
                                if (!this.consultationForm.jenis_usaha) {
                                    this.consultationForm.jenis_usaha = res.data[0].nama_kategori;
                                }
                            }
                        })
                        .catch(() => { });
                },

                selectConsultation(item) {
                    this.activeConsultation = item;
                    this.startChatPolling();
                    this.$nextTick(() => {
                        const el = document.getElementById('userChatBox');
                        if (el) el.scrollTop = el.scrollHeight;
                    });
                },

                startChatPolling() {
                    this.stopChatPolling();
                    if (!this.activeConsultation || !this.activeConsultation.id) return;

                    this.chatPollInterval = setInterval(() => {
                        if (!this.activeConsultation || !this.activeConsultation.id) {
                            this.stopChatPolling();
                            return;
                        }
                        fetch('/api/konsultasi/' + this.activeConsultation.id + '/messages')
                            .then(res => res.json())
                            .then(res => {
                                if (res.success) {
                                    if (JSON.stringify(this.activeConsultation.messages) !== JSON.stringify(res.messages) || this.activeConsultation.status !== res.status) {
                                        this.activeConsultation.messages = res.messages;
                                        this.activeConsultation.status = res.status;
                                    }
                                }
                            })
                            .catch(() => { });
                    }, 3000);
                },

                stopChatPolling() {
                    if (this.chatPollInterval) {
                        clearInterval(this.chatPollInterval);
                        this.chatPollInterval = null;
                    }
                },

                sendUserChatMessage() {
                    const text = (this.userReplyText || '').trim();
                    if (!text) return;
                    if (!this.activeConsultation || !this.activeConsultation.id) return;

                    const payload = {
                        konsultasi_id: this.activeConsultation.id,
                        pesan: text
                    };

                    fetch('/api/kirim-pesan-user', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body: JSON.stringify(payload)
                    })
                        .then(res => res.json())
                        .then(res => {
                            if (res.success) {
                                if (!this.activeConsultation.messages) this.activeConsultation.messages = [];
                                this.activeConsultation.messages.push(res.data);
                                this.userReplyText = '';
                                this.$nextTick(() => {
                                    const el = document.getElementById('userChatBox');
                                    if (el) el.scrollTop = el.scrollHeight;
                                });
                            } else {
                                this.showToast(res.message || 'Gagal mengirim pesan.', 'danger');
                            }
                        })
                        .catch(() => {
                            this.showToast('Gagal terhubung ke server.', 'danger');
                        });
                },

                form: {
                    peta_sebaran_id: '',
                    nib: '',
                    nik: '',
                    nama_usaha: '',
                    pemilik: '',
                    no_hp: '',
                    produk: '',
                    alamat_jalan: '',
                    kecamatan: 'Kartoharjo',
                    kelurahan: '',
                    kategori: 'Pangan',
                    skala_usaha: 'Mikro',
                    tingkat_risiko: 'Rendah',
                    kbli: '',
                    uraian_kbli: '',
                    investasi: 0,
                    tenaga_kerja: 1,
                    status_halal: 'Belum',
                    no_halal: '',
                    status_bpom_cppob: 'Belum',
                    no_bpom_cppob: '',
                    status_sni: 'Belum',
                    no_sni: '',
                    status_hki_merek: 'Belum',
                    no_hki_merek: '',
                    nama_merek: '',
                    latitude: '',
                    longitude: ''
                },

                toast: {
                    show: false,
                    message: '',
                    type: 'success',
                    timer: null,
                    progressWidth: 100
                },

                enableEditMode() {
                    if (this.proposalStatus === 'pending') {
                        this.showToast('Usulan perubahan data profil Anda masih dalam tahap antrian verifikasi admin dinas di /dukungan/usuldata.', 'warning');
                        return;
                    }
                    this.isEditMode = true;
                },

                cancelEditMode() {
                    this.isEditMode = false;
                    // Revert form to loaded original data
                    if (this.originalFormData) {
                        this.form = JSON.parse(JSON.stringify(this.originalFormData));
                    }
                },

                onKbliInput() {
                    const q = (this.form.kbli || '').trim();
                    if (q.length < 2) {
                        this.kbliSuggestions = [];
                        this.showKbliSuggestions = false;
                        return;
                    }
                    fetch(`/api/cari-kbli?q=${encodeURIComponent(q)}`)
                        .then(res => res.json())
                        .then(data => {
                            this.kbliSuggestions = data || [];
                            this.showKbliSuggestions = this.kbliSuggestions.length > 0;
                        })
                        .catch(() => {
                            this.kbliSuggestions = [];
                            this.showKbliSuggestions = false;
                        });
                },

                selectKbli(item) {
                    this.form.kbli = item.kode;
                    this.form.uraian_kbli = item.judul;
                    this.showKbliSuggestions = false;
                },

                checkMaxTopikTna(e, topik) {
                    if (e.target.checked) {
                        if (this.selectedTnaTopics.length >= 3) {
                            e.target.checked = false;
                            alert('Anda hanya dapat memilih maksimal 3 topik pelatihan yang paling mendesak!');
                        } else {
                            if (!this.selectedTnaTopics.includes(topik)) {
                                this.selectedTnaTopics.push(topik);
                            }
                        }
                    } else {
                        this.selectedTnaTopics = this.selectedTnaTopics.filter(t => t !== topik);
                    }
                },

                setSearchMode(mode) {
                    this.searchMode = mode;
                    this.errorMessage = '';
                    this.showRegisterOption = false;
                },
                handleSearchInput() {
                    this.errorMessage = '';
                    if (/[a-zA-Z]/.test(this.searchQuery) && (this.searchMode === 'nib' || this.searchMode === 'nik')) {
                        this.searchMode = 'nama';
                    }
                },
                getSearchPlaceholder() {
                    if (this.searchMode === 'nib') return 'Masukkan 13 digit Nomor NIB...';
                    if (this.searchMode === 'nik') return 'Masukkan 16 digit Nomor NIK...';
                    if (this.searchMode === 'nama') return 'Masukkan Nama Pelaku Usaha atau Nama Usaha...';
                    return 'Cari data IKM via NIB, NIK, atau Nama Usaha...';
                },

                showToast(message, type = 'success') {
                    if (this.toast.timer) {
                        clearInterval(this.toast.timer);
                    }
                    this.toast.message = message;
                    this.toast.type = type;
                    this.toast.show = true;
                    this.toast.progressWidth = 100;

                    const duration = 3500;
                    const intervalTime = 10;
                    const step = (intervalTime / duration) * 100;

                    this.toast.timer = setInterval(() => {
                        this.toast.progressWidth -= step;
                        if (this.toast.progressWidth <= 0) {
                            this.toast.progressWidth = 0;
                            this.toast.show = false;
                            clearInterval(this.toast.timer);
                        }
                    }, intervalTime);
                },

                closeToast() {
                    this.toast.show = false;
                    if (this.toast.timer) {
                        clearInterval(this.toast.timer);
                    }
                },

                search() {
                    const q = (this.searchQuery || '').trim();
                    if (!q) {
                        this.errorMessage = 'Nomor NIB, NIK, atau Nama Pelaku Usaha tidak boleh kosong.';
                        this.showRegisterOption = false;
                        return;
                    }

                    if (this.searchMode === 'nib' && !/^\d{13}$/.test(q)) {
                        this.errorMessage = 'Nomor NIB harus berupa tepat 13 digit angka.';
                        this.showRegisterOption = false;
                        return;
                    }

                    if (this.searchMode === 'nik' && !/^\d{16}$/.test(q)) {
                        this.errorMessage = 'Nomor NIK harus berupa tepat 16 digit angka.';
                        this.showRegisterOption = false;
                        return;
                    }

                    this.isLoading = true;
                    this.errorMessage = '';
                    this.ikmData = null;
                    this.isEditMode = false;
                    this.showRegisterOption = false;

                    let targetMode = this.searchMode;
                    if (/[a-zA-Z]/.test(q)) {
                        targetMode = 'nama';
                    }

                    fetch(`/api/cari-ikm?query=${encodeURIComponent(q)}&mode=${targetMode}`)
                        .then(res => res.json())
                        .then(res => {
                            this.isLoading = false;
                            if (res.success && res.data) {
                                this.ikmData = res.data;
                                this.proposalStatus = res.status_usulan || null;
                                this.adminNote = res.catatan_admin || null;
                                this.isNewRegistration = false;
                                this.isEditMode = false;

                                // Prepopulate FULL PetaSebaran Dataset
                                this.form.peta_sebaran_id = res.data.id || '';
                                this.form.nib = res.data.nib || '';
                                this.form.nik = res.data.nik || '';
                                this.form.nama_usaha = res.data.nama_usaha || res.data.nama_perusahaan || '';
                                this.form.pemilik = res.data.pemilik || res.data.nama_pemilik || '';
                                this.form.no_hp = res.data.no_hp || res.data.no_telp || '';
                                this.form.produk = res.data.produk || res.data.nama_proyek || '';
                                this.form.alamat_jalan = res.data.alamat_jalan || res.data.alamat_usaha || '';
                                this.form.kecamatan = res.data.kecamatan || 'Kartoharjo';
                                this.form.kelurahan = res.data.kelurahan || '';
                                this.form.kategori = res.data.kategori || 'Pangan';
                                this.form.skala_usaha = res.data.skala_usaha || 'Mikro';
                                this.form.tingkat_risiko = res.data.tingkat_risiko || 'Rendah';
                                this.form.kbli = res.data.kbli || '';
                                this.form.uraian_kbli = res.data.uraian_kbli || '';
                                this.form.investasi = res.data.investasi || 0;
                                this.form.tenaga_kerja = res.data.tenaga_kerja || 1;
                                this.form.status_halal = res.data.status_halal || 'Belum';
                                this.form.no_halal = res.data.no_halal || '';
                                this.form.status_bpom_cppob = res.data.status_bpom_cppob || 'Belum';
                                this.form.no_bpom_cppob = res.data.no_bpom_cppob || '';
                                this.form.status_sni = res.data.status_sni || 'Belum';
                                this.form.no_sni = res.data.no_sni || '';
                                this.form.status_hki_merek = res.data.status_hki_merek || 'Belum';
                                this.form.no_hki_merek = res.data.no_hki_merek || '';
                                this.form.nama_merek = res.data.nama_merek || '';
                                this.form.latitude = res.data.latitude || '';
                                this.form.longitude = res.data.longitude || '';

                                // Backup original form data for cancelation
                                this.originalFormData = JSON.parse(JSON.stringify(this.form));

                                this.consultations = res.konsultasi || [];
                                if (this.consultations.length > 0) {
                                    this.selectConsultation(this.consultations[0]);
                                } else {
                                    this.activeConsultation = null;
                                }

                                if (res.tna && res.tna.created_at) {
                                    this.hasSubmittedTna = true;
                                    this.tnaSubmittedAt = this.formatTnaDate(res.tna.created_at);
                                    this.showTnaFormAgain = false;
                                    this.tnaDeclined = false;
                                } else {
                                    this.hasSubmittedTna = false;
                                    this.tnaSubmittedAt = '';
                                    this.showTnaFormAgain = false;
                                    this.tnaDeclined = false;
                                }

                                this.activeTab = 'profil';
                                this.showNewConsultationForm = false;
                            } else {
                                this.errorMessage = res.message || 'Data IKM tidak ditemukan.';
                                if (res.message && res.message.includes('tidak ditemukan')) {
                                    this.showRegisterOption = true;
                                }
                            }
                        })
                        .catch(err => {
                            this.isLoading = false;
                            this.errorMessage = 'Terjadi kesalahan jaringan saat memproses pencarian.';
                        });
                },

                submitProposal() {
                    const payload = JSON.parse(JSON.stringify(this.form));
                    if (payload.investasi !== null && payload.investasi !== undefined) {
                        payload.investasi = String(payload.investasi).replace(/\./g, '').replace(/,/g, '.');
                    }

                    fetch('/usul-ubah-ikm', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body: JSON.stringify(payload)
                    })
                        .then(async res => {
                            const data = await res.json();
                            if (res.ok && data.success) {
                                this.showToast(data.message, 'success');
                                this.proposalStatus = 'pending';
                                this.isEditMode = false;
                            } else {
                                const errText = data.message || (data.errors ? Object.values(data.errors).flat().join(', ') : 'Gagal mengirimkan usulan perubahan.');
                                this.showToast(errText, 'danger');
                            }
                        })
                        .catch(err => {
                            this.showToast('Terjadi kesalahan koneksi saat mengirimkan usulan: ' + (err.message || err), 'danger');
                        });
                },

                submitConsultation() {
                    if (!this.consultationForm.keluhan.trim()) {
                        this.showToast('Deskripsi keluhan atau pendampingan wajib diisi.', 'danger');
                        return;
                    }

                    let userEmail = (this.form.no_hp || '').trim();
                    if (!userEmail || !userEmail.includes('@')) {
                        userEmail = (userEmail ? userEmail.replace(/[^0-9]/g, '') : 'pelaku') + '@ikmjuara.com';
                    }

                    const payload = {
                        nama_ikm: this.form.nama_usaha || this.form.pemilik || 'Pelaku Usaha',
                        email: userEmail,
                        nik: this.form.nik || '0000000000000000',
                        jenis_usaha: this.consultationForm.jenis_usaha,
                        keluhan: this.consultationForm.keluhan
                    };

                    fetch('/api/buat-konsultasi', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body: JSON.stringify(payload)
                    })
                        .then(res => res.json())
                        .then(res => {
                            if (res.success && res.data) {
                                this.showToast(res.message || 'Sesi konsultasi berhasil dibuka!', 'success');
                                this.consultations.unshift(res.data);
                                this.selectConsultation(res.data);
                                this.consultationForm.keluhan = '';
                                this.showNewConsultationForm = false;
                            } else {
                                this.showToast(res.message || 'Gagal mengirimkan pengajuan.', 'danger');
                            }
                        })
                        .catch(err => {
                            this.showToast('Terjadi kesalahan jaringan.', 'danger');
                        });
                }
            };
        }
    </script>
</body>

</html>