<?php

namespace App\Http\Controllers\Dukungan;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\PelakuUsaha;
use App\Models\Konsultasi;
use App\Models\PetaSebaran;
use App\Models\UsulanPerubahan;
use App\Models\DatabaseHkiMerek;
use App\Models\DatabaseHalal;
use App\Exports\PetaSebaranExport;
use App\Exports\PetaSebaranTemplateExport;
use App\Imports\PetaSebaranImport;
use App\Models\SiinasIndustry;
use App\Imports\SiinasImport;
use App\Exports\SiinasExport;
use App\Exports\SiinasTemplateExport;
use Maatwebsite\Excel\Facades\Excel;

class DukunganController extends Controller
{
    public function dashboard()
    {
        $totalIkm = PetaSebaran::count(); // Disesuaikan agar hanya menampilkan total 68 data IKM di database dukungan
        $totalTerpetakan = PetaSebaran::count();
            
        $persenTerpetakan = $totalIkm > 0 ? round(($totalTerpetakan / $totalIkm) * 100, 1) : 0;
        
        $totalKonsultasi = Konsultasi::count();
        $totalKategori = Konsultasi::select('jenis_usaha', DB::raw('count(*) as total'))
            ->groupBy('jenis_usaha')
            ->get();
            
        return view('admin.dashboard_dukungan', compact('totalIkm', 'totalTerpetakan', 'persenTerpetakan', 'totalKonsultasi', 'totalKategori'));
    }

    public function peta()
    {
        $semua_usaha = PetaSebaran::all();
        
        $totalUsaha = PetaSebaran::count();
        $totalInvestasi = PetaSebaran::sum('investasi');
        $totalTenagaKerja = PetaSebaran::sum('tenaga_kerja');
        
        $byKecamatan = PetaSebaran::select('kecamatan', DB::raw('count(*) as total'))
            ->groupBy('kecamatan')
            ->orderBy('total', 'desc')
            ->get();
            
        $byKelurahan = PetaSebaran::select('kelurahan', DB::raw('count(*) as total'))
            ->groupBy('kelurahan')
            ->orderBy('total', 'desc')
            ->get();
            
        $byKategori = PetaSebaran::select('kategori', DB::raw('count(*) as total'))
            ->groupBy('kategori')
            ->orderBy('total', 'desc')
            ->get();
            
        $bySkala = PetaSebaran::select('skala_usaha', DB::raw('count(*) as total'))
            ->groupBy('skala_usaha')
            ->orderBy('total', 'desc')
            ->get();

        $topKbli = PetaSebaran::select('kbli', 'uraian_kbli', DB::raw('count(*) as total'))
            ->whereNotNull('kbli')
            ->where('kbli', '!=', '')
            ->groupBy('kbli', 'uraian_kbli')
            ->orderByDesc('total')
            ->limit(10)
            ->get();

        return view('admin.peta_dukungan', compact('semua_usaha', 'totalUsaha', 'totalInvestasi', 'totalTenagaKerja', 'byKecamatan', 'byKelurahan', 'byKategori', 'bySkala', 'topKbli'));
    }

    public function petaAlatBantu()
    {
        return view('admin.peta_alat_bantu');
    }

