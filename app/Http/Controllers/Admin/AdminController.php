<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\PelakuUsaha;
use App\Models\Kegiatan; // Model untuk jumlah kegiatan
use App\Models\Pendaftar; // Model untuk jumlah pendaftar
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Http;

class AdminController extends Controller
{
    public function publikasi()
    {
        $publikasi = DB::table('publikasi')->orderBy('tanggal', 'desc')->get();
        return view('admin.publikasi', compact('publikasi'));
    }

    public function toggle($id)
    {
        $publikasi = DB::table('publikasi')->where('id', $id)->first();
        if ($publikasi) {
            DB::table('publikasi')->where('id', $id)->update([
                'is_active' => !$publikasi->is_active,
                'updated_at' => now()
            ]);
            return back()->with('success', 'Status ketertayangan publikasi berhasil diperbarui!');
        }
        
        return back()->with('error', 'Data tidak ditemukan.');
    }

    public function storePublikasi(Request $request) 
    {
        $request->validate([
            'judul'     => 'required|string|max:255',
            'deskripsi' => 'required',
            'gambar'    => 'required|image|max:5120'
        ]);

        $imageUrl = null;
        if ($request->hasFile('gambar')) {
            $file = $request->file('gambar');
            $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/publikasi'), $filename);
            $imageUrl = '/uploads/publikasi/' . $filename;
        }

        if ($imageUrl) {
            DB::table('publikasi')->insert([
                'judul'      => $request->judul,
                'gambar'     => $imageUrl,
                'tanggal'    => $request->tanggal ?? now()->format('Y-m-d'),
                'waktu'      => $request->waktu ?? '08.00 WIB',
                'deskripsi'  => $request->deskripsi,
                'status'     => $request->status ?? 'Informasi',
                'is_active'  => $request->is_active ?? 1,
                'created_at' => now(),
                'updated_at' => now()
            ]);
            return redirect()->back()->with('success', 'Konten publikasi baru berhasil diterbitkan!');
        }
        return redirect()->back()->with('error', 'Gambar gagal diproses.');
    }

    public function updatePublikasi(Request $request, $id)
    {
        $request->validate([
            'judul'     => 'required|string|max:255',
            'deskripsi' => 'required',
            'gambar'    => 'nullable|image|max:5120'
        ]);

        $item = DB::table('publikasi')->where('id', $id)->first();
        if (!$item) {
            return redirect()->back()->with('error', 'Data publikasi tidak ditemukan.');
        }

        $updateData = [
            'judul'      => $request->judul,
            'tanggal'    => $request->tanggal ?? $item->tanggal,
            'waktu'      => $request->waktu ?? $item->waktu,
            'deskripsi'  => $request->deskripsi,
            'status'     => $request->status ?? $item->status,
            'is_active'  => $request->is_active ?? $item->is_active,
            'updated_at' => now()
        ];

        if ($request->hasFile('gambar')) {
            $file = $request->file('gambar');
            $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/publikasi'), $filename);
            $updateData['gambar'] = '/uploads/publikasi/' . $filename;
        }

        DB::table('publikasi')->where('id', $id)->update($updateData);

        return redirect()->back()->with('success', 'Konten publikasi berhasil diperbarui!');
    }

    public function destroyPublikasi($id)
    {
        DB::table('publikasi')->where('id', $id)->delete();
        return redirect()->back()->with('success', 'Konten publikasi berhasil dihapus!');
    }

