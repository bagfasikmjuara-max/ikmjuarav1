<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peta Sebaran Pelaku Usaha - Kota Madiun</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
    <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css" />

    <style>
        body { 
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #f8fafc;
        }
        .font-inter {
            font-family: 'Inter', sans-serif;
        }
        #map-publik { 
            height: 75vh; 
            border-radius: 24px; 
            z-index: 1; 
        }
        /* Custom scrollbar for sidebar list */
        .card-list-scrollbar::-webkit-scrollbar { 
            width: 6px; 
        }
        .card-list-scrollbar::-webkit-scrollbar-track {
            background: transparent;
        }
        .card-list-scrollbar::-webkit-scrollbar-thumb { 
            background: #cbd5e1; 
            border-radius: 10px; 
        }
        .card-list-scrollbar::-webkit-scrollbar-thumb:hover { 
            background: #94a3b8; 
        }
        /* Leaflet Popup Styling */
        .leaflet-popup-content-wrapper {
            border-radius: 20px !important;
            box-shadow: 0 10px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1) !important;
            border: 1px solid #f1f5f9 !important;
            padding: 4px !important;
        }
        .leaflet-popup-tip {
            background: white !important;
        }
        .custom-div-icon {
            background: transparent !important;
            border: none !important;
        }
        /* Custom Marker Cluster styling */
        .marker-cluster-small {
            background-color: rgba(99, 102, 241, 0.6) !important;
        }
        .marker-cluster-small div {
            background-color: rgba(79, 70, 229, 0.85) !important;
            color: white !important;
            font-weight: bold !important;
        }
        .marker-cluster-medium {
            background-color: rgba(99, 102, 241, 0.6) !important;
        }
        .marker-cluster-medium div {
            background-color: rgba(79, 70, 229, 0.85) !important;
            color: white !important;
            font-weight: bold !important;
        }
        .marker-cluster-large {
            background-color: rgba(99, 102, 241, 0.6) !important;
        }
        .marker-cluster-large div {
            background-color: rgba(79, 70, 229, 0.85) !important;
            color: white !important;
            font-weight: bold !important;
        }
    </style>
