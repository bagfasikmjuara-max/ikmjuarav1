<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Konsultasi;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\IKMImport;
use App\Exports\IKMExport;

class IKMController extends Controller
{
    // Method untuk Dashboard Admin (FITUR TETAP JAGA)
    public function dashboardAdmin() {
        $totalIkm = DB::table('pelaku_usaha')->count();
        $totalAdmin = DB::table('users')->count();
        $totalKegiatan = DB::table('list_kegiatan')->count();
        $totalPendaftar = DB::table('registrasi_pelatihan')->count();
        $Kelurahan = DB::table('pelaku_usaha')
                ->select('kelurahan', DB::raw('count(*) as total'))
                ->groupBy('kelurahan')
                ->get();

        // Perbaikan: variabel yang di-compact harus sesuai dengan nama variabel di atas ($totalIkm)
        return view('admin.dashboard', compact(
            'totalIkm', 'totalAdmin', 'totalKegiatan', 'totalPendaftar', 'Kelurahan'
        ));
    }

    // Method untuk Halaman Data IKM (FITUR TETAP JAGA)
    public function dataIkmAdmin() {
        $totalinvestasi = DB::table('pelaku_usaha')->sum('investasi');
        $totalTenagaKerja = DB::table('pelaku_usaha')->sum('tenaga_kerja');
        $totalSemuaData = DB::table('pelaku_usaha')->count(); 
        $totalPelakuUnik = DB::table('pelaku_usaha')->select('nib')->distinct()->count();
        $data = DB::table('pelaku_usaha')->orderBy('id', 'desc')->get();

        return view('admin.pelaku_usaha.index', compact(
            'data', 'totalinvestasi', 'totalTenagaKerja', 'totalSemuaData', 'totalPelakuUnik'
        ));
    }

    // Method Index (Tetap ada sebagai cadangan/default)
    public function index() {
        $totalIkm = DB::table('pelaku_usaha')->count();
        $latestData = DB::table('pelaku_usaha')->latest('updated_at')->first();
        $terakhirUpdate = $latestData ? $latestData->updated_at : now();
        $dataChart = [
            'Kartoharjo' => DB::table('pelaku_usaha')->where('kecamatan', 'Kartoharjo')->count(),
            'Manguharjo' => DB::table('pelaku_usaha')->where('kecamatan', 'Manguharjo')->count(),
            'Taman'      => DB::table('pelaku_usaha')->where('kecamatan', 'Taman')->count(),
        ];
        $berita = DB::table('publikasi')->latest()->take(10)->get();
      
        return view('welcome', compact('totalIkm', 'berita', 'terakhirUpdate', 'dataChart'));
    }

    public function halamanStatistik()
    {
        $stats = DB::table('statistik_kecamatan')->get();
        $firstStat = DB::table('statistik_kecamatan')->first();
        
        $dbCounts = DB::table('pelaku_usaha')
            ->select('kecamatan', DB::raw('count(*) as total'))
            ->groupBy('kecamatan')
            ->pluck('total', 'kecamatan');

        return view('admin.statistik', compact('stats', 'firstStat', 'dbCounts'));
    }

    // Import & Export (FITUR TETAP JAGA)
    public function import(Request $request) 
    {
        $request->validate(['file' => 'required|mimes:xlsx,xls']);
        Excel::import(new IKMImport, $request->file('file'));
        return redirect()->back()->with('success', 'Data Berhasil Diimport!');
    }

    public function export() 
    {
        return Excel::download(new IKMExport, 'data-ikm.xlsx');
    }