    // CRUD DATA PETA SEBARAN (HALAMAN LANJUTAN)
    public function sebaranIndex(Request $request)
    {
        $query = PetaSebaran::query();

        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('pemilik', 'like', "%{$search}%")
                  ->orWhere('nib', 'like', "%{$search}%")
                  ->orWhere('nik', 'like', "%{$search}%")
                  ->orWhere('produk', 'like', "%{$search}%")
                  ->orWhere('nama_usaha', 'like', "%{$search}%");
            });
        }

        $sebaranList = $query->orderBy('id', 'desc')->paginate(50)->withQueryString();
        return view('admin.peta_sebaran_crud', compact('sebaranList'));
    }

    // EXPORT EXCEL (.xlsx asli)
    public function sebaranExport(Request $request)
    {
        return Excel::download(new PetaSebaranExport($request->search), 'peta_sebaran.xlsx');
    }

    // DOWNLOAD TEMPLATE EXCEL IMPORT
    public function sebaranTemplate()
    {
        return Excel::download(new PetaSebaranTemplateExport(), 'template_import_peta_sebaran.xlsx');
    }

    // API CEK DUPLIKASI NIB / NIK REAL-TIME
    public function sebaranCheckDuplikasi(Request $request)
    {
        $nib = trim($request->query('nib', ''));
        $nik = trim($request->query('nik', ''));
        $ignoreId = $request->query('ignore_id');

        $duplicateNib = null;
        $duplicateNik = null;

        if (!empty($nib) && strlen($nib) === 13) {
            $qNib = PetaSebaran::where('nib', $nib);
            if (!empty($ignoreId)) {
                $qNib->where('id', '!=', $ignoreId);
            }
            $duplicateNib = $qNib->first(['id', 'nama_usaha', 'pemilik', 'nib', 'nik']);
        }

        if (!empty($nik) && strlen($nik) === 16) {
            $qNik = PetaSebaran::where('nik', $nik);
            if (!empty($ignoreId)) {
                $qNik->where('id', '!=', $ignoreId);
            }
            $duplicateNik = $qNik->first(['id', 'nama_usaha', 'pemilik', 'nib', 'nik']);
        }

        return response()->json([
            'is_duplicate' => (!empty($duplicateNib) || !empty($duplicateNik)),
            'duplicate_nib' => $duplicateNib,
            'duplicate_nik' => $duplicateNik,
        ]);
    }

    // IMPORT EXCEL UNGGAH MASSAL DENGAN DETEKSI DUPLIKASI & KONFIRMASI POPUP
    public function sebaranImport(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimes:xlsx,xls'
        ]);

        $rows = Excel::toArray(new PetaSebaranImport(), $request->file('file'))[0] ?? [];

        $validRows = [];
        $duplicateRows = [];
        $invalidRows = [];
        $seenNibInFile = [];
        $seenNikInFile = [];

        $rowNumber = 1; // Baris 1 adalah header Excel

        foreach ($rows as $row) {
            $rowNumber++;

            // Skip jika baris kosong
            if (empty($row['nama_usaha']) && empty($row['nama_pemilik']) && empty($row['pemilik']) && empty($row['nib']) && empty($row['nik'])) {
                continue;
            }

            $nama_usaha = trim((string)($row['nama_usaha'] ?? ''));
            $pemilik = trim((string)($row['nama_pemilik'] ?? $row['pemilik'] ?? ''));
            $nib = isset($row['nib']) ? trim((string)$row['nib']) : '';
            $nik = isset($row['nik']) ? trim((string)$row['nik']) : '';

            if (empty($nama_usaha) || empty($pemilik)) {
                $invalidRows[] = [
                    'row' => $rowNumber,
                    'identifier' => $nama_usaha ?: 'Baris #' . $rowNumber,
                    'reason' => 'Nama Usaha atau Nama Pemilik kosong'
                ];
                continue;
            }

            if (empty($nib) || strlen($nib) !== 13) {
                $invalidRows[] = [
                    'row' => $rowNumber,
                    'identifier' => "{$nama_usaha} (NIB: {$nib})",
                    'reason' => 'NIB harus 13 digit'
                ];
                continue;
            }

            if (empty($nik) || strlen($nik) !== 16) {
                $invalidRows[] = [
                    'row' => $rowNumber,
                    'identifier' => "{$nama_usaha} (NIK: {$nik})",
                    'reason' => 'NIK harus 16 digit'
                ];
                continue;
            }

            // Cek duplikasi dengan Database PetaSebaran
            $matchedDbNib = PetaSebaran::where('nib', $nib)->first();
            $matchedDbNik = PetaSebaran::where('nik', $nik)->first();

            if ($matchedDbNib || $matchedDbNik) {
                $matchedObj = $matchedDbNib ?? $matchedDbNik;
                $reasonText = $matchedDbNib 
                    ? "NIB '{$nib}' sudah ada di Peta Sebaran (Milik: {$matchedObj->nama_usaha} - {$matchedObj->pemilik})" 
                    : "NIK '{$nik}' sudah ada di Peta Sebaran (Milik: {$matchedObj->nama_usaha} - {$matchedObj->pemilik})";

                $duplicateRows[] = [
                    'row' => $rowNumber,
                    'nama_usaha' => $nama_usaha,
                    'pemilik' => $pemilik,
                    'nib' => $nib,
                    'nik' => $nik,
                    'reason' => $reasonText,
                    'matched_with' => "{$matchedObj->nama_usaha} ({$matchedObj->pemilik})"
                ];
                continue;
            }

            // Cek duplikasi NIB / NIK di dalam file Excel yang sama
            if (in_array($nib, $seenNibInFile)) {
                $duplicateRows[] = [
                    'row' => $rowNumber,
                    'nama_usaha' => $nama_usaha,
                    'pemilik' => $pemilik,
                    'nib' => $nib,
                    'nik' => $nik,
                    'reason' => "NIB '{$nib}' ganda di dalam berkas Excel ini",
                    'matched_with' => "File Excel Saat Ini"
                ];
                continue;
            }
            if (in_array($nik, $seenNikInFile)) {
                $duplicateRows[] = [
                    'row' => $rowNumber,
                    'nama_usaha' => $nama_usaha,
                    'pemilik' => $pemilik,
                    'nib' => $nib,
                    'nik' => $nik,
                    'reason' => "NIK '{$nik}' ganda di dalam berkas Excel ini",
                    'matched_with' => "File Excel Saat Ini"
                ];
                continue;
            }

            $seenNibInFile[] = $nib;
            $seenNikInFile[] = $nik;

            // Olah Kategori & Metadata
            $kategori = $row['kategori_usaha'] ?? $row['kategori'] ?? 'Pangan';
            $allowedKategori = ['Pangan', 'Sandang', 'Kerajinan (Kriya)', 'Kimia dan Furnitur', 'Logam dan Mesin'];
            if (!in_array($kategori, $allowedKategori)) {
                if ($kategori === 'Kuliner' || $kategori === 'Makanan') $kategori = 'Pangan';
                elseif ($kategori === 'Fashion') $kategori = 'Sandang';
                else $kategori = 'Pangan';
            }

            $skala = $row['skala_usaha'] ?? 'Mikro';
            $allowedSkala = ['Mikro', 'Kecil', 'Menengah', 'Besar'];
            if (!in_array($skala, $allowedSkala)) $skala = 'Mikro';

            $risiko = $row['tingkat_risiko'] ?? 'Rendah';
            $allowedRisiko = ['Rendah', 'Menengah Rendah', 'Menengah Tinggi', 'Tinggi'];
            if (!in_array($risiko, $allowedRisiko)) $risiko = 'Rendah';

            $rawKelurahan = trim((string)($row['kelurahan'] ?? '-'));
            if (strcasecmp(str_replace('-', ' ', $rawKelurahan), 'oro oro ombo') === 0) {
                $kelurahan = 'Oro-Oro Ombo';
            } else {
                $kelurahan = ucwords(strtolower($rawKelurahan));
            }

            $kecamatan = ucwords(strtolower(trim((string)($row['kecamatan'] ?? '-'))));

            $validRows[] = [
                'nama_usaha'    => $nama_usaha,
                'pemilik'       => $pemilik,
                'nib'           => $nib,
                'nik'           => $nik,
                'no_hp'         => (string)($row['nomor_hp'] ?? $row['no_hp'] ?? '-'),
                'produk'        => (string)($row['produk_yang_diproduksi'] ?? $row['produk'] ?? '-'),
                'alamat_jalan'  => (string)($row['alamat_nama_jalan'] ?? $row['alamat_jalan'] ?? '-'),
                'alamat_no'     => (string)($row['nomor_rumah'] ?? $row['alamat_no'] ?? '-'),
                'kelurahan'     => $kelurahan,
                'kecamatan'     => $kecamatan,
                'kota_madiun'   => 'Kota Madiun',
                'kategori'      => $kategori,
                'kbli'          => isset($row['kbli']) ? (string)$row['kbli'] : null,
                'uraian_kbli'   => isset($row['uraian_kbli']) ? (string)$row['uraian_kbli'] : null,
                'investasi'     => floatval($row['nilai_investasi_rupiah'] ?? $row['investasi'] ?? 0),
                'tenaga_kerja'  => intval($row['jumlah_tenaga_kerja'] ?? $row['tenaga_kerja'] ?? 1),
                'skala_usaha'   => $skala,
                'tingkat_risiko'=> $risiko,
                'latitude'      => (string)($row['latitude'] ?? '0'),
                'longitude'     => (string)($row['longitude'] ?? '0'),
                'created_at'    => now()->toDateTimeString(),
                'updated_at'    => now()->toDateTimeString(),
            ];
        }

        // Jika terdapat data yang tertolak/duplikat, tampilkan konfirmasi popup
        if (count($duplicateRows) > 0 || count($invalidRows) > 0) {
            session(['pending_sebaran_import_rows' => $validRows]);

            return redirect()->back()->with('import_confirm_popup', [
                'duplicate_count' => count($duplicateRows),
                'valid_count' => count($validRows),
                'invalid_count' => count($invalidRows),
                'duplicate_details' => $duplicateRows,
                'invalid_details' => $invalidRows,
            ]);
        }

        // Jika 100% data bersih tanpa duplikasi
        if (count($validRows) > 0) {
            foreach ($validRows as $valData) {
                PetaSebaran::create($valData);
            }
            return redirect()->back()->with('success', '🎉 Berhasil mengunggah ' . count($validRows) . ' data IKM baru ke Peta Sebaran!');
        }

        return redirect()->back()->withErrors(['file' => 'Tidak ada data valid yang dapat diunggah dari berkas Excel tersebut.']);
    }

    // COMMIT SIMPAN DATA VALID DARI UNGGAH MASSAL
    public function sebaranCommitImport(Request $request)
    {
        $pendingRows = session('pending_sebaran_import_rows', []);

        if (empty($pendingRows)) {
            return redirect()->back()->with('error', 'Sesi unggah massal telah kadaluarsa atau tidak ada data valid.');
        }

        $insertedCount = 0;
        foreach ($pendingRows as $row) {
            if (!PetaSebaran::where('nib', $row['nib'])->exists() && !PetaSebaran::where('nik', $row['nik'])->exists()) {
                PetaSebaran::create($row);
                $insertedCount++;
            }
        }

        session()->forget('pending_sebaran_import_rows');

        return redirect()->back()->with('success', "🎉 Berhasil memproses & menyimpan {$insertedCount} data IKM yang berbeda!");
    }

    public function sebaranStore(Request $request)
    {
        $request->validate([
            'nama_usaha' => 'required|string|max:255',
            'pemilik' => 'required|string|max:255',
            'nib' => 'required|string|size:13',
            'nik' => 'required|string|size:16',
            'no_hp' => 'required|string|max:20',
            'produk' => 'required|string|max:255',
            'alamat_jalan' => 'required|string|max:255',
            'alamat_no' => 'required|string|max:50',
            'kelurahan' => 'required|string|max:255',
            'kecamatan' => 'required|string|max:255',
            'kategori' => 'required|string|in:Pangan,Sandang,Kerajinan (Kriya),Kimia dan Furnitur,Logam dan Mesin',
            'skala_usaha' => 'required|string|in:Mikro,Kecil,Menengah,Besar',
            'tingkat_risiko' => 'required|string|in:Rendah,Menengah Rendah,Menengah Tinggi,Tinggi',
            'latitude' => 'required|string',
            'longitude' => 'required|string',
        ]);

        // Cek Duplikasi NIB / NIK server-side
        $nibExists = PetaSebaran::where('nib', $request->nib)->first();
        if ($nibExists) {
            return redirect()->back()->withInput()->withErrors([
                'nib' => "NIB '{$request->nib}' sudah terdaftar pada Peta Sebaran (Milik: {$nibExists->nama_usaha} - {$nibExists->pemilik})!"
            ]);
        }

        $nikExists = PetaSebaran::where('nik', $request->nik)->first();
        if ($nikExists) {
            return redirect()->back()->withInput()->withErrors([
                'nik' => "NIK '{$request->nik}' sudah terdaftar pada Peta Sebaran (Milik: {$nikExists->nama_usaha} - {$nikExists->pemilik})!"
            ]);
        }

        $data = $request->all();
        
        // Normalisasi Kelurahan & Kecamatan
        $rawKelurahan = trim($data['kelurahan']);
        if (strcasecmp(str_replace('-', ' ', $rawKelurahan), 'oro oro ombo') === 0) {
            $data['kelurahan'] = 'Oro-Oro Ombo';
        } else {
            $data['kelurahan'] = ucwords(strtolower($rawKelurahan));
        }
        $data['kecamatan'] = ucwords(strtolower(trim($data['kecamatan'])));

        PetaSebaran::create($data);

        return redirect()->back()->with('success', 'Titik peta sebaran baru berhasil ditambahkan!');
    }

    public function sebaranUpdate(Request $request, $id)
    {
        $request->validate([
            'nama_usaha' => 'required|string|max:255',
            'pemilik' => 'required|string|max:255',
            'nib' => 'required|string|size:13',
            'nik' => 'required|string|size:16',
            'no_hp' => 'required|string|max:20',
            'produk' => 'required|string|max:255',
            'alamat_jalan' => 'required|string|max:255',
            'alamat_no' => 'required|string|max:50',
            'kelurahan' => 'required|string|max:255',
            'kecamatan' => 'required|string|max:255',
            'kategori' => 'required|string|in:Pangan,Sandang,Kerajinan (Kriya),Kimia dan Furnitur,Logam dan Mesin',
            'skala_usaha' => 'required|string|in:Mikro,Kecil,Menengah,Besar',
            'tingkat_risiko' => 'required|string|in:Rendah,Menengah Rendah,Menengah Tinggi,Tinggi',
            'latitude' => 'required|string',
            'longitude' => 'required|string',
        ]);

        $sebaran = PetaSebaran::findOrFail($id);

        // Cek Duplikasi NIB / NIK server-side
        $nibExists = PetaSebaran::where('nib', $request->nib)->where('id', '!=', $id)->first();
        if ($nibExists) {
            return redirect()->back()->withInput()->withErrors([
                'nib' => "NIB '{$request->nib}' sudah digunakan oleh IKM lain (Milik: {$nibExists->nama_usaha} - {$nibExists->pemilik})!"
            ]);
        }

        $nikExists = PetaSebaran::where('nik', $request->nik)->where('id', '!=', $id)->first();
        if ($nikExists) {
            return redirect()->back()->withInput()->withErrors([
                'nik' => "NIK '{$request->nik}' sudah digunakan oleh IKM lain (Milik: {$nikExists->nama_usaha} - {$nikExists->pemilik})!"
            ]);
        }

        $data = $request->all();

        // Normalisasi Kelurahan & Kecamatan
        $rawKelurahan = trim($data['kelurahan']);
        if (strcasecmp(str_replace('-', ' ', $rawKelurahan), 'oro oro ombo') === 0) {
            $data['kelurahan'] = 'Oro-Oro Ombo';
        } else {
            $data['kelurahan'] = ucwords(strtolower($rawKelurahan));
        }
        $data['kecamatan'] = ucwords(strtolower(trim($data['kecamatan'])));

        $sebaran->update($data);

        return redirect()->back()->with('success', 'Data titik peta sebaran berhasil diperbarui!');
    }

    public function sebaranDestroy($id)
    {
        $sebaran = PetaSebaran::findOrFail($id);
        $sebaran->delete();

        return redirect()->back()->with('success', 'Titik peta sebaran berhasil dihapus!');
    }

    // MANAJEMEN DATA USULAN (PELAKU USAHA BARU & PERUBAHAN DATA)
    public function usulDataIndex(Request $request)
    {
        $query = UsulanPerubahan::with('pelakuUsaha');

        $tipe = $request->query('tipe');
        if ($tipe === 'baru') {
            $query->where('tipe_usulan', 'baru');
        } elseif ($tipe === 'perubahan') {
            $query->where('tipe_usulan', 'perubahan');
        }

        $status = $request->query('status');
        if ($status && in_array($status, ['pending', 'disetujui', 'ditolak'])) {
            $query->where('status_usulan', $status);
        }

        $search = trim($request->query('search'));
        if ($search) {
            $query->where(function($q) use ($search) {
                $q->where('nama_perusahaan', 'like', "%{$search}%")
                  ->orWhere('nama_pemilik', 'like', "%{$search}%")
                  ->orWhere('nib', 'like', "%{$search}%")
                  ->orWhere('nik', 'like', "%{$search}%");
            });
        }

        $usulanList = $query->orderBy('created_at', 'desc')->paginate(10)->withQueryString();

        $pendingCount = UsulanPerubahan::where('status_usulan', 'pending')->count();
        $pendingBaruCount = UsulanPerubahan::where('status_usulan', 'pending')->where('tipe_usulan', 'baru')->count();
        $pendingPerubahanCount = UsulanPerubahan::where('status_usulan', 'pending')->where('tipe_usulan', 'perubahan')->count();
        $approvedCount = UsulanPerubahan::where('status_usulan', 'disetujui')->count();
        $rejectedCount = UsulanPerubahan::where('status_usulan', 'ditolak')->count();

        return view('admin.usuldata_dukungan', compact(
            'usulanList',
            'pendingCount',
            'pendingBaruCount',
            'pendingPerubahanCount',
            'approvedCount',
            'rejectedCount'
        ));
    }

    public function usulDataVerifikasi($id)
    {
        $usulan = UsulanPerubahan::findOrFail($id);
        
        $usulan->update([
            'status_usulan' => 'disetujui',
            'catatan_admin' => 'Usulan telah diverifikasi dan disetujui oleh Admin Dinas.'
        ]);

        // 1. Sync ke PelakuUsaha jika ada
        $pelakuUsaha = PelakuUsaha::where('nib', $usulan->nib)->orWhere('nik', $usulan->nik)->first();
        if ($pelakuUsaha) {
            $pelakuUsaha->update([
                'nama_pemilik' => $usulan->nama_pemilik ?: $pelakuUsaha->nama_pemilik,
                'pemilik' => $usulan->nama_pemilik ?: $pelakuUsaha->pemilik,
                'nama_perusahaan' => $usulan->nama_perusahaan ?: $pelakuUsaha->nama_perusahaan,
                'nama_usaha' => $usulan->nama_perusahaan ?: $pelakuUsaha->nama_usaha,
                'no_telp' => $usulan->no_telp ?: $pelakuUsaha->no_telp,
                'email' => $usulan->email ?: $pelakuUsaha->email,
                'alamat_usaha' => $usulan->alamat_usaha ?: $pelakuUsaha->alamat_usaha,
                'alamat' => $usulan->alamat_usaha ?: $pelakuUsaha->alamat,
                'kecamatan' => $usulan->kecamatan ?: $pelakuUsaha->kecamatan,
                'kelurahan' => $usulan->kelurahan ?: $pelakuUsaha->kelurahan,
                'skala_usaha' => $usulan->skala_usaha ?: $pelakuUsaha->skala_usaha,
                'jenis_perusahaan' => $usulan->jenis_perusahaan ?: $pelakuUsaha->jenis_perusahaan,
                'tingkat_risiko' => $usulan->tingkat_risiko ?: $pelakuUsaha->tingkat_risiko,
                'investasi' => $usulan->investasi ?: $pelakuUsaha->investasi,
                'tenaga_kerja' => $usulan->tenaga_kerja ?: $pelakuUsaha->tenaga_kerja,
                'nama_proyek' => $usulan->nama_proyek ?: $pelakuUsaha->nama_proyek,
                'kbli' => $usulan->kbli ?: $pelakuUsaha->kbli,
                'uraian_kbli' => $usulan->uraian_kbli ?: $pelakuUsaha->uraian_kbli,
            ]);
        } else {
            $pelakuUsaha = PelakuUsaha::create([
                'nib' => $usulan->nib ?: '-',
                'nik' => $usulan->nik ?: '-',
                'nama_pemilik' => $usulan->nama_pemilik ?: 'Pelaku Usaha',
                'pemilik' => $usulan->nama_pemilik ?: 'Pelaku Usaha',
                'nama_perusahaan' => $usulan->nama_perusahaan ?: 'IKM Madiun',
                'nama_usaha' => $usulan->nama_perusahaan ?: 'IKM Madiun',
                'no_telp' => $usulan->no_telp ?: '-',
                'email' => $usulan->email ?: '-',
                'alamat_usaha' => $usulan->alamat_usaha ?: '-',
                'alamat' => $usulan->alamat_usaha ?: '-',
                'kecamatan' => $usulan->kecamatan ?: 'Kartoharjo',
                'kelurahan' => $usulan->kelurahan ?: 'Kartoharjo',
                'skala_usaha' => $usulan->skala_usaha ?: 'Mikro',
                'jenis_perusahaan' => $usulan->jenis_perusahaan ?: 'Pangan',
                'tingkat_risiko' => $usulan->tingkat_risiko ?: 'Rendah',
                'investasi' => $usulan->investasi ?: 0,
                'tenaga_kerja' => $usulan->tenaga_kerja ?: 1,
                'nama_proyek' => $usulan->nama_proyek ?: '-',
                'kbli' => $usulan->kbli ?: '-',
                'uraian_kbli' => $usulan->uraian_kbli ?: '-',
            ]);
            $usulan->update(['pelaku_usaha_id' => $pelakuUsaha->id]);
        }

        // 2. Sync ke PetaSebaran (/dukungan/sebaran)
        $madiunCoordMap = [
            'Kartoharjo'     => ['lat' => '-7.6200', 'lng' => '111.5300'],
            'Kanigoro'       => ['lat' => '-7.6150', 'lng' => '111.5350'],
            'Kelun'          => ['lat' => '-7.6100', 'lng' => '111.5400'],
            'Klegen'         => ['lat' => '-7.6250', 'lng' => '111.5320'],
            'Oro-Oro Ombo'   => ['lat' => '-7.6300', 'lng' => '111.5280'],
            'Tawangrejo'     => ['lat' => '-7.6050', 'lng' => '111.5450'],
            'Rejomulyo'      => ['lat' => '-7.6180', 'lng' => '111.5380'],
            'Sukosari'       => ['lat' => '-7.6120', 'lng' => '111.5310'],
            'Pilangbango'    => ['lat' => '-7.6080', 'lng' => '111.5390'],
            'Manguharjo'     => ['lat' => '-7.6220', 'lng' => '111.5150'],
            'Pangerangan'    => ['lat' => '-7.6250', 'lng' => '111.5180'],
            'Nambangan Lor'  => ['lat' => '-7.6290', 'lng' => '111.5120'],
            'Nambangan Kidul'=> ['lat' => '-7.6340', 'lng' => '111.5140'],
            'Yosomulyo'      => ['lat' => '-7.6270', 'lng' => '111.5100'],
            'Sogaten'        => ['lat' => '-7.6180', 'lng' => '111.5130'],
            'Staboro'        => ['lat' => '-7.6150', 'lng' => '111.5080'],
            'Winongo'        => ['lat' => '-7.6150', 'lng' => '111.5080'],
            'Madiun Lor'     => ['lat' => '-7.6210', 'lng' => '111.5210'],
            'Taman'          => ['lat' => '-7.6380', 'lng' => '111.5280'],
            'Pandean'        => ['lat' => '-7.6320', 'lng' => '111.5250'],
            'Banjarejosari'  => ['lat' => '-7.6420', 'lng' => '111.5220'],
            'Demangan'       => ['lat' => '-7.6450', 'lng' => '111.5300'],
            'Josenan'        => ['lat' => '-7.6400', 'lng' => '111.5350'],
            'Kejuron'        => ['lat' => '-7.6350', 'lng' => '111.5220'],
            'Kuncen'         => ['lat' => '-7.6410', 'lng' => '111.5270'],
            'Mojorejo'       => ['lat' => '-7.6360', 'lng' => '111.5310'],
            'Manisrejo'      => ['lat' => '-7.6390', 'lng' => '111.5380'],
        ];

        $kel = trim($usulan->kelurahan ?: '');
        $defaultCoords = $madiunCoordMap[$kel] ?? ['lat' => '-7.6298', 'lng' => '111.5239'];

        $peta = PetaSebaran::where('nib', $usulan->nib)->orWhere('nik', $usulan->nik)->first();
        
        $finalLat = $usulan->latitude ?: ($peta ? $peta->latitude : '') ?: $defaultCoords['lat'];
        $finalLng = $usulan->longitude ?: ($peta ? $peta->longitude : '') ?: $defaultCoords['lng'];

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
                'status_halal' => $usulan->status_halal ?: $peta->status_halal,
                'no_halal' => $usulan->no_halal ?: $peta->no_halal,
                'status_bpom_cppob' => $usulan->status_bpom_cppob ?: $peta->status_bpom_cppob,
                'no_bpom_cppob' => $usulan->no_bpom_cppob ?: $peta->no_bpom_cppob,
                'status_sni' => $usulan->status_sni ?: $peta->status_sni,
                'no_sni' => $usulan->no_sni ?: $peta->no_sni,
                'status_hki_merek' => $usulan->status_hki_merek ?: $peta->status_hki_merek,
                'no_hki_merek' => $usulan->no_hki_merek ?: $peta->no_hki_merek,
                'nama_merek' => $usulan->nama_merek ?: $peta->nama_merek,
                'latitude' => $finalLat,
                'longitude' => $finalLng,
            ]);
        } else {
            PetaSebaran::create([
                'nib' => $usulan->nib ?: '-',
                'nik' => $usulan->nik ?: '-',
                'nama_usaha' => $usulan->nama_perusahaan ?: 'IKM Madiun',
                'pemilik' => $usulan->nama_pemilik ?: 'Pelaku Usaha',
                'no_hp' => $usulan->no_telp ?: '-',
                'produk' => $usulan->nama_proyek ?: '-',
                'alamat_jalan' => $usulan->alamat_usaha ?: '-',
                'kecamatan' => $usulan->kecamatan ?: 'Kartoharjo',
                'kelurahan' => $usulan->kelurahan ?: 'Kartoharjo',
                'kategori' => $usulan->jenis_perusahaan ?: 'Pangan',
                'skala_usaha' => $usulan->skala_usaha ?: 'Mikro',
                'tingkat_risiko' => $usulan->tingkat_risiko ?: 'Rendah',
                'kbli' => $usulan->kbli ?: '-',
                'uraian_kbli' => $usulan->uraian_kbli ?: '-',
                'investasi' => $usulan->investasi ?: 0,
                'tenaga_kerja' => $usulan->tenaga_kerja ?: 1,
                'status_halal' => $usulan->status_halal ?: 'Belum',
                'no_halal' => $usulan->no_halal ?: '-',
                'status_bpom_cppob' => $usulan->status_bpom_cppob ?: 'Belum',
                'no_bpom_cppob' => $usulan->no_bpom_cppob ?: '-',
                'status_sni' => $usulan->status_sni ?: 'Belum',
                'no_sni' => $usulan->no_sni ?: '-',
                'status_hki_merek' => $usulan->status_hki_merek ?: 'Belum',
                'no_hki_merek' => $usulan->no_hki_merek ?: '-',
                'nama_merek' => $usulan->nama_merek ?: '-',
                'latitude' => $finalLat,
                'longitude' => $finalLng,
            ]);
        }

        // 3. Format WhatsApp link
        $phone = preg_replace('/[^0-9]/', '', $usulan->no_telp ?: '');
        if (str_starts_with($phone, '0')) {
            $phone = '62' . substr($phone, 1);
        }
        $waText = "Halo Sdr/i " . ($usulan->nama_pemilik ?: 'Pelaku Usaha') . " (" . ($usulan->nama_perusahaan ?: 'IKM Madiun') . "), Pendaftaran Pelaku Usaha Baru Anda di IKM JUARA Kota Madiun telah DIVERIFIKASI & DISETUJUI oleh Admin Dinas Tenaga Kerja, KUKM Kota Madiun. Terima kasih!";
        $waUrl = $phone ? "https://wa.me/{$phone}?text=" . urlencode($waText) : null;

        // Try Fonnte WA notification if token available
        $fonnteToken = env('FONNTE_TOKEN', 'TqK5aiZZSwXPEqmRu411');
        if ($phone && $fonnteToken) {
            try {
                @curl_setopt_array($ch = curl_init(), [
                    CURLOPT_URL => 'https://api.fonnte.com/send',
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_POST => true,
                    CURLOPT_POSTFIELDS => [
                        'target' => $phone,
                        'message' => $waText,
                    ],
                    CURLOPT_HTTPHEADER => ['Authorization: ' . $fonnteToken],
                    CURLOPT_TIMEOUT => 5,
                ]);
                @curl_exec($ch);
                @curl_close($ch);
            } catch (\Throwable $e) {}
        }

        return redirect()->back()
            ->with('success', 'Usulan data IKM berhasil diverifikasi dan disinkronkan ke Database Terintegrasi!')
            ->with('wa_url', $waUrl)
            ->with('wa_name', $usulan->nama_pemilik);
    }

    public function usulDataTolak(Request $request, $id)
    {
        $usulan = UsulanPerubahan::findOrFail($id);
        $usulan->update([
            'status_usulan' => 'ditolak',
            'catatan_admin' => $request->input('catatan_admin', 'Usulan ditolak oleh Admin Dinas.')
        ]);

        return redirect()->back()->with('success', 'Usulan data IKM telah ditolak.');
    }

    // MANAJEMEN DATABASE & TRACKER LEGALITAS IKM
    public function legalitasIndex(Request $request)
    {
        $query = PetaSebaran::where('is_legalitas_tracked', true);

        // 1. Filter jenis legalitas
        $jenis = $request->query('jenis');
        if ($jenis === 'nib') {
            $query->whereNotNull('nib')->where('nib', '!=', '');
        } elseif ($jenis === 'halal') {
            $query->where('status_halal', '!=', 'Belum');
        } elseif ($jenis === 'bpom_cppob') {
            $query->where('status_bpom_cppob', '!=', 'Belum');
        } elseif ($jenis === 'sni') {
            $query->where('status_sni', '!=', 'Belum');
        } elseif ($jenis === 'hki_merek') {
            $query->where('status_hki_merek', '!=', 'Belum');
        } elseif ($jenis === 'tkdn') {
            $query->where('status_tkdn', '!=', 'Belum');
        }

        // 2. Filter Status Legalitas
        $status = $request->query('status');
        if ($status === 'ada') {
            if ($jenis === 'halal') $query->where('status_halal', 'Ada');
            elseif ($jenis === 'bpom_cppob') $query->where('status_bpom_cppob', 'Ada');
            elseif ($jenis === 'sni') $query->where('status_sni', 'Ada');
            elseif ($jenis === 'hki_merek') $query->where('status_hki_merek', 'Ada');
            elseif ($jenis === 'tkdn') $query->where('status_tkdn', 'Ada');
            else {
                $query->where(function($q) {
                    $q->where('status_halal', 'Ada')
                      ->orWhere('status_bpom_cppob', 'Ada')
                      ->orWhere('status_sni', 'Ada')
                      ->orWhere('status_hki_merek', 'Ada')
                      ->orWhere('status_tkdn', 'Ada')
                      ->orWhereNotNull('nib');
                });
            }
        } elseif ($status === 'proses') {
            if ($jenis === 'halal') $query->where('status_halal', 'Proses');
            elseif ($jenis === 'bpom_cppob') $query->where('status_bpom_cppob', 'Proses');
            elseif ($jenis === 'sni') $query->where('status_sni', 'Proses');
            elseif ($jenis === 'hki_merek') $query->where('status_hki_merek', 'Proses');
            elseif ($jenis === 'tkdn') $query->where('status_tkdn', 'Proses');
            else {
                $query->where(function($q) {
                    $q->where('status_halal', 'Proses')
                      ->orWhere('status_bpom_cppob', 'Proses')
                      ->orWhere('status_sni', 'Proses')
                      ->orWhere('status_hki_merek', 'Proses')
                      ->orWhere('status_tkdn', 'Proses');
                });
            }
        } elseif ($status === 'belum') {
            if ($jenis === 'halal') $query->where('status_halal', 'Belum');
            elseif ($jenis === 'bpom_cppob') $query->where('status_bpom_cppob', 'Belum');
            elseif ($jenis === 'sni') $query->where('status_sni', 'Belum');
            elseif ($jenis === 'hki_merek') $query->where('status_hki_merek', 'Belum');
            elseif ($jenis === 'tkdn') $query->where('status_tkdn', 'Belum');
            else {
                $query->where(function($q) {
                    $q->where('status_halal', 'Belum')
                      ->orWhere('status_bpom_cppob', 'Belum')
                      ->orWhere('status_sni', 'Belum')
                      ->orWhere('status_hki_merek', 'Belum')
                      ->orWhere('status_tkdn', 'Belum');
                });
            }
        }


        // 3. Filter kecamatan
        $kecamatan = $request->query('kecamatan');
        if ($kecamatan) {
            $query->where('kecamatan', $kecamatan);
        }

        // 4. Pencarian Teks
        $search = trim($request->query('search'));
        if ($search) {
            $query->where(function($q) use ($search) {
                $q->where('nama_usaha', 'like', "%{$search}%")
                  ->orWhere('pemilik', 'like', "%{$search}%")
                  ->orWhere('nib', 'like', "%{$search}%")
                  ->orWhere('nik', 'like', "%{$search}%")
                  ->orWhere('no_halal', 'like', "%{$search}%")
                  ->orWhere('no_bpom_cppob', 'like', "%{$search}%")
                  ->orWhere('no_sni', 'like', "%{$search}%")
                  ->orWhere('no_hki_merek', 'like', "%{$search}%")
                  ->orWhere('nama_merek', 'like', "%{$search}%")
                  ->orWhere('no_sertifikat_tkdn', 'like', "%{$search}%");
            });
        }

        // Output dengan pagination 10 data per halaman
        $legalitasList = $query->orderBy('created_at', 'desc')->paginate(10)->withQueryString();

        // High-level Statistik
        $totalIkm = PetaSebaran::count();
        $totalNib = PetaSebaran::whereNotNull('nib')->where('nib', '!=', '')->count();
        $totalTracked = PetaSebaran::where('is_legalitas_tracked', true)->count();
        
        $trackedBase = PetaSebaran::where('is_legalitas_tracked', true);

        $totalHalalAda = (clone $trackedBase)->where('status_halal', 'Ada')->count();
        $totalHalalProses = (clone $trackedBase)->where('status_halal', 'Proses')->count();
        
        $totalBpomAda  = (clone $trackedBase)->where('status_bpom_cppob', 'Ada')->count();
        $totalBpomProses  = (clone $trackedBase)->where('status_bpom_cppob', 'Proses')->count();
        
        $totalSniAda   = (clone $trackedBase)->where('status_sni', 'Ada')->count();
        $totalSniProses   = (clone $trackedBase)->where('status_sni', 'Proses')->count();
        
        $totalHkiAda   = (clone $trackedBase)->where('status_hki_merek', 'Ada')->count();
        $totalHkiProses   = (clone $trackedBase)->where('status_hki_merek', 'Proses')->count();

        $totalTkdnAda   = (clone $trackedBase)->where('status_tkdn', 'Ada')->count();
        $totalTkdnProses   = (clone $trackedBase)->where('status_tkdn', 'Proses')->count();

        // Expiring HKI Merek List (Berakhir <= 60 hari atau sudah lewat)
        $expiringHkiList = PetaSebaran::where('is_legalitas_tracked', true)
            ->where('status_hki_merek', '!=', 'Belum')
            ->whereNotNull('tgl_berakhir_hki')
            ->where('tgl_berakhir_hki', '<=', now()->addDays(60)->format('Y-m-d'))
            ->orderBy('tgl_berakhir_hki', 'asc')
            ->get();
        $expiringHkiCount = $expiringHkiList->count();

        $kecamatanList = PetaSebaran::whereNotNull('kecamatan')->where('kecamatan', '!=', '')->distinct()->pluck('kecamatan');

        return view('admin.legalitas_dukungan', compact(
            'legalitasList',
            'totalIkm',
            'totalNib',
            'totalTracked',
            'totalHalalAda',
            'totalHalalProses',
            'totalBpomAda',
            'totalBpomProses',
            'totalSniAda',
            'totalSniProses',
            'totalHkiAda',
            'totalHkiProses',
            'totalTkdnAda',
            'totalTkdnProses',
            'expiringHkiList',
            'expiringHkiCount',
            'kecamatanList'
        ));

    }

    public function legalitasDatabase(Request $request)
    {
        $activeTab = $request->query('tab', 'hki');
        if (!in_array($activeTab, ['hki', 'halal'])) {
            $activeTab = 'hki';
        }

        $search = trim($request->query('search'));

        if ($activeTab === 'halal') {
            $query = DatabaseHalal::query();
            if ($search) {
                $query->where(function($q) use ($search) {
                    $q->where('nama_pu', 'like', "%{$search}%")
                      ->orWhere('nik', 'like', "%{$search}%")
                      ->orWhere('nib', 'like', "%{$search}%")
                      ->orWhere('no_daftar', 'like', "%{$search}%")
                      ->orWhere('merk_dagang', 'like', "%{$search}%")
                      ->orWhere('no_sertifikat', 'like', "%{$search}%")
                      ->orWhere('nama_fasilitator', 'like', "%{$search}%")
                      ->orWhere('jenis_produk', 'like', "%{$search}%");
                });
            }
            $items = $query->orderBy('created_at', 'desc')->paginate(15)->withQueryString();
        } else {
            $query = DatabaseHkiMerek::query();
            if ($search) {
                $query->where(function($q) use ($search) {
                    $q->where('merek', 'like', "%{$search}%")
                      ->orWhere('nik', 'like', "%{$search}%")
                      ->orWhere('nib', 'like', "%{$search}%")
                      ->orWhere('nomor_transaksi', 'like', "%{$search}%")
                      ->orWhere('nomor_permohonan', 'like', "%{$search}%")
                      ->orWhere('tipe_permohonan', 'like', "%{$search}%");
                });
            }
            $items = $query->orderBy('created_at', 'desc')->paginate(15)->withQueryString();
        }

        $countHkiTotal = DatabaseHkiMerek::count();
        $countHalalTotal = DatabaseHalal::count();
        $kecamatanList = PetaSebaran::whereNotNull('kecamatan')->where('kecamatan', '!=', '')->distinct()->pluck('kecamatan');

        return view('admin.legalitas_database', compact(
            'items',
            'activeTab',
            'countHkiTotal',
            'countHalalTotal',
            'kecamatanList'
        ));
    }

    public function legalitasDatabaseHkiStore(Request $request)
    {
        $validated = $request->validate([
            'merek' => 'required|string|max:255',
            'nik' => 'nullable|string|max:30',
            'nib' => 'nullable|string|max:30',
            'nomor_transaksi' => 'nullable|string|max:255',
            'kelas' => 'nullable|string|max:100',
            'nomor_permohonan' => 'nullable|string|max:255',
            'link_tanda_daftar' => 'nullable|string|max:1000',
            'tipe_permohonan' => 'nullable|string|max:255',
            'status_permohonan_merek' => 'nullable|string|max:255',
            'link_sertifikat_merek' => 'nullable|string|max:1000',
        ]);

        $item = DatabaseHkiMerek::create($validated);

        return redirect()->route('dukungan.legalitas.database', ['tab' => 'hki'])->with('success', 'Data Database HKI Merek "' . $item->merek . '" berhasil disimpan!');
    }

    public function legalitasDatabaseHkiUpdate(Request $request, $id)
    {
        $item = DatabaseHkiMerek::findOrFail($id);
        $validated = $request->validate([
            'merek' => 'required|string|max:255',
            'nik' => 'nullable|string|max:30',
            'nib' => 'nullable|string|max:30',
            'nomor_transaksi' => 'nullable|string|max:255',
            'kelas' => 'nullable|string|max:100',
            'nomor_permohonan' => 'nullable|string|max:255',
            'link_tanda_daftar' => 'nullable|string|max:1000',
            'tipe_permohonan' => 'nullable|string|max:255',
            'status_permohonan_merek' => 'nullable|string|max:255',
            'link_sertifikat_merek' => 'nullable|string|max:1000',
        ]);

        if (!empty($validated['tanggal_daftar'])) {
            $validated['tanggal_daftar'] = $this->cleanImportDate($validated['tanggal_daftar']);
        }
        if (!empty($validated['tanggal_sertifikat'])) {
            $validated['tanggal_sertifikat'] = $this->cleanImportDate($validated['tanggal_sertifikat']);
        }

        $item->update($validated);

        return redirect()->route('dukungan.legalitas.database', ['tab' => 'hki'])->with('success', 'Data Database HKI Merek "' . $item->merek . '" berhasil diperbarui!');
    }

    public function legalitasDatabaseHalalStore(Request $request)
    {
        $validated = $request->validate([
            'nama_pu' => 'required|string|max:255',
            'nik' => 'nullable|string|max:30',
            'nib' => 'nullable|string|max:30',
            'no_daftar' => 'nullable|string|max:255',
            'merk_dagang' => 'nullable|string|max:255',
            'tanggal_daftar' => 'nullable|string',
            'status' => 'nullable|string|max:255',
            'tanggal_sertifikat' => 'nullable|string',
            'no_sertifikat' => 'nullable|string|max:255',
            'nama_fasilitator' => 'nullable|string|max:255',
            'jenis_produk' => 'nullable|string|max:255',
            'link_sertifikat_halal' => 'nullable|string|max:1000',
        ]);

        if (!empty($validated['tanggal_daftar'])) {
            $validated['tanggal_daftar'] = $this->cleanImportDate($validated['tanggal_daftar']);
        }
        if (!empty($validated['tanggal_sertifikat'])) {
            $validated['tanggal_sertifikat'] = $this->cleanImportDate($validated['tanggal_sertifikat']);
        }

        $item = DatabaseHalal::create($validated);

        return redirect()->route('dukungan.legalitas.database', ['tab' => 'halal'])->with('success', 'Data Database Sertifikat Halal "' . $item->nama_pu . '" berhasil disimpan!');
    }

    public function legalitasDatabaseHalalUpdate(Request $request, $id)
    {
        $item = DatabaseHalal::findOrFail($id);
        $validated = $request->validate([
            'nama_pu' => 'required|string|max:255',
            'nik' => 'nullable|string|max:30',
            'nib' => 'nullable|string|max:30',
            'no_daftar' => 'nullable|string|max:255',
            'merk_dagang' => 'nullable|string|max:255',
            'tanggal_daftar' => 'nullable|string',
            'status' => 'nullable|string|max:255',
            'tanggal_sertifikat' => 'nullable|string',
            'no_sertifikat' => 'nullable|string|max:255',
            'nama_fasilitator' => 'nullable|string|max:255',
            'jenis_produk' => 'nullable|string|max:255',
            'link_sertifikat_halal' => 'nullable|string|max:1000',
        ]);

        if (!empty($validated['tanggal_daftar'])) {
            $validated['tanggal_daftar'] = $this->cleanImportDate($validated['tanggal_daftar']);
        }
        if (!empty($validated['tanggal_sertifikat'])) {
            $validated['tanggal_sertifikat'] = $this->cleanImportDate($validated['tanggal_sertifikat']);
        }

        $item->update($validated);

        return redirect()->route('dukungan.legalitas.database', ['tab' => 'halal'])->with('success', 'Data Database Sertifikat Halal "' . $item->nama_pu . '" berhasil diperbarui!');
    }

    public function legalitasDatabaseHkiDestroy($id)
    {
        $item = DatabaseHkiMerek::findOrFail($id);
        $merek = $item->merek;
        $item->delete();

        return redirect()->route('dukungan.legalitas.database', ['tab' => 'hki'])->with('success', 'Data HKI Merek "' . $merek . '" berhasil dihapus!');
    }

    public function legalitasDatabaseHalalDestroy($id)
    {
        $item = DatabaseHalal::findOrFail($id);
        $namaPu = $item->nama_pu;
        $item->delete();

        return redirect()->route('dukungan.legalitas.database', ['tab' => 'halal'])->with('success', 'Data Sertifikat Halal "' . $namaPu . '" berhasil dihapus!');
    }

    public function legalitasSearchDatabaseAuto(Request $request)
    {
        $nik = trim($request->query('nik', ''));
        $nib = trim($request->query('nib', ''));
        $queryText = trim($request->query('query', ''));

        if (empty($nik) && empty($nib) && empty($queryText)) {
            return response()->json([
                'success' => false,
                'message' => 'Silakan masukkan NIK, NIB, atau nama usaha untuk mencari.',
                'halal_matches' => [],
                'hki_matches' => []
            ]);
        }

        $halalQuery = DatabaseHalal::query();
        $halalQuery->where(function($q) use ($nik, $nib, $queryText) {
            if (!empty($nik)) {
                $q->orWhere('nik', $nik);
            }
            if (!empty($nib)) {
                $q->orWhere('nib', $nib);
            }
            if (!empty($queryText)) {
                $q->orWhere('nama_pu', 'like', "%{$queryText}%")
                  ->orWhere('merk_dagang', 'like', "%{$queryText}%");
            }
        });
        $halalMatches = $halalQuery->orderBy('created_at', 'desc')->get();

        $hkiQuery = DatabaseHkiMerek::query();
        $hkiQuery->where(function($q) use ($nik, $nib, $queryText) {
            if (!empty($nik)) {
                $q->orWhere('nik', $nik);
            }
            if (!empty($nib)) {
                $q->orWhere('nib', $nib);
            }
            if (!empty($queryText)) {
                $q->orWhere('merek', 'like', "%{$queryText}%");
            }
        });
        $hkiMatches = $hkiQuery->orderBy('created_at', 'desc')->get();

        return response()->json([
            'success' => true,
            'halal_count' => $halalMatches->count(),
            'hki_count' => $hkiMatches->count(),
            'halal_matches' => $halalMatches,
            'hki_matches' => $hkiMatches,
        ]);
    }

    public function legalitasDatabaseExport(Request $request)
    {
        $tab = $request->query('tab', 'hki');
        $search = $request->query('search');

        if ($tab === 'halal') {
            $filename = 'Database_Sertifikat_Halal_IKM_Madiun_' . date('Ymd_His') . '.xlsx';
            return Excel::download(new \App\Exports\DatabaseHalalExport($search), $filename);
        } else {
            $filename = 'Database_HKI_Merek_IKM_Madiun_' . date('Ymd_His') . '.xlsx';
            return Excel::download(new \App\Exports\DatabaseHkiExport($search), $filename);
        }
    }

    public function legalitasDatabaseTemplate(Request $request)
    {
        $tab = $request->query('tab', 'hki');

        if ($tab === 'halal') {
            $filename = 'Template_Import_Database_Halal_' . date('Ymd') . '.xlsx';
            return Excel::download(new \App\Exports\DatabaseHalalTemplateExport(), $filename);
        } else {
            $filename = 'Template_Import_Database_HKI_Merek_' . date('Ymd') . '.xlsx';
            return Excel::download(new \App\Exports\DatabaseHkiTemplateExport(), $filename);
        }
    }

    public function legalitasDatabaseImport(Request $request)
    {
        $request->validate([
            'file_excel' => 'required|file|mimes:xlsx,xls',
            'tab' => 'required|string',
        ]);

        $tab = $request->input('tab', 'hki');
        $file = $request->file('file_excel');

        $data = Excel::toArray(new \stdClass(), $file);
        $rows = $data[0] ?? [];

        if (count($rows) <= 1) {
            return redirect()->back()->with('error', 'File Excel kosong atau tidak memiliki data!');
        }

        array_shift($rows);

        $totalRows = 0;
        $successCount = 0;
        $rejectedList = [];

        if ($tab === 'hki') {
            foreach ($rows as $index => $row) {
                $rowNumber = $index + 2;
                
                $nik = trim($row[0] ?? '');
                $nib = trim($row[1] ?? '');
                $nomorTransaksi = trim($row[2] ?? '');
                $merek = trim($row[3] ?? '');
                $kelas = trim($row[4] ?? '');
                $nomorPermohonan = trim($row[5] ?? '');
                $linkTandaDaftar = trim($row[6] ?? '');
                $tipePermohonan = trim($row[7] ?? 'Merek Dagang');
                $statusPermohonan = trim($row[8] ?? '(TM) Didaftar');
                $linkSertifikat = trim($row[9] ?? '');

                if (empty($merek) && empty($nomorPermohonan) && empty($nik) && empty($nib)) {
                    continue;
                }

                $totalRows++;

                if (empty($merek)) {
                    $rejectedList[] = [
                        'row' => $rowNumber,
                        'identifier' => 'Merek Kosong',
                        'reason' => 'Nama Merek wajib diisi pada baris ' . $rowNumber
                    ];
                    continue;
                }

                $exists = false;
                if (!empty($nomorPermohonan)) {
                    $exists = DatabaseHkiMerek::where('nomor_permohonan', $nomorPermohonan)->exists();
                } else {
                    $exists = DatabaseHkiMerek::where('merek', $merek)->where('nik', $nik)->exists();
                }

                if ($exists) {
                    $rejectedList[] = [
                        'row' => $rowNumber,
                        'identifier' => !empty($nomorPermohonan) ? "Permohonan: $nomorPermohonan" : "Merek: $merek",
                        'reason' => "Nomor Permohonan HKI / Merek '{$merek}' ({$nomorPermohonan}) sudah ada di database!"
                    ];
                    continue;
                }

                DatabaseHkiMerek::create([
                    'nik' => $nik,
                    'nib' => $nib,
                    'nomor_transaksi' => $nomorTransaksi,
                    'merek' => $merek,
                    'kelas' => $kelas,
                    'nomor_permohonan' => $nomorPermohonan,
                    'link_tanda_daftar' => $linkTandaDaftar,
                    'tipe_permohonan' => $tipePermohonan,
                    'status_permohonan_merek' => $statusPermohonan,
                    'link_sertifikat_merek' => $linkSertifikat,
                ]);

                $successCount++;
            }
        } else {
            foreach ($rows as $index => $row) {
                $rowNumber = $index + 2;
                
                $nik = trim($row[0] ?? '');
                $nib = trim($row[1] ?? '');
                $noDaftar = trim($row[2] ?? '');
                $namaPu = trim($row[3] ?? '');
                $merkDagang = trim($row[4] ?? '');
                $tanggalDaftar = $this->cleanImportDate($row[5] ?? '');
                $status = trim($row[6] ?? 'Terbit');
                $tanggalSertifikat = $this->cleanImportDate($row[7] ?? '');
                $noSertifikat = trim($row[8] ?? '');
                $namaFasilitator = trim($row[9] ?? '');
                $jenisProduk = trim($row[10] ?? '');
                $linkSertifikat = trim($row[11] ?? '');

                if (empty($namaPu) && empty($noSertifikat) && empty($noDaftar) && empty($nik)) {
                    continue;
                }

                $totalRows++;

                if (empty($namaPu)) {
                    $rejectedList[] = [
                        'row' => $rowNumber,
                        'identifier' => 'Nama PU Kosong',
                        'reason' => 'Nama Pelaku Usaha (PU) wajib diisi pada baris ' . $rowNumber
                    ];
                    continue;
                }

                $exists = false;
                if (!empty($noSertifikat)) {
                    $exists = DatabaseHalal::where('no_sertifikat', $noSertifikat)->exists();
                } elseif (!empty($noDaftar)) {
                    $exists = DatabaseHalal::where('no_daftar', $noDaftar)->exists();
                } else {
                    $exists = DatabaseHalal::where('nama_pu', $namaPu)->where('merk_dagang', $merkDagang)->exists();
                }

                if ($exists) {
                    $rejectedList[] = [
                        'row' => $rowNumber,
                        'identifier' => !empty($noSertifikat) ? "No Sertifikat: $noSertifikat" : "Nama PU: $namaPu",
                        'reason' => "Data Halal untuk '{$namaPu}' ({$noSertifikat}) sudah terdaftar di database!"
                    ];
                    continue;
                }

                DatabaseHalal::create([
                    'nik' => $nik,
                    'nib' => $nib,
                    'no_daftar' => $noDaftar,
                    'nama_pu' => $namaPu,
                    'merk_dagang' => $merkDagang,
                    'tanggal_daftar' => $tanggalDaftar,
                    'status' => $status,
                    'tanggal_sertifikat' => $tanggalSertifikat,
                    'no_sertifikat' => $noSertifikat,
                    'nama_fasilitator' => $namaFasilitator,
                    'jenis_produk' => $jenisProduk,
                    'link_sertifikat_halal' => $linkSertifikat,
                ]);

                $successCount++;
            }
        }

        $importResult = [
            'tab' => $tab,
            'total_rows' => $totalRows,
            'success_count' => $successCount,
            'rejected_count' => count($rejectedList),
            'rejected_list' => $rejectedList,
        ];

        return redirect()->route('dukungan.legalitas.database', ['tab' => $tab])
            ->with('import_result', $importResult)
            ->with('success', "Proses import data massal selesai! $successCount data berhasil diimport" . (count($rejectedList) > 0 ? ", " . count($rejectedList) . " data ditolak karena duplikasi." : "."));
    }

    private function cleanImportDate($value)
    {
        if (empty($value) || $value === '-' || $value === 'null') {
            return null;
        }

        $trimmed = trim((string)$value);

        // 1. Serial number Excel (misal 46278)
        if (is_numeric($trimmed) && (float)$trimmed > 10000 && (float)$trimmed < 100000) {
            try {
                return \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject((float)$trimmed)->format('d/m/Y');
            } catch (\Exception $e) {}
        }

        // 2. Format ISO 8601 (2025-12-12T06:27:46Z atau 2025-12-12)
        if (preg_match('/^\d{4}-\d{2}-\d{2}/', $trimmed)) {
            try {
                return \Carbon\Carbon::parse($trimmed)->format('d/m/Y');
            } catch (\Exception $e) {}
        }

        // 3. Format d/m/Y atau d-m-Y
        if (preg_match('/^(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/', $trimmed, $m)) {
            $day = str_pad($m[1], 2, '0', STR_PAD_LEFT);
            $month = str_pad($m[2], 2, '0', STR_PAD_LEFT);
            $year = $m[3];
            return "{$day}/{$month}/{$year}";
        }

        return $trimmed;
    }

    public function legalitasDatabaseUpdate(Request $request, $id)
    {
        $ikm = PetaSebaran::findOrFail($id);

        $ikm->update($request->only([
            'nik',
            'nib',
            'pemilik',
            'nama_merek',
            'nomor_transaksi_hki',
            'kelas_merek',
            'no_hki_merek',
            'link_tanda_daftar_hki',
            'tipe_permohonan_hki',
            'status_hki_merek',
            'link_gdrive_hki_merek',
            'no_daftar_halal',
            'tgl_daftar_halal',
            'status_halal',
            'tgl_sertifikat_halal',
            'no_halal',
            'nama_fasilitator_halal',
            'produk',
            'link_gdrive_halal',
        ]));

        return redirect()->back()->with('success', 'Data database legalitas ' . $ikm->nama_usaha . ' berhasil diperbarui!');
    }

    public function legalitasUpdate(Request $request, $id)
    {
        $ikm = PetaSebaran::findOrFail($id);

        $ikm->update([
            'nib' => $request->input('nib', $ikm->nib),
            'link_gdrive_nib' => $request->input('link_gdrive_nib'),
            'status_halal' => $request->input('status_halal', 'Belum'),
            'no_halal' => $request->input('no_halal'),
            'link_gdrive_halal' => $request->input('link_gdrive_halal'),
            'status_bpom_cppob' => $request->input('status_bpom_cppob', 'Belum'),
            'no_bpom_cppob' => $request->input('no_bpom_cppob'),
            'link_gdrive_bpom_cppob' => $request->input('link_gdrive_bpom_cppob'),
            'status_sni' => $request->input('status_sni', 'Belum'),
            'no_sni' => $request->input('no_sni'),
            'link_gdrive_sni' => $request->input('link_gdrive_sni'),
            'status_hki_merek' => $request->input('status_hki_merek', 'Belum'),
            'no_hki_merek' => $request->input('no_hki_merek'),
            'nama_merek' => $request->input('nama_merek'),
            'tgl_berakhir_hki' => $request->input('tgl_berakhir_hki'),
            'link_gdrive_hki_merek' => $request->input('link_gdrive_hki_merek'),
            'status_tkdn' => $request->input('status_tkdn', 'Belum'),
            'no_sertifikat_tkdn' => $request->input('no_sertifikat_tkdn'),
            'persentase_tkdn' => $request->input('persentase_tkdn'),
            'link_gdrive_tkdn' => $request->input('link_gdrive_tkdn'),
            'tgl_terbit_legalitas' => $request->input('tgl_terbit_legalitas', now()->format('Y-m-d')),
        ]);

        return redirect()->back()->with('success', 'Data legalitas IKM ' . $ikm->nama_usaha . ' berhasil diperbarui!');
    }

    public function legalitasExport(Request $request)
    {
        $jenis = $request->query('jenis');
        $kecamatan = $request->query('kecamatan');
        $search = trim($request->query('search'));

        $filename = 'Data_Legalitas_IKM_Madiun_' . date('Ymd_His') . '.xlsx';

        return Excel::download(
            new \App\Exports\LegalitasExport($jenis, $kecamatan, $search),
            $filename
        );
    }

    public function findIkm(Request $request)
    {
        $query = trim($request->query('query'));
        if (!$query) {
            return response()->json(['success' => false, 'message' => 'Parameter pencarian NIB/NIK tidak boleh kosong.']);
        }

        $ikm = PetaSebaran::where('nib', $query)
            ->orWhere('nik', $query)
            ->orWhere('nama_usaha', 'like', "%{$query}%")
            ->first();

        if (!$ikm) {
            return response()->json(['success' => false, 'message' => 'Data IKM dengan NIB/NIK tersebut tidak ditemukan.']);
        }

        return response()->json(['success' => true, 'data' => $ikm]);
    }

    public function legalitasStore(Request $request)
    {
        $request->validate([
            'nama_usaha' => 'required|string|max:255',
            'pemilik' => 'required|string|max:255',
            'no_hp' => 'nullable|string|max:20',
        ]);

        $existingId = $request->input('ikm_id');
        if ($existingId) {
            $ikm = PetaSebaran::find($existingId);
            if ($ikm) {
                $ikm->update([
                    'nama_usaha' => $request->input('nama_usaha'),
                    'pemilik' => $request->input('pemilik'),
                    'nik' => $request->input('nik'),
                    'no_hp' => $request->input('no_hp'),
                    'kecamatan' => $request->input('kecamatan', $ikm->kecamatan),
                    'kelurahan' => $request->input('kelurahan', $ikm->kelurahan),
                    'nib' => $request->input('nib', $ikm->nib),
                    'link_gdrive_nib' => $request->input('link_gdrive_nib'),
                    'status_halal' => $request->input('status_halal', 'Belum'),
                    'no_halal' => $request->input('no_halal'),
                    'link_gdrive_halal' => $request->input('link_gdrive_halal'),
                    'status_bpom_cppob' => $request->input('status_bpom_cppob', 'Belum'),
                    'no_bpom_cppob' => $request->input('no_bpom_cppob'),
                    'link_gdrive_bpom_cppob' => $request->input('link_gdrive_bpom_cppob'),
                    'status_sni' => $request->input('status_sni', 'Belum'),
                    'no_sni' => $request->input('no_sni'),
                    'link_gdrive_sni' => $request->input('link_gdrive_sni'),
                    'status_hki_merek' => $request->input('status_hki_merek', 'Belum'),
                    'no_hki_merek' => $request->input('no_hki_merek'),
                    'nama_merek' => $request->input('nama_merek'),
                    'tgl_berakhir_hki' => $request->input('tgl_berakhir_hki'),
                    'link_gdrive_hki_merek' => $request->input('link_gdrive_hki_merek'),
                    'status_tkdn' => $request->input('status_tkdn', 'Belum'),
                    'no_sertifikat_tkdn' => $request->input('no_sertifikat_tkdn'),
                    'persentase_tkdn' => $request->input('persentase_tkdn'),
                    'link_gdrive_tkdn' => $request->input('link_gdrive_tkdn'),
                    'tgl_terbit_legalitas' => now()->format('Y-m-d'),
                    'is_legalitas_tracked' => true,
                ]);
                return redirect()->back()->with('success', 'Data legalitas IKM ' . $ikm->nama_usaha . ' berhasil diperbarui!');
            }
        }

        PetaSebaran::create([
            'nama_usaha' => $request->input('nama_usaha'),
            'pemilik' => $request->input('pemilik'),
            'nik' => $request->input('nik'),
            'no_hp' => $request->input('no_hp'),
            'kecamatan' => $request->input('kecamatan', 'Manguharjo'),
            'kelurahan' => $request->input('kelurahan', 'Pangongangan'),
            'alamat_jalan' => $request->input('alamat_jalan', 'Kota Madiun'),
            'kategori' => $request->input('kategori', 'Makanan & Minuman'),
            'investasi' => 0,
            'tenaga_kerja' => 1,
            'latitude' => '-7.6298',
            'longitude' => '111.5239',
            'nib' => $request->input('nib'),
            'link_gdrive_nib' => $request->input('link_gdrive_nib'),
            'status_halal' => $request->input('status_halal', 'Belum'),
            'no_halal' => $request->input('no_halal'),
            'link_gdrive_halal' => $request->input('link_gdrive_halal'),
            'status_bpom_cppob' => $request->input('status_bpom_cppob', 'Belum'),
            'no_bpom_cppob' => $request->input('no_bpom_cppob'),
            'link_gdrive_bpom_cppob' => $request->input('link_gdrive_bpom_cppob'),
            'status_sni' => $request->input('status_sni', 'Belum'),
            'no_sni' => $request->input('no_sni'),
            'link_gdrive_sni' => $request->input('link_gdrive_sni'),
            'status_hki_merek' => $request->input('status_hki_merek', 'Belum'),
            'no_hki_merek' => $request->input('no_hki_merek'),
            'nama_merek' => $request->input('nama_merek'),
            'tgl_berakhir_hki' => $request->input('tgl_berakhir_hki'),
            'link_gdrive_hki_merek' => $request->input('link_gdrive_hki_merek'),
            'status_tkdn' => $request->input('status_tkdn', 'Belum'),
            'no_sertifikat_tkdn' => $request->input('no_sertifikat_tkdn'),
            'persentase_tkdn' => $request->input('persentase_tkdn'),
            'link_gdrive_tkdn' => $request->input('link_gdrive_tkdn'),
            'tgl_terbit_legalitas' => now()->format('Y-m-d'),
            'is_legalitas_tracked' => true,
        ]);


        return redirect()->back()->with('success', 'Data legalitas IKM baru berhasil ditambahkan!');
    }

    public function legalitasDestroy($id)
    {
        $ikm = PetaSebaran::findOrFail($id);
        $namaUsaha = $ikm->nama_usaha;

        $ikm->update([
            'is_legalitas_tracked' => false,
            'link_gdrive_nib' => null,
            'status_halal' => 'Belum',
            'no_halal' => null,
            'link_gdrive_halal' => null,
            'status_bpom_cppob' => 'Belum',
            'no_bpom_cppob' => null,
            'link_gdrive_bpom_cppob' => null,
            'status_sni' => 'Belum',
            'no_sni' => null,
            'link_gdrive_sni' => null,
            'status_hki_merek' => 'Belum',
            'no_hki_merek' => null,
            'nama_merek' => null,
            'tgl_berakhir_hki' => null,
            'link_gdrive_hki_merek' => null,
        ]);

        return redirect()->back()->with('success', 'Data legalitas IKM ' . $namaUsaha . ' berhasil terhapus dari Tracker Legalitas! (Nomor NIB & Profil di Peta Sebaran tetap 100% utuh)');
    }

    // MANAJEMEN TNA (TRAINING NEEDS ASSESSMENT) DIGITAL
    public function tnaDigitalIndex(Request $request)
    {
        $query = \App\Models\TnaDigital::query();

        // Filter Topik Pelatihan
        $topikFilter = $request->query('topik');
        if ($topikFilter) {
            $query->whereJsonContains('topik_pelatihan_prioritas', $topikFilter);
        }

        // Filter Kecamatan
        $kecamatanFilter = $request->query('kecamatan');
        if ($kecamatanFilter) {
            $query->where('kecamatan', $kecamatanFilter);
        }

        // Search Bar
        $search = trim($request->query('search'));
        if ($search) {
            $query->where(function($q) use ($search) {
                $q->where('nama_usaha', 'like', "%{$search}%")
                  ->orWhere('pemilik', 'like', "%{$search}%")
                  ->orWhere('nib', 'like', "%{$search}%")
                  ->orWhere('nik', 'like', "%{$search}%");
            });
        }

        $tnaList = $query->orderBy('created_at', 'desc')->paginate(10)->withQueryString();
        $totalResponden = \App\Models\TnaDigital::count();

        // Topic Queue Distribution Stat & Top Demand #1
        $topicStats = [
            'Pemasaran Digital' => 0,
            'Fasilitasi Sertifikasi (Halal/BPOM/SNI)' => 0,
            'Manajemen Keuangan' => 0,
            'Desain Kemasan' => 0,
            'Manajemen Ekspor' => 0,
        ];

        $allTna = \App\Models\TnaDigital::all();
        $totalKomitmenYa = 0;
        $kendalaCounts = [];

        foreach ($allTna as $item) {
            if (is_array($item->topik_pelatihan_prioritas)) {
                foreach ($item->topik_pelatihan_prioritas as $topik) {
                    if (isset($topicStats[$topik])) {
                        $topicStats[$topik]++;
                    }
                }
            }
            if ($item->komitmen_penerapan === 'Ya') {
                $totalKomitmenYa++;
            }
            if (is_array($item->kendala_operasional)) {
                foreach ($item->kendala_operasional as $k) {
                    $kendalaCounts[$k] = ($kendalaCounts[$k] ?? 0) + 1;
                }
            }
        }

        // Rank Top Demand Topic #1
        $rankedTopics = $topicStats;
        arsort($rankedTopics);
        $topTopicName = array_key_first($rankedTopics) ?: 'Pemasaran Digital';
        $topTopicCount = reset($rankedTopics) ?: 0;

        // Top Kendala #1
        arsort($kendalaCounts);
        $topKendalaName = array_key_first($kendalaCounts) ?: 'Pemasaran/penjualan rendah';

        $komitmenRate = $totalResponden > 0 ? round(($totalKomitmenYa / $totalResponden) * 100) : 100;
        $kecamatanList = PetaSebaran::whereNotNull('kecamatan')->where('kecamatan', '!=', '')->distinct()->pluck('kecamatan');

        // Seed default questions if empty and fetch for admin modal
        \App\Models\TnaPertanyaan::seedDefaults();
        $pertanyaanList = \App\Models\TnaPertanyaan::orderBy('nomor_soal')->get();

        return view('admin.tna_digital', compact(
            'tnaList',
            'totalResponden',
            'topicStats',
            'topTopicName',
            'topTopicCount',
            'topKendalaName',
            'komitmenRate',
            'kecamatanList',
            'pertanyaanList'
        ));
    }

    public function tnaDigitalStore(Request $request)
    {
        $request->validate([
            'nama_usaha' => 'required|string',
            'pemilik' => 'required|string',
        ]);

        $topikPrioritas = $request->input('topik_pelatihan_prioritas', []);
        if (is_array($topikPrioritas) && count($topikPrioritas) > 3) {
            $topikPrioritas = array_slice($topikPrioritas, 0, 3);
        }

        // Generate Automatic Training Queue Tags
        $tags = [];
        if (is_array($topikPrioritas)) {
            foreach ($topikPrioritas as $topik) {
                $tags[] = "Antrean: " . $topik . " (Batch 2026)";
            }
        }

        // Link with PetaSebaran if found
        $ikmId = $request->input('ikm_id');
        if (!$ikmId && ($request->input('nib') || $request->input('nik'))) {
            $matchedIkm = PetaSebaran::where(function($q) use ($request) {
                if ($request->input('nib')) $q->orWhere('nib', $request->input('nib'));
                if ($request->input('nik')) $q->orWhere('nik', $request->input('nik'));
            })->first();
            if ($matchedIkm) {
                $ikmId = $matchedIkm->id;
            }
        }

        $tna = \App\Models\TnaDigital::create([
            'ikm_id' => $ikmId,
            'nama_usaha' => $request->input('nama_usaha'),
            'pemilik' => $request->input('pemilik'),
            'nik' => $request->input('nik'),
            'nib' => $request->input('nib'),
            'no_hp' => $request->input('no_hp'),
            'kecamatan' => $request->input('kecamatan', 'Manguharjo'),
            'kelurahan' => $request->input('kelurahan'),
            'kendala_operasional' => $request->input('kendala_operasional', []),
            'keterampilan_kurang' => $request->input('keterampilan_kurang', []),
            'topik_pelatihan_prioritas' => $topikPrioritas,
            'materi_praktik_spesifik' => $request->input('materi_praktik_spesifik'),
            'kebutuhan_ilmu_baru' => $request->input('kebutuhan_ilmu_baru'),
            'metode_efektif' => $request->input('metode_efektif', 'Kelas tatap muka'),
            'komitmen_penerapan' => $request->input('komitmen_penerapan', 'Ya'),
            'tag_antrean_pelatihan' => $tags,
        ]);

        if ($request->wantsJson() || $request->is('api/*') || $request->ajax()) {
            return response()->json([
                'success' => true,
                'message' => 'TNA Digital telah berhasil dikirim, Terima kasih dan sampai bertemu kembali di pelatihan lainnya.',
                'data' => $tna,
                'tags' => $tags
            ]);
        }

        return redirect()->back()->with('success_tna', [
            'message' => 'Data Anda telah masuk ke dalam antrean pembinaan IKM JUARA. Terus semangat berinovasi!',
            'tags' => $tags,
            'nama_usaha' => $tna->nama_usaha
        ]);
    }

    public function tnaDigitalExport(Request $request)
    {
        $topik = $request->query('topik');
        $kecamatan = $request->query('kecamatan');
        $search = $request->query('search');

        return Excel::download(
            new \App\Exports\TnaDigitalExport($topik, $kecamatan, $search),
            'Rekap_TNA_Digital_IKM_Kota_Madiun_' . date('Y-m-d') . '.xlsx'
        );
    }

    public function tnaDigitalDestroy($id)
    {
        $tna = \App\Models\TnaDigital::findOrFail($id);
        $namaUsaha = $tna->nama_usaha;
        $tna->delete();

        return redirect()->back()->with('success', 'Data assessment TNA Digital IKM ' . $namaUsaha . ' berhasil dihapus!');
    }

    public function tnaDigitalPertanyaanApi()
    {
        \App\Models\TnaPertanyaan::seedDefaults();
        $pertanyaan = \App\Models\TnaPertanyaan::where('is_active', true)
            ->orderBy('nomor_soal', 'asc')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $pertanyaan
        ]);
    }

    public function tnaDigitalPertanyaanUpdate(Request $request)
    {
        $soalInput = $request->input('soal', []);

        foreach ($soalInput as $nomorSoal => $data) {
            $pertanyaan = \App\Models\TnaPertanyaan::where('nomor_soal', $nomorSoal)->first();
            if ($pertanyaan) {
                $teks = trim($data['teks_pertanyaan'] ?? '');
                $opsiRaw = $data['opsi_jawaban'] ?? [];
                
                $opsi = [];
                if (is_array($opsiRaw)) {
                    foreach ($opsiRaw as $o) {
                        $str = trim($o);
                        if ($str !== '') $opsi[] = $str;
                    }
                } elseif (is_string($opsiRaw)) {
                    $lines = explode("\n", $opsiRaw);
                    foreach ($lines as $line) {
                        $str = trim($line);
                        if ($str !== '') $opsi[] = $str;
                    }
                }

                if ($teks !== '') {
                    $pertanyaan->teks_pertanyaan = $teks;
                }
                if ($pertanyaan->jenis_soal !== 'text' && $pertanyaan->jenis_soal !== 'textarea') {
                    $pertanyaan->opsi_jawaban = array_values($opsi);
                }
                $pertanyaan->save();
            }
        }

        return redirect()->back()->with('success', 'Pertanyaan & opsi TNA Digital berhasil diperbarui!');
    }

    public function tnaDigitalPertanyaanReset()
    {
        \App\Models\TnaPertanyaan::resetDefaults();
        return redirect()->back()->with('success', 'Pertanyaan & opsi TNA Digital telah dikembalikan ke pengaturan awal dinas!');
    }

    /*
    |--------------------------------------------------------------------------
    | INTEGRATOR PELAPORAN SIINAS (SIINas Integrator Controller)
    |--------------------------------------------------------------------------
    */
    public function siinasIndex(Request $request)
    {
        $search = $request->input('search');
        $skala = $request->input('skala');
        $kecamatan = $request->input('kecamatan');

        $query = SiinasIndustry::query();

        if (!empty($search)) {
            $query->where(function($q) use ($search) {
                $q->where('nama_perusahaan', 'like', "%{$search}%")
                  ->orWhere('bidang_usaha', 'like', "%{$search}%")
                  ->orWhere('kbli', 'like', "%{$search}%")
                  ->orWhere('alamat_kantor_pusat', 'like', "%{$search}%")
                  ->orWhere('alamat_pabrik', 'like', "%{$search}%");
            });
        }

        if (!empty($skala)) {
            if ($skala === 'Belum Melapor') {
                $query->where('skala_usaha', 'like', '%Belum Melapor%');
            } else {
                $query->where('skala_usaha', $skala);
            }
        }

        if (!empty($kecamatan)) {
            $query->where(function($q) use ($kecamatan) {
                $q->where('alamat_pabrik', 'like', "%{$kecamatan}%")
                  ->orWhere('alamat_kantor_pusat', 'like', "%{$kecamatan}%");
            });
        }

        $totalPerusahaan = SiinasIndustry::count();
        $totalBesarMenengah = SiinasIndustry::where(function($q) {
            $q->where('skala_usaha', 'Besar')->orWhere('skala_usaha', 'Menengah');
        })->count();
        $totalKecil = SiinasIndustry::where('skala_usaha', 'Kecil')->count();
        $totalBelumMelapor = SiinasIndustry::where('skala_usaha', 'like', '%Belum Melapor%')->count();

        $industries = $query->orderBy('id', 'desc')->paginate(15)->withQueryString();


        return view('admin.siinas_dukungan', compact(
            'industries',
            'totalPerusahaan',
            'totalBesarMenengah',
            'totalKecil',
            'totalBelumMelapor',
            'search',
            'skala',
            'kecamatan'
        ));
    }

    public function siinasStore(Request $request)
    {
        $request->validate([
            'nama_perusahaan' => 'required|string|max:255',
            'skala_usaha' => 'required|string',
        ]);

        $maxNo = SiinasIndustry::max('no_urut') ?? 0;

        SiinasIndustry::create([
            'no_urut' => $maxNo + 1,
            'nama_perusahaan' => $request->nama_perusahaan,
            'alamat_kantor_pusat' => $request->alamat_kantor_pusat,
            'provinsi_kantor' => 'Jawa Timur',
            'kabkota_kantor' => 'Kota Madiun',
            'alamat_pabrik' => $request->alamat_pabrik ?? $request->alamat_kantor_pusat,
            'provinsi_pabrik' => 'Jawa Timur',
            'kabkota_pabrik' => 'Kota Madiun',
            'kbli' => $request->kbli,
            'bidang_usaha' => $request->bidang_usaha,
            'tanggal_registrasi' => $request->tanggal_registrasi ?? now()->format('d/m/Y H:i'),
            'skala_usaha' => $request->skala_usaha,
            'status_pelaporan' => $request->status_pelaporan ?? 'Terverifikasi SIINas'
        ]);

        return redirect()->back()->with('success', 'Data Perusahaan SIINas berhasil ditambahkan!');
    }

    public function siinasUpdate(Request $request, $id)
    {
        $industry = SiinasIndustry::findOrFail($id);

        $request->validate([
            'nama_perusahaan' => 'required|string|max:255',
        ]);

        $industry->update([
            'nama_perusahaan' => $request->nama_perusahaan,
            'alamat_kantor_pusat' => $request->alamat_kantor_pusat,
            'alamat_pabrik' => $request->alamat_pabrik,
            'kbli' => $request->kbli,
            'bidang_usaha' => $request->bidang_usaha,
            'tanggal_registrasi' => $request->tanggal_registrasi,
            'skala_usaha' => $request->skala_usaha,
            'status_pelaporan' => $request->status_pelaporan ?? 'Terverifikasi SIINas'
        ]);

        return redirect()->back()->with('success', 'Data Perusahaan SIINas berhasil diperbarui!');
    }

    public function siinasDestroy($id)
    {
        $industry = SiinasIndustry::findOrFail($id);
        $industry->delete();

        return redirect()->back()->with('success', 'Data Perusahaan SIINas berhasil dihapus!');
    }

    public function siinasImport(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls,csv|max:10240'
        ]);

        try {
            $import = new SiinasImport();
            Excel::import($import, $request->file('file'));

            return redirect()->back()->with('success', "Berhasil mengunggah dan mengimpor {$import->successCount} data pelaporan SIINas!");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Gagal mengimpor file Excel/CSV SIINas: ' . $e->getMessage());
        }
    }

    public function siinasExport()
    {
        $fileName = 'Data_Pelaporan_SIINas_Kota_Madiun_' . date('Y-m-d') . '.xlsx';
        $relPath = 'exports/' . $fileName;
        Excel::store(new SiinasExport(), $relPath);
        $fullPath = storage_path('app/' . $relPath);
        
        return response()->download($fullPath, $fileName, [
            'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        ])->deleteFileAfterSend(true);
    }

    public function siinasTemplate()
    {
        $filePath = public_path('downloads/Template_SIINas_Kota_Madiun.xlsx');
        if (file_exists($filePath)) {
            return response()->download($filePath, 'Template_SIINas_Kota_Madiun.xlsx', [
                'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            ]);
        }
        return Excel::download(new SiinasTemplateExport(), 'Template_SIINas_Kota_Madiun.xlsx');
    }




    public function kbliSearch(Request $request)
    {
        $q = trim($request->input('q', ''));
        if (empty($q)) {
            return response()->json([]);
        }

        $results = DB::table('kbli')
            ->where('kode', 'like', "%{$q}%")
            ->orWhere('judul', 'like', "%{$q}%")
            ->limit(20)
            ->get(['kode', 'judul', 'versi']);

        return response()->json($results);
    }

    public function siinasUploadPreview(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls,csv|max:10240'
        ]);

        try {
            $file = $request->file('file');
            $data = Excel::toArray(new \stdClass(), $file);

            if (empty($data) || empty($data[0])) {
                return response()->json([
                    'success' => false,
                    'message' => 'File Excel kosong atau tidak memiliki data.'
                ], 422);
            }

            $rows = $data[0];
            $header = array_shift($rows); // First row as header

            $validData = [];
            $invalidData = [];
            $maxNo = SiinasIndustry::max('no_urut') ?? 0;

            foreach ($rows as $index => $row) {
                $rowNum = $index + 2;
                
                // Map columns dynamically or by index
                $nama = trim($row[1] ?? $row[0] ?? '');
                $alamatPusat = trim($row[2] ?? '');
                $alamatPabrik = trim($row[3] ?? '');
                $kbli = trim($row[4] ?? '');
                $bidangUsaha = trim($row[5] ?? '');
                $tglRegistrasi = trim($row[6] ?? now()->format('d/m/Y H:i'));
                $skala = trim($row[7] ?? 'Kecil');
                $status = trim($row[8] ?? 'Terverifikasi SIINas');

                if (empty($nama)) {
                    $invalidData[] = [
                        'row' => $rowNum,
                        'nama_perusahaan' => $nama ?: '(Nama Perusahaan Kosong)',
                        'skala_usaha' => $skala,
                        'reason' => 'Nama Perusahaan tidak boleh kosong'
                    ];
                    continue;
                }

                $validData[] = [
                    'no_urut' => $maxNo + count($validData) + 1,
                    'nama_perusahaan' => $nama,
                    'alamat_kantor_pusat' => $alamatPusat,
                    'provinsi_kantor' => 'Jawa Timur',
                    'kabkota_kantor' => 'Kota Madiun',
                    'alamat_pabrik' => $alamatPabrik ?: $alamatPusat,
                    'provinsi_pabrik' => 'Jawa Timur',
                    'kabkota_pabrik' => 'Kota Madiun',
                    'kbli' => $kbli,
                    'bidang_usaha' => $bidangUsaha,
                    'tanggal_registrasi' => $tglRegistrasi,
                    'skala_usaha' => $skala ?: 'Kecil',
                    'status_pelaporan' => $status ?: 'Terverifikasi SIINas'
                ];
            }

            // Save preview data to session
            session(['siinas_pending_import' => $validData]);

            return response()->json([
                'success' => true,
                'total_rows' => count($rows),
                'valid_count' => count($validData),
                'invalid_count' => count($invalidData),
                'valid_data' => array_slice($validData, 0, 10), // Sample valid preview
                'invalid_data' => $invalidData
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal membaca file Excel/CSV: ' . $e->getMessage()
            ], 500);
        }
    }

    public function siinasCommitImport(Request $request)
    {
        $validData = session('siinas_pending_import');

        if (empty($validData)) {
            return redirect()->back()->with('error', 'Tidak ada data pratinjau yang siap disimpan.');
        }

        DB::beginTransaction();
        try {
            foreach ($validData as $item) {
                SiinasIndustry::create($item);
            }
            DB::commit();

            session()->forget('siinas_pending_import');

            $count = count($validData);
            return redirect()->back()->with('success', "Selamat! {$count} data perusahaan SIINas berhasil ditambahkan dan disimpan ke database!");
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', 'Gagal menyimpan data ke database: ' . $e->getMessage());
        }
    }

    public function siinasResetData()
    {
        \Illuminate\Support\Facades\Artisan::call('db:seed', ['--class' => 'SiinasSeeder']);
        return redirect()->back()->with('success', 'Data Pelaporan SIINas berhasil di-reset dan di-seed ulang ke data awal 344 perusahaan!');
    }

    // ==========================================
    // REKAP PESERTA & RIWAYAT PELATIHAN DUKUNGAN
    // ==========================================

    public function daftarPesertaIndex(Request $request)
    {
        // 1. Ambil seluruh list_kegiatan (dari http://127.0.0.1:8000/admin/kegiatan)
        $kegiatanList = DB::table('list_kegiatan')
            ->orderBy('id', 'desc')
            ->get()
            ->map(function ($keg) {
                // Hitung real-time jumlah peserta LOLOS yang diinput admin
                $count = DB::table('registrasi_pelatihan')
                    ->whereNull('deleted_at')
                    ->where('nama_kegiatan', $keg->nama_kegiatan)
                    ->where('is_lolos', 1)
                    ->count();
                $keg->terisi = $count;
                $keg->sisa = max(0, ($keg->kuota_peserta ?? 0) - $count);
                $keg->persentase = ($keg->kuota_peserta ?? 0) > 0 
                    ? round(($count / $keg->kuota_peserta) * 100) 
                    : 0;
                return $keg;
            });

        // 2. Ambil seluruh pendaftar LOLOS per kegiatan untuk modal detail
        $pesertaByKegiatan = DB::table('registrasi_pelatihan')
            ->whereNull('deleted_at')
            ->where('is_lolos', 1)
            ->orderBy('created_at', 'desc')
            ->get()
            ->groupBy('nama_kegiatan');

        // 3. Pencarian Riwayat Pelatihan Pelaku Usaha via NIB/NIK
        $searchQuery = trim($request->input('q', ''));
        $searchProfile = null;
        $searchRiwayat = collect();

        if (!empty($searchQuery)) {
            // Cari profil di PetaSebaran atau PelakuUsaha
            $searchProfile = PetaSebaran::where('nib', $searchQuery)
                ->orWhere('nik', $searchQuery)
                ->first();

            if (!$searchProfile) {
                $searchProfile = PelakuUsaha::where('nib', $searchQuery)
                    ->orWhere('nik', $searchQuery)
                    ->first();
            }

            // Ambil seluruh riwayat pelatihan dari registrasi_pelatihan untuk NIB/NIK ini + Detail dari list_kegiatan
            $searchRiwayat = DB::table('registrasi_pelatihan as rp')
                ->leftJoin('list_kegiatan as lk', 'rp.nama_kegiatan', '=', 'lk.nama_kegiatan')
                ->select(
                    'rp.*',
                    'lk.sub_pelaksana',
                    'lk.tgl_mulai',
                    'lk.tgl_selesai',
                    'lk.tempat_kegiatan',
                    'lk.kuota_peserta',
                    'lk.deskripsi_kegiatan',
                    'lk.status as status_kegiatan'
                )
                ->whereNull('rp.deleted_at')
                ->where('rp.is_lolos', 1)
                ->where(function($q) use ($searchQuery) {
                    $q->where('rp.nib', $searchQuery)
                      ->orWhere('rp.nik', $searchQuery);
                })
                ->orderBy('rp.created_at', 'desc')
                ->get();
        }

        // Statistik Keseluruhan
        $totalKegiatan = $kegiatanList->count();
        $totalPendaftar = DB::table('registrasi_pelatihan')->whereNull('deleted_at')->where('is_lolos', 1)->count();
        $totalUniqueIkm = DB::table('registrasi_pelatihan')->whereNull('deleted_at')->where('is_lolos', 1)->distinct('nik')->count('nik');

        return view('admin.daftarpeserta_dukungan', compact(
            'kegiatanList',
            'pesertaByKegiatan',
            'searchQuery',
            'searchProfile',
            'searchRiwayat',
            'totalKegiatan',
            'totalPendaftar',
            'totalUniqueIkm'
        ));
    }

    public function daftarPesertaFindIkm(Request $request)
    {
        $q = trim($request->input('query', ''));
        $kegiatan = trim($request->input('kegiatan', ''));

        if (empty($q)) {
            return response()->json(['success' => false, 'message' => 'Query pencarian kosong.']);
        }

        // 1. Cari terlebih dahulu pendaftaran yang SAMA KEGIATANNYA di registrasi_pelatihan
        $reg = null;
        if (!empty($kegiatan)) {
            $reg = DB::table('registrasi_pelatihan')
                ->whereNull('deleted_at')
                ->where('nama_kegiatan', $kegiatan)
                ->where(function($query) use ($q) {
                    $query->where('nib', $q)
                          ->orWhere('nik', $q)
                          ->orWhere('nama_lengkap', 'like', "%{$q}%")
                          ->orWhere('nama_usaha', 'like', "%{$q}%");
                })
                ->first();
        }

        // 2. Jika tidak ada pendaftaran spesifik kegiatan tersebut, cari pendaftaran dengan NIK/NIB tersebut
        if (!$reg) {
            $reg = DB::table('registrasi_pelatihan')
                ->whereNull('deleted_at')
                ->where(function($query) use ($q) {
                    $query->where('nib', $q)
                          ->orWhere('nik', $q)
                          ->orWhere('nama_lengkap', 'like', "%{$q}%")
                          ->orWhere('nama_usaha', 'like', "%{$q}%");
                })
                ->first();
        }

        if ($reg) {
            return response()->json([
                'success' => true,
                'source'  => 'registrasi_pelatihan',
                'message' => '✓ Data pendaftar ditemukan di Database Pendaftar Pelatihan (/admin/pendaftar)',
                'data'    => [
                    'id'           => $reg->id,
                    'nama_lengkap' => $reg->nama_lengkap,
                    'nama_usaha'   => $reg->nama_usaha,
                    'nik'          => $reg->nik,
                    'nib'          => $reg->nib,
                    'whatsapp'     => $reg->whatsapp,
                    'alamat_usaha' => $reg->alamat_usaha,
                    'kecamatan'    => $reg->kecamatan,
                    'kelurahan'    => $reg->kelurahan,
                    'produk'       => $reg->produk_diproduksi ?? '-',
                    'email'        => $reg->email ?? '-',
                    'is_lolos'     => $reg->is_lolos
                ]
            ]);
        }

        // 3. Fallback pencarian di PetaSebaran IKM jika belum mendaftar online
        $ikm = PetaSebaran::where('nib', $q)
            ->orWhere('nik', $q)
            ->orWhere('pemilik', 'like', "%{$q}%")
            ->orWhere('nama_usaha', 'like', "%{$q}%")
            ->first();

        if ($ikm) {
            return response()->json([
                'success' => true,
                'source'  => 'peta_sebaran',
                'message' => '⚠️ Pelaku usaha ini terdaftar di Peta Sebaran IKM, namun belum mengisi formulir pendaftaran online (/daftar).',
                'data'    => [
                    'id'           => null,
                    'nama_lengkap' => $ikm->pemilik,
                    'nama_usaha'   => $ikm->nama_usaha,
                    'nik'          => $ikm->nik,
                    'nib'          => $ikm->nib,
                    'whatsapp'     => $ikm->no_hp,
                    'alamat_usaha' => $ikm->alamat_jalan,
                    'kecamatan'    => $ikm->kecamatan,
                    'kelurahan'    => $ikm->kelurahan,
                    'produk'       => $ikm->produk,
                    'email'        => '-',
                    'is_lolos'     => 0
                ]
            ]);
        }

        return response()->json(['success' => false, 'message' => 'Data pendaftar atau pelaku usaha tidak ditemukan.']);
    }

    public function daftarPesertaStore(Request $request)
    {
        $request->validate([
            'nama_kegiatan' => 'required|string',
            'nik'           => 'required|string|size:16',
            'nib'           => 'required|string',
            'nama_lengkap'  => 'required|string|max:255',
            'nama_usaha'    => 'required|string|max:255',
            'whatsapp'      => 'required|string|max:50',
            'alamat_usaha'  => 'required|string',
            'kecamatan'     => 'required|string',
            'kelurahan'     => 'required|string',
        ]);

        // 1. CARI EXACT MATCH: Pendaftaran yang SAMA KEGIATANNYA & NIK/NIB nya SAMA
        $exactMatch = DB::table('registrasi_pelatihan')
            ->whereNull('deleted_at')
            ->where('nama_kegiatan', $request->nama_kegiatan)
            ->where(function($q) use ($request) {
                $q->where('nik', $request->nik)
                  ->orWhere('nib', $request->nib);
            })
            ->first();

        if ($exactMatch) {
            if ($exactMatch->is_lolos == 1) {
                return redirect()->back()->with('error', "Peserta atas nama '{$request->nama_lengkap}' (NIK: {$request->nik}) SUDAH DILOLOSKAN dalam kegiatan '{$request->nama_kegiatan}'.");
            } else {
                // Update status is_lolos = 1 pada baris pendaftaran kegiatan yang cocok
                DB::table('registrasi_pelatihan')
                    ->where('id', $exactMatch->id)
                    ->update([
                        'is_lolos'     => 1,
                        'nama_lengkap' => $request->nama_lengkap,
                        'nama_usaha'   => $request->nama_usaha,
                        'whatsapp'     => $request->whatsapp,
                        'alamat_usaha' => $request->alamat_usaha,
                        'kecamatan'    => $request->kecamatan,
                        'kelurahan'    => $request->kelurahan,
                        'updated_at'   => now()
                    ]);

                return redirect()->back()->with('success', "🎉 Status kelolosan peserta '{$request->nama_lengkap}' ({$request->nama_usaha}) berhasil diaktifkan untuk kegiatan '{$request->nama_kegiatan}'!");
            }
        }

        // 2. JIKA TIDAK ADA EXACT MATCH, CARI PENDAFTARAN DENGAN NIK/NIB TERSEBUT YANG BELUM DILOLOSKAN (is_lolos = 0)
        $unapprovedMatch = DB::table('registrasi_pelatihan')
            ->whereNull('deleted_at')
            ->where('is_lolos', 0)
            ->where(function($q) use ($request) {
                $q->where('nik', $request->nik)
                  ->orWhere('nib', $request->nib);
            })
            ->first();

        if ($unapprovedMatch) {
            // Update pendaftaran is_lolos = 0 tersebut menjadi nama_kegiatan ini dan is_lolos = 1
            DB::table('registrasi_pelatihan')
                ->where('id', $unapprovedMatch->id)
                ->update([
                    'is_lolos'      => 1,
                    'nama_kegiatan' => $request->nama_kegiatan,
                    'nama_lengkap'  => $request->nama_lengkap,
                    'nama_usaha'    => $request->nama_usaha,
                    'whatsapp'      => $request->whatsapp,
                    'alamat_usaha'  => $request->alamat_usaha,
                    'kecamatan'     => $request->kecamatan,
                    'kelurahan'     => $request->kelurahan,
                    'updated_at'    => now()
                ]);

            return redirect()->back()->with('success', "🎉 Status kelolosan peserta '{$request->nama_lengkap}' ({$request->nama_usaha}) berhasil diaktifkan untuk kegiatan '{$request->nama_kegiatan}'!");
        }

        // 3. JIKA SELURUH PENDAFTARAN TERKAIT NIK/NIB TERSEBUT SUDAH IS_LOLOS = 1 PADA KEGIATAN LAIN:
        $anyMatch = DB::table('registrasi_pelatihan')
            ->whereNull('deleted_at')
            ->where(function($q) use ($request) {
                $q->where('nik', $request->nik)
                  ->orWhere('nib', $request->nib);
            })
            ->exists();

        if ($anyMatch) {
            return redirect()->back()->with('error', "⚠️ Peserta atas nama '{$request->nama_lengkap}' (NIK: {$request->nik}) sudah diloloskan pada kegiatan lain. Untuk meloloskan pada kegiatan '{$request->nama_kegiatan}', pastikan pendaftar mendaftar online untuk kegiatan '{$request->nama_kegiatan}' via /daftar terlebih dahulu.");
        }

        // 4. JIKA BELUM MENDAFTAR SAMA SEKALI DI DATABASE PENDAFTAR (/admin/pendaftar)
        return redirect()->back()->with('error', "⚠️ Pelaku Usaha atas nama '{$request->nama_lengkap}' (NIK: {$request->nik}) BELUM TERDAFTAR di Database Pendaftar (/admin/pendaftar). Pendaftar wajib mendaftar online terlebih dahulu melalui formulir pendaftaran (/daftar).");
    }

    public function daftarPesertaDestroy($id)
    {
        $peserta = DB::table('registrasi_pelatihan')->where('id', $id)->first();
        if ($peserta) {
            $nama = $peserta->nama_lengkap;
            $usaha = $peserta->nama_usaha;
            $kegiatan = $peserta->nama_kegiatan;

            // BUKAN DIHAPUS DARI DATABASE, TETAPI HANYA MENGUBAH STATUS IS_LOLOS = 0
            DB::table('registrasi_pelatihan')
                ->where('id', $id)
                ->update(['is_lolos' => 0, 'updated_at' => now()]);

            return redirect()->back()->with('success', "🗑️ Status kelolosan peserta '{$nama}' ({$usaha}) pada kegiatan '{$kegiatan}' berhasil dibatalkan. Data pendaftar awal tetap utuh tersimpan di /admin/pendaftar.");
        }

        return redirect()->back()->with('error', 'Data peserta tidak ditemukan.');
    }

    public function daftarPesertaExportKegiatan(Request $request)
    {
        $namaKegiatan = trim($request->input('nama_kegiatan', ''));

        if (empty($namaKegiatan)) {
            return redirect()->back()->with('error', 'Nama kegiatan tidak dipilih.');
        }

        $peserta = DB::table('registrasi_pelatihan')
            ->whereNull('deleted_at')
            ->where('nama_kegiatan', $namaKegiatan)
            ->where('is_lolos', 1)
            ->orderBy('created_at', 'desc')
            ->get();

        $exportData = [];
        foreach ($peserta as $idx => $p) {
            $exportData[] = [
                'no'           => $idx + 1,
                'kegiatan'     => $p->nama_kegiatan,
                'nama_pemilik' => $p->nama_lengkap,
                'nama_usaha'   => $p->nama_usaha,
                'nib'          => $p->nib,
                'nik'          => $p->nik,
                'whatsapp'     => $p->whatsapp,
                'alamat_usaha' => $p->alamat_usaha,
                'kelurahan'    => $p->kelurahan,
                'kecamatan'    => $p->kecamatan,
                'tgl_lolos'    => \Carbon\Carbon::parse($p->created_at)->format('d/m/Y H:i'),
            ];
        }

        $slugKegiatan = \Illuminate\Support\Str::slug($namaKegiatan, '_');
        $fileName = "Daftar_Peserta_Lolos_{$slugKegiatan}.xlsx";

        return Excel::download(new class($exportData) implements \Maatwebsite\Excel\Concerns\FromArray, \Maatwebsite\Excel\Concerns\WithHeadings, \Maatwebsite\Excel\Concerns\ShouldAutoSize {
            protected $data;
            public function __construct($data) { $this->data = $data; }
            public function array(): array { return $this->data; }
            public function headings(): array {
                return [
                    'No',
                    'Nama Kegiatan Pelatihan',
                    'Nama Pemilik / Peserta',
                    'Nama Usaha / Perusahaan',
                    'NIB',
                    'NIK',
                    'No. WhatsApp / HP',
                    'Alamat Usaha',
                    'Kelurahan',
                    'Kecamatan',
                    'Tanggal Didaftarkan / Lolos'
                ];
            }
        }, $fileName);
    }
}


