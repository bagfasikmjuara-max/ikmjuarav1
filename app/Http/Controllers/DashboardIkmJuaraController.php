<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\PetaSebaran;
use App\Models\Konsultasi;
use App\Models\UsulanPerubahan;
use App\Models\PelakuUsaha;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class DashboardIkmJuaraController extends Controller
{
    public function index()
    {
        // 1. Statistik Utama dari Database Peta Sebaran Dukungan
        $totalIkm = PetaSebaran::count();
        
        // 2. Distribusi Skala Usaha
        $skalaUsaha = PetaSebaran::select('skala_usaha', DB::raw('count(*) as total'))
            ->whereNotNull('skala_usaha')
            ->where('skala_usaha', '!=', '')
            ->groupBy('skala_usaha')
            ->get();

        // 3. Distribusi per Kecamatan
        $perKecamatan = PetaSebaran::select('kecamatan', DB::raw('count(*) as total'))
            ->whereNotNull('kecamatan')
            ->where('kecamatan', '!=', '')
            ->groupBy('kecamatan')
            ->orderByDesc('total')
            ->get();

        // 4. Legalitas (NIB & NIK)
        $legalitas = [
            'nib' => PetaSebaran::whereNotNull('nib')->where('nib', '!=', '')->count(),
            'nik' => PetaSebaran::whereNotNull('nik')->where('nik', '!=', '')->count(),
            'halal' => 0,
            'bpom' => 0,
            'cppob' => 0,
            'sni' => 0,
        ];

        // 5. Konsultasi
        $totalKonsultasi = Konsultasi::count();
        $konsultasiDijawab = Konsultasi::whereIn('status', ['Sudah Dijawab', 'Selesai'])->count();
        $konsultasiBelum = Konsultasi::where('status', 'Belum Dijawab')->count();

        // 6. IKM Tersertifikasi / Punya Legalitas NIB
        $ikmTersertifikasi = PetaSebaran::whereNotNull('nib')->where('nib', '!=', '')->count();
        $persenTersertifikasi = $totalIkm > 0 ? round(($ikmTersertifikasi / $totalIkm) * 100, 1) : 0;

        // 7. Distribusi Tingkat Risiko
        $tingkatRisiko = PetaSebaran::select('tingkat_risiko', DB::raw('count(*) as total'))
            ->whereNotNull('tingkat_risiko')
            ->where('tingkat_risiko', '!=', '')
            ->groupBy('tingkat_risiko')
            ->get();

        // 8. Distribusi per Kelurahan
        $perKelurahan = PetaSebaran::select('kelurahan', DB::raw('count(*) as total'))
            ->whereNotNull('kelurahan')
            ->where('kelurahan', '!=', '')
            ->groupBy('kelurahan')
            ->orderByDesc('total')
            ->get();

        // 9. Aggregat Dasar
        $totalTenagaKerja = PetaSebaran::sum('tenaga_kerja');
        $totalInvestasi = PetaSebaran::sum('investasi');

        // 10. Jumlah kecamatan unik
        $jumlahKecamatan = PetaSebaran::whereNotNull('kecamatan')
            ->where('kecamatan', '!=', '')
            ->distinct('kecamatan')
            ->count('kecamatan');

        // 11. Kategori Industri (Pangan, Sandang, Kimia, Kriya, Logam)
        $perKategori = PetaSebaran::select('kategori', DB::raw('count(*) as total'))
            ->whereNotNull('kategori')
            ->where('kategori', '!=', '')
            ->groupBy('kategori')
            ->orderByDesc('total')
            ->get();

        // 12. SIINas readiness (IKM yang punya NIB)
        $siinasReady = PetaSebaran::whereNotNull('nib')->where('nib', '!=', '')->count();
        $persenSiinas = $totalIkm > 0 ? round(($siinasReady / $totalIkm) * 100, 1) : 0;

        // 13. TNA Pertanyaan List
        \App\Models\TnaPertanyaan::seedDefaults();
        $tnaPertanyaanList = \App\Models\TnaPertanyaan::where('is_active', true)->orderBy('nomor_soal')->get();

        return view('dashboardikmjuara', compact(
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
            'siinasReady',
            'persenSiinas',
            'tnaPertanyaanList'
        ));
    }

    public function cariIkm(Request $request)
    {
        $query = trim($request->query('query'));
        $mode = trim($request->query('mode', 'all'));

        if (empty($query)) {
            return response()->json(['success' => false, 'message' => 'Kata kunci penelusuran tidak boleh kosong.']);
        }

        // Cari di PetaSebaran (/dukungan/sebaran)
        $ikmQuery = PetaSebaran::query();

        if ($mode === 'nib') {
            $ikmQuery->where('nib', $query);
        } elseif ($mode === 'nik') {
            $ikmQuery->where('nik', $query);
        } elseif ($mode === 'nama') {
            $ikmQuery->where(function($q) use ($query) {
                $q->where('pemilik', 'like', "%{$query}%")
                  ->orWhere('nama_usaha', 'like', "%{$query}%");
            });
        } else {
            $ikmQuery->where(function($q) use ($query) {
                $q->where('nib', $query)
                  ->orWhere('nik', $query)
                  ->orWhere('pemilik', 'like', "%{$query}%")
                  ->orWhere('nama_usaha', 'like', "%{$query}%");
            });
        }

        $ikm = $ikmQuery->first();

        if (!$ikm) {
            $msg = 'Data pelaku usaha tidak ditemukan pada Database IKM Terintegrasi.';
            if ($mode === 'nib') $msg = 'NIB (' . $query . ') tidak ditemukan pada Database IKM Terintegrasi.';
            if ($mode === 'nik') $msg = 'NIK (' . $query . ') tidak ditemukan pada Database IKM Terintegrasi.';
            if ($mode === 'nama') $msg = 'Pelaku Usaha / Usaha "' . $query . '" tidak ditemukan pada Database IKM Terintegrasi.';

            return response()->json(['success' => false, 'message' => $msg]);
        }

        // Cari usulan perubahan terakhir untuk NIB/NIK ini
        $usulan = UsulanPerubahan::where(function($q) use ($ikm) {
            if (!empty($ikm->nib)) $q->orWhere('nib', $ikm->nib);
            if (!empty($ikm->nik)) $q->orWhere('nik', $ikm->nik);
        })
        ->latest()
        ->first();

        $status_usulan = null;
        $catatan_admin = null;
        if ($usulan) {
            $status_usulan = $usulan->status_usulan;
            $catatan_admin = $usulan->catatan_admin;
        }

        // Ambil riwayat konsultasi untuk NIK/Nama Usaha ini
        $konsultasiList = Konsultasi::with('messages')->where(function($q) use ($ikm) {
            if (!empty($ikm->nik)) {
                $q->orWhere('nik', $ikm->nik);
            }
            if (!empty($ikm->nama_usaha)) {
                $q->orWhere('nama_ikm', $ikm->nama_usaha);
            }
            if (!empty($ikm->pemilik)) {
                $q->orWhere('nama_ikm', $ikm->pemilik);
            }
        })
        ->orderBy('created_at', 'desc')
        ->get();

        // Ambil riwayat TNA Digital untuk NIB/NIK/Nama Usaha ini
        $tnaLatest = \App\Models\TnaDigital::where(function($q) use ($ikm) {
            if (!empty($ikm->id)) $q->orWhere('ikm_id', $ikm->id);
            if (!empty($ikm->nib)) $q->orWhere('nib', $ikm->nib);
            if (!empty($ikm->nik)) $q->orWhere('nik', $ikm->nik);
        })
        ->latest()
        ->first();

        return response()->json([
            'success' => true,
            'data' => $ikm,
            'status_usulan' => $status_usulan,
            'catatan_admin' => $catatan_admin,
            'usulan' => $usulan,
            'konsultasi' => $konsultasiList,
            'tna' => $tnaLatest
        ]);
    }

    public function usulUbahIkm(Request $request)
    {
        $request->validate([
            'peta_sebaran_id' => 'nullable',
            'nib' => 'required|string',
            'nik' => 'required|string',
            'nama_usaha' => 'required|string|max:255',
            'pemilik' => 'required|string|max:255',
            'no_hp' => 'nullable|string|max:50',
            'produk' => 'nullable|string|max:255',
            'alamat_jalan' => 'required|string',
            'kecamatan' => 'required|string|max:100',
            'kelurahan' => 'required|string|max:100',
            'kategori' => 'required|string|max:100',
            'skala_usaha' => 'nullable|string|max:100',
            'tingkat_risiko' => 'nullable|string|max:100',
            'kbli' => 'nullable|string|max:20',
            'uraian_kbli' => 'nullable|string',
            'investasi' => 'nullable',
            'tenaga_kerja' => 'nullable',
            'latitude' => 'nullable|string|max:50',
            'longitude' => 'nullable|string|max:50',
            'status_halal' => 'nullable|string|max:100',
            'no_halal' => 'nullable|string|max:100',
            'status_bpom_cppob' => 'nullable|string|max:100',
            'no_bpom_cppob' => 'nullable|string|max:100',
            'status_sni' => 'nullable|string|max:100',
            'no_sni' => 'nullable|string|max:100',
            'status_hki_merek' => 'nullable|string|max:100',
            'no_hki_merek' => 'nullable|string|max:100',
            'nama_merek' => 'nullable|string|max:255',
        ]);

        $petaId = $request->input('peta_sebaran_id');

        // Sanitize numeric fields
        $rawInv = $request->input('investasi');
        $investasi = 0;
        if ($rawInv !== null && $rawInv !== '') {
            $cleanInv = str_replace(',', '.', str_replace('.', '', (string)$rawInv));
            if (!is_numeric($cleanInv)) {
                $cleanInv = preg_replace('/[^0-9.]/', '', (string)$rawInv);
            }
            $investasi = (float)$cleanInv;
        }

        $rawTk = $request->input('tenaga_kerja');
        $tenagaKerja = 1;
        if ($rawTk !== null && $rawTk !== '') {
            $tenagaKerja = (int)preg_replace('/[^0-9]/', '', (string)$rawTk);
        }

        $pelaku = PelakuUsaha::where('nib', $request->nib)->orWhere('nik', $request->nik)->first();
        $actualPelakuId = $pelaku ? $pelaku->id : ($petaId ?: null);

        // Buat usulan baru di UsulanPerubahan
        UsulanPerubahan::create([
            'pelaku_usaha_id' => $actualPelakuId,
            'tipe_usulan' => $petaId ? 'perubahan' : 'baru',
            'nib' => $request->nib,
            'nik' => $request->nik,
            'nama_pemilik' => $request->pemilik,
            'nama_perusahaan' => $request->nama_usaha,
            'no_telp' => $request->no_hp,
            'alamat_usaha' => $request->alamat_jalan,
            'kecamatan' => $request->kecamatan,
            'kelurahan' => $request->kelurahan,
            'skala_usaha' => $request->skala_usaha,
            'jenis_perusahaan' => $request->kategori,
            'tingkat_risiko' => $request->tingkat_risiko,
            'kbli' => $request->kbli,
            'uraian_kbli' => $request->uraian_kbli,
            'investasi' => $investasi,
            'tenaga_kerja' => $tenagaKerja,
            'latitude' => $request->latitude,
            'longitude' => $request->longitude,
            'nama_proyek' => $request->produk,
            'status_usulan' => 'pending',
        ]);

        $message = $petaId 
            ? 'Usulan perubahan data profil berhasil dikirim dan sedang dalam tahap antrian verifikasi admin dinas.'
            : 'Pendaftaran pelaku usaha baru berhasil dikirim dan sedang dalam tahap antrian verifikasi admin dinas.';

        return response()->json([
            'success' => true,
            'message' => $message
        ]);
    }

    // HALAMAN CEK LEGALITAS MANDIRI IKM
    public function cekMandiri()
    {
        $adminWaNumber = env('ADMIN_WA_NUMBER', '085655480223');
        $adminWaFormatted = preg_replace('/^0/', '62', preg_replace('/[^0-9]/', '', $adminWaNumber));

        return view('dashboard_cek_mandiri', compact(
            'adminWaNumber',
            'adminWaFormatted'
        ));
    }

    // API CEK LEGALITAS MANDIRI REAL-TIME (KETAT: HANYA 13-DIGIT NIB ATAU 16-DIGIT NIK)
    public function apiCekMandiri(Request $request)
    {
        $q = preg_replace('/[^0-9]/', '', trim($request->query('q', '')));

        if (empty($q)) {
            return response()->json([
                'success' => false,
                'message' => 'Kata kunci pencarian kosong.',
                'data' => []
            ]);
        }

        // Keamanan Data Personal: Hanya mencari jika NIB (13 digit) atau NIK (16 digit) tepat & identik
        $len = strlen($q);
        if ($len !== 13 && $len !== 16) {
            return response()->json([
                'success' => false,
                'message' => 'Demi keamanan data personal, masukkan 13 digit NIB atau 16 digit NIK secara lengkap.',
                'data' => []
            ]);
        }

        $results = PetaSebaran::where(function($query) use ($q, $len) {
            if ($len === 13) {
                $query->where('nib', $q);
            } elseif ($len === 16) {
                $query->where('nik', $q);
            }
        })->get();

        $dataFormatted = $results->map(function($ikm) {
            $hasNib = !empty($ikm->nib) && strlen($ikm->nib) >= 10;
            $hasHalal = (!empty($ikm->status_halal) && strcasecmp($ikm->status_halal, 'Ada') === 0) || !empty($ikm->no_halal);
            $hasHki = (!empty($ikm->status_hki_merek) && (strcasecmp($ikm->status_hki_merek, 'Terdaftar') === 0 || strcasecmp($ikm->status_hki_merek, 'Ada') === 0)) || !empty($ikm->no_hki_merek);

            return [
                'id' => $ikm->id,
                'nama_usaha' => $ikm->nama_usaha,
                'pemilik' => $ikm->pemilik,
                'nib' => $ikm->nib ?? '-',
                'nik' => $ikm->nik ?? '-',
                'no_hp' => $ikm->no_hp ?? '-',
                'produk' => $ikm->produk ?? '-',
                'alamat_jalan' => $ikm->alamat_jalan ?? '-',
                'alamat_no' => $ikm->alamat_no ?? '-',
                'kelurahan' => $ikm->kelurahan ?? '-',
                'kecamatan' => $ikm->kecamatan ?? '-',
                'kategori' => $ikm->kategori ?? 'Pangan',
                'skala_usaha' => $ikm->skala_usaha ?? 'Mikro',
                'tingkat_risiko' => $ikm->tingkat_risiko ?? 'Rendah',
                'legalitas' => [
                    'nib' => [
                        'status' => $hasNib ? 'Ada' : 'Belum Memiliki',
                        'value' => $ikm->nib ?? '-',
                        'is_valid' => $hasNib,
                        'link_gdrive' => $ikm->link_gdrive_nib ?? null,
                    ],
                    'halal' => [
                        'status' => $ikm->status_halal ?? ($hasHalal ? 'Ada' : 'Belum Memiliki'),
                        'value' => $ikm->no_halal ?? ($hasHalal ? 'Terdaftar' : 'Belum Ada'),
                        'is_valid' => $hasHalal,
                        'link_gdrive' => $ikm->link_gdrive_halal ?? null,
                    ],
                    'hki' => [
                        'status' => $ikm->status_hki_merek ?? ($hasHki ? 'Terdaftar' : 'Belum Memiliki'),
                        'value' => $ikm->no_hki_merek ?? ($hasHki ? 'Terdaftar' : 'Belum Ada'),
                        'nama_merek' => $ikm->nama_merek ?? $ikm->nama_usaha,
                        'tgl_berakhir' => $ikm->tgl_berakhir_hki ? date('d-m-Y', strtotime($ikm->tgl_berakhir_hki)) : null,
                        'is_valid' => $hasHki,
                        'link_gdrive' => $ikm->link_gdrive_hki_merek ?? null,
                    ]
                ]
            ];
        });

        return response()->json([
            'success' => true,
            'count' => $dataFormatted->count(),
            'data' => $dataFormatted
        ]);
    }
}
