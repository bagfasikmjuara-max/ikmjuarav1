<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $title ?? 'Halaman Peta' }} - Panel Superadmin</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

    <style>
        /* Pengaturan Layout Satu Halaman (No Global Scroll) */
        html, body { 
            height: 100%; 
            margin: 0; 
            padding: 0; 
            overflow: hidden; /* Mencegah scroll seluruh halaman */
            background-color: #f0f2f5; 
        }

        .main-wrapper {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .content-area {
            flex: 1;
            display: flex;
            overflow: hidden; /* Container konten utama */
            padding: 15px;
            gap: 15px;
        }

        /* Styling Peta */
        #map-admin { 
            height: 100%; 
            width: 100%;
            border-radius: 15px; 
            z-index: 1; 
            cursor: crosshair; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        /* Sidebar Kanan (Statistik + List) */
        .sidebar-container {
            width: 400px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            height: 100%;
        }

        /* Container Scrollable */
        .scroll-section {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        /* Ukuran Statistik (Atas) */
        .statistik-box { height: 35%; }
        /* Ukuran List (Bawah) */
        .list-box { height: 65%; }

        .scroll-content {
            flex: 1;
            overflow-y: auto;
            padding: 10px;
        }

        /* Custom Scrollbar */
        .scroll-content::-webkit-scrollbar { width: 5px; }
        .scroll-content::-webkit-scrollbar-thumb { background: #198754; border-radius: 10px; }

        /* UI Components */
        .navbar { z-index: 1040; }
        .business-name { font-size: 1rem; font-weight: 700; color: #2d3436; }
        .info-text { font-size: 0.8rem; color: #636e72; margin-bottom: 2px; display: flex; align-items: flex-start; }
        .info-text i { margin-right: 8px; color: #198754; width: 14px; }
        
        .list-group-item {
            border: none !important;
            border-radius: 12px !important;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            margin-bottom: 10px;
            padding: 12px !important;
            transition: 0.2s;
        }
        .list-group-item:hover { transform: scale(1.01); background: #fff; }

        .map-picker-container { border: 2px solid #dee2e6; border-radius: 10px; overflow: hidden; }
        .bg-orange { background-color: #fd7e14; color: white; }
        .bg-purple { background-color: #6f42c1; color: white; }

        /* Tombol Tambah Mengapung */
        .btn-float {
            position: fixed;
            bottom: 30px;
            right: 430px; /* Di samping sidebar */
            width: 60px;
            height: 60px;
            z-index: 1050;
            border: 4px solid white;
        }
    </style>
</head>
<body>

    <div class="main-wrapper">
        <nav class="navbar navbar-dark bg-success shadow-sm py-2">
            <div class="container-fluid px-4">
                <span class="navbar-brand mb-0 h1 fs-5">
                    <i class="bi bi-shield-lock-fill me-2"></i>PETA KONTROL SUPERADMIN
                </span>
                <div class="d-flex gap-2">
                    <a href="{{ url('/pusat/usaha') }}" class="btn btn-sm btn-outline-light">
                        <i class="bi bi-database me-1"></i> Database
                    </a>
                    <a href="{{ url('/pusat/dashboard') }}" class="btn btn-sm btn-outline-light">
                        <i class="bi bi-speedometer2 me-1"></i> Dashboard
                    </a>
                </div>
            </div>
        </nav>

        <div class="content-area">
            <div class="flex-grow-1 h-100 position-relative">
                <div id="map-admin"></div>
            
            </div>

            <div class="sidebar-container">
                
                <div class="scroll-section statistik-box">
                    <div class="card-header bg-primary text-white py-2 px-3 fw-bold d-flex justify-content-between">
                        <span>Statistik Wilayah</span>
                        <span class="badge bg-white text-primary">{{ $totalUsaha ?? 0 }} Total</span>
                    </div>
                    <div class="scroll-content">
                        <small class="text-muted fw-bold d-block mb-1">BERDASARKAN KELURAHAN:</small>
                        <ul class="list-group list-group-flush small">
                            @foreach($statistikWilayah ?? [] as $item)
                            <li class="list-group-item d-flex justify-content-between align-items-center p-1 px-2 border-bottom">
                                {{ $item->kelurahan }}
                                <span class="badge bg-info rounded-pill">{{ $item->total }}</span>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

                <div class="scroll-section list-box">
                    <div class="card-header bg-white sticky-top fw-bold border-bottom py-2 px-3 d-flex justify-content-between align-items-center">
                        Daftar Usaha Sekitar
                        <span class="badge bg-success" id="count-badge">0</span>
                    </div>
                    <div class="scroll-content" id="usaha-list-admin">
                        <div class="p-4 text-center text-muted">
                            <i class="bi bi-cursor-fill fs-2 d-block mb-2"></i>
                            <p class="small">Klik area pada peta untuk melihat & mengelola data usaha di radius tersebut.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <button class="btn btn-success rounded-circle shadow-lg d-flex align-items-center justify-content-center btn-float" 
            data-bs-toggle="modal" data-bs-target="#modalTambah">
        <i class="bi bi-plus-lg fs-3"></i>
    </button>

    <div class="modal fade" id="modalTambah" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-0 shadow">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title"><i class="bi bi-plus-circle-fill me-2"></i>Tambah Pelaku Usaha</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <form id="formTambahUsaha" action="{{ route('pusat.usaha.store') }}" method="POST">
                    @csrf
                    <div class="modal-body row g-3">
                        <div class="col-md-6">
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Nama Usaha</label>
                                <input type="text" name="nama_usaha" class="form-control" required>
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Pemilik</label>
                                <input type="text" name="pemilik" class="form-control" required>
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Kategori</label>
                                <select name="kategori" class="form-select">
                                    <option value="Kuliner">Kuliner</option>
                                    <option value="Fashion">Fashion</option>
                                    <option value="Jasa">Jasa</option>
                                </select>
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Kelurahan</label>
                                <input type="text" name="kelurahan" id="input_kelurahan" class="form-control" placeholder="Otomatis dari peta">
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Alamat Lengkap</label>
                                <textarea name="alamat" id="alamat_input" class="form-control" rows="2" required></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold small text-success">Lokasi (Klik Peta)</label>
                            <div class="map-picker-container mb-2">
                                <div id="mapPicker" style="height: 220px;"></div>
                            </div>
                            <div class="row g-1">
                                <div class="col"><input type="text" id="lat_input" name="latitude" class="form-control form-control-sm bg-light" readonly required placeholder="Lat"></div>
                                <div class="col"><input type="text" id="lng_input" name="longitude" class="form-control form-control-sm bg-light" readonly required placeholder="Lng"></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                        <button type="submit" id="btnSimpanTambah" class="btn btn-success px-4">Simpan Data</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalEdit" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-0 shadow">
                <div class="modal-header bg-warning">
                    <h5 class="modal-title fw-bold"><i class="bi bi-pencil-square me-2"></i>Edit Data Usaha</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form id="formEditUsaha" method="POST">
                    @csrf 
                    @method('PUT')
                    <div class="modal-body row g-3">
                        <div class="col-md-6">
                            <input type="hidden" id="edit_id" name="id">
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Nama Usaha</label>
                                <input type="text" id="edit_nama" name="nama_usaha" class="form-control" required>
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Pemilik</label>
                                <input type="text" id="edit_pemilik" name="pemilik" class="form-control" required>
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Kategori</label>
                                <select id="edit_kategori" name="kategori" class="form-select">
                                    <option value="Kuliner">Kuliner</option>
                                    <option value="Fashion">Fashion</option>
                                    <option value="Jasa">Jasa</option>
                                </select>
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Kelurahan</label>
                                <input type="text" id="edit_kelurahan" name="kelurahan" class="form-control">
                            </div>
                            <div class="mb-2">
                                <label class="form-label fw-bold small">Alamat Lengkap</label>
                                <textarea id="edit_alamat" name="alamat" class="form-control" rows="2" required></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold small">Pindahkan Lokasi (Klik Peta)</label>
                            <div class="map-picker-container mb-2">
                                <div id="mapPickerEdit" style="height: 250px;"></div>
                            </div>
                            <div class="row g-1">
                                <div class="col"><input type="text" id="edit_lat" name="latitude" class="form-control form-control-sm bg-light" readonly></div>
                                <div class="col"><input type="text" id="edit_lng" name="longitude" class="form-control form-control-sm bg-light" readonly></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer bg-light">
                        <button type="submit" id="btnSimpanEdit" class="btn btn-warning w-100 fw-bold">Update Data</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    
    <script>
        // -- PETA UTAMA --
        var map = L.map('map-admin').setView([-7.6298, 111.5295], 14);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

        var markerRadius, pickerMarker, pickerMap, pickerMarkerEdit, mapPickerEdit;
        var dataUsahaAwal = @json($semua_usaha ?? []); 

        // Render Marker Awal
        dataUsahaAwal.forEach(u => {
            if(u.latitude && u.longitude) {
                L.marker([u.latitude, u.longitude]).addTo(map)
                 .bindPopup(`<div class="text-center"><strong>${u.nama_usaha}</strong><br><small>${u.alamat}</small></div>`);
            }
        });

        // Load GeoJSON Wilayah
        fetch('/data/madiun_kelurahan.json')
            .then(res => res.json())
            .then(data => {
                L.geoJSON(data, {
                    style: { color: "#198754", weight: 1, fillColor: "#198754", fillOpacity: 0.05 },
                    onEachFeature: function (feature, layer) {
                        layer.bindTooltip(feature.properties.nama_kelurahan);
                        layer.on('click', function (e) { 
                            L.DomEvent.stopPropagation(e);
                            map.fitBounds(layer.getBounds()); 
                        });
                    }
                }).addTo(map);
            }).catch(err => console.log("GeoJSON not found"));

        // Event Klik Peta Utama untuk Radius Search
        map.on('click', function(e) {
            if (markerRadius) map.removeLayer(markerRadius);
            markerRadius = L.circle([e.latlng.lat, e.latlng.lng], {
                color: 'red', fillColor: '#f03', fillOpacity: 0.1, radius: 100
            }).addTo(map);

            loadUsahaAdmin(e.latlng.lat, e.latlng.lng);
        });

        // Fungsi Load Data Sekitar via AJAX
        function loadUsahaAdmin(lat, lng) {
            const listContainer = document.getElementById('usaha-list-admin');
            listContainer.innerHTML = '<div class="text-center p-5"><div class="spinner-border text-success"></div></div>';

            fetch(`/pusat/api/usaha-sekitar?lat=${lat}&lng=${lng}`)
                .then(res => res.json())
                .then(data => {
                    listContainer.innerHTML = '';
                    document.getElementById('count-badge').innerText = data.length;
                    
                    if(data.length > 0) {
                        data.forEach(u => {
                            let badgeClass = u.kategori === 'Kuliner' ? 'bg-orange' : (u.kategori === 'Fashion' ? 'bg-info' : 'bg-purple');
                            let borderSide = u.kategori === 'Kuliner' ? '#fd7e14' : (u.kategori === 'Fashion' ? '#0dcaf0' : '#6f42c1');
                            
                            // Gunakan Base64 untuk mempassing objek JSON ke atribut HTML agar aman dari karakter petik
                            let uString = btoa(unescape(encodeURIComponent(JSON.stringify(u))));

                            listContainer.innerHTML += `
                                <div class="list-group-item">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div class="business-name">${u.nama_usaha}</div>
                                        <span class="badge bg-dark rounded-pill" style="font-size:10px;">${(u.distance * 1000).toFixed(0)}m</span>
                                    </div>
                                    <div class="info-text mt-1"><i class="bi bi-person-circle"></i>${u.pemilik}</div>
                                    <div class="info-text"><i class="bi bi-geo-alt-fill"></i>Kel. ${u.kelurahan || '-'}</div>
                                    <div class="info-text mb-2"><i class="bi bi-map"></i><span class="text-truncate">${u.alamat || '-'}</span></div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge ${badgeClass} small">${u.kategori}</span>
                                        <div class="btn-group">
                                            <button onclick="openEditModal('${uString}')" class="btn btn-sm btn-warning text-white py-0 px-2">
                                                <i class="bi bi-pencil-square"></i>
                                            </button>
                                            <button onclick="confirmDelete(${u.id})" class="btn btn-sm btn-danger py-0 px-2">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>`;
                        });
                    } else {
                        listContainer.innerHTML = '<div class="p-4 text-center alert alert-warning mx-2 small">Tidak ada usaha di radius ini.</div>';
                    }
                });
        }

        // -- PICKER TAMBAH (MODAL) --
        $('#modalTambah').on('shown.bs.modal', function () {
            if (!pickerMap) {
                pickerMap = L.map('mapPicker').setView([-7.6298, 111.5295], 13);
                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(pickerMap);
                
                pickerMap.on('click', function(e) {
                    let lat = e.latlng.lat;
                    let lng = e.latlng.lng;
                    if (pickerMarker) pickerMap.removeLayer(pickerMarker);
                    pickerMarker = L.marker(e.latlng).addTo(pickerMap);
                    
                    document.getElementById('lat_input').value = lat.toFixed(7);
                    document.getElementById('lng_input').value = lng.toFixed(7);
                    
                    reverseGeocode(lat, lng, 'input_kelurahan', 'alamat_input');
                });
            }
            pickerMap.invalidateSize();
        });

        // -- PICKER EDIT (MODAL) --
        function openEditModal(base64Data) {
            // Decode data
            let u = JSON.parse(decodeURIComponent(escape(atob(base64Data))));

            document.getElementById('edit_id').value = u.id;
            document.getElementById('edit_nama').value = u.nama_usaha;
            document.getElementById('edit_pemilik').value = u.pemilik;
            document.getElementById('edit_kategori').value = u.kategori;
            document.getElementById('edit_alamat').value = u.alamat || '';
            document.getElementById('edit_kelurahan').value = u.kelurahan || '';
            document.getElementById('edit_lat').value = u.latitude;
            document.getElementById('edit_lng').value = u.longitude;
            document.getElementById('formEditUsaha').action = '/pusat/usaha/update/' + u.id;

            const editModal = new bootstrap.Modal(document.getElementById('modalEdit'));
            editModal.show();

            setTimeout(() => {
                if (!mapPickerEdit) {
                    mapPickerEdit = L.map('mapPickerEdit').setView([u.latitude, u.longitude], 15);
                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(mapPickerEdit);
                    
                    mapPickerEdit.on('click', function(e) {
                        if (pickerMarkerEdit) mapPickerEdit.removeLayer(pickerMarkerEdit);
                        pickerMarkerEdit = L.marker(e.latlng).addTo(mapPickerEdit);
                        document.getElementById('edit_lat').value = e.latlng.lat.toFixed(7);
                        document.getElementById('edit_lng').value = e.latlng.lng.toFixed(7);
                        reverseGeocode(e.latlng.lat, e.latlng.lng, 'edit_kelurahan', 'edit_alamat');
                    });
                } else {
                    mapPickerEdit.setView([u.latitude, u.longitude], 15);
                }
                
                if (pickerMarkerEdit) mapPickerEdit.removeLayer(pickerMarkerEdit);
                pickerMarkerEdit = L.marker([u.latitude, u.longitude]).addTo(mapPickerEdit);
                mapPickerEdit.invalidateSize();
            }, 400);
        }

        // Helper Reverse Geocode
        function reverseGeocode(lat, lng, kelId, addrId) {
            fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`)
                .then(res => res.json())
                .then(data => {
                    let addr = data.address;
                    let kel = addr.village || addr.suburb || addr.town || addr.city_district || "";
                    document.getElementById(kelId).value = kel;
                    document.getElementById(addrId).value = data.display_name || "";
                });
        }

        function confirmDelete(id) {
            if(confirm('Hapus data usaha ini secara permanen?')) {
                window.location.href = `/pusat/usaha/hapus/${id}`;
            }
        }

        // Loading State On Submit
        $('form').on('submit', function() {
            $(this).find('button[type="submit"]').prop('disabled', true).html('<span class="spinner-border spinner-border-sm"></span> Processing...');
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    // Konfigurasi umum untuk notifikasi Toast (modern & otomatis hilang)
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000, // Menghilang otomatis dalam 3 detik
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    });

    // Cek pesan sukses dari Controller
    @if(session('success'))
        Toast.fire({
            icon: 'success',
            title: "{{ session('success') }}"
        });
    @endif

    // Cek pesan error (opsional)
    @if(session('error'))
        Toast.fire({
            icon: 'error',
            title: "{{ session('error') }}"
        });
    @endif
</script>
</body>
</html>