</head>
<body class="flex flex-col min-h-screen">

    <!-- Header / Navbar matching landing page -->
    <nav class="bg-white/80 backdrop-blur-md sticky top-0 z-50 border-b border-slate-100">
        <div class="max-w-7xl mx-auto flex justify-between items-center px-6 py-4">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-lg overflow-hidden flex items-center justify-center">
                    <img src="{{ asset('logo-ikm.png') }}" alt="Logo" class="w-full object-contain">
                </div>
                <span class="text-2xl font-extrabold tracking-tight text-slate-800 uppercase">
                    IKM<span class="text-yellow-500">JUARA</span>
                </span>
            </div>
            <div>
                <a href="/" class="flex items-center gap-2 text-slate-600 hover:text-indigo-600 font-bold text-sm tracking-wider transition">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    KEMBALI KE BERANDA
                </a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="flex-1 max-w-7xl w-full mx-auto p-6 flex flex-col gap-6">
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div>
                <h1 class="text-2xl font-extrabold text-slate-800 tracking-tight flex items-center gap-2">
                    <i class="bi bi-geo-alt-fill text-indigo-600"></i> PETA SEBARAN IKM BINAAN KOTA MADIUN
                </h1>
                <p class="text-sm text-slate-500 font-medium">Temukan lokasi industri kecil dan menengah binaan dinas resmi Kota Madiun secara langsung.</p>
            </div>
        </div>

        <!-- Search Bar Pelaku Usaha -->
        <div class="bg-white rounded-3xl border p-5 shadow-sm relative z-50">
            <div class="relative w-full">
                <input type="text" id="search-usaha-input" oninput="filterSearchUsaha()" placeholder="Cari pelaku usaha binaan berdasarkan nama usaha atau pemilik..." 
                       class="w-full bg-slate-50 border border-slate-200 focus:border-indigo-500 rounded-2xl pl-12 pr-6 py-4 text-sm font-bold text-slate-700 outline-none transition duration-300">
                <div class="absolute left-5 top-5 text-slate-400">
                    <i class="bi bi-search text-base"></i>
                </div>
                <!-- Suggestion list -->
                <div id="search-suggestions" class="absolute left-0 right-0 mt-2 bg-white border border-slate-200 rounded-2xl shadow-xl z-50 hidden max-h-60 overflow-y-auto card-list-scrollbar">
                    <!-- Javascript will inject list here -->
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 items-stretch">
            <!-- Map Container -->
            <div class="lg:col-span-2 flex flex-col gap-4">
                <div class="bg-white rounded-3xl p-3 border shadow-sm flex-1 flex flex-col gap-3">
                    <div id="map-publik" class="w-full"></div>
                    <!-- Legenda Kategori Peta -->
                    <div class="bg-slate-50 rounded-2xl p-4 flex flex-wrap gap-4 items-center justify-center text-xs font-bold text-slate-600 border border-slate-100">
                        <span class="text-slate-400 uppercase tracking-widest text-[9px] mr-2">Legenda Kategori:</span>
                        <span class="flex items-center gap-1.5"><span class="w-3.5 h-3.5 rounded-full inline-block" style="background-color: #f43f5e;"></span> Pangan</span>
                        <span class="flex items-center gap-1.5"><span class="w-3.5 h-3.5 rounded-full inline-block" style="background-color: #6366f1;"></span> Sandang</span>
                        <span class="flex items-center gap-1.5"><span class="w-3.5 h-3.5 rounded-full inline-block" style="background-color: #f59e0b;"></span> Kerajinan (Kriya)</span>
                        <span class="flex items-center gap-1.5"><span class="w-3.5 h-3.5 rounded-full inline-block" style="background-color: #0d9488;"></span> Kimia & Furnitur</span>
                        <span class="flex items-center gap-1.5"><span class="w-3.5 h-3.5 rounded-full inline-block" style="background-color: #2563eb;"></span> Logam & Mesin</span>
                    </div>
                </div>
                <!-- Alert Box -->
                <div class="bg-indigo-50 border border-indigo-100 rounded-2xl p-4 flex gap-3 text-indigo-800 text-xs font-semibold leading-relaxed shadow-sm">
                    <i class="bi bi-info-circle-fill text-indigo-600 text-base"></i>
                    <div>
                        <strong>Petunjuk Penggunaan:</strong> Klik angka cluster atau penanda (marker) untuk melihat informasi detail usaha. Klik di area peta manapun untuk memindai pelaku usaha binaan di sekitarnya dalam radius <strong>200 meter</strong>.
                    </div>
                </div>
            </div>

            <!-- List Sidebar -->
            <div class="flex flex-col bg-white rounded-3xl border shadow-sm overflow-hidden h-[75vh] lg:h-auto">
                <div class="bg-slate-50 px-6 py-4 border-b">
                    <h3 class="font-extrabold text-slate-800 text-base flex items-center gap-2">
                        <i class="bi bi-compass-fill text-indigo-600"></i> Daftar Usaha Terdeteksi
                    </h3>
                </div>
                
                <div class="flex-1 overflow-y-auto card-list-scrollbar p-4" id="usaha-list-publik">
                    <div class="h-full flex flex-col items-center justify-center text-center text-slate-400 p-6">
                        <div class="w-16 h-16 rounded-full bg-slate-50 flex items-center justify-center mb-4 text-indigo-500 text-2xl shadow-sm border border-slate-100">
                            <i class="bi bi-cursor-fill"></i>
                        </div>
                        <p class="font-bold text-slate-700 text-sm mb-1">Pindai Area Sekitar</p>
                        <p class="text-xs max-w-xs text-slate-400">Silakan klik area di peta untuk mendeteksi IKM Binaan dalam radius 200 meter.</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>

    <script>
        // 1. Inisialisasi Peta
        var map = L.map('map-publik').setView([-7.6298, 111.5295], 14);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);

        var markerRadius;
        var dataUsaha = @json($semua_usaha); // Data dari Controller

        // 2. Inisialisasi Cluster Group
        var markers = L.markerClusterGroup({
            showCoverageOnHover: false, // Mematikan garis polygon saat hover agar lebih bersih
            zoomToBoundsOnClick: true   // Otomatis zoom saat klik angka cluster
        });

        // Simpan referensi marker berdasarkan ID usaha untuk navigasi pencarian
        var markerMap = {};

        // 3. Menampilkan Semua Marker dengan Popup Custom ke dalam Cluster Group
        var categoryColors = {
            'Pangan': '#f43f5e',           // Rose/Merah
            'Sandang': '#6366f1',          // Indigo/Ungu
            'Kerajinan (Kriya)': '#f59e0b', // Amber/Oranye
            'Kimia dan Furnitur': '#0d9488',// Teal/Hijau Toska
            'Logam dan Mesin': '#2563eb'    // Blue/Biru
        };

        dataUsaha.forEach(function(u) {
            if(u.latitude && u.longitude) {
                var catColor = categoryColors[u.kategori] || '#10b981'; // Emerald default

                // Custom SVG pin markup
                var iconHtml = `
                    <div style="display: flex; justify-content: center; align-items: center; width: 32px; height: 32px;">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="${catColor}" style="width: 30px; height: 30px; filter: drop-shadow(0px 2px 4px rgba(0,0,0,0.35));">
                            <path fill-rule="evenodd" d="M11.54 22.351l.07.04.028.016a.76.76 0 00.723 0l.028-.015.071-.041a16.975 16.975 0 001.144-.742 19.58 19.58 0 002.683-2.282c1.944-1.99 3.963-4.98 3.963-8.827a8.25 8.25 0 00-16.5 0c0 3.846 2.02 6.837 3.963 8.827a19.58 19.58 0 002.682 2.282 16.975 16.975 0 001.145.742zM12 13.5a3.5 3.5 0 100-7 3.5 3.5 0 000 7z" clip-rule="evenodd" />
                        </svg>
                    </div>
                `;

                var customIcon = L.divIcon({
                    html: iconHtml,
                    className: 'custom-div-icon',
                    iconSize: [32, 32],
                    iconAnchor: [16, 32],
                    popupAnchor: [0, -32]
                });

                // Buat Marker satuan dengan custom icon
                var marker = L.marker([u.latitude, u.longitude], { icon: customIcon });

                // Isi Popup (Menggunakan tema sesuai kategori)
                var popupContent = `
                    <div class="font-inter" style="min-width: 220px; padding: 4px;">
                        <h4 style="text-transform: uppercase; color: ${catColor}; font-size: 13px; font-weight: 800; margin-bottom: 4px; font-family: 'Plus Jakarta Sans', sans-serif;">${u.nama_usaha || u.nama_perusahaan}</h4>
                        <div style="font-size: 11px; color: #64748b; font-weight: 600; margin-bottom: 8px;">
                            <i class="bi bi-person-fill" style="color: ${catColor};"></i> Pemilik: ${u.nama_pemilik || u.pemilik || '-'}
                        </div>
                        <p style="font-size: 11px; margin: 8px 0; color: #334155; line-height: 1.5; font-weight: 500;">
                            <i class="bi bi-geo-alt-fill" style="color: ${catColor};"></i> ${u.alamat_jalan || ''} ${u.alamat_no && u.alamat_no !== '-' ? 'No. ' + u.alamat_no : ''}, Kel. ${u.kelurahan || '-'}
                        </p>
                        <div style="border-top: 1px dashed #e2e8f0; padding-top: 6px; margin-top: 8px; display: flex; justify-content: space-between; align-items: center;">
                             <span style="font-size: 10px; font-weight: bold; background: ${catColor}15; color: ${catColor}; padding: 3px 8px; border-radius: 9999px;">
                                 <i class="bi bi-tag-fill"></i> ${u.kategori || 'IKM'}
                            </span>
                        </div>
                    </div>
                `;
                
                marker.bindPopup(popupContent);
                
                // Simpan referensi ke map
                markerMap[u.id] = marker;

                // Tambahkan marker ke cluster group
                markers.addLayer(marker);
            }
        });

        // Tambahkan seluruh group cluster ke peta
        map.addLayer(markers);

        // FUNGSI PENCARIAN & NAVIGASI PETA
        function filterSearchUsaha() {
            var input = document.getElementById('search-usaha-input');
            var query = input.value.trim().toLowerCase();
            var suggestions = document.getElementById('search-suggestions');

            if (query.length < 2) {
                suggestions.classList.add('hidden');
                suggestions.innerHTML = '';
                return;
            }

            var matches = dataUsaha.filter(function(u) {
                return (u.nama_usaha && u.nama_usaha.toLowerCase().includes(query)) ||
                       (u.pemilik && u.pemilik.toLowerCase().includes(query));
            });

            if (matches.length === 0) {
                suggestions.innerHTML = '<div class="p-4 text-slate-400 text-xs font-bold text-center">Pelaku usaha tidak ditemukan</div>';
                suggestions.classList.remove('hidden');
                return;
            }

            var html = '';
            matches.forEach(function(u) {
                var name = u.nama_usaha;
                var owner = u.pemilik || '-';
                var lat = u.latitude;
                var lng = u.longitude;
                var catColor = categoryColors[u.kategori] || '#10b981';

                html += `
                    <div onclick="selectUsaha(${u.id}, ${lat}, ${lng})" class="p-3.5 hover:bg-slate-50 transition cursor-pointer flex justify-between items-center text-xs font-semibold border-b border-slate-50 last:border-0">
                        <div class="flex flex-col">
                            <span class="text-slate-800 font-extrabold uppercase">${name}</span>
                            <span class="text-slate-400 text-[10px] mt-0.5"><i class="bi bi-person-fill" style="color: ${catColor};"></i> Pemilik: ${owner}</span>
                        </div>
                        <span class="text-[10px] font-bold px-2.5 py-0.5 rounded-full" style="background: ${catColor}15; color: ${catColor};">${u.kategori || 'IKM'}</span>
                    </div>
                `;
            });

            suggestions.innerHTML = html;
            suggestions.classList.remove('hidden');
        }

        function selectUsaha(id, lat, lng) {
            document.getElementById('search-suggestions').classList.add('hidden');
            
            // Fokus peta ke koordinat usaha
            map.flyTo([lat, lng], 17, {
                animate: true,
                duration: 1.5
            });

            setTimeout(function() {
                var m = markerMap[id];
                if (m) {
                    markers.zoomToShowLayer(m, function() {
                        m.openPopup();
                    });
                }
            }, 1200);
        }

        // Tutup daftar saran ketika klik di luar area
        document.addEventListener('click', function(e) {
            var searchContainer = document.getElementById('search-usaha-input');
            var suggestions = document.getElementById('search-suggestions');
            if (e.target !== searchContainer && e.target !== suggestions) {
                if(suggestions) suggestions.classList.add('hidden');
            }
        });

        // 4. Fungsi Ambil Data List di Samping (Radius 200m)
        function loadUsahaList(lat, lng) {
            const listContainer = document.getElementById('usaha-list-publik');
            listContainer.innerHTML = `
                <div class="h-full flex flex-col items-center justify-center text-center p-6">
                    <div class="animate-spin rounded-full h-8 w-8 border-4 border-indigo-500 border-t-transparent mb-3"></div>
                    <p class="text-sm font-bold text-slate-700">Mencari IKM Binaan...</p>
                </div>
            `;

            fetch(`/api/peta-publik?lat=${lat}&lng=${lng}`)
                .then(res => res.json())
                .then(data => {
                    listContainer.innerHTML = '';
                    if(data.length > 0) {
                        data.forEach(u => {
                            const name = u.nama_usaha || u.nama_perusahaan;
                            const owner = u.nama_pemilik || u.pemilik || '-';
                            const address = (u.alamat_jalan || '') + (u.alamat_no && u.alamat_no !== '-' ? ' No. ' + u.alamat_no : '');
                            const catColor = categoryColors[u.kategori] || '#10b981';

                            listContainer.innerHTML += `
                                <div class="p-4 mb-3 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition duration-200 bg-gradient-to-r from-white to-slate-50 border-l-4" style="border-left-color: ${catColor};">
                                    <h6 class="font-extrabold text-slate-800 text-sm mb-1 leading-snug uppercase tracking-tight">${name}</h6>
                                    <p class="text-xs text-slate-500 font-semibold mb-2"><i class="bi bi-person-fill" style="color: ${catColor};"></i> ${owner}</p>
                                    <p class="text-xs text-slate-650 font-medium mb-3 leading-relaxed"><i class="bi bi-geo-alt-fill" style="color: ${catColor};"></i> ${address}</p>
                                    <div class="flex justify-between items-center">
                                        <span class="text-[10px] font-bold px-3 py-1 rounded-full border" style="background-color: ${catColor}15; color: ${catColor}; border-color: ${catColor}20;">${u.kategori || 'IKM'}</span>
                                        <span class="text-[10px] font-bold bg-slate-100 text-slate-600 px-3 py-1 rounded-full"><i class="bi bi-distribute-vertical text-slate-400"></i> ${(u.distance * 1000).toFixed(0)}m</span>
                                    </div>
                                </div>
                            `;
                        });
                    } else {
                        listContainer.innerHTML = `
                            <div class="h-full flex flex-col items-center justify-center text-center text-slate-400 p-6">
                                <div class="w-16 h-16 rounded-full bg-slate-50 flex items-center justify-center mb-4 text-slate-400 text-2xl shadow-sm border border-slate-100">
                                    <i class="bi bi-info-circle"></i>
                                </div>
                                <p class="font-bold text-slate-700 text-sm mb-1">Tidak Ada Data</p>
                                <p class="text-xs max-w-xs text-slate-400">Tidak ada pelaku usaha binaan yang terdeteksi dalam radius 200 meter dari titik ini.</p>
                            </div>
                        `;
                    }
                })
                .catch(err => {
                    listContainer.innerHTML = `
                        <div class="h-full flex flex-col items-center justify-center text-center text-red-500 p-6">
                            <i class="bi bi-exclamation-triangle-fill text-3xl mb-3"></i>
                            <p class="font-bold text-sm">Gagal Mengambil Data</p>
                            <p class="text-xs text-red-400">Terjadi kesalahan saat memuat data. Silakan coba kembali.</p>
                        </div>
                    `;
                });
        }

        // 5. Event Klik di Peta untuk Radius Search (200m)
        map.on('click', function(e) {
            var lat = e.latlng.lat;
            var lng = e.latlng.lng;

            // Efek Zoom halus saat klik
            map.panTo(e.latlng);

            if (markerRadius) map.removeLayer(markerRadius);
            markerRadius = L.circle([lat, lng], {
                color: '#4f46e5',
                fillColor: '#818cf8',
                fillOpacity: 0.15,
                radius: 200
            }).addTo(map);

            loadUsahaList(lat, lng);
        });
    </script>
</body>
</html>