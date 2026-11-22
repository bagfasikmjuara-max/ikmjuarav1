<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Admin Form Builder & Manager - IKM Juara</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background-color: #0b1329; 
            color: #f8fafc;
        }
        .glass-panel {
            background: rgba(30, 41, 59, 0.4);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.08);
            box-shadow: 0 20px 40px -15px rgba(0, 0, 0, 0.5);
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.06);
            transition: all 0.25s ease;
        }
        .glass-card:hover {
            border-color: rgba(245, 158, 11, 0.25);
            background: rgba(255, 255, 255, 0.05);
        }
        .input-glass {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }
        .input-glass:focus {
            border-color: #f59e0b;
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 0 0 4px rgba(245, 158, 11, 0.1);
        }

        /* Select Option Styling for Dark Mode */
        select option {
            background-color: #0f172a !important;
            color: #ffffff !important;
            padding: 10px !important;
        }

        /* High Specificity Light Mode CSS Overrides */
        html.light-mode,
        html.light-mode body,
        #app-body.light-mode {
            background-color: #f1f5f9 !important;
            background: #f1f5f9 !important;
            color: #0f172a !important;
        }

        html.light-mode #app-body .pointer-events-none.-z-10,
        html.light-mode #app-body [class*="blur-[140px]"],
        #app-body.light-mode .pointer-events-none.-z-10 {
            display: none !important;
        }

        /* EVERY Questionnaire Panel & Card MUST BE SOLID OPAQUE PURE WHITE */
        html.light-mode #app-body header,
        html.light-mode #app-body .glass-panel,
        html.light-mode #app-body .glass-card,
        html.light-mode #app-body div.glass-panel,
        html.light-mode #app-body div.glass-card,
        #app-body.light-mode header,
        #app-body.light-mode .glass-panel,
        #app-body.light-mode .glass-card {
            background-color: #ffffff !important;
            background: #ffffff !important;
            backdrop-filter: none !important;
            -webkit-backdrop-filter: none !important;
            border: 1px solid #cbd5e1 !important;
            color: #0f172a !important;
            box-shadow: 0 4px 20px -2px rgba(15, 23, 42, 0.08) !important;
        }

        html.light-mode #app-body .glass-card:hover,
        #app-body.light-mode .glass-card:hover {
            border-color: #f59e0b !important;
            background-color: #fffbeb !important;
            box-shadow: 0 4px 12px rgba(245, 158, 11, 0.12) !important;
        }

        /* Inputs, Textareas, Date Inputs, Select Controls */
        html.light-mode #app-body input,
        html.light-mode #app-body textarea,
        html.light-mode #app-body select,
        html.light-mode #app-body .input-glass,
        #app-body.light-mode input,
        #app-body.light-mode textarea,
        #app-body.light-mode select {
            background-color: #ffffff !important;
            background: #ffffff !important;
            border: 1px solid #cbd5e1 !important;
            color: #0f172a !important;
            font-weight: 700 !important;
        }

        html.light-mode #app-body input::placeholder,
        html.light-mode #app-body textarea::placeholder,
        #app-body.light-mode input::placeholder {
            color: #64748b !important;
            font-weight: 500 !important;
        }

        html.light-mode #app-body input:focus,
        html.light-mode #app-body select:focus,
        html.light-mode #app-body textarea:focus,
        #app-body.light-mode input:focus {
            border-color: #f59e0b !important;
            background-color: #ffffff !important;
            box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.2) !important;
        }

        /* Text Overrides for Light Mode: All text becomes dark slate / black */
        html.light-mode #app-body .text-white,
        html.light-mode #app-body .text-slate-100,
        html.light-mode #app-body .text-slate-200,
        html.light-mode #app-body .text-slate-300,
        html.light-mode #app-body .text-slate-400,
        html.light-mode #app-body .text-slate-500,
        #app-body.light-mode .text-white,
        #app-body.light-mode .text-slate-100,
        #app-body.light-mode .text-slate-200,
        #app-body.light-mode .text-slate-300,
        #app-body.light-mode .text-slate-400,
        #app-body.light-mode .text-slate-500 {
            color: #0f172a !important;
        }

        /* Huruf yang semula berwarna kuning (Amber/Yellow) menjadi HITAM (#0f172a / #000000) */
        html.light-mode #app-body .text-amber-300,
        html.light-mode #app-body .text-amber-400,
        html.light-mode #app-body .text-amber-500,
        html.light-mode #app-body .text-amber-600,
        html.light-mode #app-body .text-yellow-300,
        html.light-mode #app-body .text-yellow-400,
        html.light-mode #app-body .text-yellow-500,
        #app-body.light-mode .text-amber-300,
        #app-body.light-mode .text-amber-400,
        #app-body.light-mode .text-amber-500,
        #app-body.light-mode .text-amber-600,
        #app-body.light-mode .text-yellow-300,
        #app-body.light-mode .text-yellow-400,
        #app-body.light-mode .text-yellow-500 {
            color: #0f172a !important;
            font-weight: 800 !important;
        }

        /* Badges, Tabs & Soft Containers */
        html.light-mode #app-body .bg-white\/5,
        html.light-mode #app-body .bg-white\/10,
        #app-body.light-mode .bg-white\/5,
        #app-body.light-mode .bg-white\/10 {
            background-color: #f1f5f9 !important;
            border-color: #cbd5e1 !important;
            color: #0f172a !important;
        }

        html.light-mode #app-body .bg-amber-500\/10,
        html.light-mode #app-body .bg-amber-500\/20,
        #app-body.light-mode .bg-amber-500\/10,
        #app-body.light-mode .bg-amber-500\/20 {
            background-color: #fef3c7 !important;
            border-color: #f59e0b !important;
            color: #0f172a !important;
        }

        html.light-mode #app-body .bg-emerald-500\/10,
        html.light-mode #app-body .bg-emerald-500\/20,
        #app-body.light-mode .bg-emerald-500\/10,
        #app-body.light-mode .bg-emerald-500\/20 {
            background-color: #d1fae5 !important;
            border-color: #10b981 !important;
            color: #065f46 !important;
        }

        /* Select Options in Dropdown */
        html.light-mode #app-body select option,
        #app-body.light-mode select option {
            background-color: #ffffff !important;
            color: #0f172a !important;
            font-weight: 700 !important;
        }

        html.light-mode #app-body select option:disabled,
        #app-body.light-mode select option:disabled {
            background-color: #f1f5f9 !important;
            color: #94a3b8 !important;
        }

        /* Modal Overrides */
        html.light-mode #app-body [id*="-modal"],
        #app-body.light-mode [id*="-modal"] {
            background-color: rgba(15, 23, 42, 0.65) !important;
            backdrop-filter: none !important;
        }

        /* Table Styling for Admin */
        html.light-mode #app-body th,
        #app-body.light-mode th {
            color: #334155 !important;
            border-bottom: 2px solid #cbd5e1 !important;
            background-color: #f8fafc !important;
        }

        html.light-mode #app-body td,
        #app-body.light-mode td {
            color: #0f172a !important;
            border-bottom: 1px solid #e2e8f0 !important;
        }
    </style>
