<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Daftar Pelaku Usaha - DataTables</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f7f6; }
        .card { border-radius: 15px; border: none; box-shadow: 0 5px 20px rgba(0,0,0,0.05); }
        .header-green { background: #198754; color: white; border-radius: 15px 15px 0 0; padding: 20px; }
        .badge-kuliner { background-color: #fd7e14; color: white; }
        .badge-fashion { background-color: #0dcaf0; color: white; }
        .badge-lainnya { background-color: #6f42c1; color: white; }
        #mapEdit { height: 300px; border-radius: 10px; margin-bottom: 10px; }
    </style>
</head>
<body>

<div class="container mt-5 mb-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold text-dark"><i class="bi bi-grid-3x3-gap-fill text-success"></i> Database Pelaku Usaha</h3>
        <a href="{{ route('pusat.peta') }}" class="btn btn-outline-success border-2 fw-bold">
            <i class="bi bi-geo-alt"></i> Kembali ke Peta
        </a>
    </div>

    <div class="mb-3">
        <button class="btn btn-primary fw-bold" onclick="tambahUsaha()">
            <i class="bi bi-plus-circle"></i> Tambah Usaha Baru
        </button>
        <a href="{{ route('pusat.usaha.export') }}" class="btn btn-success fw-bold">
            <i class="bi bi-file-earmark-excel"></i> Export Excel
        </a>
        <button class="btn btn-info text-white fw-bold" data-bs-toggle="modal" data-bs-target="#modalImport">
            <i class="bi bi-file-earmark-arrow-up"></i> Import Excel
        </button>
    </div>

    <div class="card">
        <div class="header-green">
            <h5 class="mb-0">Keseluruhan Data Terinput</h5>
        </div>
        <div class="card-body p-4">
            <div class="table-responsive">
                <table id="tableUsaha" class="table table-hover w-100">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama Usaha</th>
                            <th>Pemilik</th>
                            <th>Kategori</th>
                            <th>Kelurahan</th>
                            <th>Alamat</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($data as $key => $u)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td class="fw-bold">{{ $u->nama_usaha }}</td>
                            <td>{{ $u->pemilik }}</td>
                            <td>
                                @php 
                                    $kategori = strtolower($u->kategori);
                                    $class = $kategori == 'kuliner' ? 'badge-kuliner' : ($kategori == 'fashion' ? 'badge-fashion' : 'badge-lainnya');
                                @endphp
                                <span class="badge {{ $class }} px-3 py-2 rounded-pill">{{ $u->kategori }}</span>
                            </td>
                            <td>{{ $u->kelurahan }}</td>
                            <td><small class="text-muted">{{ Str::limit($u->alamat, 40) }}</small></td>
                            <td class="text-center">
                                <div class="btn-group">
                                    <button class="btn btn-sm btn-outline-warning" onclick="editUsaha({{ json_encode($u) }})" title="Edit Data">
                                        <i class="bi bi-pencil-square"></i>
                                    </button>

                                    <button class="btn btn-sm btn-outline-danger btn-delete-modern" 
                                            data-id="{{ $u->id }}" 
                                            data-nama="{{ $u->nama_usaha }}">
                                        <i class="bi bi-trash"></i>
                                    </button>

                                    <form id="form-delete-{{ $u->id }}" action="{{ route('pusat.usaha.hapus', $u->id) }}" method="POST" style="display:none;">
                                        @csrf @method('DELETE')
                                    </form>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalTambahUsaha" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form id="formUsaha" method="POST">
            @csrf
            <div id="method_field"></div> <div class="modal-content">
                <div class="modal-header" id="modalHeader">
                    <h5 class="modal-title fw-bold" id="modalTitle">Form Usaha</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Nama Usaha</label>
                                <input type="text" name="nama_usaha" id="nama_usaha" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Pemilik</label>
                                <input type="text" name="pemilik" id="pemilik" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Kategori</label>
                                <select name="kategori" id="kategori" class="form-select" required>
                                    <option value="Kuliner">Kuliner</option>
                                    <option value="Fashion">Fashion</option>
                                    <option value="Lainnya">Lainnya</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Kelurahan</label>
                                <input type="text" name="kelurahan" id="kelurahan" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Alamat Lengkap</label>
                                <textarea name="alamat" id="alamat" class="form-control" rows="3" required></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Pindahkan Lokasi (Klik Peta)</label>
                            <div id="mapEdit"></div>
                            <div class="row g-2">
                                <div class="col">
                                    <input type="text" name="latitude" id="lat_input" class="form-control" readonly placeholder="Latitude">
                                </div>
                                <div class="col">
                                    <input type="text" name="longitude" id="lng_input" class="form-control" readonly placeholder="Longitude">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-success fw-bold" id="btnSubmit">Simpan Data</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="modalImport" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <form action="{{ route('pusat.usaha.import') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold">Import Data Excel</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="file" name="file_excel" class="form-control" required accept=".xlsx, .xls">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Mulai Import</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<script>
    let map, marker;
    const defaultCenter = [-7.6298, 111.5239]; // Sesuaikan koordinat Magetan/Pusat

    $(document).ready(function() {
        $('#tableUsaha').DataTable({
            "language": { "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/id.json" },
            "responsive": true
        });

        // Event Hapus
        $(document).on('click', '.btn-delete-modern', function() {
            let id = $(this).data('id');
            let nama = $(this).data('nama');
            Swal.fire({
                title: 'Hapus Data?',
                text: "Usaha '" + nama + "' akan dihapus!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                confirmButtonText: 'Ya, Hapus!'
            }).then((result) => {
                if (result.isConfirmed) { $('#form-delete-' + id).submit(); }
            });
        });
    });

    // Fungsi Reset & Buka Modal Tambah
    function tambahUsaha() {
        $('#modalTitle').html('<i class="bi bi-plus-circle"></i> Tambah Pelaku Usaha');
        $('#modalHeader').removeClass('bg-warning text-dark').addClass('bg-primary text-white');
        $('#btnSubmit').removeClass('btn-warning text-dark').addClass('btn-primary').text('Simpan Data');
        $('#formUsaha').attr('action', "{{ route('pusat.usaha.store') }}");
        $('#method_field').html('');
        $('#formUsaha')[0].reset();
        
        openModalMap(defaultCenter[0], defaultCenter[1]);
    }

    // Fungsi Isi & Buka Modal Edit
    function editUsaha(data) {
        $('#modalTitle').html('<i class="bi bi-pencil-square"></i> Edit Pelaku Usaha');
        $('#modalHeader').removeClass('bg-primary text-white').addClass('bg-warning text-dark');
        $('#btnSubmit').removeClass('btn-primary').addClass('btn-warning text-dark').text('Update Data');
        $('#formUsaha').attr('action', '/pusat/usaha/update/' + data.id);
        $('#method_field').html('<input type="hidden" name="_method" value="PUT">');

        $('#nama_usaha').val(data.nama_usaha);
        $('#pemilik').val(data.pemilik);
        $('#kategori').val(data.kategori);
        $('#kelurahan').val(data.kelurahan);
        $('#alamat').val(data.alamat);
        $('#lat_input').val(data.latitude);
        $('#lng_input').val(data.longitude);

        openModalMap(data.latitude, data.longitude);
    }

    function openModalMap(lat, lng) {
        $('#modalTambahUsaha').modal('show');
        setTimeout(() => {
            if (!map) {
                map = L.map('mapEdit').setView([lat, lng], 15);
                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);
                marker = L.marker([lat, lng], {draggable: true}).addTo(map);
                
                map.on('click', function(e) { updateMarker(e.latlng.lat, e.latlng.lng); });
                marker.on('dragend', function() { updateMarker(marker.getLatLng().lat, marker.getLatLng().lng); });
            } else {
                map.setView([lat, lng], 15);
                updateMarker(lat, lng);
                map.invalidateSize();
            }
        }, 300);
    }

    function updateMarker(lat, lng) {
        marker.setLatLng([lat, lng]);
        $('#lat_input').val(lat.toFixed(8));
        $('#lng_input').val(lng.toFixed(8));
    }

    @if(session('success'))
        Swal.fire('Berhasil!', "{{ session('success') }}", 'success');
    @endif
</script>
</body>
</html>