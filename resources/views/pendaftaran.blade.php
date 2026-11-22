<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrasi Pelatihan IKM Madiun</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
    <style>
        .step-content { display: none; }
        .step-content.active { display: block; }
        
        .custom-checkbox:checked + div, .custom-radio:checked + div {
            border-color: #4f46e5 !important;
            background-color: #eef2ff !important;
            color: #1e1b4b !important;
            font-weight: 800 !important;
            box-shadow: 0 4px 14px rgba(79, 70, 229, 0.15) !important;
        }
        .custom-radio:checked + div .radio-circle {
            border-color: #4f46e5 !important;
            background-color: #4f46e5 !important;
        }
        .custom-radio:checked + div .radio-dot {
            opacity: 1 !important;
            background-color: #ffffff !important;
        }
        
        #progress-bar { transition: width 0.5s ease-in-out; }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }
        .shake { animation: shake 0.2s ease-in-out 0s 2; }
    </style>
</head>
<body class="bg-slate-50 font-sans text-slate-900">

    <div class="max-w-3xl mx-auto my-6 px-4">
        {{-- TOMBOL KEMBALI KE DASHBOARD AWAL --}}
        <div class="flex items-center justify-between mb-6">
            <a href="{{ route('home') }}" class="inline-flex items-center gap-2.5 bg-white hover:bg-indigo-50 text-indigo-700 px-5 py-3 rounded-2xl border border-slate-200 shadow-sm font-extrabold text-xs uppercase tracking-wider transition-all duration-300 transform hover:-translate-x-1 group">
                <i class="fas fa-arrow-left text-xs group-hover:-translate-x-1 transition-transform"></i>
                <span>Kembali ke Beranda</span>
            </a>
            <div class="flex items-center gap-2 bg-indigo-50/80 px-4 py-2 rounded-2xl border border-indigo-100">
                <img src="{{ asset('logo-ikm.png') }}" alt="Logo IKM JUARA" class="h-6 object-contain" onerror="this.style.display='none'">
                <span class="font-black text-[11px] tracking-widest uppercase text-indigo-900">IKM JUARA</span>
            </div>
        </div>

        <div class="text-center mb-8">
            <h1 class="text-3xl font-extrabold text-indigo-900">Formulir Registrasi Pelatihan</h1>
            <p class="text-slate-500 mt-2">Data ini membantu kami menyesuaikan materi dengan kondisi usaha Anda.</p>
        </div>

        {{-- BAGIAN NOTIFIKASI SUKSES --}}
        @if(session('success'))
            <div id="success-alert" class="bg-green-100 border-l-4 border-green-500 text-green-700 p-5 mb-6 rounded-xl shadow-lg flex items-center animate-bounce">
                <i class="fas fa-check-circle text-2xl mr-3"></i>
                <div>
                    <p class="font-bold">Pendaftaran Berhasil!</p>
                    <p class="text-sm">{{ session('success') }}</p>
                </div>
            </div>
            <script>
                // Scroll otomatis ke notifikasi jika muncul
                window.scrollTo({ top: 0, behavior: 'smooth' });
                // Hilangkan notifikasi setelah 10 detik
                setTimeout(() => {
                    document.getElementById('success-alert')?.remove();
                }, 10000);
            </script>
        @endif

        @if(isset($errors) && $errors->any())
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded-xl shadow-md">
                <p class="font-bold mb-2">Mohon perbaiki kesalahan berikut:</p>
                <ul class="list-disc ml-5 text-sm">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @if (session('error'))
            <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6 rounded-xl shadow-md">
                {{ session('error') }}
            </div>
        @endif

        <div class="bg-white rounded-3xl shadow-xl overflow-hidden border border-slate-100">
            <div class="h-2 bg-slate-100">
                <div id="progress-bar" class="h-full bg-indigo-600" style="width: 20%"></div>
            </div>

            <form action="{{ route('pendaftaran.store') }}" method="POST" enctype="multipart/form-data" id="registrationForm" onsubmit="return finalCheck()">
                @csrf

                {{-- STEP 1: PILIH KEGIATAN --}}
                <div class="step-content active p-8" id="step-1">
                    <h2 class="text-xl font-bold mb-6 text-indigo-900"><i class="fas fa-calendar-check mr-2 text-indigo-500"></i>Pilih Pelatihan</h2>
                    
                    <div class="space-y-4">
                        <div>
                            <label class="block font-medium text-slate-700 mb-2">Pelatihan yang Ingin Diikuti:</label>
                            <select name="nama_kegiatan" id="pilih_kegiatan" onchange="updateDetail()" class="w-full border border-slate-200 rounded-xl px-4 py-4 outline-none focus:ring-2 focus:ring-indigo-500 transition" required>
                                <option value="">-- Pilih Kegiatan --</option>
                            
                                @if(isset($kegiatan) && $kegiatan->count() > 0)
                                    @foreach($kegiatan as $keg)
                                        <option value="{{ $keg->nama_kegiatan }}" 
                                                data-tempat="{{ $keg->tempat_kegiatan ?? $keg->tempat }}" 
                                                data-jadwal="{{ isset($keg->tgl_mulai) ? \Carbon\Carbon::parse($keg->tgl_mulai)->format('d M Y') : '' }} s/d {{ isset($keg->tgl_selesai) ? \Carbon\Carbon::parse($keg->tgl_selesai)->format('d M Y') : '' }}"
                                                data-deskripsi="{{ $keg->deskripsi_kegiatan ?? $keg->deskripsi ?? 'Tidak ada deskripsi' }}"
                                                data-kuota="{{ $keg->kuota_peserta ?? 0 }}">
                                            {{ $keg->nama_kegiatan }}
                                        </option>
                                    @endforeach
                                @else
                                    <option value="" disabled>Belum ada kegiatan aktif</option>
                                @endif
                            </select>
                        </div>

                        {{-- DETAIL KEGIATAN POPUP BOX --}}
                        <div id="detail_box" class="hidden bg-indigo-50/50 border border-indigo-100 rounded-2xl p-5 space-y-3 transition-all duration-300">
                            <h3 class="font-bold text-indigo-900 text-sm flex items-center gap-2">
                                <i class="fas fa-info-circle text-indigo-600"></i> Detail Informasi Pelatihan:
                            </h3>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-3 text-xs">
                                <div class="bg-white p-3 rounded-xl border border-indigo-50">
                                    <span class="text-slate-400 font-medium block mb-1">📅 Jadwal Pelaksanaan</span>
                                    <span id="det_jadwal" class="font-bold text-slate-800"></span>
                                </div>
                                <div class="bg-white p-3 rounded-xl border border-indigo-50">
                                    <span class="text-slate-400 font-medium block mb-1">📍 Lokasi / Tempat</span>
                                    <span id="det_tempat" class="font-bold text-slate-800"></span>
                                </div>
                                <div class="bg-white p-3 rounded-xl border border-indigo-50">
                                    <span class="text-slate-400 font-medium block mb-1">👥 Kuota Peserta</span>
                                    <span id="det_kuota" class="font-bold text-indigo-600"></span> Peserta
                                </div>
                                <div class="bg-white p-3 rounded-xl border border-indigo-50">
                                    <span class="text-slate-400 font-medium block mb-1">📝 Deskripsi Singkat</span>
                                    <span id="det_deskripsi" class="font-medium text-slate-700"></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="button" onclick="goToStep(2)" class="w-full mt-8 py-4 bg-indigo-600 text-white rounded-2xl font-bold hover:shadow-lg transition transform active:scale-95">
                        Lanjut ke Data Diri <i class="fas fa-arrow-right ml-2"></i>
                    </button>
                </div>

                {{-- STEP 2: DATA DIRI PESERTA --}}
                <div class="step-content p-8" id="step-2">
                    <h2 class="text-xl font-bold mb-6 text-indigo-900"><i class="fas fa-user mr-2 text-indigo-500"></i>Data Diri Peserta</h2>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="space-y-1">
                            <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Nama Lengkap (Sesuai KTP)</label>
                            <input type="text" name="nama_lengkap" placeholder="Masukkan nama lengkap" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" value="{{ old('nama_lengkap') }}" required>
                        </div>

                        <div class="space-y-1">
                            <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">NIK (Wajib 16 Digit)</label>
                            <input type="text" name="nik" maxlength="16" minlength="16" placeholder="Contoh: 357701xxxxxxxxxx" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-mono font-bold" oninput="this.value = this.value.replace(/[^0-9]/g, '')" value="{{ old('nik') }}" required>
                        </div>

                        {{-- PERTANYAAN REVISI NIB CONDITIONAL --}}
                        <div class="space-y-3 md:col-span-2 bg-slate-50 p-5 rounded-2xl border border-slate-200">
                            <label class="block text-slate-800 font-bold text-xs uppercase tracking-wider">Apakah Anda telah memiliki Nomor Induk Berusaha (NIB)?</label>
                            
                            <div class="grid grid-cols-2 gap-3">
                                <label class="flex items-center gap-3 p-3.5 bg-white border border-slate-200 rounded-xl cursor-pointer hover:border-indigo-400 transition group">
                                    <input type="radio" name="status_nib" value="Sudah" onchange="toggleNibFields()" class="w-4 h-4 text-indigo-600 focus:ring-indigo-500" {{ old('status_nib') == 'Sudah' ? 'checked' : '' }}>
                                    <span class="text-xs font-bold text-slate-700 group-hover:text-indigo-600">Sudah Memiliki NIB</span>
                                </label>
                                
                                <label class="flex items-center gap-3 p-3.5 bg-white border border-slate-200 rounded-xl cursor-pointer hover:border-indigo-400 transition group">
                                    <input type="radio" name="status_nib" value="Belum" onchange="toggleNibFields()" class="w-4 h-4 text-indigo-600 focus:ring-indigo-500" {{ old('status_nib') == 'Belum' ? 'checked' : '' }}>
                                    <span class="text-xs font-bold text-slate-700 group-hover:text-indigo-600">Belum Memiliki NIB</span>
                                </label>
                            </div>

                            {{-- JIKA SUDAH MEMILIKI NIB --}}
                            <div id="nib_input_container" class="hidden space-y-1 pt-2">
                                <label class="text-slate-700 font-bold text-xs uppercase tracking-wider">Nomor NIB (Wajib 13 Digit)</label>
                                <input type="text" name="nib" id="nib" maxlength="13" placeholder="Contoh: 9120000xxxxxx" class="w-full p-4 bg-white border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-mono font-bold" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                                <span class="text-[10px] text-slate-400 font-medium">Ketik 13 digit angka NIB dari sistem OSS.</span>
                            </div>

                            {{-- JIKA BELUM MEMILIKI NIB --}}
                            <div id="nib_pendampingan_container" class="hidden space-y-3 pt-2 bg-amber-50 p-4 rounded-xl border border-amber-200">
                                <label class="block text-slate-800 font-bold text-xs leading-relaxed">
                                    Bersedia didampingi dalam pembuatan NIB bilamana lolos seleksi pelatihan?
                                </label>

                                <div class="grid grid-cols-2 gap-3">
                                    <label class="flex items-center gap-2.5 p-3 bg-white border border-emerald-300 rounded-xl cursor-pointer hover:bg-emerald-50 transition">
                                        <input type="radio" name="bersedia_nib" value="Bersedia" class="w-4 h-4 text-emerald-600 focus:ring-emerald-500" {{ old('bersedia_nib') == 'Bersedia' ? 'checked' : '' }}>
                                        <span class="text-xs font-black text-emerald-700">Ya, Bersedia Didampingi</span>
                                    </label>

                                    <label class="flex items-center gap-2.5 p-3 bg-white border border-rose-200 rounded-xl cursor-pointer hover:bg-rose-50 transition">
                                        <input type="radio" name="bersedia_nib" value="Tidak" class="w-4 h-4 text-rose-600 focus:ring-rose-500" {{ old('bersedia_nib') == 'Tidak' ? 'checked' : '' }}>
                                        <span class="text-xs font-bold text-rose-600">Tidak Bersedia</span>
                                    </label>
                                </div>
                                <p class="text-[10px] text-amber-800 font-medium">* Pendaftar yang belum memiliki NIB WAJIB memilih "Ya, Bersedia Didampingi" untuk dapat melanjutkan pendaftaran.</p>
                            </div>
                        </div>

                        <div class="space-y-1">
                            <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Email Aktif</label>
                            <input type="email" name="email" placeholder="contoh@gmail.com" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" value="{{ old('email') }}" required>
                        </div>

                        <div class="space-y-1">
                            <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Nomor WhatsApp Aktif</label>
                            <input type="text" name="whatsapp" placeholder="Contoh: 0812xxxxxxx" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" value="{{ old('whatsapp') }}" required>
                        </div>

                        {{-- REVISI JENIS KELAMIN: PLACEHOLDER OPTION --}}
                        <div class="space-y-1">
                            <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Jenis Kelamin</label>
                            <select name="jenis_kelamin" id="jenis_kelamin_select" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" required>
                                <option value="" disabled {{ old('jenis_kelamin') ? '' : 'selected' }}>-- Pilih Jenis Kelamin --</option>
                                <option value="Laki-laki" {{ old('jenis_kelamin') == 'Laki-laki' ? 'selected' : '' }}>Laki-laki</option>
                                <option value="Perempuan" {{ old('jenis_kelamin') == 'Perempuan' ? 'selected' : '' }}>Perempuan</option>
                            </select>
                        </div>

                        <div class="space-y-1 md:col-span-2">
                            <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Tanggal Lahir</label>
                            <input type="date" name="tanggal_lahir" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" required>
                        </div>
                    </div>
                    
                    <div class="mt-6">
                        <label class="block mb-2 font-bold text-slate-700 text-xs uppercase tracking-wider">Unggah Foto KTP:</label>
                        <div class="relative border-2 border-dashed border-slate-300 rounded-2xl p-8 text-center hover:bg-slate-50 transition cursor-pointer group">
                            <input type="file" name="foto_ktp" class="absolute inset-0 opacity-0 cursor-pointer" onchange="previewFile(this)" accept="image/*" required>
                            <div id="upload-label">
                                <i class="fas fa-cloud-upload-alt text-3xl text-slate-300 mb-2 group-hover:text-indigo-400 transition"></i>
                                <p class="text-sm text-slate-500">Klik untuk upload foto KTP Anda</p>
                            </div>
                            <img id="preview-img" class="hidden mx-auto h-40 rounded-lg shadow-md border-2 border-white">
                        </div>
                    </div>

                    <div class="flex gap-4 mt-8">
                        <button type="button" onclick="goToStep(1)" class="w-1/3 py-4 border rounded-2xl font-bold text-slate-500 hover:bg-slate-100 transition">Kembali</button>
                        <button type="button" onclick="goToStep(3)" class="w-2/3 py-4 bg-indigo-600 text-white rounded-2xl font-bold hover:shadow-lg transition transform active:scale-95">Lanjut ke Info Usaha</button>
                    </div>
                </div>

                {{-- STEP 3: INFORMASI USAHA --}}
                <div class="step-content p-8" id="step-3">
                    <h2 class="text-xl font-bold mb-6 text-indigo-900"><i class="fas fa-store mr-2 text-indigo-500"></i>Informasi Usaha</h2>
                    <div class="space-y-4">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div class="space-y-1">
                                <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Nama Usaha / Merek Usaha</label>
                                <input type="text" name="nama_usaha" placeholder="Contoh: Keripik Tempe Barokah" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" required>
                            </div>
                            <div class="space-y-1">
                                <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Produk yang Diproduksi</label>
                                <input type="text" name="produk_diproduksi" placeholder="Contoh: Keripik Tempe, Sambel Pecel" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" required>
                            </div>
                        </div>

                        {{-- UNGGAH FOTO PRODUK / USAHA (MAKS 3 FOTO, MAKS 500 KB / FOTO) --}}
                        <div class="space-y-2 pt-2">
                            <div class="flex justify-between items-center">
                                <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Unggah Foto Produk / Usaha</label>
                                <span class="text-[10px] font-extrabold text-indigo-600 bg-indigo-50 px-3 py-1 rounded-full border border-indigo-100 uppercase">
                                    Maks. 3 Foto (Otomatis Kompres &lt; 500 KB)
                                </span>
                            </div>

                            <div class="relative border-2 border-dashed border-indigo-200 bg-indigo-50/20 hover:bg-indigo-50/50 rounded-2xl p-6 text-center transition cursor-pointer group" onclick="document.getElementById('foto_produk_input').click()">
                                <input type="file" id="foto_produk_input" name="foto_produk[]" accept="image/*" multiple class="hidden" onchange="handleFotoProdukUpload(this)">
                                <div id="foto-produk-placeholder" class="space-y-2">
                                    <div class="w-12 h-12 rounded-2xl bg-indigo-100 text-indigo-600 flex items-center justify-center mx-auto group-hover:scale-110 transition-transform">
                                        <i class="fas fa-camera text-xl"></i>
                                    </div>
                                    <p class="text-xs font-bold text-slate-700">Klik untuk memilih foto produk atau usaha (Maks. 3 foto)</p>
                                    <p class="text-[10px] text-slate-400 font-medium">Format: JPG, PNG, WEBP. Foto di atas 500 KB akan otomatis dikompres secara otomatis.</p>
                                </div>
                            </div>

                            <!-- Preview List -->
                            <div id="foto-produk-preview-list" class="grid grid-cols-3 gap-3 pt-2"></div>
                        </div>
                        
                        <input type="hidden" name="kota" value="Madiun">
                        
                        <div class="space-y-1">
                            <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Alamat Lengkap Usaha</label>
                            <textarea name="alamat_usaha" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" placeholder="Contoh: Jl. Pahlawan Gang Teratai, No. 12, Kota Madiun" required>{{ old('alamat_usaha') }}</textarea>
                        </div>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="space-y-1">
                                <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Kecamatan</label>
                                <select id="kecamatan_select" name="kecamatan" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" required onchange="updateKelurahanOptions()">
                                    <option value="">-- Pilih Kecamatan --</option>
                                    <option value="Kartoharjo" {{ old('kecamatan') == 'Kartoharjo' ? 'selected' : '' }}>Kartoharjo</option>
                                    <option value="Manguharjo" {{ old('kecamatan') == 'Manguharjo' ? 'selected' : '' }}>Manguharjo</option>
                                    <option value="Taman" {{ old('kecamatan') == 'Taman' ? 'selected' : '' }}>Taman</option>
                                </select>
                            </div>
                            <div class="space-y-1">
                                <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Kelurahan</label>
                                <select id="kelurahan_select" name="kelurahan" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" required disabled>
                                    <option value="">-- Pilih Kecamatan Terlebih Dahulu --</option>
                                </select>
                            </div>
                        </div>

                        <div class="space-y-1">
                            <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Jenis Usaha</label>
                            <select name="jenis_usaha" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" required>
                                <option value="">Pilih Jenis Usaha...</option>
                                <option value="Kuliner">Kuliner</option>
                                <option value="Fashion">Fashion</option>
                                <option value="Jasa">Jasa</option>
                                <option value="Kriya">Kriya</option>
                                <option value="Kerajinan">Kerajinan</option>
                            </select>
                        </div>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="space-y-1">
                                <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Tahun Mulai Usaha</label>
                                <input type="number" name="tahun_mulai" placeholder="Contoh: 2020" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" required>
                            </div>
                            <div class="space-y-1">
                                <label class="text-slate-700 font-bold ml-1 text-xs uppercase tracking-wider">Skala Usaha</label>
                                <select name="skala_usaha" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium">
                                    <option value="Mikro">Mikro</option>
                                    <option value="Kecil">Kecil</option>
                                    <option value="Menengah">Menengah</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="flex gap-4 mt-8">
                        <button type="button" onclick="goToStep(2)" class="w-1/3 py-4 border rounded-2xl hover:bg-slate-100 transition font-bold">Kembali</button>
                        <button type="button" onclick="goToStep(4)" class="w-2/3 py-4 bg-indigo-600 text-white rounded-2xl font-bold hover:shadow-lg transition transform active:scale-95">Lanjut ke Kondisi Bisnis</button>
                    </div>
                </div>

                {{-- STEP 4: KONDISI BISNIS --}}
                <div class="step-content p-8" id="step-4">
                    <h2 class="text-xl font-bold mb-6 text-indigo-900"><i class="fas fa-chart-line mr-2 text-indigo-500"></i>Kondisi Bisnis</h2>
                    <div class="space-y-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div class="space-y-1">
                                <label class="text-slate-700 font-bold text-xs uppercase tracking-wider block">Omzet per bulan (Rupiah)?</label>
                                <div class="relative">
                                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                        <span class="text-slate-400 font-bold text-sm">Rp</span>
                                    </div>
                                    <input type="text" name="omzet_bulanan" id="omzet_input" placeholder="Contoh: 5.000.000" class="w-full p-4 pl-12 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium transition" oninput="handleRupiah(this)" required>
                                </div>
                            </div>
                            <div class="space-y-1">
                                <label class="text-slate-700 font-bold text-xs uppercase tracking-wider block">Stabilitas Omzet</label>
                                <select name="stabilitas_omzet" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium">
                                    <option value="Ya">Ya, Stabil</option>
                                    <option value="Tidak">Tidak</option>
                                    <option value="Musiman">Musiman / Made By Order</option>
                                </select>
                            </div>
                        </div>

                        {{-- PERTANYAAN REVISI: CAKUPAN WILAYAH PEMASARAN PRODUK --}}
                        <div class="space-y-3">
                            <label class="block font-bold text-slate-800 text-xs uppercase tracking-wider">Cakupan Wilayah Pemasaran Produk (Bisa Pilih > 1):</label>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-3 text-xs">
                                <label class="cursor-pointer relative group">
                                    <input type="checkbox" name="cakupan_pemasaran[]" value="Lokal (Kabupaten/Kota/Provinsi)" class="hidden custom-checkbox">
                                    <div class="p-4 bg-slate-50 border border-slate-200 rounded-2xl transition-all group-hover:bg-indigo-50 flex items-start gap-3">
                                        <i class="fas fa-map-marker-alt text-indigo-500 text-base mt-0.5"></i>
                                        <div>
                                            <div class="font-extrabold text-slate-800 text-sm">Lokal</div>
                                            <div class="text-[11px] text-slate-500 font-medium">Mencakup 1 wilayah Kabupaten, Kota, atau Provinsi.</div>
                                        </div>
                                    </div>
                                </label>

                                <label class="cursor-pointer relative group">
                                    <input type="checkbox" name="cakupan_pemasaran[]" value="Regional (Antar Provinsi/Nasional)" class="hidden custom-checkbox">
                                    <div class="p-4 bg-slate-50 border border-slate-200 rounded-2xl transition-all group-hover:bg-indigo-50 flex items-start gap-3">
                                        <i class="fas fa-globe-asia text-indigo-500 text-base mt-0.5"></i>
                                        <div>
                                            <div class="font-extrabold text-slate-800 text-sm">Regional</div>
                                            <div class="text-[11px] text-slate-500 font-medium">Mencakup wilayah antar Provinsi atau Nasional.</div>
                                        </div>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <div class="space-y-3">
                            <label class="block font-bold text-slate-800 text-xs uppercase tracking-wider">Tantangan Utama (Bisa pilih > 1):</label>
                            <div class="grid grid-cols-2 gap-3 text-xs">
                                @php $tantangan = ['Penjualan sepi', 'Marketing kurang efektif', 'Modal terbatas', 'Produksi terbatas', 'SDM kurang', 'Lainnya']; @endphp
                                @foreach($tantangan as $t)
                                <label class="cursor-pointer relative group">
                                    <input type="checkbox" name="tantangan[]" value="{{ $t }}" class="hidden custom-checkbox">
                                    <div class="p-3 bg-slate-50 border border-slate-200 rounded-xl transition-all group-hover:bg-indigo-50 flex items-center gap-2 font-medium">
                                        <i class="fas fa-tag opacity-30 text-[10px]"></i> {{ $t }}
                                    </div>
                                </label>
                                @endforeach
                            </div>
                        </div>

                        <div class="space-y-3">
                            <label class="block font-bold text-slate-800 text-xs uppercase tracking-wider">Media Penjualan:</label>
                            <div class="grid grid-cols-2 gap-3 text-xs">
                                @php $medias = ['Offline (toko)', 'WhatsApp', 'Instagram', 'Marketplace', 'Website']; @endphp
                                @foreach($medias as $m)
                                <label class="cursor-pointer relative group">
                                    <input type="checkbox" name="media[]" value="{{ $m }}" class="hidden custom-checkbox">
                                    <div class="p-3 bg-slate-50 border border-slate-200 rounded-xl transition-all group-hover:bg-indigo-50 flex items-center gap-2 font-medium">
                                        <i class="fas fa-share-alt opacity-30 text-[10px]"></i> {{ $m }}
                                    </div>
                                </label>
                                @endforeach
                            </div>
                        </div>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="space-y-1">
                                <label class="text-xs text-slate-700 font-bold uppercase tracking-wider">Jumlah Karyawan Tetap</label>
                                <input type="number" name="karyawan_tetap" value="0" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium">
                            </div>
                            <div class="space-y-1">
                                <label class="text-xs text-slate-700 font-bold uppercase tracking-wider">Karyawan Tidak Tetap</label>
                                <input type="number" name="karyawan_tidak_tetap" value="0" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium">
                            </div>
                        </div>
                    </div>

                    <div class="flex gap-4 mt-8">
                        <button type="button" onclick="goToStep(3)" class="w-1/3 py-4 border rounded-2xl hover:bg-slate-100 transition font-bold">Kembali</button>
                        <button type="button" onclick="goToStep(5)" class="w-2/3 py-4 bg-indigo-600 text-white rounded-2xl font-bold hover:shadow-lg transition">Langkah Terakhir</button>
                    </div>
                </div>

                {{-- STEP 5: LANGKAH TERAKHIR (STYLING RADIO LEVEL DIGITAL REVISED) --}}
                <div class="step-content p-8" id="step-5">
                    <h2 class="text-xl font-bold mb-4 text-indigo-900"><i class="fas fa-rocket mr-2 text-indigo-500"></i>Langkah Terakhir</h2>
                    <div class="space-y-6">
                        
                        {{-- REVISI STYLING TINGKAT DIGITAL MARKETING --}}
                        <div class="space-y-3">
                            <label class="font-bold text-slate-800 text-xs uppercase tracking-wider block">Tingkat Digital Marketing:</label>
                            <div class="grid grid-cols-1 gap-3">
                                <label class="cursor-pointer group">
                                    <input type="radio" name="level_digital" value="Belum" required class="hidden custom-radio">
                                    <div class="p-4 bg-slate-50 border-2 border-slate-200 rounded-2xl flex items-center gap-3.5 group-hover:border-indigo-300 group-hover:bg-indigo-50/40 transition-all duration-200">
                                        <div class="w-5 h-5 border-2 border-slate-300 rounded-full flex items-center justify-center shrink-0 transition-colors radio-circle">
                                            <div class="w-2.5 h-2.5 rounded-full opacity-0 transition-opacity radio-dot"></div>
                                        </div>
                                        <div>
                                            <span class="text-sm font-extrabold text-slate-800">Belum Menggunakan</span>
                                            <p class="text-xs text-slate-500 font-normal">Belum pernah memakai media sosial atau marketplace untuk jualan online.</p>
                                        </div>
                                    </div>
                                </label>
                                
                                <label class="cursor-pointer group">
                                    <input type="radio" name="level_digital" value="Sudah tapi belum maksimal" class="hidden custom-radio">
                                    <div class="p-4 bg-slate-50 border-2 border-slate-200 rounded-2xl flex items-center gap-3.5 group-hover:border-indigo-300 group-hover:bg-indigo-50/40 transition-all duration-200">
                                        <div class="w-5 h-5 border-2 border-slate-300 rounded-full flex items-center justify-center shrink-0 transition-colors radio-circle">
                                            <div class="w-2.5 h-2.5 rounded-full opacity-0 transition-opacity radio-dot"></div>
                                        </div>
                                        <div>
                                            <span class="text-sm font-extrabold text-slate-800">Sudah Tapi Belum Maksimal</span>
                                            <p class="text-xs text-slate-500 font-normal">Sudah punya akun medsos/toko online tetapi jarang update atau belum rutin promosi.</p>
                                        </div>
                                    </div>
                                </label>
                                
                                <label class="cursor-pointer group">
                                    <input type="radio" name="level_digital" value="Sudah aktif" class="hidden custom-radio">
                                    <div class="p-4 bg-slate-50 border-2 border-slate-200 rounded-2xl flex items-center gap-3.5 group-hover:border-indigo-300 group-hover:bg-indigo-50/40 transition-all duration-200">
                                        <div class="w-5 h-5 border-2 border-slate-300 rounded-full flex items-center justify-center shrink-0 transition-colors radio-circle">
                                            <div class="w-2.5 h-2.5 rounded-full opacity-0 transition-opacity radio-dot"></div>
                                        </div>
                                        <div>
                                            <span class="text-sm font-extrabold text-slate-800">Sudah Aktif & Rutin</span>
                                            <p class="text-xs text-slate-500 font-normal">Rutin promosi digital, membuat konten produk, dan melayani pembeli online secara konsisten.</p>
                                        </div>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <div class="space-y-3">
                            <label class="font-bold text-slate-800 text-xs uppercase tracking-wider block">Apakah Anda pernah mengikuti pelatihan IKM (khususnya diselenggarakan oleh DisnakerKUKM) sebelumnya?</label>
                            <div class="flex gap-6">
                                <label class="flex items-center gap-2 cursor-pointer group">
                                    <input type="radio" name="pernah_pelatihan" value="Pernah" class="w-4 h-4 accent-indigo-600" required> 
                                    <span class="text-sm font-bold text-slate-700">Pernah</span>
                                </label>
                                <label class="flex items-center gap-2 cursor-pointer group">
                                    <input type="radio" name="pernah_pelatihan" value="Belum" checked class="w-4 h-4 accent-indigo-600"> 
                                    <span class="text-sm font-bold text-slate-700">Belum</span>
                                </label>
                            </div>
                        </div>

                        <div class="space-y-1">
                            <label class="text-xs font-bold text-slate-700 uppercase tracking-wider block">Apa harapan Anda setelah mengikuti pelatihan ini?</label>
                            <textarea name="harapan_pelatihan" rows="2" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" placeholder="Contoh: Ingin bisa jualan di TikTok atau memperluas jaringan reseller..." required></textarea>
                        </div>

                        <div class="space-y-1">
                            <label class="text-xs font-bold text-slate-700 uppercase tracking-wider block">Apa target usaha Anda dalam 6 bulan ke depan?</label>
                            <textarea name="target_6_bulan" rows="2" class="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:ring-2 focus:ring-indigo-500 outline-none font-medium" placeholder="Contoh: Menambah 3 reseller baru atau omzet naik 2x lipat..." required></textarea>
                        </div>

                        <div class="bg-amber-50 p-4 rounded-xl border border-amber-200 text-xs text-amber-900 space-y-1">
                            <p class="font-bold">🔒 Kerahasiaan Data Terjamin:</p>
                            <p class="font-medium">Data yang Anda masukkan hanya digunakan untuk keperluaan penyeleksian dan pendampingan program IKM DisnakerKUKM Kota Madiun.</p>
                        </div>

                        <div class="flex gap-4 mt-8">
                            <button type="button" onclick="goToStep(4)" class="w-1/3 py-4 border rounded-2xl hover:bg-slate-100 transition font-bold">Kembali</button>
                            <button type="submit" id="submitBtn" class="w-2/3 py-4 bg-indigo-700 hover:bg-indigo-800 text-white rounded-2xl font-extrabold shadow-lg transition transform active:scale-95">Kirim Pendaftaran 🚀</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <p class="text-center text-slate-400 text-xs mt-8 font-medium">IKM Maju Madiun Mendunia &copy; 2026</p>
    </div>