</head>
<body id="app-body" class="min-h-screen flex flex-col relative overflow-x-hidden">

    <!-- Background Orbs -->
    <div class="fixed top-0 left-0 w-full h-full -z-10 overflow-hidden pointer-events-none">
        <div class="absolute top-[-10%] left-[-10%] w-[45%] h-[45%] bg-amber-500/10 rounded-full blur-[140px]"></div>
        <div class="absolute bottom-[-10%] right-[-10%] w-[45%] h-[45%] bg-emerald-500/10 rounded-full blur-[140px]"></div>
    </div>

    <!-- Navigation Bar -->
    <header class="w-full glass-panel sticky top-0 z-50 border-b border-white/10 px-6 py-4">
        <div class="max-w-7xl mx-auto flex items-center justify-between">
            <div class="flex items-center gap-3">
                <a href="{{ url('/') }}" class="text-xl font-black italic tracking-tighter text-white uppercase">
                    IKM<span class="text-amber-500">JUARA</span>
                </a>
                <span class="bg-amber-500/10 text-amber-400 border border-amber-500/20 text-[10px] font-black uppercase tracking-widest px-3 py-1 rounded-full">
                    Admin Form Builder & Manager
                </span>
            </div>

            <div class="flex items-center gap-3">
                <button type="button" onclick="toggleTheme()" id="theme-toggle-btn"
                    class="bg-amber-500/10 hover:bg-amber-500/20 border border-amber-500/30 text-amber-400 hover:text-amber-300 px-3.5 py-2 rounded-xl text-xs font-bold transition flex items-center gap-2 cursor-pointer">
                    <span id="theme-toggle-icon">☀️</span>
                    <span id="theme-toggle-text">Mode Terang</span>
                </button>
                <div class="hidden sm:flex items-center gap-2 bg-emerald-500/10 border border-emerald-500/20 px-3 py-1.5 rounded-full text-xs text-emerald-400 font-semibold">
                    <span class="w-2 h-2 rounded-full bg-emerald-500 animate-pulse"></span>
                    <span>Admin Mode (Kode: 232008)</span>
                </div>
                <a href="{{ route('login.dukungan') }}" 
                    class="bg-white/5 border border-white/10 hover:bg-white/10 text-slate-300 hover:text-white px-4 py-2 rounded-xl text-xs font-bold transition flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    <span>Keluar Portal</span>
                </a>
            </div>
        </div>
    </header>

    <!-- Main Admin Container -->
    <main class="flex-1 max-w-7xl w-full mx-auto p-4 md:p-8">
        
        <!-- Header Hero Banner -->
        <div class="glass-panel rounded-3xl p-6 md:p-8 mb-8 border border-white/10 relative overflow-hidden">
            <div class="relative z-10 flex flex-col md:flex-row md:items-center justify-between gap-6">
                <div>
                    <div class="inline-flex items-center gap-2 bg-amber-500/10 border border-amber-500/30 px-3 py-1 rounded-full text-amber-400 text-xs font-bold mb-3">
                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                        </svg>
                        <span>Portal Manajemen & Pembuat Form</span>
                    </div>
                    <h1 class="text-2xl md:text-3xl font-extrabold text-white tracking-tight mb-2">
                        Panel Kontrol <span class="text-amber-400">Form App Admin</span>
                    </h1>
                    <p class="text-slate-400 text-xs md:text-sm max-w-2xl leading-relaxed">
                        Kelola struktur pertanyaan, sesuaikan bobot skor per opsi jawaban, simpan template formulir, dan dapatkan **Link Akses Publik** yang siap dibagikan ke responden.
                    </p>
                </div>
            </div>
        </div>

        @if(session('success'))
            <div class="mb-6 bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 px-5 py-4 rounded-2xl text-xs font-bold flex items-center justify-between">
                <span>{{ session('success') }}</span>
                <button type="button" onclick="this.parentElement.remove()" class="text-emerald-400 hover:text-white">&times;</button>
            </div>
        @endif

        <!-- Admin Mode Switcher Tabs -->
        <div class="flex flex-wrap gap-3 mb-8 glass-panel p-2 rounded-2xl border border-white/10">
            <button type="button" onclick="switchAdminTab('builder')" id="tab-btn-builder"
                class="flex-1 min-w-[200px] py-3 px-5 text-xs font-extrabold rounded-xl transition duration-300 text-slate-950 bg-amber-500 shadow-lg flex items-center justify-center gap-2">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                </svg>
                <span>Form Builder & Pengaturan Skor</span>
            </button>

            <button type="button" onclick="switchAdminTab('links')" id="tab-btn-links"
                class="flex-1 min-w-[200px] py-3 px-5 text-xs font-extrabold rounded-xl transition duration-300 text-slate-400 hover:text-white flex items-center justify-center gap-2">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
                </svg>
                <span>Link Akses Terpublikasi ({{ count($templates) }})</span>
            </button>

            <button type="button" onclick="switchAdminTab('results')" id="tab-btn-results"
                class="flex-1 min-w-[200px] py-3 px-5 text-xs font-extrabold rounded-xl transition duration-300 text-slate-400 hover:text-white flex items-center justify-center gap-2">
                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                </svg>
                <span>Hasil Responden & Skor ({{ count($responses) }})</span>
            </button>
        </div>

        <!-- TAB 1: FORM BUILDER -->
        <div id="tab-content-builder" class="space-y-8">
            <form id="template-builder-form" onsubmit="saveTemplate(event)" class="space-y-8">
                @csrf
                <input type="hidden" id="builder-template-id" name="template_id" value="">

                <!-- Edit Mode Banner (Hidden by Default) -->
                <div id="edit-mode-banner" class="hidden glass-panel p-4 rounded-2xl border border-amber-500/40 bg-amber-500/10 text-amber-300 flex items-center justify-between text-xs font-bold">
                    <div class="flex items-center gap-2">
                        <span class="w-2.5 h-2.5 rounded-full bg-amber-400 animate-ping"></span>
                        <span id="edit-mode-text">Mode Edit Formulir Terpublikasi</span>
                    </div>
                    <button type="button" onclick="resetFormBuilder()" class="bg-amber-500/20 hover:bg-amber-500/30 text-white px-3 py-1 rounded-xl text-[11px] font-bold border border-amber-500/30 transition">
                        &times; Batal Edit / Buat Form Baru
                    </button>
                </div>

                <!-- Metadata Configuration -->
                <div class="glass-panel p-6 md:p-8 rounded-3xl border border-white/10 space-y-6">
                    <h2 class="text-lg font-bold text-amber-400 flex items-center gap-2 border-b border-white/10 pb-4">
                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                        </svg>
                        <span>Identitas Formulir Kuesioner</span>
                    </h2>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                        <div class="md:col-span-2">
                            <label class="block text-xs font-bold text-slate-300 mb-2">Judul Formulir Kuesioner <span class="text-red-400">*</span></label>
                            <input type="text" id="builder-title" name="title" required
                                value="KUESIONER EVALUASI PELATIHAN PENINGKATAN DAYA SAING IKM"
                                class="w-full input-glass rounded-xl px-4 py-3.5 text-sm font-bold text-white outline-none">
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-300 mb-2">Penyelenggara <span class="text-red-400">*</span></label>
                            <input type="text" id="builder-penyelenggara" name="penyelenggara" required
                                value="Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun"
                                class="w-full input-glass rounded-xl px-4 py-3.5 text-sm font-semibold text-white outline-none">
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-300 mb-2">Lokasi / Tempat Pelaksanaan <span class="text-red-400">*</span></label>
                            <input type="text" id="builder-lokasi" name="lokasi" required
                                value="Resto I Club Madiun (Aula Utama)"
                                class="w-full input-glass rounded-xl px-4 py-3.5 text-sm font-semibold text-white outline-none">
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-300 mb-2">Tanggal Mulai Pelaksanaan <span class="text-red-400">*</span></label>
                            <input type="date" id="builder-tanggal" name="tanggal" required
                                value="{{ date('Y-m-d') }}"
                                class="w-full input-glass rounded-xl px-4 py-3.5 text-sm font-semibold text-white outline-none">
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-300 mb-2">Tanggal Selesai Pelaksanaan <span class="text-slate-400 font-normal">(Opsional)</span></label>
                            <input type="date" id="builder-tanggal-selesai" name="tanggal_selesai"
                                value="{{ date('Y-m-d') }}"
                                class="w-full input-glass rounded-xl px-4 py-3.5 text-sm font-semibold text-white outline-none">
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-xs font-bold text-slate-300 mb-1">
                                Daftar Nama Peserta Pelatihan <span class="text-amber-400 font-normal">(Opsional - 1 Nama Per Baris)</span>
                            </label>
                            <p class="text-[11px] text-slate-400 mb-2">
                                Jika diisi, responden hanya dapat memilih nama dari daftar ini pada formulir. Setelah mengisi, nama peserta akan <strong>terkunci</strong> (tidak bisa mengisi 2 kali).
                            </p>
                            <textarea id="builder-peserta-list" name="peserta_list" rows="4"
                                class="w-full input-glass rounded-xl px-4 py-3 text-xs font-medium text-white outline-none placeholder:text-slate-500 font-mono"
                                placeholder="Masukkan nama peserta (1 nama per baris), contoh:&#10;Budi Santoso, S.T.&#10;Siti Rahmawati&#10;Ahmad Dahlan"></textarea>
                        </div>
                    </div>
                </div>

                <!-- Interactive Section & Question Structure Editor -->
                <div class="glass-panel p-6 md:p-8 rounded-3xl border border-white/10 space-y-8">
                    <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 border-b border-white/10 pb-4">
                        <div>
                            <h2 class="text-lg font-bold text-amber-400 flex items-center gap-2">
                                <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 10h16M4 14h16M4 18h16" />
                                </svg>
                                <span>Struktur Pertanyaan & Bobot Skor</span>
                            </h2>
                            <p class="text-xs text-slate-400 mt-1">Admin dapat menambah, mengedit pertanyaan, serta menentukan poin skor pada tiap opsi jawaban.</p>
                        </div>
                        <button type="button" onclick="addSection()" class="bg-white/10 hover:bg-white/20 text-white font-bold text-xs px-4 py-2.5 rounded-xl border border-white/10 transition flex items-center gap-2">
                            <span>+ Tambah Sub-Bagian Baru</span>
                        </button>
                    </div>

                    <!-- Container for Dynamic Sections -->
                    <div id="sections-container" class="space-y-8"></div>
                </div>

                <!-- Save Action Button -->
                <div class="glass-panel p-6 rounded-3xl border border-white/10 text-center">
                    <button type="submit" id="btn-save-template"
                        class="w-full md:w-auto px-10 py-4 bg-amber-500 hover:bg-amber-400 text-slate-950 font-black text-sm rounded-2xl shadow-xl shadow-amber-900/30 transition duration-300 uppercase tracking-wider flex items-center justify-center gap-3 mx-auto">
                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M8 7H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3m-1 4l-3 3m0 0l-3-3m3 3V4" />
                        </svg>
                        <span>Simpan Form & Generate Link Akses User</span>
                    </button>
                </div>
            </form>
        </div>

        <!-- TAB 2: PUBLISHED LINKS -->
        <div id="tab-content-links" class="space-y-6 hidden">
            <div class="glass-panel p-6 md:p-8 rounded-3xl border border-white/10">
                <h2 class="text-lg font-bold text-amber-400 mb-6 flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
                    </svg>
                    <span>Daftar Form Terpublikasi & Link Akses Bagikan</span>
                </h2>

                @if(count($templates) === 0)
                    <div class="text-center py-12 border border-dashed border-white/10 rounded-2xl">
                        <p class="text-slate-400 text-sm">Belum ada template form yang disimpan. Silakan buat form baru pada tab **Form Builder**.</p>
                    </div>
                @else
                    <div class="space-y-4">
                        @foreach($templates as $tmpl)
                            @php
                                $shareUrl = url('/formapp/kuesioner/' . $tmpl->slug);
                            @endphp
                            <div class="glass-card p-6 rounded-2xl flex flex-col md:flex-row md:items-center justify-between gap-4">
                                <div class="space-y-1">
                                    <div class="flex items-center gap-2">
                                        <h3 class="font-extrabold text-white text-base">{{ $tmpl->title }}</h3>
                                        @if($tmpl->is_active)
                                            <span class="bg-emerald-500/10 text-emerald-400 text-[10px] font-bold px-2.5 py-0.5 rounded-full border border-emerald-500/20">Aktif</span>
                                        @else
                                            <span class="bg-slate-700/50 text-slate-400 text-[10px] font-bold px-2.5 py-0.5 rounded-full border border-slate-600">Non-Aktif</span>
                                        @endif
                                    </div>
                                    <p class="text-xs text-slate-400">Penyelenggara: <span class="text-slate-200 font-semibold">{{ $tmpl->penyelenggara }}</span> &bull; Tanggal: {{ $tmpl->tanggal }}</p>
                                    <div class="pt-2">
                                        <span class="text-[10px] uppercase font-bold text-slate-400">Link Akses User:</span>
                                        <div class="flex items-center gap-2 mt-1">
                                            <input type="text" readonly value="{{ $shareUrl }}" class="bg-slate-900 border border-white/10 text-amber-400 text-xs font-mono px-3 py-1.5 rounded-lg w-full md:w-96 select-all outline-none">
                                            <button type="button" onclick="copyToClipboard('{{ $shareUrl }}')" class="bg-amber-500/10 hover:bg-amber-500/20 border border-amber-500/30 text-amber-400 text-xs font-bold px-3 py-1.5 rounded-lg transition flex items-center gap-1">
                                                <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
                                                </svg>
                                                <span>Salin Link</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex flex-wrap items-center gap-2 self-end md:self-center">
                                    <!-- Toggle Link Status Button -->
                                    <form action="{{ route('formapp.template.toggle', $tmpl->id) }}" method="POST" class="inline">
                                        @csrf
                                        @method('PATCH')
                                        @if($tmpl->is_active)
                                            <button type="submit" title="Klik untuk menonaktifkan link akses formulir"
                                                class="bg-emerald-500/15 hover:bg-emerald-500/25 border border-emerald-500/40 text-emerald-400 text-xs font-bold px-3.5 py-2 rounded-xl transition flex items-center gap-1.5 shadow-sm">
                                                <span class="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
                                                <span>Status: Aktif</span>
                                            </button>
                                        @else
                                            <button type="submit" title="Klik untuk mengaktifkan kembali link akses formulir"
                                                class="bg-slate-800 hover:bg-slate-700 border border-slate-600 text-slate-400 text-xs font-bold px-3.5 py-2 rounded-xl transition flex items-center gap-1.5 shadow-sm">
                                                <span class="w-2 h-2 rounded-full bg-slate-500"></span>
                                                <span>Status: Non-Aktif</span>
                                            </button>
                                        @endif
                                    </form>

                                    <button type="button" onclick='editTemplate({{ json_encode($tmpl) }})'
                                        class="bg-amber-500/10 hover:bg-amber-500/20 border border-amber-500/30 text-amber-400 text-xs font-bold px-3.5 py-2 rounded-xl transition flex items-center gap-1.5" title="Edit Identitas, Tanggal & Daftar Peserta">
                                        <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                        </svg>
                                        <span>Edit Form & Peserta</span>
                                    </button>

                                    <a href="{{ $shareUrl }}" target="_blank" class="bg-white/5 hover:bg-white/10 border border-white/10 text-white text-xs font-bold px-4 py-2 rounded-xl transition flex items-center gap-1.5">
                                        <span>Buka Form User</span>
                                        <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                                        </svg>
                                    </a>
                                    <button type="button" onclick="openDeleteModal({{ $tmpl->id }}, '{{ addslashes($tmpl->title) }}')"
                                        class="bg-red-500/10 hover:bg-red-500/20 border border-red-500/20 text-red-400 text-xs font-bold px-3.5 py-2 rounded-xl transition flex items-center gap-1.5">
                                        <svg class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                        </svg>
                                        <span>Hapus</span>
                                    </button>
                                </div>
                            </div>
                        @endforeach
                    </div>
                @endif
            </div>
        </div>

        <!-- TAB 3: RESPONDENT RESULTS -->
        <div id="tab-content-results" class="space-y-6 hidden">
            <div class="glass-panel p-6 md:p-8 rounded-3xl border border-white/10">
                
                <!-- Filter & Export Control Bar -->
                <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-4 mb-6 border-b border-white/10 pb-5">
                    <div>
                        <h2 class="text-lg font-bold text-amber-400 flex items-center gap-2">
                            <svg class="w-5 h-5 text-amber-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                            </svg>
                            <span>Hasil Tanggapan Responden & Skor Evaluasi</span>
                        </h2>
                        <p class="text-xs text-slate-400 mt-1">Filter hasil berdasarkan kegiatan/formulir dan unduh laporan rekapitulasi format Excel (.xlsx)</p>
                    </div>

                    <div class="flex flex-wrap items-center gap-3">
                        <div class="flex items-center gap-2">
                            <label class="text-xs text-slate-400 font-bold whitespace-nowrap">Filter Kegiatan:</label>
                            <select id="filter-kegiatan" onchange="filterResults(this.value)"
                                class="bg-slate-900 border border-white/15 text-white text-xs font-semibold px-3.5 py-2.5 rounded-xl outline-none focus:border-amber-500 transition">
                                <option value="all" {{ ($selectedTemplateId ?? 'all') == 'all' ? 'selected' : '' }}>Semua Kegiatan Formulir</option>
                                @foreach($templates as $tmpl)
                                    <option value="{{ $tmpl->id }}" {{ ($selectedTemplateId ?? '') == $tmpl->id ? 'selected' : '' }}>
                                        {{ $tmpl->title }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <a href="{{ route('formapp.export.excel') }}?template_id={{ $selectedTemplateId ?? 'all' }}"
                            class="bg-gradient-to-r from-emerald-600 to-teal-600 hover:from-emerald-500 hover:to-teal-500 text-white font-extrabold text-xs px-4 py-2.5 rounded-xl shadow-lg shadow-emerald-950/40 border border-emerald-400/30 transition flex items-center gap-2">
                            <svg class="w-4 h-4 text-emerald-200" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                            </svg>
                            <span>Unduh Rekap Excel (.xlsx)</span>
                        </a>
                    </div>
                </div>

                @if(count($responses) === 0)
                    <div class="text-center py-12 border border-dashed border-white/10 rounded-2xl">
                        <p class="text-slate-400 text-sm">Belum ada pengisian kuesioner dari responden/user untuk filter kegiatan ini.</p>
                    </div>
                @else
                    <div class="overflow-x-auto">
                        <table class="w-full text-left text-xs border-collapse">
                            <thead>
                                <tr class="border-b border-white/10 text-slate-400 uppercase tracking-wider">
                                    <th class="py-3.5 px-4">#</th>
                                    <th class="py-3.5 px-4">Waktu</th>
                                    <th class="py-3.5 px-4">Nama Lengkap Responden</th>
                                    <th class="py-3.5 px-4">Formulir</th>
                                    <th class="py-3.5 px-4 text-center">Skor Total</th>
                                    <th class="py-3.5 px-4 text-center">Tingkat Kepuasan</th>
                                    <th class="py-3.5 px-4 text-center">Aksi Detail</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-white/5 font-semibold text-slate-200">
                                @foreach($responses as $idx => $resp)
                                    @php
                                        $pct = $resp->max_score > 0 ? round(($resp->total_score / $resp->max_score) * 100, 1) : 0;
                                    @endphp
                                    <tr class="hover:bg-white/5 transition">
                                        <td class="py-3.5 px-4 text-slate-400">{{ $idx + 1 }}</td>
                                        <td class="py-3.5 px-4 text-slate-400">{{ \Carbon\Carbon::parse($resp->created_at)->format('d M Y, H:i') }}</td>
                                        <td class="py-3.5 px-4 font-bold text-white">{{ $resp->nama_ikm ?? 'Anonim' }}</td>
                                        <td class="py-3.5 px-4 text-slate-300">{{ $resp->template_title }}</td>
                                        <td class="py-3.5 px-4 text-center text-amber-400 font-extrabold text-sm">{{ $resp->total_score }} / {{ $resp->max_score }}</td>
                                        <td class="py-3.5 px-4 text-center">
                                            <span class="px-3 py-1 rounded-full text-xs font-bold {{ $pct >= 85 ? 'bg-emerald-500/10 border border-emerald-500/20 text-emerald-400' : ($pct >= 70 ? 'bg-amber-500/10 border border-amber-500/20 text-amber-400' : 'bg-red-500/10 border border-red-500/20 text-red-400') }}">
                                                {{ $pct }}%
                                            </span>
                                        </td>
                                        <td class="py-3.5 px-4 text-center">
                                            <div class="flex items-center justify-center gap-2">
                                                <button type="button" onclick='openDetailModal({{ json_encode($resp) }})'
                                                    class="bg-amber-500/10 hover:bg-amber-500/20 border border-amber-500/30 text-amber-400 px-3 py-1.5 rounded-xl text-xs font-bold transition flex items-center gap-1.5" title="Lihat Detail Jawaban">
                                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                    </svg>
                                                    <span>Detail</span>
                                                </button>

                                                <button type="button" onclick="confirmDeleteResponse({{ $resp->id }}, '{{ addslashes($resp->nama_ikm ?? 'Anonim') }}')"
                                                    class="bg-red-500/10 hover:bg-red-500/20 border border-red-500/30 text-red-400 p-1.5 rounded-xl text-xs font-bold transition" title="Hapus Data Responden">
                                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                        <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                                    </svg>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
            </div>
        </div>

        <!-- DETAIL RESPONSE MODAL POPUP FOR ADMIN -->
        <div id="detail-response-modal" onclick="closeDetailModal()" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/85 backdrop-blur-md hidden transition-all duration-300">
            <div onclick="event.stopPropagation()" class="glass-panel max-w-4xl w-full p-6 md:p-8 rounded-[32px] border border-white/10 shadow-2xl relative overflow-hidden max-h-[90vh] flex flex-col">
                
                <!-- Modal Header -->
                <div class="flex items-center justify-between border-b border-white/10 pb-4 mb-4 shrink-0">
                    <div>
                        <span class="bg-amber-500/10 text-amber-400 text-[10px] font-black uppercase tracking-widest px-3 py-1 rounded-full border border-amber-500/20">
                            Detail Jawaban Responden
                        </span>
                        <h3 id="modal-resp-name" class="text-xl font-extrabold text-white mt-1">Nama Responden</h3>
                        <p id="modal-resp-info" class="text-xs text-slate-400"></p>
                    </div>

                    <div class="flex items-center gap-3">
                        <div class="bg-slate-900 border border-white/10 px-4 py-2 rounded-2xl text-center">
                            <span class="text-[10px] text-slate-400 font-extrabold block uppercase">Skor Total</span>
                            <span id="modal-resp-score" class="text-lg font-black text-amber-400">0 / 100</span>
                        </div>
                        <button type="button" onclick="closeDetailModal()" class="text-slate-400 hover:text-white hover:bg-white/10 bg-white/5 w-10 h-10 rounded-xl border border-white/10 flex items-center justify-center cursor-pointer transition text-lg font-bold">
                            &times;
                        </button>
                    </div>
                </div>

                <!-- Modal Content Scrollable -->
                <div id="modal-resp-content" class="flex-1 overflow-y-auto pr-2 space-y-6"></div>

                <!-- Modal Footer -->
                <div class="pt-4 border-t border-white/10 flex justify-end shrink-0">
                    <button type="button" onclick="closeDetailModal()" class="py-2.5 px-6 bg-white/10 hover:bg-white/20 text-white font-bold text-xs rounded-xl cursor-pointer transition shadow-md">
                        Tutup Detail
                    </button>
                </div>
            </div>
        </div>

        <!-- DELETE RESPONSE CONFIRMATION MODAL POPUP -->
        <div id="delete-response-modal" onclick="closeDeleteResponseModal()" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/85 backdrop-blur-md hidden transition-all duration-300">
            <div onclick="event.stopPropagation()" class="glass-panel max-w-md w-full p-6 md:p-8 rounded-3xl border border-red-500/30 text-center shadow-2xl relative overflow-hidden">
                <div class="w-16 h-16 rounded-2xl bg-red-500/20 border border-red-500/40 text-red-400 flex items-center justify-center mx-auto mb-4 shadow-lg shadow-red-950/40">
                    <svg class="w-8 h-8 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                    </svg>
                </div>
                <h3 class="text-xl font-extrabold text-white mb-2">Konfirmasi Hapus Data Responden</h3>
                <p class="text-slate-300 text-xs mb-6 leading-relaxed">
                    Apakah Anda yakin ingin menghapus data jawaban responden dari <strong id="delete-target-name" class="text-amber-400 font-bold"></strong>? Data yang dihapus tidak dapat dikembalikan.
                </p>
                <div class="flex items-center gap-3">
                    <button type="button" onclick="closeDeleteResponseModal()" class="flex-1 py-3 bg-white/10 hover:bg-white/20 text-white font-bold text-xs rounded-xl transition">
                        Batal
                    </button>
                    <button type="button" id="btn-confirm-delete-resp" onclick="executeDeleteResponse()" class="flex-1 py-3 bg-red-600 hover:bg-red-500 text-white font-extrabold text-xs rounded-xl shadow-lg shadow-red-900/40 transition">
                        Ya, Hapus Data
                    </button>
                </div>
            </div>
        </div>

    </main>

    <!-- COLORFUL & INTERACTIVE SUCCESS MODAL POPUP -->
    <div id="save-success-modal" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/85 backdrop-blur-md hidden transition-all duration-300">
        <div class="glass-panel max-w-lg w-full p-8 rounded-[36px] text-center border border-amber-500/30 shadow-2xl relative overflow-hidden animate-bounce-short">
            
            <!-- Glow Background Effect -->
            <div class="absolute -top-24 -left-24 w-48 h-48 bg-emerald-500/20 rounded-full blur-3xl pointer-events-none"></div>
            <div class="absolute -bottom-24 -right-24 w-48 h-48 bg-amber-500/20 rounded-full blur-3xl pointer-events-none"></div>

            <!-- Icon Header -->
            <div class="relative z-10 w-20 h-20 rounded-3xl bg-gradient-to-tr from-emerald-500/20 to-amber-500/20 border border-amber-500/40 text-amber-400 flex items-center justify-center mx-auto mb-5 shadow-inner">
                <svg class="w-10 h-10 text-amber-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
            </div>

            <!-- Title & Desc -->
            <div class="relative z-10 space-y-2 mb-6">
                <span class="bg-emerald-500/10 text-emerald-400 text-[10px] font-black uppercase tracking-widest px-3 py-1 rounded-full border border-emerald-500/30">
                    Proses Berhasil
                </span>
                <h3 class="text-2xl font-black text-white tracking-tight">
                    Formulir Berhasil Disimpan!
                </h3>
                <p class="text-slate-300 text-xs leading-relaxed max-w-sm mx-auto">
                    Struktur pertanyaan & poin skor tersimpan. **Link Akses Publik** telah siap dibagikan ke responden.
                </p>
            </div>

            <!-- Generated URL Box -->
            <div class="relative z-10 bg-slate-950/80 border border-amber-500/30 p-4 rounded-2xl mb-6 text-left space-y-2 shadow-inner">
                <div class="flex items-center justify-between text-[10px] font-black uppercase tracking-wider text-slate-400">
                    <span>Link Akses Responden (Generated):</span>
                    <span class="text-emerald-400 font-bold">● SIAP DIBAGIKAN</span>
                </div>
                <div class="flex items-center gap-2">
                    <input type="text" id="modal-share-url" readonly value=""
                        class="bg-slate-900 border border-white/10 text-amber-400 text-xs font-mono px-3.5 py-2.5 rounded-xl w-full select-all outline-none font-bold">
                    <button type="button" id="btn-modal-copy" onclick="copyModalUrl()"
                        class="bg-amber-500 hover:bg-amber-400 text-slate-950 text-xs font-black px-4 py-2.5 rounded-xl transition flex items-center gap-1.5 shrink-0 shadow-lg shadow-amber-900/30">
                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
                        </svg>
                        <span id="btn-modal-copy-text">Salin Link</span>
                    </button>
                </div>
            </div>

            <!-- Modal Action Buttons -->
            <div class="relative z-10 grid grid-cols-1 sm:grid-cols-2 gap-3">
                <a id="btn-modal-open-url" href="#" target="_blank"
                    class="py-3 px-4 bg-emerald-600 hover:bg-emerald-500 text-white font-extrabold text-xs rounded-xl transition flex items-center justify-center gap-2 shadow-lg shadow-emerald-950/40">
                    <span>Buka Form User</span>
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                    </svg>
                </a>

                <button type="button" onclick="closeSaveSuccessModal()"
                    class="py-3 px-4 bg-white/10 hover:bg-white/20 border border-white/15 text-white font-extrabold text-xs rounded-xl transition">
                    Lihat Daftar Link
                </button>
            </div>
        </div>
    </div>

    <!-- COLORFUL & INTERACTIVE DELETE CONFIRMATION MODAL POPUP -->
    <div id="delete-confirm-modal" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/85 backdrop-blur-md hidden transition-all duration-300">
        <div class="glass-panel max-w-md w-full p-8 rounded-[36px] text-center border border-red-500/30 shadow-2xl relative overflow-hidden">
            
            <!-- Glow Background Effect -->
            <div class="absolute -top-24 -left-24 w-48 h-48 bg-red-500/20 rounded-full blur-3xl pointer-events-none"></div>
            <div class="absolute -bottom-24 -right-24 w-48 h-48 bg-amber-500/20 rounded-full blur-3xl pointer-events-none"></div>

            <!-- Icon Header -->
            <div class="relative z-10 w-20 h-20 rounded-3xl bg-gradient-to-tr from-red-500/20 to-amber-500/20 border border-red-500/40 text-red-400 flex items-center justify-center mx-auto mb-5 shadow-inner">
                <svg class="w-10 h-10 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                </svg>
            </div>

            <!-- Title & Desc -->
            <div class="relative z-10 space-y-2 mb-6">
                <span class="bg-red-500/10 text-red-400 text-[10px] font-black uppercase tracking-widest px-3 py-1 rounded-full border border-red-500/30">
                    Konfirmasi Hapus
                </span>
                <h3 class="text-2xl font-black text-white tracking-tight">
                    Hapus Formulir Kuesioner?
                </h3>
                <p id="delete-modal-text" class="text-slate-300 text-xs leading-relaxed max-w-sm mx-auto">
                    Apakah Anda yakin ingin menghapus formulir ini? Semua data tanggapan responden terkait formulir ini akan terhapus secara permanen.
                </p>
            </div>

            <!-- Modal Action Buttons -->
            <div class="relative z-10 grid grid-cols-2 gap-3">
                <button type="button" onclick="closeDeleteModal()"
                    class="py-3 px-4 bg-white/10 hover:bg-white/20 border border-white/15 text-white font-extrabold text-xs rounded-xl transition">
                    Batal
                </button>

                <form id="delete-active-form" action="" method="POST">
                    @csrf
                    @method('DELETE')
                    <button type="submit"
                        class="w-full py-3 px-4 bg-gradient-to-r from-red-600 to-rose-600 hover:from-red-500 hover:to-rose-500 text-white font-black text-xs rounded-xl shadow-lg shadow-red-950/40 transition flex items-center justify-center gap-1.5">
                        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                        </svg>
                        <span>Ya, Hapus</span>
                    </button>
                </form>
            </div>
        </div>
    </div>

    <!-- TOAST NOTIFICATION FLOATING CONTAINER -->
    <div id="toast-container" class="fixed bottom-6 right-6 z-50 flex flex-col gap-2 pointer-events-none"></div>

    <!-- JavaScript Logic -->
    <script>
        // Initial Default Structure Seed (25 Questions with Customizable Options & Scores)
        let formStructure = {
            sections: [
                {
                    title: "Bagian A: Kualitas dan Relevansi Materi",
                    subtitle: "Penilaian terhadap kualitas dan relevansi materi pelatihan",
                    type: "agree",
                    questions: [
                        { id: "q1", text: "Materi pelatihan mudah dipahami dan dicerna dengan baik." },
                        { id: "q2", text: "Materi sangat relevan dengan kondisi dan tantangan IKM saat ini." },
                        { id: "q3", text: "Materi memberikan wawasan baru untuk inovasi produk atau jasa." },
                        { id: "q4", text: "Materi tentang efisiensi proses produksi dapat langsung diaplikasikan." },
                        { id: "q5", text: "Materi strategi pemasaran digital (termasuk pembuatan konten media sosial/video) aplikatif untuk usaha saya." },
                        { id: "q6", text: "Materi mengenai branding, penamaan, dan legalitas merek dijelaskan dengan sangat jelas." },
                        { id: "q7", text: "Materi didukung dengan contoh-contoh kasus nyata (best practice) yang sesuai." },
                        { id: "q8", text: "Modul, handout, atau bahan ajar digital yang diberikan sangat informatif." },
                        { id: "q9", text: "Proporsi antara teori dasar dan aktivitas praktik sangat seimbang." },
                        { id: "q10", text: "Materi pelatihan selalu mengacu pada kebaruan informasi dan tren pasar terkini." }
                    ],
                    options: [
                        { val: "Sangat Setuju", label: "Sangat Setuju", score: 4 },
                        { val: "Setuju", label: "Setuju", score: 3 },
                        { val: "Cukup", label: "Cukup", score: 2 },
                        { val: "Kurang Setuju", label: "Kurang Setuju", score: 1 }
                    ]
                },
                {
                    title: "Bagian B: Kinerja Fasilitator / Narasumber",
                    subtitle: "Penilaian terhadap kualitas kinerja narasumber selama pelatihan",
                    type: "performance",
                    questions: [
                        { id: "q11", text: "Tingkat penguasaan fasilitator terhadap materi kewirausahaan dan daya saing." },
                        { id: "q12", text: "Sistematika dan keruntutan fasilitator dalam menyampaikan materi." },
                        { id: "q13", text: "Kemampuan fasilitator dalam mendorong pelaku IKM untuk berinteraksi dan berbagi pengalaman." },
                        { id: "q14", text: "Kemampuan fasilitator dalam memberikan solusi praktis dan tepat sasaran saat sesi tanya jawab." },
                        { id: "q15", text: "Kedisiplinan fasilitator terhadap waktu (mulai dan selesai tepat waktu)." },
                        { id: "q16", text: "Pembawaan fasilitator dalam menjaga antusiasme dan energi peserta selama pelatihan." },
                        { id: "q17", text: "Kejelasan fasilitator saat memandu sesi simulasi atau praktik." }
                    ],
                    options: [
                        { val: "Sangat Baik", label: "Sangat Baik", score: 4 },
                        { val: "Baik", label: "Baik", score: 3 },
                        { val: "Cukup", label: "Cukup", score: 2 },
                        { val: "Kurang", label: "Kurang", score: 1 }
                    ]
                },
                {
                    title: "Bagian C: Penyelenggaraan dan Fasilitas Pelatihan",
                    subtitle: "Tingkat kepuasan mengenai fasilitas dan layanan panitia",
                    type: "facility",
                    questions: [
                        { id: "q18", text: "Kenyamanan ruangan (aula/tempat pelatihan) dan suasana belajar selama acara." },
                        { id: "q19", text: "Kualitas sarana pendukung audio visual (layar presentasi, mikrofon, dan tata suara)." },
                        { id: "q20", text: "Kualitas dan ketepatan waktu penyajian konsumsi (makan, minum, atau coffee break)." },
                        { id: "q21", text: "Keramahan, kesigapan, dan pelayanan dari panitia/penyelenggara selama kegiatan." },
                        { id: "q22", text: "Kecepatan dan efisiensi proses administrasi (registrasi, presensi, pembagian sertifikat)." }
                    ],
                    options: [
                        { val: "Sangat Memuaskan", label: "Sangat Memuaskan", score: 4 },
                        { val: "Memuaskan", label: "Memuaskan", score: 3 },
                        { val: "Cukup", label: "Cukup", score: 2 },
                        { val: "Kurang Memuaskan", label: "Kurang Memuaskan", score: 1 }
                    ]
                },
                {
                    title: "Bagian D: Dampak Keseluruhan dan Rencana Tindak Lanjut",
                    subtitle: "Penilaian dampak pelatihan terhadap perkembangan skala usaha",
                    type: "impact",
                    questions: [
                        { id: "q23", text: "Pelatihan ini meningkatkan motivasi dan kepercayaan diri saya untuk mengembangkan skala usaha." },
                        { id: "q24", text: "Saya akan merekomendasikan pelatihan semacam ini kepada rekan pelaku IKM lainnya." },
                        { id: "q25", text: "Tingkat kepuasan Anda secara keseluruhan terhadap pelaksanaan kegiatan pelatihan ini." }
                    ],
                    options: [
                        { val: "Sangat Memuaskan", label: "Sangat Memuaskan / Sangat Setuju", score: 4 },
                        { val: "Memuaskan", label: "Memuaskan / Setuju", score: 3 },
                        { val: "Cukup", label: "Cukup", score: 2 },
                        { val: "Kurang", label: "Kurang Memuaskan / Kurang Setuju", score: 1 }
                    ]
                }
            ]
        };

        function renderFormBuilder() {
            const container = document.getElementById('sections-container');
            container.innerHTML = '';

            formStructure.sections.forEach((section, sIdx) => {
                const sectionEl = document.createElement('div');
                sectionEl.className = 'glass-card p-6 md:p-8 rounded-3xl border border-white/10 space-y-6';

                let html = `
                    <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 border-b border-white/10 pb-4">
                        <div class="flex-1">
                            <label class="block text-[10px] font-black text-amber-400 uppercase tracking-widest mb-1">Judul Sub-Bagian #${sIdx + 1}</label>
                            <input type="text" value="${escapeHtml(section.title)}" onchange="updateSectionTitle(${sIdx}, this.value)"
                                class="w-full input-glass rounded-xl px-4 py-2.5 text-base font-extrabold text-white outline-none">
                        </div>
                        <button type="button" onclick="removeSection(${sIdx})" class="self-end md:self-center text-xs text-red-400 hover:text-red-300 font-bold bg-red-500/10 hover:bg-red-500/20 px-3 py-2 rounded-xl border border-red-500/20 transition">
                            Hapus Sub-Bagian
                        </button>
                    </div>

                    <div class="bg-white/5 p-4 rounded-2xl border border-white/5 space-y-3">
                        <span class="block text-xs font-extrabold text-slate-300">Pengaturan Opsi Jawaban & Poin Skor (Nilai Evaluasi):</span>
                        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">
                `;

                section.options.forEach((opt, oIdx) => {
                    html += `
                        <div class="bg-slate-900/60 p-3 rounded-xl border border-white/10 flex flex-col gap-2">
                            <div class="flex items-center justify-between gap-2">
                                <input type="text" value="${escapeHtml(opt.label)}" onchange="updateOptionLabel(${sIdx}, ${oIdx}, this.value)"
                                    class="bg-transparent text-xs font-bold text-amber-400 outline-none w-full border-b border-white/10 pb-1">
                            </div>
                            <div class="flex items-center justify-between gap-2">
                                <span class="text-[10px] text-slate-400 uppercase font-bold">Poin Skor:</span>
                                <input type="number" value="${opt.score}" onchange="updateOptionScore(${sIdx}, ${oIdx}, this.value)"
                                    class="bg-slate-800 text-center font-extrabold text-xs text-emerald-400 w-16 py-1 rounded-lg border border-white/10 outline-none">
                            </div>
                        </div>
                    `;
                });

                html += `
                        </div>
                    </div>

                    <div class="space-y-4">
                        <div class="flex items-center justify-between">
                            <span class="text-xs font-bold text-slate-300">Daftar Pertanyaan (${section.questions.length}):</span>
                            <button type="button" onclick="addQuestion(${sIdx})" class="text-xs text-amber-400 hover:text-amber-300 font-bold bg-amber-500/10 px-3 py-1.5 rounded-lg border border-amber-500/20 transition">
                                + Tambah Pertanyaan
                            </button>
                        </div>
                `;

                section.questions.forEach((q, qIdx) => {
                    html += `
                        <div class="flex items-center gap-3 bg-white/5 p-3.5 rounded-xl border border-white/5">
                            <span class="text-xs font-extrabold text-amber-400 w-8 text-center">${qIdx + 1}.</span>
                            <input type="text" value="${escapeHtml(q.text)}" onchange="updateQuestionText(${sIdx}, ${qIdx}, this.value)"
                                class="w-full input-glass rounded-xl px-4 py-2 text-xs font-bold text-slate-200 outline-none">
                            <button type="button" onclick="removeQuestion(${sIdx}, ${qIdx})" class="text-slate-400 hover:text-red-400 p-2">
                                &times;
                            </button>
                        </div>
                    `;
                });

                html += `
                    </div>
                `;

                sectionEl.innerHTML = html;
                container.appendChild(sectionEl);
            });
        }

        function updateSectionTitle(sIdx, val) { formStructure.sections[sIdx].title = val; }
        function updateOptionLabel(sIdx, oIdx, val) { formStructure.sections[sIdx].options[oIdx].label = val; formStructure.sections[sIdx].options[oIdx].val = val; }
        function updateOptionScore(sIdx, oIdx, val) { formStructure.sections[sIdx].options[oIdx].score = parseInt(val) || 0; }
        function updateQuestionText(sIdx, qIdx, val) { formStructure.sections[sIdx].questions[qIdx].text = val; }

        function addSection() {
            const nextIdx = formStructure.sections.length + 1;
            formStructure.sections.push({
                title: `Sub-Bagian ${nextIdx}: Judul Baru`,
                subtitle: "Keterangan petunjuk sub-bagian",
                type: "custom",
                questions: [
                    { id: `q_custom_${Date.now()}_1`, text: "Pertanyaan baru 1" }
                ],
                options: [
                    { val: "Sangat Baik", label: "Sangat Baik", score: 4 },
                    { val: "Baik", label: "Baik", score: 3 },
                    { val: "Cukup", label: "Cukup", score: 2 },
                    { val: "Kurang", label: "Kurang", score: 1 }
                ]
            });
            renderFormBuilder();
        }

        function removeSection(sIdx) {
            if (formStructure.sections.length <= 1) {
                alert("Minimal harus ada 1 sub-bagian pertanyaan.");
                return;
            }
            formStructure.sections.splice(sIdx, 1);
            renderFormBuilder();
        }

        function addQuestion(sIdx) {
            const qCount = formStructure.sections[sIdx].questions.length + 1;
            formStructure.sections[sIdx].questions.push({
                id: `q_${Date.now()}_${qCount}`,
                text: `Pertanyaan baru #${qCount}`
            });
            renderFormBuilder();
        }

        function removeQuestion(sIdx, qIdx) {
            if (formStructure.sections[sIdx].questions.length <= 1) {
                alert("Sub-bagian minimal harus memiliki 1 pertanyaan.");
                return;
            }
            formStructure.sections[sIdx].questions.splice(qIdx, 1);
            renderFormBuilder();
        }

        function editTemplate(tmpl) {
            document.getElementById('builder-template-id').value = tmpl.id;
            document.getElementById('builder-title').value = tmpl.title || '';
            document.getElementById('builder-penyelenggara').value = tmpl.penyelenggara || '';
            document.getElementById('builder-lokasi').value = tmpl.lokasi || '';
            document.getElementById('builder-tanggal').value = tmpl.tanggal || '';
            document.getElementById('builder-tanggal-selesai').value = tmpl.tanggal_selesai || tmpl.tanggal || '';

            let rawPeserta = tmpl.peserta_list;
            let textPeserta = '';
            if (rawPeserta) {
                try {
                    const parsed = typeof rawPeserta === 'string' ? JSON.parse(rawPeserta) : rawPeserta;
                    if (Array.isArray(parsed)) textPeserta = parsed.join("\n");
                } catch(e) {
                    textPeserta = rawPeserta;
                }
            }
            document.getElementById('builder-peserta-list').value = textPeserta;

            if (tmpl.structure) {
                try {
                    formStructure = typeof tmpl.structure === 'string' ? JSON.parse(tmpl.structure) : tmpl.structure;
                } catch(e) {}
            }

            renderFormBuilder();

            const banner = document.getElementById('edit-mode-banner');
            const bannerText = document.getElementById('edit-mode-text');
            if (banner) {
                bannerText.innerText = `Mode Edit Formulir: "${tmpl.title}" (ID: ${tmpl.id})`;
                banner.classList.remove('hidden');
            }

            switchAdminTab('builder');
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        function resetFormBuilder() {
            document.getElementById('builder-template-id').value = '';
            document.getElementById('builder-title').value = 'KUESIONER EVALUASI PELATIHAN PENINGKATAN DAYA SAING IKM';
            document.getElementById('builder-penyelenggara').value = 'Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun';
            document.getElementById('builder-lokasi').value = 'Resto I Club Madiun (Aula Utama)';
            document.getElementById('builder-tanggal').value = '{{ date('Y-m-d') }}';
            document.getElementById('builder-tanggal-selesai').value = '{{ date('Y-m-d') }}';
            document.getElementById('builder-peserta-list').value = '';

            const banner = document.getElementById('edit-mode-banner');
            if (banner) banner.classList.add('hidden');

            renderFormBuilder();
        }

        async function saveTemplate(e) {
            e.preventDefault();

            const templateId = document.getElementById('builder-template-id')?.value || null;
            const title = document.getElementById('builder-title').value;
            const penyelenggara = document.getElementById('builder-penyelenggara').value;
            const lokasi = document.getElementById('builder-lokasi').value;
            const tanggal = document.getElementById('builder-tanggal').value;
            const tanggalSelesai = document.getElementById('builder-tanggal-selesai')?.value || tanggal;
            const pesertaList = document.getElementById('builder-peserta-list')?.value || '';

            const payload = {
                template_id: templateId,
                title: title,
                penyelenggara: penyelenggara,
                lokasi: lokasi,
                tanggal: tanggal,
                tanggal_selesai: tanggalSelesai,
                peserta_list: pesertaList,
                structure: JSON.stringify(formStructure)
            };

            const btnSave = document.getElementById('btn-save-template');
            btnSave.disabled = true;
            btnSave.innerHTML = `<span>Memproses Simpan & Generate Link...</span>`;

            try {
                const res = await fetch("{{ route('formapp.template.store') }}", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify(payload)
                });

                const data = await res.json();

                if (res.ok && data.success) {
                    // Open Colorful Interactive Success Modal Popup
                    document.getElementById('modal-share-url').value = data.share_url;
                    document.getElementById('btn-modal-open-url').setAttribute('href', data.share_url);
                    document.getElementById('save-success-modal').classList.remove('hidden');
                } else {
                    showToast('Gagal menyimpan: ' + (data.message || 'Kesalahan sistem'), 'error');
                }
            } catch (err) {
                showToast('Terjadi kesalahan jaringan saat menyimpan.', 'error');
            } finally {
                btnSave.disabled = false;
                btnSave.innerHTML = `
                    <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M8 7H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3m-1 4l-3 3m0 0l-3-3m3 3V4" />
                    </svg>
                    <span>Simpan Form & Generate Link Akses User</span>
                `;
            }
        }

        function copyModalUrl() {
            const urlInput = document.getElementById('modal-share-url');
            copyToClipboard(urlInput.value);
            const btnCopyText = document.getElementById('btn-modal-copy-text');
            btnCopyText.innerText = '✓ Tersalin!';
            setTimeout(() => { btnCopyText.innerText = 'Salin Link'; }, 2500);
        }

        function closeSaveSuccessModal() {
            document.getElementById('save-success-modal').classList.add('hidden');
            switchAdminTab('links');
        }

        function switchAdminTab(tab) {
            const btnB = document.getElementById('tab-btn-builder');
            const btnL = document.getElementById('tab-btn-links');
            const btnR = document.getElementById('tab-btn-results');

            const contentB = document.getElementById('tab-content-builder');
            const contentL = document.getElementById('tab-content-links');
            const contentR = document.getElementById('tab-content-results');

            const activeClass = "flex-1 min-w-[200px] py-3 px-5 text-xs font-extrabold rounded-xl transition duration-300 text-slate-950 bg-amber-500 shadow-lg flex items-center justify-center gap-2";
            const inactiveClass = "flex-1 min-w-[200px] py-3 px-5 text-xs font-extrabold rounded-xl transition duration-300 text-slate-400 hover:text-white flex items-center justify-center gap-2";

            btnB.className = tab === 'builder' ? activeClass : inactiveClass;
            btnL.className = tab === 'links' ? activeClass : inactiveClass;
            btnR.className = tab === 'results' ? activeClass : inactiveClass;

            contentB.classList.toggle('hidden', tab !== 'builder');
            contentL.classList.toggle('hidden', tab !== 'links');
            contentR.classList.toggle('hidden', tab !== 'results');
        }

        function copyToClipboard(text) {
            navigator.clipboard.writeText(text).then(() => {
                showToast('Link Akses Responden berhasil disalin ke clipboard!', 'success');
            }).catch(() => {
                prompt('Salin link akses secara manual:', text);
            });
        }

        function showToast(message, type = 'success') {
            const container = document.getElementById('toast-container');
            const toast = document.createElement('div');
            const isSuccess = type === 'success';

            toast.className = `pointer-events-auto flex items-center gap-3 px-4 py-3 rounded-2xl border text-xs font-bold shadow-2xl transition-all duration-300 transform translate-y-4 opacity-0 ${
                isSuccess 
                    ? 'bg-emerald-950/90 border-emerald-500/40 text-emerald-300' 
                    : 'bg-red-950/90 border-red-500/40 text-red-300'
            }`;

            toast.innerHTML = `
                <svg class="w-5 h-5 shrink-0 ${isSuccess ? 'text-emerald-400' : 'text-red-400'}" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    ${isSuccess 
                        ? '<path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>' 
                        : '<path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>'}
                </svg>
                <span>${escapeHtml(message)}</span>
            `;

            container.appendChild(toast);

            setTimeout(() => {
                toast.classList.remove('translate-y-4', 'opacity-0');
            }, 10);

            setTimeout(() => {
                toast.classList.add('translate-y-4', 'opacity-0');
                setTimeout(() => toast.remove(), 300);
            }, 3500);
        }

        function openDetailModal(resp) {
            const modal = document.getElementById('detail-response-modal');
            document.getElementById('modal-resp-name').innerText = resp.nama_ikm || 'Anonim';
            
            let formattedDate = resp.created_at;
            try {
                formattedDate = new Date(resp.created_at).toLocaleString('id-ID', { dateStyle: 'medium', timeStyle: 'short' });
            } catch (e) {}

            document.getElementById('modal-resp-info').innerText = `${resp.template_title || 'Formulir Kuesioner'} • ${formattedDate}`;
            document.getElementById('modal-resp-score').innerText = `${resp.total_score} / ${resp.max_score}`;

            let answers = {};
            try {
                answers = typeof resp.answers === 'string' ? JSON.parse(resp.answers || '{}') : (resp.answers || {});
            } catch(e) { answers = {}; }

            let structure = {};
            try {
                structure = typeof resp.template_structure === 'string' ? JSON.parse(resp.template_structure || '{}') : (resp.template_structure || {});
            } catch(e) { structure = {}; }
            
            const container = document.getElementById('modal-resp-content');
            container.innerHTML = '';

            const sections = structure.sections || [];
            if (sections.length === 0) {
                container.innerHTML = `<p class="text-slate-400 text-xs text-center py-6">Data struktur pertanyaan tidak tersedia.</p>`;
                modal.classList.remove('hidden');
                return;
            }

            let globalQIndex = 0;
            sections.forEach((sec, sIdx) => {
                const secOptions = sec.options || [];
                const secBox = document.createElement('div');
                secBox.className = 'glass-card p-5 rounded-2xl border border-white/10 space-y-4 mb-4';

                let secHtml = `
                    <div class="border-b border-white/10 pb-3 flex items-center justify-between">
                        <div>
                            <span class="text-[10px] font-black uppercase tracking-wider text-amber-400 bg-amber-500/10 px-2.5 py-0.5 rounded-full border border-amber-500/20">Sub-Bagian ${sIdx + 1}</span>
                            <h4 class="text-base font-extrabold text-white mt-1">${escapeHtml(sec.title || '')}</h4>
                        </div>
                    </div>
                    <div class="space-y-3">
                `;

                (sec.questions || []).forEach((q) => {
                    globalQIndex++;
                    const userVal = answers[q.id] !== undefined ? answers[q.id] : null;
                    let matchedOpt = null;
                    
                    secOptions.forEach(opt => {
                        if (userVal !== null && (String(userVal) === String(opt.val) || String(userVal) === String(opt.label))) {
                            matchedOpt = opt;
                        }
                    });

                    const score = matchedOpt ? parseInt(matchedOpt.score || 0) : 0;
                    const answerText = matchedOpt ? `${matchedOpt.label} (${matchedOpt.val})` : (userVal !== null ? userVal : '<span class="text-red-400 italic">Tidak Dijawab</span>');

                    let badgeClass = "bg-slate-800 border-slate-700 text-slate-300";
                    let badgeLabel = `Skor: ${score} Poin`;
                    if (score === 4) {
                        badgeClass = "bg-emerald-500/10 border-emerald-500/30 text-emerald-400 font-bold";
                        badgeLabel = `Skor: ${score} Poin (Sangat Baik)`;
                    } else if (score === 3) {
                        badgeClass = "bg-blue-500/10 border-blue-500/30 text-blue-400 font-bold";
                        badgeLabel = `Skor: ${score} Poin (Baik)`;
                    } else if (score === 2) {
                        badgeClass = "bg-amber-500/10 border-amber-500/30 text-amber-400 font-bold";
                        badgeLabel = `Skor: ${score} Poin (Cukup)`;
                    } else if (score <= 1) {
                        badgeClass = "bg-red-500/20 border-red-500/40 text-red-400 font-extrabold animate-pulse";
                        badgeLabel = `⚠️ Skor: ${score} Poin (Kurang)`;
                    }

                    secHtml += `
                        <div class="bg-slate-900/80 p-3.5 rounded-xl border border-white/5 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3">
                            <div class="space-y-1">
                                <p class="text-xs font-bold text-slate-200">
                                    <span class="text-amber-400 mr-1.5">${globalQIndex}.</span>${escapeHtml(q.text || '')}
                                </p>
                                <p class="text-xs text-slate-400">
                                    Jawaban Responden: <strong class="text-white">${answerText}</strong>
                                </p>
                            </div>
                            <div class="shrink-0">
                                <span class="px-3 py-1 rounded-xl text-[11px] border ${badgeClass}">
                                    ${badgeLabel}
                                </span>
                            </div>
                        </div>
                    `;
                });

                secHtml += `</div>`;
                secBox.innerHTML = secHtml;
                container.appendChild(secBox);
            });

            modal.classList.remove('hidden');
        }

        function closeDetailModal() {
            const modal = document.getElementById('detail-response-modal');
            if (modal) {
                modal.classList.add('hidden');
            }
        }

        function openDeleteModal(id, title) {
            const modal = document.getElementById('delete-confirm-modal');
            const form = document.getElementById('delete-active-form');
            const text = document.getElementById('delete-modal-text');

            form.action = `/formapp/template/${id}`;
            text.innerHTML = `Apakah Anda yakin ingin menghapus formulir <strong class="text-white">"${escapeHtml(title)}"</strong>? Seluruh data kuesioner dan hasil responden akan terhapus secara permanen.`;
            modal.classList.remove('hidden');
        }

        function closeDeleteModal() {
            document.getElementById('delete-confirm-modal').classList.add('hidden');
        }

        // --- Theme Toggle Logic (Light / Dark Mode) ---
        function initTheme() {
            const savedTheme = localStorage.getItem('formapp_theme') || 'dark';
            applyTheme(savedTheme);
        }

        function applyTheme(theme) {
            const htmlEl = document.documentElement;
            const bodyEl = document.body;
            const btnIcon = document.getElementById('theme-toggle-icon');
            const btnText = document.getElementById('theme-toggle-text');
            
            if (theme === 'light') {
                htmlEl.classList.add('light-mode');
                if (bodyEl) {
                    bodyEl.classList.add('light-mode');
                    bodyEl.style.backgroundColor = '#ffffff';
                    bodyEl.style.color = '#0f172a';
                }
                if (btnIcon) btnIcon.innerText = '🌙';
                if (btnText) btnText.innerText = 'Mode Gelap';
            } else {
                htmlEl.classList.remove('light-mode');
                if (bodyEl) {
                    bodyEl.classList.remove('light-mode');
                    bodyEl.style.backgroundColor = '#0b1329';
                    bodyEl.style.color = '#f8fafc';
                }
                if (btnIcon) btnIcon.innerText = '☀️';
                if (btnText) btnText.innerText = 'Mode Terang';
            }
            localStorage.setItem('formapp_theme', theme);
        }

        function toggleTheme() {
            const currentTheme = localStorage.getItem('formapp_theme') || 'dark';
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            applyTheme(newTheme);
        }

        // --- Delete Response Confirmation Logic ---
        let activeDeleteResponseId = null;

        function confirmDeleteResponse(id, name) {
            activeDeleteResponseId = id;
            const targetName = document.getElementById('delete-target-name');
            if (targetName) targetName.innerText = name;
            const modal = document.getElementById('delete-response-modal');
            if (modal) modal.classList.remove('hidden');
        }

        function closeDeleteResponseModal() {
            activeDeleteResponseId = null;
            const modal = document.getElementById('delete-response-modal');
            if (modal) modal.classList.add('hidden');
        }

        async function executeDeleteResponse() {
            if (!activeDeleteResponseId) return;
            
            const btn = document.getElementById('btn-confirm-delete-resp');
            btn.disabled = true;
            btn.innerText = 'Menghapus...';
            
            try {
                const res = await fetch(`/formapp/response/${activeDeleteResponseId}`, {
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                        'Accept': 'application/json'
                    }
                });
                
                const data = await res.json();
                if (res.ok && data.success) {
                    window.location.reload();
                } else {
                    alert('Gagal menghapus: ' + (data.message || 'Kesalahan server'));
                    btn.disabled = false;
                    btn.innerText = 'Ya, Hapus Data';
                }
            } catch (e) {
                alert('Terjadi kesalahan jaringan.');
                btn.disabled = false;
                btn.innerText = 'Ya, Hapus Data';
            }
        }

        function filterResults(templateId) {
            window.location.href = "{{ route('formapp') }}?template_id=" + templateId + "&tab=results";
        }

        function escapeHtml(str) {
            if (!str) return '';
            return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
        }

        document.addEventListener('DOMContentLoaded', () => {
            initTheme();
            renderFormBuilder();
            
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('tab') === 'results' || urlParams.has('template_id')) {
                switchAdminTab('results');
            }

            document.addEventListener('keydown', (e) => {
                if (e.key === 'Escape') {
                    closeDetailModal();
                    closeDeleteModal();
                    closeDeleteResponseModal();
                    if (document.getElementById('save-success-modal')) {
                        document.getElementById('save-success-modal').classList.add('hidden');
                    }
                }
            });
        });
    </script>
</body>
</html>
