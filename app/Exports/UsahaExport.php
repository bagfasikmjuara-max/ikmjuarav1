<?php

namespace App\Exports;

use App\Models\PelakuUsaha;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class UsahaExport implements FromCollection, WithHeadings
{
public function collection()
    {
        return \App\Models\PelakuUsaha::select('nama_usaha', 'pemilik', 'kategori', 'kelurahan', 'alamat', 'latitude', 'longitude')->get();
    }

    public function headings(): array
    {
        return [
            'Nama Usaha',
            'Pemilik',
            'Kategori',
            'Kelurahan',
            'Alamat Lengkap',
            'Latitude',
            'Longitude',
        ];
    }
}