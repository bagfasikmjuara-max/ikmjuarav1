<?php

namespace App\Exports;

use App\Models\PetaSebaran;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class PetaSebaranExport implements FromQuery, WithHeadings, WithMapping, ShouldAutoSize
{
    protected $search;

    public function __construct($search = null)
    {
        $this->search = $search;
    }

    public function query()
    {
        $query = PetaSebaran::query();

        if ($this->search) {
            $search = $this->search;
            $query->where(function($q) use ($search) {
                $q->where('pemilik', 'like', "%{$search}%")
                  ->orWhere('nib', 'like', "%{$search}%")
                  ->orWhere('nik', 'like', "%{$search}%")
                  ->orWhere('produk', 'like', "%{$search}%")
                  ->orWhere('nama_usaha', 'like', "%{$search}%");
            });
        }

        return $query->orderBy('id', 'desc');
    }

    public function headings(): array
    {
        return [
            'ID',
            'Nama Usaha',
            'Nama Pemilik',
            'NIB',
            'NIK',
            'Nomor HP',
            'Produk Yang Diproduksi',
            'Alamat (Nama Jalan)',
            'Nomor Rumah',
            'Kelurahan',
            'Kecamatan',
            'Kota',
            'Kategori Usaha',
            'KBLI',
            'Uraian KBLI',
            'Nilai Investasi (Rupiah)',
            'Jumlah Tenaga Kerja',
            'Skala Usaha',
            'Tingkat Risiko',
            'Latitude',
            'Longitude',
        ];
    }

    public function map($row): array
    {
        return [
            $row->id,
            $row->nama_usaha,
            $row->pemilik,
            $row->nib,
            $row->nik,
            $row->no_hp,
            $row->produk,
            $row->alamat_jalan,
            $row->alamat_no,
            $row->kelurahan,
            $row->kecamatan,
            $row->kota_madiun,
            $row->kategori,
            $row->kbli,
            $row->uraian_kbli,
            $row->investasi,
            $row->tenaga_kerja,
            $row->skala_usaha,
            $row->tingkat_risiko,
            $row->latitude,
            $row->longitude,
        ];
    }
}