<script>
function updateDetail() {
    const select = document.getElementById('pilih_kegiatan');
    const selectedOption = select.options[select.selectedIndex];
    const detailBox = document.getElementById('detail_box');

    if (selectedOption.value !== "") {
        const kuotaValue = selectedOption.getAttribute('data-kuota');
        document.getElementById('det_jadwal').innerText = selectedOption.getAttribute('data-jadwal');
        document.getElementById('det_tempat').innerText = selectedOption.getAttribute('data-tempat');
        document.getElementById('det_deskripsi').innerText = selectedOption.getAttribute('data-deskripsi');
        document.getElementById('det_kuota').innerText = kuotaValue ? kuotaValue : '0';
        detailBox.classList.remove('hidden');
    } else {
        detailBox.classList.add('hidden');
    }
}

function toggleNibFields() {
    const statusNib = document.querySelector('input[name="status_nib"]:checked')?.value;
    const nibContainer = document.getElementById('nib_input_container');
    const pendampinganContainer = document.getElementById('nib_pendampingan_container');
    const nibInput = document.getElementById('nib');

    if (statusNib === 'Sudah') {
        nibContainer.classList.remove('hidden');
        pendampinganContainer.classList.add('hidden');
        if (nibInput && nibInput.value.startsWith('Belum')) {
            nibInput.value = '';
        }
    } else if (statusNib === 'Belum') {
        nibContainer.classList.add('hidden');
        pendampinganContainer.classList.remove('hidden');
        if (nibInput) {
            nibInput.value = 'Belum (Bersedia)';
        }
    }
}

