<?php

namespace App\Exports;

use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class PendaftarExport implements FromCollection, WithHeadings
{
    protected $kegiatan;

    public function __construct($kegiatan = null)
    {
        $this->kegiatan = $kegiatan;
    }

    public function collection()
    {
        // PERBAIKAN: Hanya mengambil data pendaftar aktif (whereNull('deleted_at'))
        // Data yang berada di Recycle Bin (deleted_at IS NOT NULL) TIDAK ikut diekspor.
        $query = DB::table('registrasi_pelatihan')
            ->whereNull('deleted_at');

        if (!empty($this->kegiatan)) {
            $query->where('nama_kegiatan', $this->kegiatan);
        }

        return $query->get();
    }

    public function headings(): array
    {
        return [
            'ID', 'Nama Kegiatan', 'Nama Lengkap', 'NIK', 'NIB', 'Email', 'WhatsApp', 
            'Jenis Kelamin', 'Tanggal Lahir', 'Foto KTP', 'Foto Produk / Usaha', 'Nama Usaha', 'Produk Diproduksi', 'Alamat Usaha',
            'Kota', 'Kelurahan', 'Kecamatan', 'Jenis Usaha', 'Tahun Mulai', 'Skala Usaha',
            'Omzet', 'Stabilitas', 'Tantangan', 'Media', 'Karyawan Tetap', 'Karyawan Lepas',
            'Sistem Usaha', 'Level Digital', 'Pernah Pelatihan', 'Harapan', 'Target 6 Bulan',
            'Dibuat Pada', 'Diupdate Pada', 'Dihapus Pada'
        ];
    }
}