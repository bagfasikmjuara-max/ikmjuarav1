<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $template->title }} - IKM Juara</title>
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
        .option-radio:checked + label {
            background: rgba(245, 158, 11, 0.15);
            border-color: #f59e0b;
            color: #fbbf24;
            box-shadow: 0 0 15px rgba(245, 158, 11, 0.2);
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

        /* Select & Option Styling for Dark Mode */
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

        /* EVERY Questionnaire Card & Container MUST BE SOLID OPAQUE PURE WHITE */
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

        /* Inputs & Select Controls */
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

        html.light-mode #app-body input:focus,
        html.light-mode #app-body select:focus,
        html.light-mode #app-body textarea:focus,
        #app-body.light-mode input:focus {
            border-color: #f59e0b !important;
            background-color: #ffffff !important;
            box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.2) !important;
        }

        /* Standard Text -> Dark Slate / Black */
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

        /* ALL YELLOW / AMBER TEXT -> BLACK (#0f172a / #000000) */
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

        /* Badges & Soft Backgrounds */
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

        /* Questionnaire Radio Buttons */
        html.light-mode #app-body .option-radio + label,
        #app-body.light-mode .option-radio + label {
            background-color: #ffffff !important;
            background: #ffffff !important;
            border: 1px solid #cbd5e1 !important;
            color: #0f172a !important;
        }

        html.light-mode #app-body .option-radio:hover + label,
        #app-body.light-mode .option-radio:hover + label {
            background-color: #f8fafc !important;
            background: #f8fafc !important;
            border-color: #f59e0b !important;
        }

        html.light-mode #app-body .option-radio:checked + label,
        #app-body.light-mode .option-radio:checked + label {
            background-color: #fef3c7 !important;
            background: #fef3c7 !important;
            border-color: #f59e0b !important;
            color: #0f172a !important;
            font-weight: 800 !important;
            box-shadow: 0 2px 8px rgba(245, 158, 11, 0.2) !important;
        }

        /* Modal Overrides */
        html.light-mode #app-body [id*="-modal"],
        #app-body.light-mode [id*="-modal"] {
            background-color: rgba(15, 23, 42, 0.65) !important;
            backdrop-filter: none !important;
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
        <div class="max-w-5xl mx-auto flex items-center justify-between">
            <div class="flex items-center gap-3">
                <a href="{{ url('/') }}" class="text-xl font-black italic tracking-tighter text-white uppercase">
                    IKM<span class="text-amber-500">JUARA</span>
                </a>
                <span class="bg-amber-500/10 text-amber-400 border border-amber-500/20 text-[10px] font-black uppercase tracking-widest px-3 py-1 rounded-full">
                    Form Responden
                </span>
            </div>

            <div class="flex items-center gap-3">
                <button type="button" onclick="toggleTheme()" id="theme-toggle-btn"
                    class="bg-amber-500/10 hover:bg-amber-500/20 border border-amber-500/30 text-amber-400 hover:text-amber-300 px-3.5 py-1.5 rounded-full text-xs font-bold transition flex items-center gap-2 cursor-pointer">
                    <span id="theme-toggle-icon">☀️</span>
                    <span id="theme-toggle-text">Mode Terang</span>
                </button>
                <div class="flex items-center gap-2 bg-emerald-500/10 border border-emerald-500/20 px-3 py-1.5 rounded-full text-xs text-emerald-400 font-semibold">
                    <span class="w-2 h-2 rounded-full bg-emerald-500 animate-ping"></span>
                    <span>Form Terverifikasi</span>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Container -->
    <main class="flex-1 max-w-5xl w-full mx-auto p-4 md:p-8">
        
        <!-- Header Banner -->
        <div class="glass-panel rounded-3xl p-6 md:p-8 mb-8 border border-white/10 relative overflow-hidden">
            <div class="relative z-10">
                <div class="inline-flex items-center gap-2 bg-amber-500/10 border border-amber-500/30 px-3 py-1 rounded-full text-amber-400 text-xs font-bold mb-3">
                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                    </svg>
                    <span>Formulir Kuesioner Responden</span>
                </div>
                <h1 class="text-2xl md:text-3xl font-extrabold text-white tracking-tight mb-3">
                    {{ $template->title }}
                </h1>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 pt-4 border-t border-white/10 text-xs">
                    <div>
                        <span class="text-slate-400 block font-medium">Penyelenggara:</span>
                        <span class="text-white font-bold">{{ $template->penyelenggara }}</span>
                    </div>
                    <div>
                        <span class="text-slate-400 block font-medium">Lokasi / Tempat:</span>
                        <span class="text-white font-bold">{{ $template->lokasi }}</span>
                    </div>
                    <div>
                        <span class="text-slate-400 block font-medium">Tanggal Pelaksanaan:</span>
                        <span class="text-white font-bold">
                            @if(!empty($template->tanggal_selesai) && $template->tanggal_selesai != $template->tanggal)
                                {{ \Carbon\Carbon::parse($template->tanggal)->format('d F Y') }} s/d {{ \Carbon\Carbon::parse($template->tanggal_selesai)->format('d F Y') }}
                            @else
                                {{ \Carbon\Carbon::parse($template->tanggal)->format('d F Y') }}
                            @endif
                        </span>
                    </div>
                </div>
            </div>
        </div>

        @if(!$template->is_active)
            <!-- Form Inactive Notice -->
            <div class="glass-panel p-8 rounded-3xl border border-red-500/30 text-center space-y-4 mb-8 relative overflow-hidden">
                <div class="w-16 h-16 rounded-2xl bg-red-500/10 border border-red-500/30 text-red-400 flex items-center justify-center mx-auto shadow-inner">
                    <svg class="w-8 h-8 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                    </svg>
                </div>
                <h2 class="text-xl font-extrabold text-white">Akses Pengisian Formulir Ditutup</h2>
                <p class="text-xs text-slate-300 max-w-md mx-auto leading-relaxed">
                    Maaf, akses pengisian kuesioner evaluasi ini sedang <strong class="text-red-400 font-bold">DINONAKTIFKAN / DITUTUP SEMENTARA</strong> oleh panitia penyelenggara. Anda tidak dapat mengirim tanggapan saat ini.
                </p>
            </div>
        @endif

        @php
            $sections = $template->structure['sections'] ?? [];
            $totalQ = 0;
            foreach($sections as $s) {
                $totalQ += count($s['questions'] ?? []);
            }
        @endphp

        <!-- Sticky Progress Bar -->
        <div class="sticky top-20 z-40 mb-8 glass-panel p-4 rounded-2xl border border-white/10 backdrop-blur-md">
            <div class="flex items-center justify-between text-xs font-bold mb-2">
                <span class="text-slate-300">Kemajuan Pengisian Kuesioner</span>
                <span id="progress-text" class="text-amber-400 font-extrabold">0 / {{ $totalQ }} Pertanyaan Diisi (0%)</span>
            </div>
            <div class="w-full h-2.5 bg-slate-800 rounded-full overflow-hidden">
                <div id="progress-bar" class="h-full bg-gradient-to-r from-amber-500 to-emerald-400 transition-all duration-300 w-0"></div>
            </div>
        </div>

        <!-- User Questionnaire Form -->
        <form id="user-kuesioner-form" onsubmit="submitUserForm(event)" class="space-y-8">
            @csrf

            <!-- Identitas Responden -->
            <div class="glass-panel p-6 md:p-8 rounded-3xl border border-white/10 space-y-4">
                <h2 class="text-lg font-bold text-amber-400 flex items-center gap-2 border-b border-white/10 pb-3">
                    <svg class="w-5 h-5 text-amber-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                    </svg>
                    <span>Identitas Peserta / Responden</span>
                </h2>

                @if(isset($pesertaList) && count($pesertaList) > 0)
                    <div>
                        <label class="block text-xs font-bold text-slate-300 mb-1">
                            Pilih Nama Lengkap Anda <span class="text-amber-400 font-extrabold">(Wajib Diisi)</span> <span class="text-red-400">*</span>
                        </label>
                        <p class="text-[11px] text-slate-400 mb-3 leading-relaxed">
                            Silakan klik dan gulir (scroll) pilihan di bawah untuk memilih nama Anda. Nama bertanda <strong class="text-red-400">🔒 Terkunci</strong> telah menyelesaikan pengisian kuesioner ini.
                        </p>

                        <select name="nama_ikm" id="select-nama-ikm" required
                            class="w-full input-glass rounded-xl px-4 py-3.5 text-sm font-bold outline-none cursor-pointer transition">
                            <option value="" disabled selected>-- Klik Untuk Memilih Nama Anda --</option>
                            @foreach($pesertaList as $pName)
                                @php
                                    $cleanP = trim($pName);
                                    $isLocked = in_array(strtolower($cleanP), $alreadySubmittedNames ?? []);
                                @endphp
                                <option value="{{ $cleanP }}" {{ $isLocked ? 'disabled' : '' }}>
                                    {{ $isLocked ? '🔒 ' . $cleanP . ' (Sudah Mengisi - Terkunci)' : '👤 ' . $cleanP }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                @else
                    <div>
                        <label class="block text-xs font-bold text-slate-300 mb-2">
                            Nama Lengkap Anda <span class="text-amber-400 font-extrabold">(Wajib Diisi)</span> <span class="text-red-400">*</span>
                        </label>
                        <input type="text" name="nama_ikm" required
                            class="w-full input-glass rounded-xl px-4 py-3.5 text-sm font-semibold text-white outline-none placeholder:text-slate-500"
                            placeholder="Contoh: Budi Santoso, S.T. / Siti Rahmawati">
                    </div>
                @endif
            </div>

            <!-- Dynamic Questionnaire Sections -->
            @php $qIndex = 0; @endphp
            @foreach($sections as $sIdx => $section)
                <div class="glass-panel p-6 md:p-8 rounded-3xl border border-white/10 space-y-6">
                    <div class="border-b border-white/10 pb-4">
                        <span class="text-[10px] font-black tracking-widest text-amber-400 uppercase bg-amber-500/10 px-3 py-1 rounded-full border border-amber-500/20">Sub-Bagian {{ $sIdx + 1 }}</span>
                        <h2 class="text-xl font-extrabold text-white mt-2">{{ $section['title'] }}</h2>
                        @if(!empty($section['subtitle']))
                            <p class="text-xs text-slate-400 mt-1">{{ $section['subtitle'] }}</p>
                        @endif
                    </div>

                    <div class="space-y-6">
                        @foreach($section['questions'] as $q)
                            @php $qIndex++; @endphp
                            <div class="glass-card p-5 rounded-2xl">
                                <p class="text-sm font-bold text-slate-200 mb-4 leading-relaxed">
                                    <span class="text-amber-400 mr-2">{{ $qIndex }}.</span>{{ $q['text'] }}
                                </p>

                                <div class="grid grid-cols-2 md:grid-cols-4 gap-3">
                                    @foreach($section['options'] as $optIdx => $opt)
                                        <div class="relative">
                                            <input type="radio" 
                                                id="q_{{ $q['id'] }}_{{ $optIdx }}" 
                                                name="answers[{{ $q['id'] }}]" 
                                                value="{{ $opt['val'] }}" 
                                                required 
                                                onchange="updateProgress()" 
                                                class="option-radio hidden">
                                            <label for="q_{{ $q['id'] }}_{{ $optIdx }}" 
                                                class="block text-center py-3.5 px-3 rounded-xl border border-white/10 bg-white/5 text-xs font-bold text-slate-300 cursor-pointer hover:bg-white/10 transition">
                                                {{ $opt['label'] }}
                                            </label>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endforeach

            <!-- SUBMIT BUTTON -->
            <div class="glass-panel p-6 rounded-3xl border border-white/10 text-center">
                @if($template->is_active)
                    <button type="submit" id="btn-user-submit"
                        class="w-full md:w-auto px-10 py-4 bg-amber-500 hover:bg-amber-400 text-slate-950 font-black text-sm rounded-2xl shadow-xl shadow-amber-900/30 transition duration-300 uppercase tracking-wider flex items-center justify-center gap-3 mx-auto">
                        <span>Kirim Tanggapan Kuesioner</span>
                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                        </svg>
                    </button>
                @else
                    <button type="button" disabled
                        class="w-full md:w-auto px-10 py-4 bg-slate-800 text-slate-500 font-black text-sm rounded-2xl border border-white/10 cursor-not-allowed flex items-center justify-center gap-3 mx-auto uppercase tracking-wider">
                        <span>Akses Pengisian Ditutup</span>
                    </button>
                @endif
            </div>
        </form>
    </main>

    <!-- SUCCESS MODAL POPUP -->
    <div id="user-success-modal" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/80 backdrop-blur-md hidden">
        <div class="glass-panel max-w-md w-full p-8 rounded-3xl text-center border border-amber-500/30">
            <div class="w-20 h-20 rounded-full bg-emerald-500/20 border border-emerald-500/40 text-emerald-400 flex items-center justify-center mx-auto mb-5 shadow-lg shadow-emerald-950/40">
                <svg class="w-10 h-10 text-emerald-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                </svg>
            </div>
            <h3 class="text-2xl font-black text-white mb-2">Terima Kasih!</h3>
            <p class="text-slate-300 text-sm mb-6 leading-relaxed">
                Tanggapan evaluasi Anda telah tersimpan secara resmi.
            </p>

            <button type="button" onclick="window.location.reload()"
                class="w-full py-4 bg-amber-500 hover:bg-amber-400 text-slate-950 font-black text-sm rounded-2xl shadow-xl shadow-amber-900/30 transition uppercase tracking-wider">
                Pengisian Selesai
            </button>
        </div>
    </div>

    <!-- Footer -->
    <footer class="w-full glass-panel border-t border-white/10 py-6 px-6 mt-12 text-center">
        <p class="text-xs text-slate-400 font-medium">
            &copy; 2026 Pemerintah Kota Madiun &bull; Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah.
        </p>
    </footer>

    <script>
        const totalQuestions = {{ $totalQ }};

        // --- Theme Management ---
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

        function updateProgress() {
            const allChecked = document.querySelectorAll('input[type="radio"]:checked');
            const answered = allChecked.length;

            const percent = totalQuestions > 0 ? Math.round((answered / totalQuestions) * 100) : 0;
            document.getElementById('progress-bar').style.width = `${percent}%`;
            document.getElementById('progress-text').innerText = `${answered} / ${totalQuestions} Pertanyaan Diisi (${percent}%)`;
        }

        async function submitUserForm(e) {
            e.preventDefault();

            const form = document.getElementById('user-kuesioner-form');
            const formData = new FormData(form);
            const btnSubmit = document.getElementById('btn-user-submit');

            btnSubmit.disabled = true;
            btnSubmit.innerHTML = `<span>Memproses...</span>`;

            try {
                const res = await fetch("{{ route('formapp.user.submit', $template->slug) }}", {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                        'Accept': 'application/json'
                    },
                    body: formData
                });

                const data = await res.json();

                if (res.ok && data.success) {
                    document.getElementById('user-success-modal').classList.remove('hidden');
                } else {
                    alert('Gagal mengirim: ' + (data.message || 'Kesalahan sistem'));
                }
            } catch (err) {
                alert('Terjadi kesalahan jaringan.');
            } finally {
                btnSubmit.disabled = false;
                btnSubmit.innerHTML = `
                    <span>Kirim Tanggapan Kuesioner</span>
                    <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                    </svg>
                `;
            }
        }

        document.addEventListener('DOMContentLoaded', () => {
            initTheme();
            updateProgress();
        });
    </script>
</body>
</html>