function goToStep(step) {
    const currentActive = document.querySelector('.step-content.active');
    const currentStepId = currentActive ? parseInt(currentActive.id.replace('step-', '')) : 1;

    if (step > currentStepId) {
        const inputs = currentActive.querySelectorAll('input[required], select[required], textarea[required]');
        let allValid = true;

        // Bersihkan error lama
        currentActive.querySelectorAll('.error-msg').forEach(el => el.remove());
        currentActive.querySelectorAll('.border-red-500').forEach(el => el.classList.remove('border-red-500', 'shake'));

        // VALIDASI SPESIFIK STEP 2 (DATA DIRI & CONDITIONAL NIB)
        if (currentStepId === 2) {
            const jkel = document.getElementById('jenis_kelamin_select')?.value;
            if (!jkel) {
                allValid = false;
                const sel = document.getElementById('jenis_kelamin_select');
                sel.classList.add('border-red-500', 'shake');
                showError(sel, "Silakan pilih Jenis Kelamin terlebih dahulu");
            }

            const statusNib = document.querySelector('input[name="status_nib"]:checked')?.value;
            if (!statusNib) {
                allValid = false;
                const radContainer = document.querySelector('input[name="status_nib"]')?.closest('.space-y-3');
                if (radContainer) showError(radContainer, "Pilih apakah Anda sudah/belum memiliki NIB");
            } else if (statusNib === 'Sudah') {
                const nibVal = document.getElementById('nib')?.value.trim();
                if (!nibVal || nibVal.length < 13) {
                    allValid = false;
                    const nibIn = document.getElementById('nib');
                    nibIn.classList.add('border-red-500', 'shake');
                    showError(nibIn, "Nomor NIB harus berjumlah persis 13 digit angka");
                }
            } else if (statusNib === 'Belum') {
                const bersedia = document.querySelector('input[name="bersedia_nib"]:checked')?.value;
                if (!bersedia || bersedia === 'Tidak') {
                    allValid = false;
                    const pendContainer = document.getElementById('nib_pendampingan_container');
                    showError(pendContainer, "Pendaftar yang belum memiliki NIB WAJIB memilih 'Ya, Bersedia Didampingi' untuk dapat melanjutkan pendaftaran.");
                } else {
                    document.getElementById('nib').value = 'Belum (Bersedia)';
                }
            }
        }

        inputs.forEach(input => {
            if (input.type === 'radio' && input.name !== 'status_nib' && input.name !== 'bersedia_nib') {
                const name = input.name;
                const checked = currentActive.querySelector(`input[name="${name}"]:checked`);
                if (!checked) {
                    allValid = false;
                    showError(input.closest('.grid') || input.parentNode, "Pilih salah satu");
                }
            } 
            else if (input.id !== 'nib' && (!input.value.trim() || (input.type === 'file' && input.files.length === 0))) {
                allValid = false;
                input.classList.add('border-red-500', 'shake');
                showError(input, "Bidang ini wajib diisi");
            } 
            else if (input.name === 'nik' && input.value.length < 16) {
                allValid = false;
                input.classList.add('border-red-500', 'shake');
                showError(input, "NIK harus 16 digit");
            }
        });
        if (!allValid) return;
    }

    document.querySelectorAll('.step-content').forEach(el => el.classList.remove('active'));
    const targetStep = document.getElementById('step-' + step);
    if(targetStep) {
        targetStep.classList.add('active');
        let progress = (step / 5) * 100;
        document.getElementById('progress-bar').style.width = progress + '%';
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

function showError(element, message) {
    const error = document.createElement('p');
    error.className = 'error-msg text-[11px] font-bold text-red-500 mt-1 ml-1';
    error.innerHTML = `<i class="fas fa-exclamation-circle mr-1"></i> ${message}`;
    element.parentNode.appendChild(error);
}

function previewFile(input) {
    const preview = document.getElementById('preview-img');
    const label = document.getElementById('upload-label');
    const file = input.files[0];
    if (!file) return;
    
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (event) {
        const img = new Image();
        img.src = event.target.result;
        img.onload = function () {
            const canvas = document.createElement('canvas');
            let width = img.width;
            let height = img.height;
            const max_size = 1200;

            if (width > height) {
                if (width > max_size) {
                    height *= max_size / width;
                    width = max_size;
                }
            } else {
                if (height > max_size) {
                    width *= max_size / height;
                    height = max_size;
                }
            }
            canvas.width = width;
            canvas.height = height;
            const ctx = canvas.getContext('2d');
            ctx.drawImage(img, 0, 0, width, height);
            
            const dataUrl = canvas.toDataURL('image/jpeg', 0.7);
            preview.src = dataUrl;
            preview.classList.remove('hidden');
            if (label) label.classList.add('hidden');
        };
    };
}

// MANAGEMENT FOTO PRODUK (UP TO 3 FILES WITH AUTO-COMPRESSION)
let selectedFotoProdukFiles = [];

async function handleFotoProdukUpload(input) {
    const files = Array.from(input.files);
    if (files.length === 0) return;

    const availableSlots = 3 - selectedFotoProdukFiles.length;
    if (availableSlots <= 0) {
        alert('Maksimal foto produk / usaha yang diunggah adalah 3 foto.');
        return;
    }

    const filesToProcess = files.slice(0, availableSlots);

    for (const file of filesToProcess) {
        if (file.size > 500 * 1024 && file.type.startsWith('image/')) {
            try {
                const compressed = await compressImageToTargetKb(file, 500);
                selectedFotoProdukFiles.push(compressed);
            } catch (e) {
                selectedFotoProdukFiles.push(file);
            }
        } else {
            selectedFotoProdukFiles.push(file);
        }
    }

    updateFotoProdukInputAndPreview();
}

function compressImageToTargetKb(file, targetKb = 500) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = (e) => {
            const img = new Image();
            img.src = e.target.result;
            img.onload = () => {
                const canvas = document.createElement('canvas');
                let quality = 0.8;
                const maxBytes = targetKb * 1024;
                
                let width = img.width;
                let height = img.height;
                if (width > 1200) {
                    height = (height * 1200) / width;
                    width = 1200;
                }

                canvas.width = width;
                canvas.height = height;
                const ctx = canvas.getContext('2d');
                ctx.drawImage(img, 0, 0, width, height);

                function attemptCompress() {
                    canvas.toBlob((blob) => {
                        if (!blob) {
                            resolve(file);
                            return;
                        }
                        if (blob.size <= maxBytes || quality <= 0.2) {
                            const compressedFile = new File([blob], file.name.replace(/\.[^/.]+$/, "") + ".jpg", {
                                type: 'image/jpeg',
                                lastModified: Date.now()
                            });
                            resolve(compressedFile);
                        } else {
                            quality -= 0.1;
                            attemptCompress();
                        }
                    }, 'image/jpeg', quality);
                }
                attemptCompress();
            };
            img.onerror = (err) => reject(err);
        };
        reader.onerror = (err) => reject(err);
    });
}

