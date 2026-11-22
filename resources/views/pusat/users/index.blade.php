<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Manajemen Akses - Pusat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="d-flex justify-content-between mb-3">
            <h3>Daftar Pengguna & Hak Akses</h3>
            <a href="{{ route('pusat.dashboard') }}" class="btn btn-secondary btn-sm">Kembali ke Dashboard</a>
        </div>

        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <div class="card shadow-sm">
            <div class="card-body">
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Nama</th>
                            <th>Username</th>
                            <th>Role Saat Ini</th>
                            <th>Ubah Role</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($users as $u)
                        <tr>
                            <td>{{ $u->name }}</td>
                            <td>{{ $u->username }}</td>
                            <td><span class="badge bg-info text-dark">{{ $u->role }}</span></td>
                            <td>
                                <form action="{{ route('pusat.users.update', $u->id) }}" method="POST" class="d-flex gap-2">
                                    @csrf
                                    <select name="role" class="form-select form-select-sm">
                                        <option value="user" {{ $u->role == 'user' ? 'selected' : '' }}>User Biasa</option>
                                        <option value="admin" {{ $u->role == 'admin' ? 'selected' : '' }}>Admin (IKM Juara)</option>
                                        <option value="superadmin" {{ $u->role == 'superadmin' ? 'selected' : '' }}>Superadmin</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm">Simpan</button>
                                </form>
                            </td>
                            <td>
                                <form action="{{ route('pusat.users.delete', $u->id) }}" method="POST" onsubmit="return confirm('Yakin hapus user ini?')">
                                    @csrf @method('DELETE')
                                    <button class="btn btn-danger btn-sm">Hapus</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>