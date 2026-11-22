<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class DatabaseHalalTemplateExport implements FromArray, WithHeadings, ShouldAutoSize
{
    public function headings(): array
    {
        return [
            'NIK (16 Digit)',
            'NIB (13 Digit)',
            'No Daftar',
            'Nama PU',
            'Merk Dagang',
            'Tanggal Daftar',
            'Status',
            'Tanggal Sertifikat',
            'No Sertifikat',
            'Nama Fasilitator',
            'Jenis Produk',
            'Link Sertifikat Halal',
        ];
    }

    public function array(): array
    {
        return [
            [
                '3574012304850001',
                '9120001234567',
                'SH2025-00123',
                'Siti Rahmah',
                'Keripik Pisang Juara',
                '2025-01-15',
                'Terbit',
                '2025-02-10',
                'ID35110001234560123',
                'DisnakerKUKM Kota Madiun',
                'Makanan Ringan',
                'https://drive.google.com/file/d/halal1',
            ],
            [
                '3574025608900002',
                '9120007654321',
                'SH2025-00456',
                'Budi Santoso',
                'Sambel Pecel Asli Madiun',
                '2025-02-01',
                'Terbit',
                '2025-02-20',
                'ID35110007654320456',
                'Mandiri / Self Declare',
                'Bumbu & Rempah',
                'https://drive.google.com/file/d/halal2',
            ]
        ];
    }
}