function removeFotoProduk(index) {
    selectedFotoProdukFiles.splice(index, 1);
    updateFotoProdukInputAndPreview();
}

function updateFotoProdukInputAndPreview() {
    const dt = new DataTransfer();
    selectedFotoProdukFiles.forEach(file => dt.items.add(file));
    
    const fileInput = document.getElementById('foto_produk_input');
    if (fileInput) {
        fileInput.files = dt.files;
    }

    const previewList = document.getElementById('foto-produk-preview-list');
    const placeholder = document.getElementById('foto-produk-placeholder');

    if (!previewList) return;
    previewList.innerHTML = '';

    if (selectedFotoProdukFiles.length > 0) {
        if (placeholder) {
            placeholder.innerHTML = `
                <i class="fas fa-check-circle text-2xl text-emerald-500 mb-1"></i>
                <p class="text-xs font-bold text-slate-700">${selectedFotoProdukFiles.length} dari 3 foto produk terpilih</p>
                <p class="text-[10px] text-indigo-600 font-bold">Klik untuk menambah/mengubah foto</p>
            `;
        }

        selectedFotoProdukFiles.forEach((file, idx) => {
            const url = URL.createObjectURL(file);
            const sizeKb = (file.size / 1024).toFixed(0);
            const card = document.createElement('div');
            card.className = "relative group bg-slate-100 rounded-xl overflow-hidden border border-slate-200 shadow-sm h-24";
            card.innerHTML = `
                <img src="${url}" class="w-full h-full object-cover">
                <div class="absolute inset-0 bg-slate-900/50 opacity-0 group-hover:opacity-100 transition flex items-center justify-center gap-2">
                    <button type="button" onclick="removeFotoProduk(${idx}); event.stopPropagation();" class="w-7 h-7 rounded-full bg-red-600 text-white flex items-center justify-center hover:bg-red-700 transition shadow">
                        <i class="fas fa-trash-alt text-xs"></i>
                    </button>
                </div>
                <div class="absolute bottom-1 right-1 bg-slate-900/80 text-white text-[9px] font-bold px-1.5 py-0.5 rounded backdrop-blur">
                    ${sizeKb} KB
                </div>
            `;
            previewList.appendChild(card);
        });
    } else {
        if (placeholder) {
            placeholder.innerHTML = `
                <div class="w-12 h-12 rounded-2xl bg-indigo-100 text-indigo-600 flex items-center justify-center mx-auto group-hover:scale-110 transition-transform">
                    <i class="fas fa-camera text-xl"></i>
                </div>
                <p class="text-xs font-bold text-slate-700">Klik untuk memilih foto produk atau usaha (Maks. 3 foto)</p>
                <p class="text-[10px] text-slate-400 font-medium">Format: JPG, PNG, WEBP. Foto di atas 500 KB akan otomatis dikompres secara otomatis.</p>
            `;
        }
    }
}

