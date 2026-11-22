<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin Dukungan - IKM Juara</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background-color: #0f172a; 
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.05);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }
        .input-glass {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }
        .input-glass:focus {
            border-color: #10b981;
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-6 overflow-hidden">

    <div class="absolute top-0 left-0 w-full h-full -z-10">
        <div class="absolute top-[-10%] left-[-10%] w-[50%] h-[50%] bg-emerald-600/20 rounded-full blur-[120px]"></div>
        <div class="absolute bottom-[-10%] right-[-10%] w-[50%] h-[50%] bg-indigo-500/10 rounded-full blur-[120px]"></div>
    </div>

    <div class="w-full max-w-md relative">
        <div class="text-center mb-10">
            <h2 class="text-3xl font-black italic tracking-tighter text-white uppercase">
                IKM<span class="text-amber-500">JUARA</span>
            </h2>
            <p class="text-[10px] font-bold tracking-[0.3em] text-slate-400 mt-2 uppercase">Support Administrator Portal</p>
        </div>

        <div class="glass-card rounded-[40px] p-8 md:p-10 relative overflow-hidden">
            <!-- Mode Switcher Tabs -->
            <div class="flex bg-white/5 p-1 rounded-2xl mb-8 relative z-10 border border-white/10">
                <button type="button" onclick="switchTab('admin')" id="tab-btn-admin"
                    class="flex-1 py-3 text-xs font-bold rounded-xl transition-all duration-300 text-white bg-emerald-600 shadow-lg">
                    Admin Dukungan
                </button>
                <button type="button" onclick="switchTab('formapp')" id="tab-btn-formapp"
                    class="flex-1 py-3 text-xs font-bold rounded-xl transition-all duration-300 text-slate-400 hover:text-white">
                    Akses Form App
                </button>
            </div>

            <!-- Panel Login Admin -->
            <div id="panel-admin" class="relative z-10">
                <div class="mb-6 text-center">
                    <h1 class="text-xl font-bold text-white">Login Admin Dukungan</h1>
                    <p class="text-xs text-slate-400 font-medium mt-1">Gunakan kredensial akses dukungan teknis Anda</p>
                </div>

                @if(session('error'))
                    <div class="mb-6 bg-red-500/10 border border-red-500/20 text-red-400 px-4 py-3 rounded-2xl text-xs font-bold text-center animate-pulse">
                        {{ session('error') }}
                    </div>
                @endif

                <form action="{{ route('login.dukungan.post') }}" method="POST" class="space-y-5">
                    @csrf
                    <div>
                        <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Username Dukungan</label>
                        <input type="text" name="username" required autofocus
                            class="w-full input-glass rounded-2xl px-5 py-4 text-sm font-bold text-white outline-none placeholder:text-slate-600"
                            placeholder="contoh: dukungan">
                    </div>

                    <div>
                        <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Password</label>
                        <div class="relative">
                            <input id="password-field" type="password" name="password" required
                                class="w-full input-glass rounded-2xl pl-5 pr-12 py-4 text-sm font-bold text-white outline-none placeholder:text-slate-600"
                                placeholder="••••••••">
                            <button type="button" onclick="togglePasswordVisibility()" class="absolute inset-y-0 right-0 pr-4 flex items-center text-slate-400 hover:text-white transition duration-200">
                                <svg id="eye-icon" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="pt-2 flex flex-col gap-3">
                        <button type="submit" 
                            class="w-full bg-emerald-600 hover:bg-emerald-500 text-white py-4 rounded-2xl font-bold text-sm shadow-xl shadow-emerald-900/20 transition duration-300 transform hover:-translate-y-1 active:scale-95 uppercase tracking-wider">
                            Masuk Ke Panel Dukungan
                        </button>
                        <a href="{{ url('/') }}" 
                            class="w-full bg-white/5 border border-white/10 text-white hover:bg-white/10 py-4 rounded-2xl font-bold text-sm transition duration-300 text-center uppercase tracking-wider flex items-center justify-center gap-2">
                            <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                            </svg>
                            Kembali ke Dashboard
                        </a>
                    </div>
                </form>
            </div>

            <!-- Panel Form App Access -->
            <div id="panel-formapp" class="relative z-10 hidden">
                <div class="mb-6 text-center">
                    <div class="inline-flex items-center justify-center w-12 h-12 rounded-2xl bg-amber-500/10 border border-amber-500/20 text-amber-400 mb-3">
                        <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                        </svg>
                    </div>
                    <h1 class="text-xl font-bold text-white">Akses Masuk Form App</h1>
                    <p class="text-xs text-slate-400 font-medium mt-1">Masukkan Kode Masuk untuk membuka Halaman Form App</p>
                </div>

                @if(session('error_kode'))
                    <div class="mb-6 bg-red-500/10 border border-red-500/20 text-red-400 px-4 py-3 rounded-2xl text-xs font-bold text-center animate-pulse">
                        {{ session('error_kode') }}
                    </div>
                @endif

                <form action="{{ route('login.dukungan.formapp') }}" method="POST" class="space-y-5">
                    @csrf
                    <div>
                        <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Kode Masuk Form App</label>
                        <div class="relative">
                            <input type="password" name="kode_masuk" value="" required autocomplete="off"
                                class="w-full input-glass rounded-2xl px-5 py-4 text-center tracking-[0.25em] font-extrabold text-lg text-amber-400 outline-none border-amber-500/30 focus:border-amber-400 placeholder:text-slate-600 placeholder:tracking-normal placeholder:font-normal placeholder:text-sm"
                                placeholder="Masukkan Kode Masuk">
                        </div>
                        <p class="text-[10px] text-slate-400 font-medium mt-2 text-center">Ketik 6-digit Kode Masuk terotorisasi untuk mengakses Form App</p>
                    </div>

                    <div class="pt-2 flex flex-col gap-3">
                        <button type="submit" 
                            class="w-full bg-amber-500 hover:bg-amber-400 text-slate-950 py-4 rounded-2xl font-black text-sm shadow-xl shadow-amber-900/20 transition duration-300 transform hover:-translate-y-1 active:scale-95 uppercase tracking-wider flex items-center justify-center gap-2">
                            <span>Masuk Ke Form App</span>
                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                            </svg>
                        </button>
                        <a href="{{ url('/') }}" 
                            class="w-full bg-white/5 border border-white/10 text-white hover:bg-white/10 py-4 rounded-2xl font-bold text-sm transition duration-300 text-center uppercase tracking-wider flex items-center justify-center gap-2">
                            <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                            </svg>
                            Kembali ke Dashboard
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <div class="mt-8 text-center space-y-4">
            <p class="text-[10px] text-slate-650 font-medium italic">
                &copy; 2026 Pemerintah Kota Madiun. All rights reserved. / Support Access.
            </p>
        </div>
    </div>

    <script>
        function switchTab(tab) {
            const panelAdmin = document.getElementById('panel-admin');
            const panelFormApp = document.getElementById('panel-formapp');
            const btnAdmin = document.getElementById('tab-btn-admin');
            const btnFormApp = document.getElementById('tab-btn-formapp');

            if (tab === 'admin') {
                panelAdmin.classList.remove('hidden');
                panelFormApp.classList.add('hidden');
                btnAdmin.className = 'flex-1 py-3 text-xs font-bold rounded-xl transition-all duration-300 text-white bg-emerald-600 shadow-lg';
                btnFormApp.className = 'flex-1 py-3 text-xs font-bold rounded-xl transition-all duration-300 text-slate-400 hover:text-white';
            } else {
                panelAdmin.classList.add('hidden');
                panelFormApp.classList.remove('hidden');
                btnFormApp.className = 'flex-1 py-3 text-xs font-bold rounded-xl transition-all duration-300 text-slate-950 bg-amber-500 font-extrabold shadow-lg';
                btnAdmin.className = 'flex-1 py-3 text-xs font-bold rounded-xl transition-all duration-300 text-slate-400 hover:text-white';
            }
        }

        @if(session('error_kode'))
            document.addEventListener('DOMContentLoaded', () => {
                switchTab('formapp');
            });
        @endif

        function togglePasswordVisibility() {
            const passwordField = document.getElementById('password-field');
            const eyeIcon = document.getElementById('eye-icon');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                eyeIcon.innerHTML = `
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.814 7.814a3 3 0 01-4.243-4.243m1.895-1.895L17.5 17.5m-3.65-3.65l-3.65-3.65m0 0a3 3 0 014.243-4.243m-4.242 4.242L3 21" />
                `;
            } else {
                passwordField.type = 'password';
                eyeIcon.innerHTML = `
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                `;
            }
        }
    </script>
</body>
</html>