    public function deletePublikasi($id)
    {
        return $this->destroyPublikasi($id);
    }
    public function dashboardAdmin()
    {
        // 1. Statistik Umum
        $totalIkm = PelakuUsaha::count();
        
        // 2. Distribusi Skala Usaha
        $skalaUsaha = PelakuUsaha::select('skala_usaha', DB::raw('count(*) as total'))
            ->whereNotNull('skala_usaha')
            ->where('skala_usaha', '!=', '')
            ->groupBy('skala_usaha')
            ->get();

        // 3. Distribusi per Kecamatan
        $perKecamatan = PelakuUsaha::select('kecamatan', DB::raw('count(*) as total'))
            ->whereNotNull('kecamatan')
            ->where('kecamatan', '!=', '')
            ->groupBy('kecamatan')
            ->orderByDesc('total')
            ->get();

        // 4. Legalitas & Sertifikasi
        $legalitas = [
            'nib' => PelakuUsaha::whereNotNull('nib')->where('nib', '!=', '')->count(),
            'halal' => PelakuUsaha::whereNotNull('sertifikat_halal')->where('sertifikat_halal', '!=', '')->count(),
            'bpom' => PelakuUsaha::whereNotNull('bpom')->where('bpom', '!=', '')->count(),
            'cppob' => PelakuUsaha::whereNotNull('cppob')->where('cppob', '!=', '')->count(),
            'sni' => PelakuUsaha::whereNotNull('sni')->where('sni', '!=', '')->count(),
        ];

        // 5. Konsultasi
        $totalKonsultasi = DB::table('konsultasi')->count();
        $konsultasiDijawab = DB::table('konsultasi')->whereIn('status', ['Sudah Dijawab', 'Selesai'])->count();
        $konsultasiBelum = DB::table('konsultasi')->where('status', 'Belum Dijawab')->count();

        // 6. IKM Tersertifikasi (punya minimal 1 sertifikasi)
        $ikmTersertifikasi = PelakuUsaha::where(function($q) {
            $q->where(function($sub) {
                $sub->whereNotNull('sertifikat_halal')->where('sertifikat_halal', '!=', '');
            })->orWhere(function($sub) {
                $sub->whereNotNull('bpom')->where('bpom', '!=', '');
            })->orWhere(function($sub) {
                $sub->whereNotNull('cppob')->where('cppob', '!=', '');
            })->orWhere(function($sub) {
                $sub->whereNotNull('sni')->where('sni', '!=', '');
            });
        })->count();

        $persenTersertifikasi = $totalIkm > 0 ? round(($ikmTersertifikasi / $totalIkm) * 100, 1) : 0;

        // 7. Distribusi Tingkat Risiko
        $tingkatRisiko = PelakuUsaha::select('tingkat_risiko', DB::raw('count(*) as total'))
            ->whereNotNull('tingkat_risiko')
            ->where('tingkat_risiko', '!=', '')
            ->groupBy('tingkat_risiko')
            ->get();

        // 8. Distribusi per Kelurahan (untuk detail kecamatan)
        $perKelurahan = PelakuUsaha::select('kelurahan', DB::raw('count(*) as total'))
            ->whereNotNull('kelurahan')
            ->where('kelurahan', '!=', '')
            ->groupBy('kelurahan')
            ->orderByDesc('total')
            ->get();

        // 9. Total Tenaga Kerja & Investasi
        $totalTenagaKerja = PelakuUsaha::sum('tenaga_kerja');
        $totalInvestasi = PelakuUsaha::sum('investasi');

        // 10. Jumlah kecamatan unik
        $jumlahKecamatan = PelakuUsaha::whereNotNull('kecamatan')
            ->where('kecamatan', '!=', '')
            ->distinct('kecamatan')
            ->count('kecamatan');

        // 11. Kategori / Jenis Perusahaan
        $perKategori = PelakuUsaha::select('kategori', DB::raw('count(*) as total'))
            ->whereNotNull('kategori')
            ->where('kategori', '!=', '')
            ->groupBy('kategori')
            ->orderByDesc('total')
            ->get();

        // 12. Total Pelaku Unik (NIB Unik)
        $totalPelakuUnik = PelakuUsaha::whereNotNull('nib')->where('nib', '!=', '')->distinct('nib')->count('nib');

        // 13. Rekapitulasi Kode KBLI (KESELURUHAN DATA)
        $perKbli = PelakuUsaha::select('kbli', DB::raw('count(*) as total'))
            ->whereNotNull('kbli')
            ->where('kbli', '!=', '')
            ->groupBy('kbli')
            ->orderByDesc('total')
            ->get();

        $kbliCodes = $perKbli->pluck('kbli')->filter()->toArray();
        $kbliTitles = [];
        if (count($kbliCodes) > 0) {
            $kbliTitles = DB::table('kbli')->whereIn('kode', $kbliCodes)->pluck('judul', 'kode')->toArray();
        }

        foreach ($perKbli as $item) {
            $item->judul = $kbliTitles[$item->kbli] ?? 'Klasifikasi KBLI ' . $item->kbli;
        }

        // Mengirimkan SEMUA variabel ke dashboard.blade.php
        return view('admin.dashboard', compact(
            'totalIkm',
            'skalaUsaha',
            'perKecamatan',
            'legalitas',
            'totalKonsultasi',
            'konsultasiDijawab',
            'konsultasiBelum',
            'ikmTersertifikasi',
            'persenTersertifikasi',
            'tingkatRisiko',
            'perKelurahan',
            'totalTenagaKerja',
            'totalInvestasi',
            'jumlahKecamatan',
            'perKategori',
            'totalPelakuUnik',
            'perKbli'
        ));
    }
public function settings() {
    $users = User::all();
    $totalIkm = DB::table('pelaku_usaha')->count(); 
    $totalAdmin = User::count();
    $totalKegiatan = DB::table('list_kegiatan')->count();
    return view('admin.pengaturan', compact('users', 'totalIkm', 'totalAdmin', 'totalKegiatan'));
    }

