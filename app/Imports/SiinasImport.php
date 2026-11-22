<?php

namespace App\Imports;

use App\Models\SiinasIndustry;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\Importable;

class SiinasImport implements ToModel, WithHeadingRow
{
    use Importable;

    public $successCount = 0;

    public function model(array $row)
    {
        $nama = $row['nama_perusahaan'] ?? $row['nama'] ?? null;
        if (empty($nama)) {
            return null;
        }

        $this->successCount++;

        return new SiinasIndustry([
            'no_urut' => $row['no'] ?? $row['no_urut'] ?? null,
            'nama_perusahaan' => $nama,
            'alamat_kantor_pusat' => $row['alamat_kantor_pusat'] ?? $row['alamat_kantor'] ?? null,
            'provinsi_kantor' => $row['provinsi_kantor'] ?? 'Jawa Timur',
            'kabkota_kantor' => $row['kabkota_kantor'] ?? 'Kota Madiun',
            'alamat_pabrik' => $row['alamat_pabrik'] ?? $row['alamat'] ?? null,
            'provinsi_pabrik' => $row['provinsi_pabrik'] ?? 'Jawa Timur',
            'kabkota_pabrik' => $row['kabkota_pabrik'] ?? 'Kota Madiun',
            'kbli' => $row['kbli'] ?? null,
            'bidang_usaha' => $row['bidang_usaha'] ?? null,
            'tanggal_registrasi' => $row['tanggal_registrasi'] ?? now()->format('d/m/Y H:i'),
            'skala_usaha' => $row['skala_usaha'] ?? 'Kecil',
            'status_pelaporan' => $row['status_pelaporan'] ?? 'Terverifikasi SIINas',
        ]);
    }
}
