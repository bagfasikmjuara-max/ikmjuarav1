<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\User;

// Impor Controller Lama
use App\Http\Controllers\IKMController as PublicIKMController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\IKMController as AdminIKMController;
use App\Http\Controllers\PendaftaranController;
use App\Http\Controllers\KegiatanController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\PublikasiController;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

// Impor Controller Baru (Pusat & Publik)
use App\Http\Controllers\Pusat\LoginController as PusatLogin;
use App\Http\Controllers\Pusat\DashboardController as PusatDashboard;
use App\Http\Controllers\Pusat\UserController as PusatUserController;
use App\Http\Controllers\Publik\PetaController as PetaPublik;
use App\Http\Controllers\DashboardIkmJuaraController;

/*
|--------------------------------------------------------------------------
| AUTHENTICATION & BYPASS
|--------------------------------------------------------------------------
*/
Route::get('/login', [LoginController::class, 'showLogin'])->name('login');
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');
Route::get('/login-dukungan', [App\Http\Controllers\Auth\LoginDukunganController::class, 'showLogin'])->name('login.dukungan');
Route::post('/login-dukungan', [App\Http\Controllers\Auth\LoginDukunganController::class, 'login'])->name('login.dukungan.post');
Route::post('/login-dukungan/formapp-access', [App\Http\Controllers\Auth\LoginDukunganController::class, 'accessFormApp'])->name('login.dukungan.formapp');
Route::post('/logout-dukungan', [App\Http\Controllers\Auth\LoginDukunganController::class, 'logout'])->name('logout.dukungan');

// Admin Form App Routes
Route::get('/formapp', [App\Http\Controllers\Auth\LoginDukunganController::class, 'showFormApp'])->name('formapp');
Route::get('/formapp/export-excel', [App\Http\Controllers\Auth\LoginDukunganController::class, 'exportExcel'])->name('formapp.export.excel');
Route::post('/formapp/template/store', [App\Http\Controllers\Auth\LoginDukunganController::class, 'storeFormTemplate'])->name('formapp.template.store');
Route::patch('/formapp/template/{id}/toggle', [App\Http\Controllers\Auth\LoginDukunganController::class, 'toggleFormTemplateStatus'])->name('formapp.template.toggle');
Route::delete('/formapp/template/{id}', [App\Http\Controllers\Auth\LoginDukunganController::class, 'destroyFormTemplate'])->name('formapp.template.destroy');
Route::delete('/formapp/response/{id}', [App\Http\Controllers\Auth\LoginDukunganController::class, 'destroyResponse'])->name('formapp.response.destroy');
Route::post('/formapp/simpan-kuesioner', [App\Http\Controllers\Auth\LoginDukunganController::class, 'simpanKuesioner'])->name('formapp.simpan-kuesioner');

// Public User Respondent Form Routes (Generated Link)
Route::get('/formapp/kuesioner/{slug}', [App\Http\Controllers\Auth\LoginDukunganController::class, 'showUserKuesioner'])->name('formapp.user.show');
Route::post('/formapp/kuesioner/{slug}/submit', [App\Http\Controllers\Auth\LoginDukunganController::class, 'submitUserKuesioner'])->name('formapp.user.submit');

Route::get('/masuk-sekarang', function() {
    $user = \App\Models\User::first(); 
    if($user) {
        auth()->login($user);
        return redirect()->route('admin.dashboard');
    }
    return "Database kosong, tidak ada user untuk login.";
});

