<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $title }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body { background-color: #f8f9fa; }
        .sidebar { min-height: 100 vh; background: #212529; color: white; }
        .nav-link { color: rgba(255,255,255,.75); }
        .nav-link:hover { color: white; background: rgba(255,255,255,.1); }
        .nav-link.active { color: white; background: #0d6efd; }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse p-3">
            <h5 class="text-center mb-4">Pusat Kendali</h5>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="#">
                        <i class="bi bi-speedometer2 me-2"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
<a class="nav-link" href="{{ route('pusat.users.index') }}">
    <i class="bi bi-shield-lock me-2"></i> Manajemen Akses
</a>
                </li>
                <li class="nav-item">
    <a class="nav-link" href="{{ route('pusat.peta') }}">
        <i class="bi bi-map me-2"></i> Peta Sebaran
    </a>
</li>
                <hr>
                <li class="nav-item">
                    <form action="{{ route('logout') }}" method="POST">
                        @csrf
                        <button type="submit" class="nav-link border-0 bg-transparent w-100 text-start text-danger">
                            <i class="bi bi-box-arrow-right me-2"></i> Keluar
                        </button>
                    </form>
                </li>
            </ul>
        </nav>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">{{ $title }}</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <span class="badge bg-primary p-2">{{ $tanggal }}</span>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body p-4">
                            <h4>Halo, {{ $user->name }}! 👋</h4>
                            <p class="text-muted">Ini adalah area isolasi untuk <strong>Admin Pusat</strong>. Kode di sini tidak bersentuhan dengan Admin lama.</p>
                            
                            <div class="alert alert-success border-0 shadow-sm">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                Anda berhasil masuk dengan hak akses: <strong>{{ $user->role }}</strong>
                            </div>

                            <div class="mt-4">
                                <h6>Informasi Akun:</h6>
                                <table class="table table-sm table-borderless">
                                    <tr><td width="150">Nama</td><td>: {{ $user->name }}</td></tr>
                                    <tr><td>Email</td><td>: {{ $user->email }}</td></tr>
                                    <tr><td>ID User</td><td>: #{{ $user->id }}</td></tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>