    /**
     * OPTIMASI FINAL: Method untuk mengambil data Manual 460
     * Memastikan kolom yang diambil adalah 'jumlah_ikm', bukan 'jumlah'
     */
    public function getStatistikManual() {
        // KOREKSI DISINI: Pastikan mengambil kolom 'jumlah_ikm'
        $statsData = DB::table('statistik_kecamatan')->pluck('jumlah_ikm', 'kecamatan');

        $dataChartManual = [
            'Kartoharjo' => $statsData['Kartoharjo'] ?? 0,
            'Manguharjo' => $statsData['Manguharjo'] ?? 0,
            'Taman'      => $statsData['Taman'] ?? 0,
        ];

        $totalIkmManual = array_sum($dataChartManual);
        $berita = DB::table('publikasi')->latest()->take(10)->get();
        $latestUpdate = DB::table('statistik_kecamatan')->latest('updated_at')->first();
        $terakhirUpdateManual = $latestUpdate ? $latestUpdate->updated_at : now();

        // Ambil statistik website dari baris pertama statistik_kecamatan
        $firstRow = DB::table('statistik_kecamatan')->first();
        $ikmTerdaftar = $firstRow->ikm_terdaftar ?? 560;

        $kunjunganHariIni = (int)($firstRow->kunjungan_hari_ini ?? 26);
        $kunjunganBulanIni = (int)($firstRow->kunjungan_bulan_ini ?? 148);
        $kunjunganTahunIni = (int)($firstRow->kunjungan_tahun_ini ?? 4423);
        $kunjunganTahunLalu = (int)($firstRow->kunjungan_tahun_lalu ?? 0);

        // Pengunjung Aktif otomatis pembulatan dari 30% pengunjung hari ini
        $pengunjungAktif = (int)round($kunjunganHariIni * 0.30);

        // Total Kunjungan merupakan akumulasi dari: hari ini + bulan ini + tahun ini + tahun n-1
        $kunjunganTotal = $kunjunganHariIni + $kunjunganBulanIni + $kunjunganTahunIni + $kunjunganTahunLalu;
        $totalKunjungan = $kunjunganTotal;

        // Fallback default social media resmi jika database kosong
        $defaultSosmed = [
            ['platform' => 'Instagram', 'username' => '@disnakerkukm.madiunkota', 'url' => 'https://www.instagram.com/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn'],
            ['platform' => 'Instagram', 'username' => '@perindustrian.kotamadiun', 'url' => 'https://www.instagram.com/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs'],
            ['platform' => 'Facebook', 'username' => 'Disnakerkukm Kota Madiun', 'url' => 'https://www.facebook.com/share/19RgNeZgVq/'],
            ['platform' => 'TikTok', 'username' => '@disnakerkukmkotamadiun', 'url' => 'https://vm.tiktok.com/ZS9hYefCLguks-CQgR6/'],
            ['platform' => 'X', 'username' => '@DisnakerKUKM', 'url' => 'https://x.com/DisnakerKUKM'],
        ];

        $rawSosmed = $firstRow->sosial_media ?? null;
        if (is_string($rawSosmed)) {
            $sosialMedia = json_decode($rawSosmed, true);
        } elseif (is_array($rawSosmed)) {
            $sosialMedia = $rawSosmed;
        } else {
            $sosialMedia = [];
        }

        if (empty($sosialMedia)) {
            $sosialMedia = $defaultSosmed;
        }

        $telpDinas = $firstRow->telp_dinas ?? '(0351) 454288';
        $emailDinas = $firstRow->email_dinas ?? 'disnaker@madiunkota.go.id';

        // Compact semua variabel agar tidak ada error 'Undefined Variable' di Blade
        return view('welcome', compact(
            'dataChartManual', 
            'totalIkmManual', 
            'terakhirUpdateManual', 
            'berita',
            'totalKunjungan',
            'pengunjungAktif',
            'ikmTerdaftar',
            'kunjunganHariIni',
            'kunjunganBulanIni',
            'kunjunganTahunIni',
            'kunjunganTotal',
            'sosialMedia',
            'telpDinas',
            'emailDinas'
        ));
    }

    public function updateStatistik(Request $request)
    {
        try {
            // Loop dan Update berdasarkan ID untuk statistik kecamatan (jika ada)
            $dataStats = $request->input('stats');
            if ($dataStats) {
                foreach ($dataStats as $id => $nilai) {
                    DB::table('statistik_kecamatan')
                        ->where('id', $id)
                        ->update([
                            'jumlah_ikm' => $nilai,
                            'updated_at' => now()
                        ]);
                }
            }

            return redirect()->back()->with('success', 'Statistik Kecamatan Berhasil Diperbarui!');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Gagal menyimpan: ' . $e->getMessage());
        }
    }