/*
|--------------------------------------------------------------------------
| ADMIN ROUTES (PROTECTED)
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    
    // DASHBOARD - Menggunakan DashboardController agar lebih rapi
    Route::get('/dashboard', [AdminController::class, 'dashboardAdmin'])->name('dashboard');

    Route::get('/publikasi', [AdminController::class, 'publikasi'])->name('publikasi');
    Route::post('/publikasi/store', [AdminController::class, 'storePublikasi'])->name('publikasi.store');
    Route::put('/publikasi/{id}', [AdminController::class, 'updatePublikasi'])->name('publikasi.update');
    Route::patch('/publikasi/{id}/toggle', [AdminController::class, 'toggle'])->name('publikasi.toggle');
    Route::delete('/publikasi/{id}', [AdminController::class, 'destroyPublikasi'])->name('publikasi.destroy');


    // DATA IKM & Import/Export (Fitur Lama)
    Route::get('/data-ikm', [AdminIKMController::class, 'dataIkmAdmin'])->name('data-ikm');
    Route::post('/import-ikm', [AdminIKMController::class, 'import'])->name('import-ikm');
    Route::get('/export-ikm', [AdminIKMController::class, 'export'])->name('export-ikm');
    Route::get('/download-template', [AdminIKMController::class, 'downloadTemplate'])->name('download-template');

    // PENDAFTAR PELATIHAN (Fitur Lama)
    Route::get('/pendaftar', [PendaftaranController::class, 'dataPendaftar'])->name('pendaftar');
    Route::get('/pendaftar/export', [PendaftaranController::class, 'exportExcel'])->name('pendaftar.export');
    Route::get('/pendaftar/recycle-bin', [PendaftaranController::class, 'recycleBin'])->name('recycle');
    Route::post('/pendaftar/restore/{id}', [PendaftaranController::class, 'restore'])->name('restore');
    Route::delete('/pendaftar/force-delete/{id}', [PendaftaranController::class, 'forceDelete'])->name('force_delete');
    Route::delete('/pendaftar/{id}', [PendaftaranController::class, 'destroy'])->name('pendaftar.destroy');

    // KEGIATAN (Fitur Lama)
    Route::get('/kegiatan', [KegiatanController::class, 'index'])->name('kegiatan.index');
    Route::post('/kegiatan/store', [KegiatanController::class, 'store'])->name('kegiatan.store');
    Route::delete('/kegiatan/{id}', [KegiatanController::class, 'destroy'])->name('kegiatan.destroy');

    // PENGATURAN & ADMIN MANAGEMENT (Fitur Lama)
    Route::get('/pengaturan', [AdminController::class, 'settings'])->name('pengaturan');
    Route::post('/pengaturan/store', [AdminController::class, 'storeAdmin'])->name('users.store');
    Route::put('/pengaturan/update/{id}', [AdminController::class, 'updateAdmin'])->name('users.update');
    Route::delete('/pengaturan/destroy/{id}', [AdminController::class, 'deleteAdmin'])->name('users.destroy');

    // STATISTIK (Fitur Lama)
    Route::get('/statistik', [PublicIKMController::class, 'halamanStatistik'])->name('statistik');
    Route::post('/statistik/update', [PublicIKMController::class, 'updateStatistik'])->name('statistik.update');

    // USULAN PERUBAHAN DATA IKM
    Route::get('/usulan-perubahan', [AdminController::class, 'usulanPerubahanIndex'])->name('usulan-perubahan.index');
    Route::post('/usulan-perubahan/{id}/verifikasi', [AdminController::class, 'usulanPerubahanVerifikasi'])->name('usulan-perubahan.verifikasi');
    Route::post('/usulan-perubahan/{id}/tolak', [AdminController::class, 'usulanPerubahanTolak'])->name('usulan-perubahan.tolak');
});

/*
|--------------------------------------------------------------------------
| PUBLIC ROUTES (Halaman Depan)
|--------------------------------------------------------------------------
*/
Route::get('/', [PublicIKMController::class, 'getStatistikManual'])->name('home');
Route::get('/layananmpp', [\App\Http\Controllers\LayananMppController::class, 'index'])->name('layananmpp');
Route::post('/layananmpp/store', [\App\Http\Controllers\LayananMppController::class, 'store'])->name('layananmpp.store');
Route::get('/api/tracking-hki-merek', [\App\Http\Controllers\LayananMppController::class, 'trackingApi'])->name('api.tracking-hki-merek');
Route::get('/dashboardikmjuara', [DashboardIkmJuaraController::class, 'index'])->name('dashboard.ikm.juara');
Route::get('/dashboardikmjuara/cekmandiri', [DashboardIkmJuaraController::class, 'cekMandiri'])->name('dashboard.ikm.juara.cekmandiri');
Route::get('/api/cek-legalitas-mandiri', [DashboardIkmJuaraController::class, 'apiCekMandiri'])->name('api.cek-legalitas-mandiri');
Route::get('/api/cari-ikm', [DashboardIkmJuaraController::class, 'cariIkm'])->name('api.cari-ikm');
Route::get('/api/cari-kbli', function(Request $request) {
    $q = $request->query('q');
    if (empty($q)) {
        return response()->json([]);
    }
    $likeOp = DB::getDriverName() === 'pgsql' ? 'ILIKE' : 'LIKE';
    $kblis = DB::table('kbli')
        ->where('kode', $likeOp, '%' . $q . '%')
        ->orWhere('judul', $likeOp, '%' . $q . '%')
        ->limit(20)
        ->get(['kode', 'judul', 'versi']);
    return response()->json($kblis);
})->name('api.cari-kbli');

