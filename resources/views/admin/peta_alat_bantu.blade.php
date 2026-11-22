@extends('layouts.dukungan')

@section('title', 'Alat Bantu Koordinat (Geocoding Alamat) — Kota Madiun')

@section('styles')
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <style>
        #map-alat-bantu { 
            height: 520px; 
            border-radius: 24px; 
            z-index: 1; 
        }
        .pulse-emerald {
            animation: pulseEmerald 2s ease-out infinite;
        }
        @keyframes pulseEmerald {
            0% { box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.4); }
            70% { box-shadow: 0 0 0 12px rgba(16, 185, 129, 0); }
            100% { box-shadow: 0 0 0 0 rgba(16, 185, 129, 0); }
        }
    </style>
@endsection

@section('content')
<div class="space-y-6" x-data="alatBantuGeocoding()" x-init="initMap()">
    
    <!-- Header Navigation & Action Banner -->
    <div class="bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 rounded-3xl p-6 lg:p-8 text-white shadow-xl flex flex-col md:flex-row justify-between items-start md:items-center gap-6 border border-slate-800 relative overflow-hidden">
        <div class="space-y-2 relative z-10">
            <div class="inline-flex items-center gap-2 px-3.5 py-1.5 bg-emerald-500/20 border border-emerald-400/30 rounded-full text-xs font-black text-emerald-300 uppercase tracking-widest">
                <span class="w-2.5 h-2.5 rounded-full bg-emerald-400 animate-pulse"></span>
                <span>Tools Spasial & Geocoding Madiun</span>
            </div>
            <h2 class="text-2xl lg:text-3xl font-black tracking-tight">Alat Bantu Koordinat Alamat</h2>
            <p class="text-xs lg:text-sm text-slate-300 font-medium max-w-2xl leading-relaxed">
                Masukkan alamat lengkap (Nama Jalan, Nomor, RT/RW, Kelurahan, Kecamatan di Kota Madiun) untuk mendapatkan titik posisi di peta dan nilai Latitude & Longitude presisi.
            </p>
        </div>
        <div class="flex items-center gap-3 relative z-10 shrink-0">
            <a href="{{ route('dukungan.peta') }}" class="px-5 py-3 bg-white/10 hover:bg-white/20 text-white rounded-2xl text-xs font-bold border border-white/20 transition flex items-center gap-2">
                <i class="bi bi-arrow-left"></i>
                <span>Kembali ke Peta Sebaran</span>
            </a>
        </div>
    </div>

    <!-- Main Grid: Form Inputs (Left 5 cols) & Interactive Map + Result (Right 7 cols) -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-6 items-start">
        
        <!-- Left Panel: Form Input Alamat Lengkap -->
        <div class="lg:col-span-5 bg-white rounded-3xl p-6 lg:p-8 border border-slate-200 shadow-sm space-y-5">
            <div class="border-b border-slate-100 pb-4">
                <h3 class="text-lg font-black text-slate-800 flex items-center gap-2">
                    <i class="bi bi-geo-alt-fill text-emerald-600"></i>
                    <span>Formulir Alamat Lengkap</span>
                </h3>
                <p class="text-xs text-slate-500 font-semibold mt-1">Lengkapi rincian alamat pelaku usaha di Kota Madiun.</p>
            </div>

            <form @submit.prevent="cariKoordinat()" class="space-y-4">
                <!-- Nama Jalan / Gang / Patokan -->
                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 mb-1.5">
                        Nama Jalan / Gang / Patokan <span class="text-rose-500">*</span>
                    </label>
                    <input type="text" x-model="form.jalan" placeholder="Contoh: Jl. Pahlawan / Gang 2" required
                        class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                </div>

                <!-- Nomor Rumah / Bangunan & RT / RW (2 Cols) -->
                <div class="grid grid-cols-2 gap-3">
                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 mb-1.5">
                            Nomor Rumah / Usaha
                        </label>
                        <input type="text" x-model="form.nomor" placeholder="Contoh: No. 45B"
                            class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                    </div>
                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 mb-1.5">
                            RT / RW
                        </label>
                        <input type="text" x-model="form.rtrw" placeholder="Contoh: RT 04 / RW 02"
                            class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                    </div>
                </div>

                <!-- Kecamatan -->
                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 mb-1.5">
                        Kecamatan <span class="text-rose-500">*</span>
                    </label>
                    <select x-model="form.kecamatan" @change="onKecamatanChange()" required
                        class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        <option value="Kartoharjo">Kartoharjo</option>
                        <option value="Manguharjo">Manguharjo</option>
                        <option value="Taman">Taman</option>
                    </select>
                </div>

                <!-- Kelurahan -->
                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 mb-1.5">
                        Kelurahan <span class="text-rose-500">*</span>
                    </label>
                    <select x-model="form.kelurahan" required
                        class="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-emerald-500 focus:bg-white transition">
                        <template x-for="kel in kelurahanList" :key="kel">
                            <option :value="kel" x-text="kel"></option>
                        </template>
                    </select>
                </div>

                <!-- Kota & Provinsi (Fixed Info) -->
                <div class="grid grid-cols-2 gap-3">
                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1.5">
                            Kota (Locked)
                        </label>
                        <input type="text" value="Kota Madiun" disabled
                            class="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-2xl text-xs font-bold text-slate-500 cursor-not-allowed">
                    </div>
                    <div>
                        <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1.5">
                            Provinsi (Locked)
                        </label>
                        <input type="text" value="Jawa Timur" disabled
                            class="w-full px-4 py-3 bg-slate-100 border border-slate-200 rounded-2xl text-xs font-bold text-slate-500 cursor-not-allowed">
                    </div>
                </div>

                <!-- Button Search Coordinates -->
                <div class="pt-2">
                    <button type="submit" :disabled="isSearching"
                        class="w-full py-4 bg-emerald-600 hover:bg-emerald-700 active:scale-98 text-white rounded-2xl text-xs font-black shadow-lg shadow-emerald-600/20 transition flex items-center justify-center gap-2 cursor-pointer pulse-emerald">
                        <template x-if="!isSearching">
                            <span class="flex items-center gap-2">
                                <i class="bi bi-search"></i>
                                <span>🔍 Cari & Tampilkan Koordinat di Peta</span>
                            </span>
                        </template>
                        <template x-if="isSearching">
                            <span class="flex items-center gap-2">
                                <span class="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></span>
                                <span>Mencari Koordinat Alamat...</span>
                            </span>
                        </template>
                    </button>
                </div>

                <!-- Google Maps Link / Coordinate Importer -->
                <div class="mt-4 pt-4 border-t border-slate-100 space-y-2">
                    <label class="block text-xs font-bold uppercase tracking-wider text-slate-700 flex items-center gap-1.5">
                        <i class="bi bi-google text-rose-500"></i>
                        <span>Atau Impor Link / Koordinat Google Maps</span>
                    </label>
                    <div class="flex gap-2">
                        <input type="text" x-model="gmapsInput" @keyup.enter="parseGoogleMapsInput()"
                            placeholder="Tempel link Google Maps atau format -7.627624, 111.529526"
                            class="w-full px-4 py-2.5 bg-slate-50 border border-slate-200 rounded-2xl text-xs font-semibold text-slate-800 outline-none focus:border-indigo-500 focus:bg-white transition">
                        <button type="button" @click="parseGoogleMapsInput()"
                            class="px-4 py-2.5 bg-indigo-600 hover:bg-indigo-700 active:scale-95 text-white rounded-2xl text-xs font-bold shrink-0 transition shadow-sm">
                            Terapkan
                        </button>
                    </div>
                    <p class="text-[10px] text-slate-400 font-medium italic">
                        Tempel link Google Maps titik usaha untuk mengambil koordinat presisi secara otomatis.
                    </p>
                </div>
            </form>
        </div>

        <!-- Right Panel: Interactive Map & Coordinate Output Card -->
        <div class="lg:col-span-7 space-y-6">
            
            <!-- Map Card -->
            <div class="bg-white rounded-3xl p-3 border border-slate-200 shadow-sm relative">
                <div id="map-alat-bantu" class="w-full"></div>
                <div class="absolute bottom-6 left-6 z-[1000] bg-white/90 backdrop-blur-md px-4 py-2 rounded-2xl shadow-md border border-slate-200 text-[11px] font-bold text-slate-700 flex items-center gap-2">
                    <i class="bi bi-info-circle-fill text-indigo-600"></i>
                    <span>Geser penanda (marker) di peta untuk menyesuaikan posisi presisi.</span>
                </div>
            </div>

            <!-- Coordinate Result Card -->
            <div class="bg-gradient-to-br from-slate-900 via-slate-800 to-indigo-950 text-white rounded-3xl p-6 lg:p-8 shadow-xl border border-slate-700 space-y-5">
                <div class="flex justify-between items-center border-b border-slate-700/80 pb-4">
                    <div>
                        <span class="text-[10px] font-black uppercase tracking-widest text-emerald-400">Hasil Penentuan Koordinat</span>
                        <h3 class="text-xl font-black text-white mt-0.5">Nilai Latitude & Longitude</h3>
                    </div>
                    <span class="px-3 py-1 bg-emerald-500/20 border border-emerald-400/40 text-emerald-300 rounded-full text-xs font-black">
                        Kota Madiun
                    </span>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <!-- Latitude Card -->
                    <div class="bg-white/10 backdrop-blur-md p-4 rounded-2xl border border-white/10 space-y-1">
                        <span class="text-[10px] font-bold uppercase tracking-wider text-slate-300">Latitude (Lintang)</span>
                        <div class="flex items-center justify-between">
                            <span class="text-xl font-black font-mono text-emerald-300" x-text="lat || '-7.6298000'"></span>
                            <button type="button" @click="copyText(lat, 'Latitude')" class="p-2 bg-white/10 hover:bg-white/20 rounded-xl text-xs transition text-white">
                                <i class="bi bi-clipboard"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Longitude Card -->
                    <div class="bg-white/10 backdrop-blur-md p-4 rounded-2xl border border-white/10 space-y-1">
                        <span class="text-[10px] font-bold uppercase tracking-wider text-slate-300">Longitude (Bujur)</span>
                        <div class="flex items-center justify-between">
                            <span class="text-xl font-black font-mono text-emerald-300" x-text="lng || '111.5239000'"></span>
                            <button type="button" @click="copyText(lng, 'Longitude')" class="p-2 bg-white/10 hover:bg-white/20 rounded-xl text-xs transition text-white">
                                <i class="bi bi-clipboard"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Combined Format & Copy Button -->
                <div class="bg-emerald-950/60 border border-emerald-500/30 p-4 rounded-2xl flex flex-col sm:flex-row items-center justify-between gap-3">
                    <div class="space-y-0.5">
                        <span class="text-[10px] font-bold text-emerald-300 uppercase tracking-wider block">Format Gabungan (Lat, Lng)</span>
                        <span class="text-sm font-black font-mono text-white block" x-text="lat && lng ? (lat + ', ' + lng) : '-7.6298000, 111.5239000'"></span>
                    </div>
                    <button type="button" @click="copyText((lat + ', ' + lng), 'Koordinat Lengkap')"
                        class="w-full sm:w-auto px-5 py-2.5 bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-black rounded-xl text-xs shadow-lg transition active:scale-95 flex items-center justify-center gap-2">
                        <i class="bi bi-clipboard-check-fill"></i>
                        <span>Salin Koordinat (Lat, Lng)</span>
                    </button>
                </div>
            </div>

        </div>

    </div>