    public function halamanStatistikSosmed()
    {
        $stats = DB::table('statistik_kecamatan')->get();
        $firstStat = DB::table('statistik_kecamatan')->first();
        return view('admin.statistik_sosmed', compact('stats', 'firstStat'));
    }

    public function updateStatistikSosmed(Request $request)
    {
        try {
            $hariIni = (int)$request->input('kunjungan_hari_ini', 0);
            $bulanIni = (int)$request->input('kunjungan_bulan_ini', 0);
            $tahunIni = (int)$request->input('kunjungan_tahun_ini', 0);
            $tahunN1 = (int)$request->input('kunjungan_tahun_lalu', 0);

            // Pengunjung aktif otomatis pembulatan 30% dari pengunjung hari ini
            $pengunjungAktif = (int)round($hariIni * 0.30);

            // Total kunjungan adalah akumulasi: hari ini + bulan ini + tahun ini + tahun n-1
            $totalAkumulasi = $hariIni + $bulanIni + $tahunIni + $tahunN1;

            $defaultSosmed = [
                ['platform' => 'Instagram', 'username' => '@disnakerkukm.madiunkota', 'url' => 'https://www.instagram.com/disnakerkukm.madiunkota?igsh=cXJqZ3ZjNmJudWFn'],
                ['platform' => 'Instagram', 'username' => '@perindustrian.kotamadiun', 'url' => 'https://www.instagram.com/perindustrian.kotamadiun?igsh=MTFzYnQwMnRhamNs'],
                ['platform' => 'Facebook', 'username' => 'Disnakerkukm Kota Madiun', 'url' => 'https://www.facebook.com/share/19RgNeZgVq/'],
                ['platform' => 'TikTok', 'username' => '@disnakerkukmkotamadiun', 'url' => 'https://vm.tiktok.com/ZS9hYefCLguks-CQgR6/'],
                ['platform' => 'X', 'username' => '@DisnakerKUKM', 'url' => 'https://x.com/DisnakerKUKM'],
            ];

            $submittedSosmed = $request->input('sosial_media');
            if (!empty($submittedSosmed) && $submittedSosmed !== '[]' && $submittedSosmed !== 'null') {
                $sosmedJson = $submittedSosmed;
            } else {
                $existing = DB::table('statistik_kecamatan')->value('sosial_media');
                $sosmedJson = (!empty($existing) && $existing !== '[]') ? $existing : json_encode($defaultSosmed);
            }

            $updateData = [
                'total_kunjungan' => $totalAkumulasi,
                'kunjungan_total' => $totalAkumulasi,
                'pengunjung_aktif' => $pengunjungAktif,
                'ikm_terdaftar' => $request->input('ikm_terdaftar', 560),
                'kunjungan_hari_ini' => $hariIni,
                'kunjungan_bulan_ini' => $bulanIni,
                'kunjungan_tahun_ini' => $tahunIni,
                'kunjungan_tahun_lalu' => $tahunN1,
                'sosial_media' => $sosmedJson,
                'telp_dinas' => $request->input('telp_dinas', '(0351) 454288'),
                'email_dinas' => $request->input('email_dinas', 'disnaker@madiunkota.go.id'),
                'updated_at' => now()
            ];

            if ($request->has('fonnte_token')) {
                $updateData['fonnte_token'] = $request->input('fonnte_token');
            }
            if ($request->has('admin_wa_number')) {
                $updateData['admin_wa_number'] = $request->input('admin_wa_number');
            }
            if ($request->has('wa_notif_active')) {
                $updateData['wa_notif_active'] = $request->input('wa_notif_active');
            }

            DB::table('statistik_kecamatan')->update($updateData);

            return redirect()->back()->with('success', 'Pengaturan Statistik & Gateway WhatsApp Fonnte Berhasil Diperbarui!');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Gagal menyimpan: ' . $e->getMessage());
        }
    }
}