Route::post('/usul-ubah-ikm', [DashboardIkmJuaraController::class, 'usulUbahIkm'])->name('usul.ubah.ikm');
Route::post('/api/buat-konsultasi', function(\Illuminate\Http\Request $request) {
    $request->validate([
        'nama_ikm' => 'required|string|max:255',
        'jenis_usaha' => 'required|string|max:255',
        'email' => 'required|string|max:255',
        'nik' => 'nullable|string|max:16',
        'keluhan' => 'required|string',
    ]);
    $konsultasi = \App\Models\Konsultasi::create([
        'nama_ikm' => $request->nama_ikm,
        'jenis_usaha' => $request->jenis_usaha,
        'email' => $request->email,
        'nik' => $request->nik,
        'sumber' => 'IKM Juara',
        'keluhan' => $request->keluhan,
        'status' => 'Belum Dijawab'
    ]);

    // Kirim Notifikasi WhatsApp Pengingat Admin via Fonnte
    \App\Services\FonnteService::sendNotificationToAdmin(
        $request->nama_ikm . ' (' . $request->email . ')',
        $request->jenis_usaha,
        $request->keluhan,
        $konsultasi->id
    );

    return response()->json([
        'success' => true,
        'message' => 'Layanan Konsultasi & Pembinaan berhasil diajukan!',
        'data' => $konsultasi
    ]);
})->name('api.buat-konsultasi');

Route::post('/api/kirim-pesan-konsultasi', function(\Illuminate\Http\Request $request) {
    $request->validate([
        'konsultasi_id' => 'required|exists:konsultasi,id',
        'pesan' => 'required|string',
    ]);
    
    $konsultasi = \App\Models\Konsultasi::findOrFail($request->konsultasi_id);
    
    // Check 24-hour expiration based on updated_at or if status is Selesai
    if ($konsultasi->status === 'Selesai' || $konsultasi->updated_at->diffInHours(now()) >= 24) {
        return response()->json([
            'success' => false,
            'message' => 'Sesi konsultasi ini telah ditutup atau diakhiri.'
        ], 403);
    }
    
    $pesan = \App\Models\KonsultasiPesan::create([
        'konsultasi_id' => $konsultasi->id,
        'sender' => 'user',
        'pesan' => $request->pesan
    ]);
    
    $konsultasi->touch();
    $konsultasi->update(['status' => 'Belum Dijawab']);
    
    // Kirim Notifikasi WhatsApp Pengingat Admin via Fonnte
    \App\Services\FonnteService::sendNotificationToAdmin(
        $konsultasi->nama_ikm . ' (' . $konsultasi->email . ')',
        $konsultasi->jenis_usaha ?? 'Konsultasi IKM',
        $request->pesan,
        $konsultasi->id
    );

    return response()->json([
        'success' => true,
        'data' => $pesan
    ]);
})->name('api.kirim-pesan-konsultasi');

