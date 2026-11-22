<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin - IKM Juara</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background-color: #0f172a; /* Slate 900 untuk kontras glassmorphism */
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
            border-color: #6366f1;
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-6 overflow-hidden">

    <div class="absolute top-0 left-0 w-full h-full -z-10">
        <div class="absolute top-[-10%] left-[-10%] w-[50%] h-[50%] bg-indigo-600/20 rounded-full blur-[120px]"></div>
        <div class="absolute bottom-[-10%] right-[-10%] w-[50%] h-[50%] bg-amber-500/10 rounded-full blur-[120px]"></div>
    </div>

    <div class="w-full max-w-md relative">
        <div class="text-center mb-10">
            <h2 class="text-3xl font-black italic tracking-tighter text-white uppercase">
                IKM<span class="text-amber-500">JUARA</span>
            </h2>
            <p class="text-[10px] font-bold tracking-[0.3em] text-slate-400 mt-2 uppercase">Secure Administrator Portal</p>
        </div>

        <div class="glass-card rounded-[40px] p-10 relative overflow-hidden">
            <div class="mb-8 text-center relative z-10">
                <h1 class="text-xl font-bold text-white">Selamat Datang</h1>
                <p class="text-xs text-slate-400 font-medium mt-1">Silakan masuk dengan akun Anda</p>
            </div>

            @if(session('error'))
                <div class="mb-6 bg-red-500/10 border border-red-500/20 text-red-400 px-4 py-3 rounded-2xl text-xs font-bold text-center animate-pulse">
                    {{ session('error') }}
                </div>
            @endif

            <form action="{{ route('login') }}" method="POST" class="space-y-5 relative z-10">
                @csrf
                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Username</label>
                    <div class="relative">
                        <input type="text" name="username" required autofocus
                            class="w-full input-glass rounded-2xl px-5 py-4 text-sm font-bold text-white outline-none placeholder:text-slate-600"
                            placeholder="admin">
                    </div>
                </div>

                <div>
                    <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Password</label>
                    <div class="relative">
                        <input id="password-field" type="password" name="password" required
                            class="w-full input-glass rounded-2xl pl-5 pr-12 py-4 text-sm font-bold text-white outline-none placeholder:text-slate-600"
                            placeholder="bolodewo44">
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
                        class="w-full bg-indigo-600 text-white py-4 rounded-2xl font-bold text-sm shadow-xl shadow-indigo-900/20 hover:bg-indigo-500 transition duration-300 transform hover:-translate-y-1 active:scale-95 uppercase tracking-wider">
                        Masuk Ke Panel
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

        <div class="mt-8 text-center space-y-4">
            <p class="text-[10px] text-slate-600 font-medium italic">
                &copy; 2026 Pemerintah Kota Madiun. All rights reserved. / Developed by Bidang Perindustrian.
            </p>
        </div>
    </div>

    <script>
        function togglePasswordVisibility() {
            const passwordField = document.getElementById('password-field');
            const eyeIcon = document.getElementById('eye-icon');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                // Change to eye-off icon
                eyeIcon.innerHTML = `
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.814 7.814a3 3 0 01-4.243-4.243m1.895-1.895L17.5 17.5m-3.65-3.65l-3.65-3.65m0 0a3 3 0 014.243-4.243m-4.242 4.242L3 21" />
                `;
            } else {
                passwordField.type = 'password';
                // Change to eye icon
                eyeIcon.innerHTML = `
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                `;
            }
        }
    </script>
</body>
</html>