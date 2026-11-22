<?php

namespace App\Imports;

use App\Models\PetaSebaran;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\Importable;

class PetaSebaranImport implements ToModel, WithHeadingRow
{
    use Importable;

    public $successCount = 0;
    public $failedRows = [];
    private $rowNumber = 1; // Baris 1 adalah header excel

    public function model(array $row)
    {
        $this->rowNumber++;

        // Skip jika baris benar-benar kosong
        if (empty($row['nama_usaha']) && empty($row['nama_pemilik']) && empty($row['pemilik']) && empty($row['nib'])) {
            return null;
        }

        $nama_usaha = $row['nama_usaha'] ?? null;
        $pemilik = $row['nama_pemilik'] ?? $row['pemilik'] ?? null;
        $nib = isset($row['nib']) ? trim($row['nib']) : null;
        $nik = isset($row['nik']) ? trim($row['nik']) : null;

        // Validasi Nama Usaha
        if (empty($nama_usaha)) {
            $this->failedRows[] = [
                'row' => $this->rowNumber,
                'identifier' => 'Baris #' . $this->rowNumber,
                'reason' => 'Nama Usaha kosong'
            ];
            return null;
        }

        // Validasi Pemilik
        if (empty($pemilik)) {
            $this->failedRows[] = [
                'row' => $this->rowNumber,
                'identifier' => $nama_usaha,
                'reason' => 'Nama Pemilik kosong'
            ];
            return null;
        }

        // Validasi NIB (Wajib & 13 Digit)
        if (empty($nib)) {
            $this->failedRows[] = [
                'row' => $this->rowNumber,
                'identifier' => $nama_usaha,
                'reason' => 'NIB kosong'
            ];
            return null;
        } elseif (strlen($nib) !== 13) {
            $this->failedRows[] = [
                'row' => $this->rowNumber,
                'identifier' => "{$nama_usaha} (NIB: {$nib})",
                'reason' => 'NIB harus 13 digit'
            ];
            return null;
        }

        // Validasi NIK (Wajib & 16 Digit)
        if (empty($nik)) {
            $this->failedRows[] = [
                'row' => $this->rowNumber,
                'identifier' => $nama_usaha,
                'reason' => 'NIK kosong'
            ];
            return null;
        } elseif (strlen($nik) !== 16) {
            $this->failedRows[] = [
                'row' => $this->rowNumber,
                'identifier' => "{$nama_usaha} (NIK: {$nik})",
                'reason' => 'NIK harus 16 digit'
            ];
            return null;
        }

        // Cek duplikasi NIB di database
        $existsNib = PetaSebaran::where('nib', $nib)->exists();
        if ($existsNib) {
            $this->failedRows[] = [
                'row' => $this->rowNumber,
                'identifier' => "{$nama_usaha} (NIB: {$nib})",
                'reason' => 'NIB sudah terdaftar'
            ];
            return null;
        }

        // Cek duplikasi NIK di database
        $existsNik = PetaSebaran::where('nik', $nik)->exists();
        if ($existsNik) {
            $this->failedRows[] = [
                'row' => $this->rowNumber,
                'identifier' => "{$nama_usaha} (NIK: {$nik})",
                'reason' => 'NIK sudah terdaftar'
            ];
            return null;
        }

        // Kategori Usaha validasi list
        $kategori = $row['kategori_usaha'] ?? $row['kategori'] ?? 'Pangan';
        $allowedKategori = ['Pangan', 'Sandang', 'Kerajinan (Kriya)', 'Kimia dan Furnitur', 'Logam dan Mesin'];
        if (!in_array($kategori, $allowedKategori)) {
            // Coba petakan atau default
            if ($kategori === 'Kuliner' || $kategori === 'Makanan') {
                $kategori = 'Pangan';
            } elseif ($kategori === 'Fashion') {
                $kategori = 'Sandang';
            } else {
                $kategori = 'Pangan';
            }
        }

        // Skala Usaha validasi list
        $skala = $row['skala_usaha'] ?? 'Mikro';
        $allowedSkala = ['Mikro', 'Kecil', 'Menengah', 'Besar'];
        if (!in_array($skala, $allowedSkala)) {
            $skala = 'Mikro';
        }

        // Tingkat Risiko
        $risiko = $row['tingkat_risiko'] ?? 'Rendah';
        $allowedRisiko = ['Rendah', 'Menengah Rendah', 'Menengah Tinggi', 'Tinggi'];
        if (!in_array($risiko, $allowedRisiko)) {
            $risiko = 'Rendah';
        }

        // Normalisasi Kelurahan & Kecamatan
        $rawKelurahan = trim($row['kelurahan'] ?? '-');
        if (strcasecmp(str_replace('-', ' ', $rawKelurahan), 'oro oro ombo') === 0) {
            $kelurahan = 'Oro-Oro Ombo';
        } else {
            $kelurahan = ucwords(strtolower($rawKelurahan));
        }

        $rawKecamatan = trim($row['kecamatan'] ?? '-');
        $kecamatan = ucwords(strtolower($rawKecamatan));

        $this->successCount++;

        return new PetaSebaran([
            'nama_usaha'    => $nama_usaha,
            'pemilik'       => $pemilik,
            'nib'           => $nib,
            'nik'           => $nik,
            'no_hp'         => $row['nomor_hp'] ?? $row['no_hp'] ?? '-',
            'produk'        => $row['produk_yang_diproduksi'] ?? $row['produk'] ?? '-',
            'alamat_jalan'  => $row['alamat_nama_jalan'] ?? $row['alamat_jalan'] ?? '-',
            'alamat_no'     => $row['nomor_rumah'] ?? $row['alamat_no'] ?? '-',
            'kelurahan'     => $kelurahan,
            'kecamatan'     => $kecamatan,
            'kota_madiun'   => 'Kota Madiun',
            'kategori'      => $kategori,
            'kbli'          => $row['kbli'] ?? null,
            'uraian_kbli'   => $row['uraian_kbli'] ?? null,
            'investasi'     => floatval($row['nilai_investasi_rupiah'] ?? $row['investasi'] ?? 0),
            'tenaga_kerja'  => intval($row['jumlah_tenaga_kerja'] ?? $row['tenaga_kerja'] ?? 1),
            'skala_usaha'   => $skala,
            'tingkat_risiko'=> $risiko,
            'latitude'      => $row['latitude'] ?? '0',
            'longitude'     => $row['longitude'] ?? '0',
        ]);
    }
}