Route::get('/api/konsultasi/{id}/pesan', function($id) {
    $konsultasi = \App\Models\Konsultasi::with('messages')->find($id);
    if (!$konsultasi) {
        return response()->json(['success' => false, 'message' => 'Sesi tidak ditemukan'], 404);
    }
    return response()->json([
        'success' => true,
        'status' => $konsultasi->status,
        'updated_at' => $konsultasi->updated_at,
        'messages' => $konsultasi->messages
    ]);
})->name('api.konsultasi.pesan');

Route::get('/api/kategori-konsultasi', [\App\Http\Controllers\KonsultasiController::class, 'getKategori'])->name('api.kategori-konsultasi');
Route::get('/api/konsultasi/{id}/messages', [\App\Http\Controllers\KonsultasiController::class, 'getPesan'])->name('api.konsultasi.messages');
Route::post('/api/kirim-pesan-user', [\App\Http\Controllers\KonsultasiController::class, 'kirimPesanUser'])->name('api.kirim-pesan-user');
Route::post('/api/tnadigital/store', [App\Http\Controllers\Dukungan\DukunganController::class, 'tnaDigitalStore'])->name('api.tnadigital.store');
Route::get('/api/tnadigital/pertanyaan', [App\Http\Controllers\Dukungan\DukunganController::class, 'tnaDigitalPertanyaanApi'])->name('api.tnadigital.pertanyaan');
Route::post('/kirim-konsultasi', [\App\Http\Controllers\KonsultasiController::class, 'store'])->name('konsultasi.store');

Route::get('/daftar', function () {
    $kegiatan = DB::table('list_kegiatan')
                ->where('is_active', 1) 
                ->orderBy('id', 'desc')
                ->get();
    return view('pendaftaran', compact('kegiatan'));
})->name('daftar');

Route::post('/simpan-pendaftaran', [PublicIKMController::class, 'simpan'])->name('pendaftaran.simpan');
Route::get('/daftar-pelatihan', [PendaftaranController::class, 'formulir'])->name('pendaftaran.index');
Route::post('/daftar-pelatihan', [PendaftaranController::class, 'store'])->name('pendaftaran.store');
Route::get('/welcome', function () { return view('welcome'); });

/*
|--------------------------------------------------------------------------
| CRUD PELAKU USAHA (Direct DB Update)
|--------------------------------------------------------------------------
*/
Route::get('/pelaku-usaha', [AdminIKMController::class, 'index'])->name('pelaku-usaha.index');

Route::post('/pelaku-usaha', function (Request $request) {
    $data = $request->except(['_token', '_method']);
    if (isset($data['tki'])) { $data['tenaga_kerja'] = $data['tki']; }
    unset($data['tki']); 
    DB::table('pelaku_usaha')->insert(array_merge($data, [
        'created_at' => now(), 
        'updated_at' => now()
    ]));
    return redirect()->back()->with('success', 'Data Berhasil Ditambahkan!');
})->name('pelaku-usaha.store');

Route::put('/pelaku-usaha/{id}', function (Request $request, $id) {
    $data = $request->except(['id', '_token', '_method']);
    DB::table('pelaku_usaha')->where('id', $id)->update(array_merge($data, [
        'updated_at' => now()
    ]));
    return redirect()->back()->with('success', 'Data Berhasil Diperbarui!');
})->name('pelaku-usaha.update');

Route::delete('/pelaku-usaha/{id}', function ($id) {
    DB::table('pelaku_usaha')->where('id', $id)->delete();
    return redirect()->back()->with('success', 'Data Berhasil Dihapus!');
})->name('pelaku-usaha.destroy');

Route::get('/profil', function () { return view('profil');})->name('profil');
Route::get('/profil-dinas', function () { return view('profil-dinas');})->name('profil-dinas');
Route::get('/alur-pendaftaran', function () { return view('alur-pendaftaran'); })->name('alur-pendaftaran');
Route::get('/faq', function () { return view('faq'); })->name('faq');

/*
|--------------------------------------------------------------------------
| UTILITY & DEBUG
|--------------------------------------------------------------------------
*/
Route::get('/cek-db', function() {
    try {
        $user = User::all();
        return response()->json(['status' => 'Koneksi DB Oke', 'data' => $user]);
    } catch (\Exception $e) { 
        return "Gagal koneksi: " . $e->getMessage(); 
    }
});