// DATA MAPPING KOTA MADIUN (KECAMATAN & KELURAHAN DESA)
const madiunKelurahanMap = {
    "Kartoharjo": [
        "Kanigoro",
        "Kartoharjo",
        "Kelun",
        "Klegen",
        "Oro-Oro Ombo",
        "Pilangbango",
        "Rejomulyo",
        "Sukosari",
        "Tawangrejo"
    ],
    "Manguharjo": [
        "Madiun Lor",
        "Manguharjo",
        "Nambangan Kidul",
        "Nambangan Lor",
        "Ngegong",
        "Pangongangan",
        "Patihan",
        "Sogaten",
        "Winongo"
    ],
    "Taman": [
        "Banjarejo",
        "Demangan",
        "Josenan",
        "Kejuron",
        "Kuncen",
        "Manisrejo",
        "Mojorejo",
        "Pandean",
        "Taman"
    ]
};

function updateKelurahanOptions(selectedKelurahan = '') {
    const kecSelect = document.getElementById('kecamatan_select');
    const kelSelect = document.getElementById('kelurahan_select');
    if (!kecSelect || !kelSelect) return;

    const selectedKec = kecSelect.value;
    kelSelect.innerHTML = '';

    if (!selectedKec || !madiunKelurahanMap[selectedKec]) {
        kelSelect.disabled = true;
        kelSelect.innerHTML = '<option value="">-- Pilih Kecamatan Terlebih Dahulu --</option>';
        return;
    }

    kelSelect.disabled = false;
    kelSelect.innerHTML = '<option value="">-- Pilih Kelurahan --</option>';

    madiunKelurahanMap[selectedKec].forEach(kel => {
        const option = document.createElement('option');
        option.value = kel;
        option.textContent = kel;
        if (selectedKelurahan && selectedKelurahan.toLowerCase() === kel.toLowerCase()) {
            option.selected = true;
        }
        kelSelect.appendChild(option);
    });
}

document.addEventListener('DOMContentLoaded', function() {
    const oldKec = "{{ old('kecamatan') }}";
    const oldKel = "{{ old('kelurahan') }}";
    if (oldKec) {
        updateKelurahanOptions(oldKel);
    }
    toggleNibFields();
});

function handleRupiah(element) {
    let value = element.value.replace(/[^0-9]/g, ""); 
    if (value !== "") {
        element.value = new Intl.NumberFormat('id-ID').format(value);
    } else {
        element.value = "";
    }
}

function finalCheck() {
    const omzetInput = document.getElementById('omzet_input');
    const btn = document.getElementById('submitBtn');

    if (omzetInput && omzetInput.value) {
        omzetInput.value = omzetInput.value.replace(/\./g, '');
    }
    if (btn) {
        btn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i> Mengirim...';
        btn.disabled = true;
    }
    return true;
}
</script>
</body>
</html>