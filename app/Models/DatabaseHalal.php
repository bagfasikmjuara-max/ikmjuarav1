<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DatabaseHalal extends Model
{
    use HasFactory;

    protected $table = 'database_halals';

    protected $fillable = [
        'nik',
        'nib',
        'no_daftar',
        'nama_pu',
        'merk_dagang',
        'tanggal_daftar',
        'status',
        'tanggal_sertifikat',
        'no_sertifikat',
        'nama_fasilitator',
        'jenis_produk',
        'link_sertifikat_halal',
    ];

    protected $appends = [
        'formatted_tanggal_daftar',
        'formatted_tanggal_sertifikat',
        'iso_tanggal_daftar',
        'iso_tanggal_sertifikat',
    ];

    public function getFormattedTanggalDaftarAttribute()
    {
        return $this->formatDateDisplay($this->tanggal_daftar);
    }

    public function getFormattedTanggalSertifikatAttribute()
    {
        return $this->formatDateDisplay($this->tanggal_sertifikat);
    }

    public function getIsoTanggalDaftarAttribute()
    {
        return $this->formatDateIso($this->tanggal_daftar);
    }

    public function getIsoTanggalSertifikatAttribute()
    {
        return $this->formatDateIso($this->tanggal_sertifikat);
    }

    private function formatDateDisplay($value)
    {
        if (empty($value) || $value === '-' || $value === 'null') {
            return '-';
        }

        $trimmed = trim((string)$value);

        // 1. Cek angka serial Excel (seperti 46278)
        if (is_numeric($trimmed) && (float)$trimmed > 10000 && (float)$trimmed < 100000) {
            try {
                return \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject((float)$trimmed)->format('d/m/Y');
            } catch (\Exception $e) {}
        }

        // 2. Cek format ISO (seperti: 2025-12-12T06:27:46Z atau 2025-12-12)
        if (preg_match('/^\d{4}-\d{2}-\d{2}/', $trimmed)) {
            try {
                return \Carbon\Carbon::parse($trimmed)->format('d/m/Y');
            } catch (\Exception $e) {}
        }

        // 3. Cek format d/m/Y atau d-m-Y (13/09/2026 atau 13-09-2026)
        if (preg_match('/^(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/', $trimmed, $m)) {
            $day = str_pad($m[1], 2, '0', STR_PAD_LEFT);
            $month = str_pad($m[2], 2, '0', STR_PAD_LEFT);
            $year = $m[3];
            return "{$day}/{$month}/{$year}";
        }

        return $trimmed;
    }

    private function formatDateIso($value)
    {
        if (empty($value) || $value === '-' || $value === 'null') {
            return '';
        }

        $trimmed = trim((string)$value);

        // 1. Cek angka serial Excel (seperti 46278)
        if (is_numeric($trimmed) && (float)$trimmed > 10000 && (float)$trimmed < 100000) {
            try {
                return \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject((float)$trimmed)->format('Y-m-d');
            } catch (\Exception $e) {}
        }

        // 2. Cek format ISO (seperti: 2025-12-12T06:27:46Z)
        if (preg_match('/^\d{4}-\d{2}-\d{2}/', $trimmed)) {
            try {
                return \Carbon\Carbon::parse($trimmed)->format('Y-m-d');
            } catch (\Exception $e) {}
        }

        // 3. Cek format d/m/Y atau d-m-Y (13/09/2026)
        if (preg_match('/^(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})/', $trimmed, $m)) {
            $day = str_pad($m[1], 2, '0', STR_PAD_LEFT);
            $month = str_pad($m[2], 2, '0', STR_PAD_LEFT);
            $year = $m[3];
            return "{$year}-{$month}-{$day}";
        }

        return $trimmed;
    }
}
