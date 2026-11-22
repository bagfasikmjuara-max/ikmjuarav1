<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Layanan MPP - Permohonan Surat Rekomendasi HKI Merek Kota Madiun</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
    </style>
</head>
<body class="bg-slate-50 text-slate-800 min-h-screen py-8 px-4 sm:px-6 lg:px-8 relative overflow-x-hidden">

    {{-- BACKGROUND DECORATION GLOW HARMONIS SAMA DENGAN WELCOME PAGE --}}
    <div class="fixed -right-32 -top-32 w-96 h-96 bg-amber-500/10 rounded-full blur-3xl pointer-events-none"></div>
    <div class="fixed -left-32 -bottom-32 w-96 h-96 bg-indigo-600/10 rounded-full blur-3xl pointer-events-none"></div>

    <div class="max-w-5xl mx-auto space-y-8 relative z-10" x-data="mppApp()">

        {{-- TOP NAVIGATION HEADER --}}
        <nav class="bg-white/80 backdrop-blur-md sticky top-4 z-50 border border-slate-200/80 rounded-3xl p-5 shadow-sm flex items-center justify-between transition-all">
            <a href="{{ url('/') }}" class="inline-flex items-center gap-3 group">
                <div class="w-10 h-10 rounded-xl bg-slate-100 border border-slate-200 text-slate-700 flex items-center justify-center font-black text-lg group-hover:bg-slate-900 group-hover:text-white transition">
                    ←
                </div>
                <span class="text-xs font-black uppercase tracking-wider text-slate-700 group-hover:text-amber-500 transition">Kembali ke Beranda Utama</span>
            </a>
            
            <div class="flex items-center gap-2 bg-gradient-to-r from-amber-500 to-amber-600 text-slate-950 px-4 py-2 rounded-2xl font-black text-xs uppercase tracking-wider shadow-md shadow-amber-500/20">
                🏛️ MAL PELAYANAN PUBLIK (MPP) KOTA MADIUN
            </div>
        </nav>

        {{-- HEADER BANNER HARMONIS HKI MEREK --}}
        <div class="bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 p-8 lg:p-10 rounded-[35px] text-white shadow-xl text-center relative overflow-hidden">
            <span class="text-xs font-black text-amber-400 uppercase tracking-[0.25em] bg-amber-400/10 px-4 py-1.5 rounded-full border border-amber-400/20 inline-block mb-3">Layanan Terpadu Satu Pintu</span>
            <h1 class="text-3xl sm:text-4xl lg:text-5xl font-black text-white tracking-tight">Permohonan Surat Rekomendasi <span class="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 via-indigo-200 to-amber-300">HKI MEREK</span></h1>
            <p class="text-slate-300 text-xs sm:text-sm mt-3 max-w-2xl mx-auto font-medium leading-relaxed">Fasilitasi resmi penerbitan Surat Rekomendasi Pendaftaran Hak Kekayaan Intelektual (HKI Merek) bagi Pelaku Usaha IKM Kota Madiun.</p>
        </div>

        {{-- MAIN TAB SELECTION (FORM vs TRACKING) --}}
        <div class="flex bg-white p-2 rounded-3xl border border-slate-200 shadow-sm gap-2">
            <button type="button" 
                    @click="activeTab = 'form'" 
                    :class="activeTab === 'form' ? 'bg-gradient-to-r from-amber-500 to-amber-600 text-slate-950 font-black shadow-md shadow-amber-500/20' : 'text-slate-500 hover:text-slate-900 font-bold'" 
                    class="flex-1 py-4 px-6 rounded-2xl text-xs uppercase tracking-wider transition flex items-center justify-center gap-2">
                <span>📝 1. Formulir Permohonan Baru</span>
            </button>

            <button type="button" 
                    @click="activeTab = 'tracking'" 
                    :class="activeTab === 'tracking' ? 'bg-gradient-to-r from-indigo-600 to-violet-600 text-white font-black shadow-md shadow-indigo-500/20' : 'text-slate-500 hover:text-slate-900 font-bold'" 
                    class="flex-1 py-4 px-6 rounded-2xl text-xs uppercase tracking-wider transition flex items-center justify-center gap-2">
                <span>🔍 2. Lacak / Tracking Progress Permohonan</span>
            </button>
        </div>

        {{-- TAB 1: FORMULIR PERMOHONAN HKI --}}
        <div x-show="activeTab === 'form'" x-transition class="bg-white border border-slate-200/80 rounded-[35px] p-8 lg:p-12 shadow-sm">
            <form id="formPermohonanHki" @submit.prevent="submitForm" class="space-y-8">
                @csrf

                {{-- SECTION 1: DATA PEMOHON --}}
                <div class="space-y-6">
                    <h3 class="text-base font-black text-slate-900 uppercase tracking-wider border-b border-slate-100 pb-3 flex items-center gap-2">
                        <span class="w-3 h-3 rounded-full bg-amber-500"></span>
                        <span>1. Identitas Pemohon (Sesuai KTP)</span>
                    </h3>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">Nama Lengkap Pemohon</label>
                            <input type="text" name="nama_lengkap" required placeholder="Masukkan nama lengkap sesuai KTP..." class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition">
                        </div>

                        <div>
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">NIK Pemohon (16 Digit)</label>
                            <input type="text" name="nik" maxlength="16" minlength="16" required placeholder="357701xxxxxxxxxx" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-mono font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                            <span class="text-[10px] text-slate-400 font-medium mt-1 block">Wajib 16 digit angka sesuai KTP.</span>
                        </div>
                    </div>

                    <div>
                        <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">Alamat Lengkap (Sesuai KTP)</label>
                        <textarea name="alamat_ktp" rows="2" required placeholder="Jl. Pandean No. 12, Kel. Pandean, Kec. Taman, Kota Madiun..." class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition"></textarea>
                    </div>

                    <div>
                        <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">Nomor HP / WhatsApp Aktif</label>
                        <input type="text" name="no_hp" required placeholder="08xxxxxxxxxx" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                    </div>
                </div>

                {{-- SECTION 2: DATA MEREK & USAHA --}}
                <div class="space-y-6 pt-4 border-t border-slate-100">
                    <h3 class="text-base font-black text-slate-900 uppercase tracking-wider border-b border-slate-100 pb-3 flex items-center gap-2">
                        <span class="w-3 h-3 rounded-full bg-indigo-600"></span>
                        <span>2. Informasi Merek & Legalisasi Usaha</span>
                    </h3>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">NIB Pelaku Usaha (13 Digit)</label>
                            <input type="text" name="nib" maxlength="13" minlength="13" required placeholder="9120000xxxxxx" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-mono font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                            <span class="text-[10px] text-slate-400 font-medium mt-1 block">Wajib 13 digit angka NIB OSS RBA.</span>
                        </div>

                        <div>
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">Nama Merek yang Diusulkan</label>
                            <input type="text" name="nama_merek" required placeholder="Contoh: Sambal Pecel Juara Madiun" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition">
                        </div>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">Kelas Merek (Angka Kelas)</label>
                            <input type="text" name="kelas_merek" required placeholder="Contoh: 29, 30, 35, 43..." class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition" oninput="this.value = this.value.replace(/[^0-9, ]/g, '')">
                            <span class="text-[10px] text-slate-400 font-medium mt-1 block">Ketik angka nomor kelas barang/jasa (Contoh: Kelas 30).</span>
                        </div>

                        <div>
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">Alamat Tempat Usaha</label>
                            <input type="text" name="alamat_usaha" required placeholder="Masukkan alamat lokasi produksi/tempat usaha..." class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition">
                        </div>
                    </div>

                    <div>
                        <label class="block text-xs font-black text-slate-700 uppercase tracking-wider mb-2">Uraian Barang / Jasa yang Didaftarkan Merek (Sesuai Kelas)</label>
                        <textarea name="uraian_barang_jasa" rows="3" required placeholder="Jelaskan secara rinci barang atau jasa yang didaftarkan, contoh: Sambal pecel, bumbu pecel olahan, kue kering, kripik tempe..." class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition"></textarea>
                    </div>
                </div>

                {{-- SECTION 3: UNGGAH BERKAS --}}
                <div class="space-y-6 pt-4 border-t border-slate-100">
                    <div class="flex justify-between items-center border-b border-slate-100 pb-3">
                        <h3 class="text-base font-black text-slate-900 uppercase tracking-wider flex items-center gap-2">
                            <span class="w-3 h-3 rounded-full bg-emerald-500"></span>
                            <span>3. Unggah Berkas Dokumen Persyaratan</span>
                        </h3>
                        <span class="text-[10px] font-extrabold bg-emerald-50 text-emerald-700 px-3 py-1 rounded-full border border-emerald-200">
                            ⚡ Auto-Compress &lt; 500 KB
                        </span>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="bg-slate-50 p-5 rounded-3xl border border-slate-200/80 space-y-2">
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider">1. Upload File KTP Pemohon</label>
                            <input type="file" name="file_ktp" accept="image/*,.pdf" required class="w-full bg-white border border-slate-200 rounded-2xl p-3 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500">
                        </div>

                        <div class="bg-slate-50 p-5 rounded-3xl border border-slate-200/80 space-y-2">
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider">2. Upload File NIB (OSS)</label>
                            <input type="file" name="file_nib" accept="image/*,.pdf" required class="w-full bg-white border border-slate-200 rounded-2xl p-3 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500">
                        </div>

                        <div class="bg-slate-50 p-5 rounded-3xl border border-slate-200/80 space-y-2">
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider">3. Upload Logo / Etiket Merek</label>
                            <input type="file" name="file_etiket_merek" accept="image/*,.pdf" required class="w-full bg-white border border-slate-200 rounded-2xl p-3 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500">
                        </div>

                        <div class="bg-slate-50 p-5 rounded-3xl border border-slate-200/80 space-y-2">
                            <label class="block text-xs font-black text-slate-700 uppercase tracking-wider">4. Upload Surat Pernyataan Bermaterai</label>
                            <input type="file" name="file_surat_pernyataan" accept="image/*,.pdf" required class="w-full bg-white border border-slate-200 rounded-2xl p-3 text-xs font-bold text-slate-700 outline-none focus:border-indigo-500">
                        </div>
                    </div>
                </div>

                {{-- SECTION 4: DEKLARASI STATEMENT --}}
                <div class="bg-amber-50 border border-amber-200 p-6 rounded-3xl space-y-4">
                    <label class="flex items-start gap-4 cursor-pointer">
                        <input type="checkbox" name="pernyataan" required class="w-6 h-6 mt-1 text-amber-500 rounded-lg border-slate-300 focus:ring-amber-400 shrink-0">
                        <span class="text-xs text-slate-700 font-bold leading-relaxed">
                            Saya menyatakan dengan sesungguhnya bahwa seluruh data dan dokumen yang diunggah adalah benar adanya tanpa adanya rekayasa serta diisi dengan kesadaran penuh.
                        </span>
                    </label>
                </div>

                {{-- SUBMIT BUTTON --}}
                <div class="pt-4">
                    <button type="submit" 
                            :disabled="submitting"
                            class="w-full bg-gradient-to-r from-amber-500 via-amber-500 to-amber-600 hover:from-amber-600 hover:to-amber-700 text-slate-950 py-5 rounded-2xl font-black text-base shadow-lg shadow-amber-500/25 transition transform hover:scale-[1.01] active:scale-95 flex items-center justify-center gap-3">
                        <svg x-show="!submitting" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8" />
                        </svg>
                        <span x-text="submitting ? 'MEMPROSES & MENGOMPRES DOKUMEN...' : 'KIRIM PERMOHONAN REKOMENDASI HKI'">KIRIM PERMOHONAN REKOMENDASI HKI</span>
                    </button>
                </div>
            </form>
        </div>

        {{-- TAB 2: FITUR TRACKING / MENELUSURI PROGRESS --}}
        <div x-show="activeTab === 'tracking'" x-transition class="space-y-8">
            
            {{-- SEARCH BOX CARD --}}
            <div class="bg-white border border-slate-200/80 rounded-[35px] p-8 lg:p-10 shadow-sm space-y-6">
                <div class="text-center max-w-xl mx-auto space-y-2">
                    <span class="text-xs font-black text-indigo-600 uppercase tracking-widest bg-indigo-50 px-3 py-1 rounded-full border border-indigo-100">Tracking Permohonan HKI</span>
                    <h2 class="text-2xl sm:text-3xl font-black text-slate-900">Menelusuri Status & Progress Permohonan</h2>
                    <p class="text-xs text-slate-500 font-medium">Ketik NIK, NIB, atau Nama Pemohon untuk melihat tahapan status dan mengunduh Surat Rekomendasi jika telah diterbitkan.</p>
                </div>

                <form @submit.prevent="searchTracking" class="flex flex-col sm:flex-row gap-3 max-w-2xl mx-auto">
                    <div class="relative flex-1">
                        <input type="text" 
                               x-model="searchQuery" 
                               placeholder="Masukkan NIK, NIB, atau Nama Pemohon..." 
                               class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 pl-12 text-sm font-bold text-slate-800 outline-none focus:bg-white focus:border-indigo-500 focus:ring-4 focus:ring-indigo-50 transition">
                        <span class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-lg">🔍</span>
                    </div>
                    <button type="submit" 
                            :disabled="searching"
                            class="bg-indigo-600 hover:bg-indigo-700 text-white font-black px-8 py-4 rounded-2xl text-xs uppercase tracking-wider transition shadow-md shadow-indigo-500/20 shrink-0">
                        <span x-text="searching ? 'MENCARI...' : 'TELUSURI PROGRESS'">TELUSURI PROGRESS</span>
                    </button>
                </form>
            </div>

            {{-- DETAIL TATA CARA TRACKING CARD --}}
            <div class="bg-gradient-to-r from-slate-900 to-indigo-950 text-white p-8 rounded-[35px] shadow-xl space-y-4">
                <h4 class="text-sm font-black text-amber-400 uppercase tracking-wider flex items-center gap-2">
                    <span>💡 Panduan Tahapan Tracking Status Permohonan HKI:</span>
                </h4>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 text-xs font-medium">
                    <div class="bg-white/10 p-4 rounded-2xl border border-white/10 space-y-1">
                        <div class="font-black text-amber-300">Tahap 1: Diajukan</div>
                        <p class="text-slate-300 text-[11px]">Berkas formulir berhasil diterima oleh sistem database MPP.</p>
                    </div>
                    <div class="bg-white/10 p-4 rounded-2xl border border-white/10 space-y-1">
                        <div class="font-black text-indigo-300">Tahap 2: Diproses</div>
                        <p class="text-slate-300 text-[11px]">Tim Admin Dinas sedang meninjau kelengkapan dokumen KTP, NIB, & Logo.</p>
                    </div>
                    <div class="bg-white/10 p-4 rounded-2xl border border-white/10 space-y-1">
                        <div class="font-black text-emerald-300">Tahap 3: Disetujui</div>
                        <p class="text-slate-300 text-[11px]">Berkas valid & Surat Rekomendasi sedang diterbitkan oleh Pejabat.</p>
                    </div>
                    <div class="bg-white/10 p-4 rounded-2xl border border-white/10 space-y-1">
                        <div class="font-black text-cyan-300">Tahap 4: Surat Terbit</div>
                        <p class="text-slate-300 text-[11px]">Surat Rekomendasi siap diunduh secara langsung via link Google Drive.</p>
                    </div>
                </div>
            </div>

            {{-- RESULTS DISPLAY CONTAINER --}}
            <div x-show="searched" x-transition class="space-y-6">
                
                <div x-show="searchResults.length === 0" class="bg-white border border-slate-200 rounded-[35px] p-12 text-center text-slate-500 space-y-3">
                    <div class="text-4xl">📭</div>
                    <h3 class="text-lg font-black text-slate-800">Permohonan Tidak Ditemukan</h3>
                    <p class="text-xs text-slate-400 max-w-md mx-auto">Tidak ditemukan data permohonan HKI Merek dengan NIK / NIB / Nama tersebut. Pastikan Anda telah menginput kata kunci yang sesuai.</p>
                </div>

                <template x-for="item in searchResults" :key="item.id">
                    <div class="bg-white border border-slate-200/80 rounded-[35px] p-8 shadow-sm space-y-8">
                        
                        {{-- CARD HEADER INFO --}}
                        <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 border-b border-slate-100 pb-6">
                            <div>
                                <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Nama Merek / Usaha</span>
                                <h3 class="text-2xl font-black text-slate-900" x-text="item.nama_merek"></h3>
                                <p class="text-xs font-bold text-indigo-600 mt-0.5">Pemohon: <span x-text="item.nama_lengkap"></span> (NIK: <span x-text="item.nik"></span>)</p>
                            </div>

                            <div class="shrink-0">
                                <template x-if="item.status === 'Disetujui'">
                                    <span class="inline-flex items-center gap-1.5 px-4 py-2 rounded-2xl bg-emerald-50 text-emerald-700 border border-emerald-200 font-black text-xs uppercase tracking-wider">
                                        ✅ Status: Disetujui
                                    </span>
                                </template>
                                <template x-if="item.status === 'Ditolak'">
                                    <span class="inline-flex items-center gap-1.5 px-4 py-2 rounded-2xl bg-rose-50 text-rose-700 border border-rose-200 font-black text-xs uppercase tracking-wider">
                                        ❌ Status: Ditolak
                                    </span>
                                </template>
                                <template x-if="item.status === 'Pending'">
                                    <span class="inline-flex items-center gap-1.5 px-4 py-2 rounded-2xl bg-amber-50 text-amber-700 border border-amber-200 font-black text-xs uppercase tracking-wider">
                                        ⏳ Status: Dalam Proses
                                    </span>
                                </template>
                            </div>
                        </div>

                        {{-- VISUAL TIMELINE PROGRESS TRACKER (4 STEPS) --}}
                        <div class="space-y-4">
                            <span class="text-xs font-black uppercase tracking-wider text-slate-400 block">Visual Progress Alur Permohonan:</span>
                            
                            <div class="grid grid-cols-1 sm:grid-cols-4 gap-4">
                                {{-- STEP 1: DIAJUKAN --}}
                                <div class="p-4 rounded-2xl border transition-all"
                                     :class="true ? 'bg-indigo-50 border-indigo-200 text-indigo-900' : 'bg-slate-50 border-slate-200 text-slate-400'">
                                    <div class="flex items-center gap-2 font-black text-xs">
                                        <span class="w-5 h-5 rounded-full bg-indigo-600 text-white flex items-center justify-center text-[10px]">1</span>
                                        <span>Permohonan Diusulkan</span>
                                    </div>
                                    <p class="text-[10px] text-slate-500 font-medium mt-1">Formulir diterima sistem MPP.</p>
                                </div>

                                {{-- STEP 2: DIPROSES --}}
                                <div class="p-4 rounded-2xl border transition-all"
                                     :class="item.status === 'Pending' || item.status === 'Disetujui' ? 'bg-amber-50 border-amber-200 text-amber-900' : 'bg-slate-50 border-slate-200 text-slate-400'">
                                    <div class="flex items-center gap-2 font-black text-xs">
                                        <span class="w-5 h-5 rounded-full bg-amber-500 text-white flex items-center justify-center text-[10px]">2</span>
                                        <span>Pemeriksaan Berkas</span>
                                    </div>
                                    <p class="text-[10px] text-slate-500 font-medium mt-1">Ditinjau oleh Tim Admin Dinas.</p>
                                </div>

                                {{-- STEP 3: DIVERIFIKASI --}}
                                <div class="p-4 rounded-2xl border transition-all"
                                     :class="item.status === 'Disetujui' ? 'bg-emerald-50 border-emerald-200 text-emerald-900' : 'bg-slate-50 border-slate-200 text-slate-400'">
                                    <div class="flex items-center gap-2 font-black text-xs">
                                        <span class="w-5 h-5 rounded-full bg-emerald-600 text-white flex items-center justify-center text-[10px]">3</span>
                                        <span>Verifikasi Disetujui</span>
                                    </div>
                                    <p class="text-[10px] text-slate-500 font-medium mt-1">Dokumen lengkap & disetujui.</p>
                                </div>

                                {{-- STEP 4: SURAT TERBIT --}}
                                <div class="p-4 rounded-2xl border transition-all"
                                     :class="item.status === 'Disetujui' && item.link_gdrive_rekom ? 'bg-cyan-50 border-cyan-200 text-cyan-900' : 'bg-slate-50 border-slate-200 text-slate-400'">
                                    <div class="flex items-center gap-2 font-black text-xs">
                                        <span class="w-5 h-5 rounded-full bg-cyan-600 text-white flex items-center justify-center text-[10px]">4</span>
                                        <span>Surat Rekom Terbit</span>
                                    </div>
                                    <p class="text-[10px] text-slate-500 font-medium mt-1">Siap diakses & diunduh.</p>
                                </div>
                            </div>
                        </div>

                        {{-- DOWNLOAD SURAT REKOMENDASI BUTTON (GDRIVE LINK) --}}
                        <div x-show="item.status === 'Disetujui' && item.link_gdrive_rekom" class="bg-gradient-to-r from-emerald-500 to-teal-600 p-6 rounded-3xl text-white space-y-3 shadow-lg shadow-emerald-500/20">
                            <div class="flex items-center gap-3">
                                <span class="text-3xl">🎉</span>
                                <div>
                                    <h4 class="font-black text-base">Surat Rekomendasi HKI Merek Siap Diunduh!</h4>
                                    <p class="text-xs text-emerald-100 font-medium">Selamat, permohonan Anda telah disetujui dan Surat Rekomendasi resmi telah diunggah oleh Admin.</p>
                                </div>
                            </div>
                            <div>
                                <a :href="item.link_gdrive_rekom" target="_blank" class="inline-flex items-center gap-2 bg-white hover:bg-slate-100 text-slate-950 font-black px-6 py-3.5 rounded-2xl text-xs uppercase tracking-wider transition shadow-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-emerald-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5"><path stroke-linecap="round" stroke-linejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" /></svg>
                                    <span>UNDUH SURAT REKOMENDASI (GOOGLE DRIVE)</span>
                                </a>
                            </div>
                        </div>

                        <div x-show="item.status === 'Disetujui' && !item.link_gdrive_rekom" class="bg-amber-50 border border-amber-200 p-4 rounded-2xl text-xs font-bold text-amber-800">
                            ℹ️ Permohonan Anda telah disetujui. Tim Admin sedang mengunggah berkas Surat Rekomendasi ke Google Drive.
                        </div>

                    </div>
                </template>

            </div>

        </div>

        {{-- 5-SECOND COUNTDOWN POP-UP MODAL --}}
        <div x-show="showSuccessModal" 
             x-transition 
             class="fixed inset-0 bg-slate-950/70 backdrop-blur-md z-50 flex items-center justify-center p-4" 
             style="display: none;">
            <div class="bg-white border border-slate-200 rounded-[35px] p-8 lg:p-10 max-w-lg w-full text-center space-y-6 shadow-2xl relative overflow-hidden">
                <div class="w-20 h-20 rounded-full bg-emerald-50 text-emerald-600 border border-emerald-200 flex items-center justify-center mx-auto text-4xl shadow-inner animate-bounce">
                    🏛️
                </div>

                <div>
                    <h3 class="text-2xl font-black text-slate-900 uppercase tracking-tight">Terima Kasih!</h3>
                    <p class="text-amber-600 font-extrabold text-sm mt-2">Terima kasih telah menggunakan layanan kami di MPP Kota Madiun!</p>
                    <p class="text-slate-500 text-xs mt-3 leading-relaxed font-medium">Permohonan rekomendasi pendaftaran HKI Merek Anda telah diterima dan dapat dipantau pada tab "Lacak / Tracking Progress".</p>
                </div>

                <div class="bg-slate-50 p-4 rounded-2xl border border-slate-200 flex items-center justify-center gap-3">
                    <span class="text-2xl font-black text-indigo-600" x-text="countdown">5</span>
                    <span class="text-xs font-bold text-slate-600">Mengalihkan ke beranda otomatis...</span>
                </div>

                <div class="flex gap-3">
                    <button type="button" @click="redirectNow()" class="w-full bg-amber-500 hover:bg-amber-600 text-slate-950 font-black py-4 rounded-2xl text-xs uppercase tracking-wider transition shadow-md shadow-amber-500/20">
                        Kembali ke Beranda Sekarang
                    </button>
                </div>
            </div>
        </div>

    </div>

    <script>
        function mppApp() {
            return {
                activeTab: 'form',
                submitting: false,
                searching: false,
                searched: false,
                searchQuery: '',
                searchResults: [],
                showSuccessModal: false,
                countdown: 5,
                timerInterval: null,

                async submitForm() {
                    this.submitting = true;
                    const form = document.getElementById('formPermohonanHki');
                    const formData = new FormData(form);

                    try {
                        const response = await fetch("{{ route('layananmpp.store') }}", {
                            method: "POST",
                            headers: {
                                "X-CSRF-TOKEN": "{{ csrf_token() }}",
                                "Accept": "application/json"
                            },
                            body: formData
                        });

                        const result = await response.json();

                        if (response.ok && result.success) {
                            this.showSuccessModal = true;
                            this.startCountdown();
                        } else {
                            let errorMsg = result.message || 'Terjadi kesalahan saat memproses permohonan.';
                            if (result.errors) {
                                errorMsg = Object.values(result.errors).flat().join('<br>');
                            }
                            Swal.fire({
                                title: 'Gagal Validasi!',
                                html: errorMsg,
                                icon: 'error',
                                confirmButtonColor: '#4f46e5',
                                borderRadius: '20px'
                            });
                        }
                    } catch (e) {
                        Swal.fire({
                            title: 'Terjadi Kesalahan!',
                            text: 'Gagal terhubung ke server: ' + e.message,
                            icon: 'error',
                            confirmButtonColor: '#4f46e5',
                            borderRadius: '20px'
                        });
                    } finally {
                        this.submitting = false;
                    }
                },

                async searchTracking() {
                    if (!this.searchQuery.trim()) {
                        Swal.fire({
                            title: 'Input Kosong!',
                            text: 'Silakan masukkan NIK, NIB, atau Nama Pemohon.',
                            icon: 'warning',
                            confirmButtonColor: '#4f46e5',
                            borderRadius: '20px'
                        });
                        return;
                    }

                    this.searching = true;
                    try {
                        const res = await fetch('/api/tracking-hki-merek?q=' + encodeURIComponent(this.searchQuery));
                        const data = await res.json();
                        if (data.success) {
                            this.searchResults = data.data || [];
                            this.searched = true;
                        }
                    } catch (e) {
                        Swal.fire({
                            title: 'Gagal Memuat!',
                            text: 'Gagal mengambil data tracking: ' + e.message,
                            icon: 'error',
                            confirmButtonColor: '#4f46e5',
                            borderRadius: '20px'
                        });
                    } finally {
                        this.searching = false;
                    }
                },

                startCountdown() {
                    this.countdown = 5;
                    this.timerInterval = setInterval(() => {
                        this.countdown--;
                        if (this.countdown <= 0) {
                            clearInterval(this.timerInterval);
                            this.redirectNow();
                        }
                    }, 1000);
                },

                redirectNow() {
                    if (this.timerInterval) clearInterval(this.timerInterval);
                    window.location.href = "{{ url('/') }}";
                }
            };
        }
    </script>
</body>
</html>