/*
|--------------------------------------------------------------------------
| AREA PUSAT / SUPERADMIN (MODUL TERSTRUKTUR)
|--------------------------------------------------------------------------
*/

// 1. AREA PUBLIK (Peta untuk Warga)
Route::get('/peta-ikmbinaan', [PetaPublik::class, 'index'])->name('peta.umum');
Route::get('/api/peta-publik', [PetaPublik::class, 'getDataApi']);

// 2. AREA SUPERADMIN (Panel Kendali)
Route::middleware(['auth', 'role_pusat'])->prefix('pusat')->group(function () {
    
    // DASHBOARD & USERS
    Route::get('/dashboard', [PusatDashboard::class, 'index'])->name('pusat.dashboard');
    Route::get('/users', [PusatUserController::class, 'index'])->name('pusat.users.index');
    Route::post('/users/update-role/{id}', [PusatUserController::class, 'updateRole'])->name('pusat.users.update');
    Route::delete('/users/delete/{id}', [PusatUserController::class, 'destroy'])->name('pusat.users.delete');
    
    // HALAMAN DATABASE (DATATABLE)
    Route::get('/usaha', [PusatDashboard::class, 'indexUsaha'])->name('pusat.usaha.index');

    // PETA KONTROL (MANAJEMEN USAHA)
    Route::get('/peta', [PusatDashboard::class, 'peta'])->name('pusat.peta');
    
    // API & CRUD USAHA (Inilah yang tadi 404 karena salah penempatan)
    Route::get('/api/usaha-sekitar', [PusatDashboard::class, 'getUsahaSekitar'])->name('pusat.api.sekitar');
    Route::post('/usaha/store', [PusatDashboard::class, 'store'])->name('pusat.usaha.store');
    Route::get('/usaha/edit/{id}', [PusatDashboard::class, 'edit'])->name('pusat.usaha.edit');
    Route::put('/usaha/update/{id}', [PusatDashboard::class, 'update'])->name('pusat.usaha.update');
    Route::delete('/usaha/hapus/{id}', [PusatDashboard::class, 'hapusUsaha'])->name('pusat.usaha.hapus');

    Route::get('/usaha/export', [PusatDashboard::class, 'export'])->name('pusat.usaha.export');
    Route::post('/usaha/import', [PusatDashboard::class, 'import'])->name('pusat.usaha.import');
}); // Penutup Middleware & Prefix Pusat