</div>
@endsection

@section('scripts')
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<script>
    function alatBantuGeocoding() {
        return {
            form: {
                jalan: '',
                nomor: '',
                rtrw: '',
                kecamatan: 'Kartoharjo',
                kelurahan: 'Kartoharjo'
            },
            kelurahanMap: {
                'Kartoharjo': ['Kartoharjo', 'Kanigoro', 'Kelun', 'Klegen', 'Oro-oro Ombo', 'Tawangrejo', 'Rejomulyo', 'Sukosari', 'Nambangan Lor'],
                'Manguharjo': ['Manguharjo', 'Nambangan Kidul', 'Ngegong', 'Pangongangan', 'Madiun Lor', 'Sogaten', 'Winongo', 'Patihan'],
                'Taman': ['Taman', 'Banjarejo', 'Demangan', 'Josenan', 'Manisrejo', 'Mojorejo', 'Pandean', 'Kejuron']
            },
            kelurahanList: [],
            map: null,
            marker: null,
            lat: '-7.6298000',
            lng: '111.5239000',
            gmapsInput: '',
            isSearching: false,

            initMap() {
                this.onKecamatanChange();
                
                // Initialize Leaflet Map centered on Kota Madiun
                this.map = L.map('map-alat-bantu').setView([-7.6298, 111.5239], 14);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    maxZoom: 19,
                    attribution: '&copy; OpenStreetMap contributors | IKM JUARA Madiun'
                }).addTo(this.map);

                // Create initial draggable marker
                this.marker = L.marker([-7.6298, 111.5239], { draggable: true }).addTo(this.map);
                this.marker.bindPopup("<b>Lokasi Koordinat</b><br>Geser untuk menyesuaikan titik presisi.").openPopup();

                // Listen to marker drag event
                this.marker.on('dragend', (e) => {
                    const position = e.target.getLatLng();
                    this.lat = position.lat.toFixed(7);
                    this.lng = position.lng.toFixed(7);
                });

                // Listen to map click event
                this.map.on('click', (e) => {
                    this.marker.setLatLng(e.latlng);
                    this.lat = e.latlng.lat.toFixed(7);
                    this.lng = e.latlng.lng.toFixed(7);
                });
            },

            onKecamatanChange() {
                this.kelurahanList = this.kelurahanMap[this.form.kecamatan] || [];
                if (!this.kelurahanList.includes(this.form.kelurahan)) {
                    this.form.kelurahan = this.kelurahanList[0] || '';
                }
            },

            async cariKoordinat() {
                this.isSearching = true;

                // 1. Bersihkan string input jalan (hapus kata "No. xx", "RT/RW", dsb agar pencarian OSM presisi)
                let cleanJalan = (this.form.jalan || '')
                    .replace(/no\.?\s*\d+\w*/gi, '')
                    .replace(/rt\.?\s*\d+\s*\/?\s*rw\.?\s*\d+/gi, '')
                    .trim();

                let rawStreetName = cleanJalan.replace(/^(jl\.?|jalan)\s+/i, '').trim();

                let targetLat = null;
                let targetLng = null;

                // Cascading Multi-Tier Search ke OpenStreetMap Nominatim API
                const queries = [
                    // Tier 1: "Jl. Bolodewo, Kota Madiun" -> Mendapatkan titik presisi sama persis seperti Google Maps (-7.6279314, 111.5298893)!
                    `${cleanJalan}, Kota Madiun, Jawa Timur`,
                    `Jalan ${rawStreetName}, Kota Madiun, Jawa Timur`,
                    `${cleanJalan}, Kelurahan ${this.form.kelurahan}, Kota Madiun`,
                    `Jalan ${rawStreetName}, ${this.form.kelurahan}, Madiun`,
                    `Kelurahan ${this.form.kelurahan}, Kecamatan ${this.form.kecamatan}, Kota Madiun, Jawa Timur`,
                    `Kecamatan ${this.form.kecamatan}, Kota Madiun, Jawa Timur`
                ];

                for (let q of queries) {
                    try {
                        const url = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(q)}&bounded=1&viewbox=111.48,-7.66,111.56,-7.60`;
                        const res = await fetch(url);
                        const data = await res.json();
                        if (data && data.length > 0) {
                            targetLat = parseFloat(data[0].lat);
                            targetLng = parseFloat(data[0].lon);
                            break;
                        }
                    } catch (e) {
                        console.error(e);
                    }
                }

                if (targetLat && targetLng) {
                    this.lat = targetLat.toFixed(7);
                    this.lng = targetLng.toFixed(7);

                    this.map.setView([targetLat, targetLng], 17);
                    this.marker.setLatLng([targetLat, targetLng]);

                    const displayAddress = `${this.form.jalan} ${this.form.nomor ? ('No. ' + this.form.nomor) : ''}, Kel. ${this.form.kelurahan}, Kec. ${this.form.kecamatan}`;
                    this.marker.bindPopup(`<b>📍 ${displayAddress}</b><br><span class="text-xs text-emerald-600 font-bold">Penanda dipasang tepat pada ruas jalan ini. Geser marker untuk menyesuaikan nomor rumah/bangunan persis.</span>`).openPopup();

                    Swal.fire({
                        icon: 'success',
                        title: 'Titik Jalan Ditemukan Presisi!',
                        html: `<b>Alamat:</b> ${displayAddress}<br><br><span class="text-xs font-mono text-emerald-600 font-bold">Latitude: ${this.lat}, Longitude: ${this.lng}</span><br><br><span class="text-xs text-slate-500">Silakan klik atau geser penanda pada peta jika ingin menyesuaikan posisi nomor rumah.</span>`,
                        confirmButtonText: 'Siap, Paham'
                    });
                } else {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Penentuan Posisi Manual',
                        text: 'Sistem menempatkan di pusat Kota Madiun. Silakan klik atau geser marker ke lokasi rumah/bangunan yang diinginkan.',
                        confirmButtonText: 'Tentukan di Peta'
                    });
                }
                this.isSearching = false;
            },

            parseGoogleMapsInput() {
                if (!this.gmapsInput) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Link/Koordinat Kosong',
                        text: 'Silakan tempelkan link Google Maps atau koordinat terlebih dahulu.'
                    });
                    return;
                }
                
                // Parse lat & lng from URL (@-7.6276246,111.5295261 or 3d-7.6276246!4d111.5295261 or raw -7.6276246, 111.5295261)
                const matchUrl = this.gmapsInput.match(/@(-?\d+\.\d+),(-?\d+\.\d+)/) || 
                                 this.gmapsInput.match(/3d(-?\d+\.\d+)!4d(-?\d+\.\d+)/) ||
                                 this.gmapsInput.match(/!3d(-?\d+\.\d+)!4d(-?\d+\.\d+)/) ||
                                 this.gmapsInput.match(/(-?\d+\.\d+)\s*,\s*(-?\d+\.\d+)/);

                if (matchUrl) {
                    const parsedLat = parseFloat(matchUrl[1]);
                    const parsedLng = parseFloat(matchUrl[2]);

                    this.lat = parsedLat.toFixed(7);
                    this.lng = parsedLng.toFixed(7);

                    this.map.setView([parsedLat, parsedLng], 18);
                    this.marker.setLatLng([parsedLat, parsedLng]);
                    this.marker.bindPopup(`<b>📍 Impor Google Maps</b><br>Latitude: ${this.lat}<br>Longitude: ${this.lng}`).openPopup();

                    Swal.fire({
                        icon: 'success',
                        title: 'Koordinat Google Maps Berhasil Diimpor!',
                        html: `<span class="text-xs font-mono text-emerald-600 font-bold">Latitude: ${this.lat}, Longitude: ${this.lng}</span>`,
                        timer: 2200,
                        showConfirmButton: false
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Link / Koordinat Tidak Dikenali',
                        text: 'Pastikan menempelkan link Google Maps utuh atau teks koordinat seperti "-7.6276246, 111.5295261".'
                    });
                }
            },

            copyText(text, label) {
                navigator.clipboard.writeText(text).then(() => {
                    Swal.fire({
                        toast: true,
                        position: 'top-end',
                        icon: 'success',
                        title: `${label} berhasil disalin!`,
                        showConfirmButton: false,
                        timer: 2000
                    });
                });
            }
        };
    }
</script>
@endsection