    /**
     * Alias untuk fungsi settings jika rute lain memanggil 'index' atau 'pengaturan'
     */
    public function index() { return $this->settings(); }
    public function pengaturan() { return $this->settings(); }

    /**
     * Menyimpan administrator baru ke database.
     * Menggunakan validasi yang paling ketat dari baris kode sebelumnya.
     */
    public function storeAdmin(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'username' => 'required|string|unique:users,username',
            'password' => 'required|string|min:6',
            'role' => 'required|string|in:admin,dukungan',
        ]);

        User::create([
            'name' => $request->name,
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'role' => $request->role,
        ]);

        return redirect()->back()->with('success', 'Akses administrator baru berhasil ditambahkan!');
    }

    /**
     * Menghapus administrator dengan proteksi berlapis.
     * Fitur: Tidak bisa hapus diri sendiri & tidak bisa hapus admin terakhir.
     */
    public function deleteAdmin($id)
    {
        $user = User::findOrFail($id);
        
        // FITUR 1: Mencegah admin menghapus dirinya sendiri
        if (Auth::id() == $user->id) {
            return redirect()->back()->with('error', 'Anda tidak bisa menghapus akun sendiri!');
        }

        // FITUR 2: Mencegah penghapusan jika hanya tersisa satu admin di sistem
        if (User::count() <= 1) {
            return redirect()->back()->with('error', 'Tidak bisa menghapus administrator terakhir di sistem!');
        }

        $user->delete();
        return redirect()->back()->with('success', 'Akun administrator berhasil dihapus!');
    }
public function updateAdmin(Request $request, $id)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'username' => 'required|string|unique:users,username,' . $id,
        'password' => 'nullable|min:6', // Password boleh kosong saat edit
        'role' => 'required|string|in:admin,dukungan',
    ]);

    $user = User::findOrFail($id);
    $user->name = $request->name;
    $user->username = $request->username;
    $user->role = $request->role;

    // Hanya update password jika inputan password diisi
    if ($request->filled('password')) {
        $user->password = Hash::make($request->password);
    }

    $user->save();

    return redirect()->back()->with('success', 'Data Administrator berhasil diperbarui!');
}

public function usulanPerubahanIndex()
{
    $tipe = request()->query('tipe');
    $query = \App\Models\UsulanPerubahan::with('pelakuUsaha');
    
    if ($tipe === 'baru') {
        $query->where('tipe_usulan', 'baru');
    } elseif ($tipe === 'perubahan') {
        $query->where('tipe_usulan', 'perubahan');
    }
    
    $usulanList = $query->orderBy('created_at', 'desc')->paginate(10)->withQueryString();
        
    return view('admin.usulan_perubahan', compact('usulanList'));
}

