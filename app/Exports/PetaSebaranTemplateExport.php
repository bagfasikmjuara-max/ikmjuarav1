<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class PetaSebaranTemplateExport implements FromArray, WithHeadings, ShouldAutoSize
{
    public function headings(): array
    {
        return [
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

    public function array(): array
    {
        return [
            [
                'Bengkel Motor Makmur',
                'Budi Santoso',
                '9120000000123',
                '3573010000000123',
                '081234567890',
                'Reparasi Motor',
                'Jl. Pahlawan',
                '15',
                'Kartoharjo',
                'Kartoharjo',
                'Logam dan Mesin',
                '25920',
                'Industri Jasa Pemotongan Dan Pengelasan Logam',
                '75000000',
                '5',
                'Mikro',
                'Rendah',
                '-7.6298',
                '111.5295'
            ]
        ];
    }
}