/*
|--------------------------------------------------------------------------
| AREA DUKUNGAN / SUPPORT ADMIN (MODUL KHUSUS)
|--------------------------------------------------------------------------
*/
Route::middleware(['dukungan'])->prefix('dukungan')->name('dukungan.')->group(function () {
    Route::get('/dashboard', [App\Http\Controllers\Dukungan\DukunganController::class, 'dashboard'])->name('dashboard');
    Route::get('/peta', [App\Http\Controllers\Dukungan\DukunganController::class, 'peta'])->name('peta');
    Route::get('/peta/alatbantu', [App\Http\Controllers\Dukungan\DukunganController::class, 'petaAlatBantu'])->name('peta.alatbantu');
    
    // CRUD peta sebaran routes
    Route::get('/sebaran', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranIndex'])->name('sebaran.index');
    Route::post('/sebaran/store', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranStore'])->name('sebaran.store');
    Route::put('/sebaran/update/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranUpdate'])->name('sebaran.update');
    Route::delete('/sebaran/destroy/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranDestroy'])->name('sebaran.destroy');
    
    // DATA USULAN ROUTES
    Route::get('/usuldata', [App\Http\Controllers\Dukungan\DukunganController::class, 'usulDataIndex'])->name('usuldata.index');
    Route::post('/usuldata/{id}/verifikasi', [App\Http\Controllers\Dukungan\DukunganController::class, 'usulDataVerifikasi'])->name('usuldata.verifikasi');
    Route::post('/usuldata/{id}/tolak', [App\Http\Controllers\Dukungan\DukunganController::class, 'usulDataTolak'])->name('usuldata.tolak');
    
    // Excel routes
    Route::get('/sebaran/export', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranExport'])->name('sebaran.export');
    Route::get('/sebaran/template', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranTemplate'])->name('sebaran.template');
    Route::get('/sebaran/check-duplikasi', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranCheckDuplikasi'])->name('sebaran.check-duplikasi');
    Route::post('/sebaran/import', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranImport'])->name('sebaran.import');
    Route::post('/sebaran/commit-import', [App\Http\Controllers\Dukungan\DukunganController::class, 'sebaranCommitImport'])->name('sebaran.commit-import');

    // KONSULTASI DUKUNGAN
    Route::get('/konsultasi', [\App\Http\Controllers\KonsultasiController::class, 'adminIndex'])->name('konsultasi.index');
    Route::post('/konsultasi/{id}/jawab', [\App\Http\Controllers\KonsultasiController::class, 'adminReply'])->name('konsultasi.reply');
    Route::post('/konsultasi/{id}/akhiri', [\App\Http\Controllers\KonsultasiController::class, 'adminEnd'])->name('konsultasi.end');
    Route::post('/konsultasi/kategori/tambah', [\App\Http\Controllers\KonsultasiController::class, 'tambahKategori'])->name('konsultasi.kategori.tambah');
    Route::delete('/konsultasi/kategori/{id}', [\App\Http\Controllers\KonsultasiController::class, 'hapusKategori'])->name('konsultasi.kategori.hapus');

    // LEGALITAS IKM ROUTES
    Route::get('/legalitas', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasIndex'])->name('legalitas.index');
    Route::get('/legalitas/database', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabase'])->name('legalitas.database');
    Route::post('/legalitas/database/hki/store', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseHkiStore'])->name('legalitas.database.hki.store');
    Route::post('/legalitas/database/hki/update/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseHkiUpdate'])->name('legalitas.database.hki.update');
    Route::delete('/legalitas/database/hki/destroy/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseHkiDestroy'])->name('legalitas.database.hki.destroy');
    Route::post('/legalitas/database/halal/store', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseHalalStore'])->name('legalitas.database.halal.store');
    Route::post('/legalitas/database/halal/update/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseHalalUpdate'])->name('legalitas.database.halal.update');
    Route::delete('/legalitas/database/halal/destroy/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseHalalDestroy'])->name('legalitas.database.halal.destroy');
    Route::post('/legalitas/database/update/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseUpdate'])->name('legalitas.database.update');
    Route::get('/legalitas/database/export', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseExport'])->name('legalitas.database.export');
    Route::get('/legalitas/database/template', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseTemplate'])->name('legalitas.database.template');
    Route::post('/legalitas/database/import', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDatabaseImport'])->name('legalitas.database.import');
    Route::get('/legalitas/export', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasExport'])->name('legalitas.export');
    Route::get('/legalitas/find-ikm', [App\Http\Controllers\Dukungan\DukunganController::class, 'findIkm'])->name('legalitas.find_ikm');
    Route::get('/legalitas/search-database-auto', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasSearchDatabaseAuto'])->name('legalitas.search_database_auto');
    Route::post('/legalitas/store', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasStore'])->name('legalitas.store');
    Route::post('/legalitas/update/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasUpdate'])->name('legalitas.update');
    Route::match(['post', 'delete', 'get'], '/legalitas/destroy/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'legalitasDestroy'])->name('legalitas.destroy');

    // TNA DIGITAL ROUTES
    Route::get('/tnadigital', [App\Http\Controllers\Dukungan\DukunganController::class, 'tnaDigitalIndex'])->name('tnadigital.index');
    Route::get('/tnadigital/export', [App\Http\Controllers\Dukungan\DukunganController::class, 'tnaDigitalExport'])->name('tnadigital.export');
    Route::post('/tnadigital/store', [App\Http\Controllers\Dukungan\DukunganController::class, 'tnaDigitalStore'])->name('tnadigital.store');
    Route::post('/tnadigital/destroy/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'tnaDigitalDestroy'])->name('tnadigital.destroy');
    Route::post('/tnadigital/pertanyaan/update', [App\Http\Controllers\Dukungan\DukunganController::class, 'tnaDigitalPertanyaanUpdate'])->name('tnadigital.pertanyaan.update');
    Route::post('/tnadigital/pertanyaan/reset', [App\Http\Controllers\Dukungan\DukunganController::class, 'tnaDigitalPertanyaanReset'])->name('tnadigital.pertanyaan.reset');

    // STATISTIK & SOSMED DUKUNGAN
    Route::get('/statistik-sosmed', [\App\Http\Controllers\IKMController::class, 'halamanStatistikSosmed'])->name('statistik-sosmed.index');
    Route::post('/statistik-sosmed/update', [\App\Http\Controllers\IKMController::class, 'updateStatistikSosmed'])->name('statistik-sosmed.update');

    // INTEGRATOR PELAPORAN SIINAS ROUTES
    Route::get('/siinas', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasIndex'])->name('siinas.index');
    Route::post('/siinas/store', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasStore'])->name('siinas.store');
    Route::put('/siinas/update/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasUpdate'])->name('siinas.update');
    Route::match(['delete', 'post'], '/siinas/destroy/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasDestroy'])->name('siinas.destroy');

    Route::post('/siinas/import', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasImport'])->name('siinas.import');
    Route::get('/siinas/export', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasExport'])->name('siinas.export');
    Route::get('/siinas/template', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasTemplate'])->name('siinas.template');
    Route::get('/siinas/kbli-search', [App\Http\Controllers\Dukungan\DukunganController::class, 'kbliSearch'])->name('siinas.kbli-search');
    Route::post('/siinas/upload-preview', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasUploadPreview'])->name('siinas.upload-preview');
    Route::post('/siinas/commit-import', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasCommitImport'])->name('siinas.commit-import');

    // REKOMENDASI HKI MEREK (LAYANAN MPP)
    Route::get('/rekomhkimerek', [\App\Http\Controllers\LayananMppController::class, 'adminIndex'])->name('rekomhkimerek.index');
    Route::patch('/rekomhkimerek/{id}/status', [\App\Http\Controllers\LayananMppController::class, 'updateStatus'])->name('rekomhkimerek.status');
    Route::patch('/rekomhkimerek/{id}/gdrive', [\App\Http\Controllers\LayananMppController::class, 'updateGdriveLink'])->name('rekomhkimerek.gdrive');
    Route::delete('/rekomhkimerek/{id}', [\App\Http\Controllers\LayananMppController::class, 'destroy'])->name('rekomhkimerek.destroy');
    Route::post('/siinas/reset', [App\Http\Controllers\Dukungan\DukunganController::class, 'siinasResetData'])->name('siinas.reset');

    // REKAP PESERTA & RIWAYAT PELATIHAN DUKUNGAN
    Route::get('/daftarpeserta', [App\Http\Controllers\Dukungan\DukunganController::class, 'daftarPesertaIndex'])->name('daftarpeserta.index');
    Route::post('/daftarpeserta/tambah', [App\Http\Controllers\Dukungan\DukunganController::class, 'daftarPesertaStore'])->name('daftarpeserta.store');
    Route::get('/daftarpeserta/find-ikm', [App\Http\Controllers\Dukungan\DukunganController::class, 'daftarPesertaFindIkm'])->name('daftarpeserta.find-ikm');
    Route::match(['delete', 'post'], '/daftarpeserta/destroy/{id}', [App\Http\Controllers\Dukungan\DukunganController::class, 'daftarPesertaDestroy'])->name('daftarpeserta.destroy');
    Route::get('/daftarpeserta/export-kegiatan', [App\Http\Controllers\Dukungan\DukunganController::class, 'daftarPesertaExportKegiatan'])->name('daftarpeserta.export-kegiatan');
});

// FALLBACK 404 ROUTE
Route::fallback(function () {
    return response()->view('errors.404', [], 404);
});