public function usulanPerubahanVerifikasi($id)
{
    $usulan = \App\Models\UsulanPerubahan::findOrFail($id);
    
    if ($usulan->pelaku_usaha_id) {
        // Update data pelaku usaha terkait
        $pelakuUsaha = PelakuUsaha::findOrFail($usulan->pelaku_usaha_id);
        $pelakuUsaha->update([
            'nama_pemilik' => $usulan->nama_pemilik,
            'nama_perusahaan' => $usulan->nama_perusahaan,
            'no_telp' => $usulan->no_telp,
            'email' => $usulan->email,
            'alamat_usaha' => $usulan->alamat_usaha,
            'kecamatan' => $usulan->kecamatan,
            'kelurahan' => $usulan->kelurahan,
            'skala_usaha' => $usulan->skala_usaha,
            'jenis_perusahaan' => $usulan->jenis_perusahaan,
            'tingkat_risiko' => $usulan->tingkat_risiko,
            'investasi' => $usulan->investasi,
            'tenaga_kerja' => $usulan->tenaga_kerja,
            'nama_proyek' => $usulan->nama_proyek,
            'kbli' => $usulan->kbli,
            'uraian_kbli' => $usulan->uraian_kbli,
            'tgl_terbit' => $usulan->tgl_terbit,
            'status' => $usulan->status,
            'sertifikat_halal' => $usulan->sertifikat_halal,
            'bpom' => $usulan->bpom,
            'cppob' => $usulan->cppob,
            'sni' => $usulan->sni,
        ]);
    } else {
        // Buat pelaku usaha baru
        $pelakuUsaha = PelakuUsaha::create([
            'nib' => $usulan->nib,
            'nik' => $usulan->nik,
            'nama_pemilik' => $usulan->nama_pemilik,
            'pemilik' => $usulan->nama_pemilik, // Legacy
            'nama_perusahaan' => $usulan->nama_perusahaan,
            'nama_usaha' => $usulan->nama_perusahaan, // Legacy
            'no_telp' => $usulan->no_telp,
            'email' => $usulan->email,
            'alamat_usaha' => $usulan->alamat_usaha,
            'alamat' => $usulan->alamat_usaha, // Legacy
            'kecamatan' => $usulan->kecamatan,
            'kelurahan' => $usulan->kelurahan,
            'skala_usaha' => $usulan->skala_usaha,
            'jenis_perusahaan' => $usulan->jenis_perusahaan,
            'tingkat_risiko' => $usulan->tingkat_risiko,
            'investasi' => $usulan->investasi,
            'tenaga_kerja' => $usulan->tenaga_kerja,
            'nama_proyek' => $usulan->nama_proyek,
            'kbli' => $usulan->kbli,
            'uraian_kbli' => $usulan->uraian_kbli,
            'tgl_terbit' => $usulan->tgl_terbit,
            'status' => $usulan->status,
            'sertifikat_halal' => $usulan->sertifikat_halal,
            'bpom' => $usulan->bpom,
            'cppob' => $usulan->cppob,
            'sni' => $usulan->sni,
        ]);
        
        $usulan->update([
            'pelaku_usaha_id' => $pelakuUsaha->id
        ]);
    }
    
        // Sync ke PetaSebaran (/dukungan/sebaran)
        $peta = \App\Models\PetaSebaran::where('nib', $usulan->nib)->orWhere('nik', $usulan->nik)->first();
        if ($peta) {
            $peta->update([
                'nama_usaha' => $usulan->nama_perusahaan ?: $peta->nama_usaha,
                'pemilik' => $usulan->nama_pemilik ?: $peta->pemilik,
                'no_hp' => $usulan->no_telp ?: $peta->no_hp,
                'produk' => $usulan->nama_proyek ?: $peta->produk,
                'alamat_jalan' => $usulan->alamat_usaha ?: $peta->alamat_jalan,
                'kecamatan' => $usulan->kecamatan ?: $peta->kecamatan,
                'kelurahan' => $usulan->kelurahan ?: $peta->kelurahan,
                'kategori' => $usulan->jenis_perusahaan ?: $peta->kategori,
                'skala_usaha' => $usulan->skala_usaha ?: $peta->skala_usaha,
                'tingkat_risiko' => $usulan->tingkat_risiko ?: $peta->tingkat_risiko,
                'kbli' => $usulan->kbli ?: $peta->kbli,
                'uraian_kbli' => $usulan->uraian_kbli ?: $peta->uraian_kbli,
                'investasi' => $usulan->investasi ?: $peta->investasi,
                'tenaga_kerja' => $usulan->tenaga_kerja ?: $peta->tenaga_kerja,
            ]);
        } else {
            \App\Models\PetaSebaran::create([
                'nib' => $usulan->nib,
                'nik' => $usulan->nik,
                'nama_usaha' => $usulan->nama_perusahaan,
                'pemilik' => $usulan->nama_pemilik,
                'no_hp' => $usulan->no_telp,
                'produk' => $usulan->nama_proyek,
                'alamat_jalan' => $usulan->alamat_usaha,
                'kecamatan' => $usulan->kecamatan,
                'kelurahan' => $usulan->kelurahan,
                'kategori' => $usulan->jenis_perusahaan,
                'skala_usaha' => $usulan->skala_usaha,
                'tingkat_risiko' => $usulan->tingkat_risiko,
                'kbli' => $usulan->kbli,
                'uraian_kbli' => $usulan->uraian_kbli,
                'investasi' => $usulan->investasi ?: 0,
                'tenaga_kerja' => $usulan->tenaga_kerja ?: 1,
            ]);
        }
        
        // Update status usulan
        $usulan->update([
            'status_usulan' => 'disetujui'
        ]);
    
    return redirect()->back()->with('success', 'Usulan data pelaku usaha baru/perubahan telah diverifikasi dan disetujui!');
}

public function usulanPerubahanTolak(Request $request, $id)
{
    $usulan = \App\Models\UsulanPerubahan::findOrFail($id);
    
    $usulan->update([
        'status_usulan' => 'ditolak',
        'catatan_admin' => $request->input('catatan_admin', 'Ditolak oleh admin.')
    ]);
    
    return redirect()->back()->with('success', 'Usulan perubahan data pelaku usaha telah ditolak.');
}
}