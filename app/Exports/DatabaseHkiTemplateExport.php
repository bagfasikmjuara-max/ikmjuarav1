<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class DatabaseHkiTemplateExport implements FromArray, WithHeadings, ShouldAutoSize
{
    public function headings(): array
    {
        return [
            'NIK (16 Digit)',
            'NIB (13 Digit)',
            'Nomor Transaksi',
            'Merek',
            'Kelas',
            'Nomor Permohonan',
            'Link File Tanda Daftar',
            'Tipe Permohonan',
            'Status Permohonan Merek',
            'Link File Sertifikat Merek',
        ];
    }

    public function array(): array
    {
        return [
            [
                '3574012304850001',
                '9120001234567',
                'IPT2025136011',
                'ABRA CULINARY + Logo',
                '30',
                'DID2025066752',
                'https://drive.google.com/file/d/sample1',
                'Merek Dagang',
                '(TM) Didaftar',
                'https://drive.google.com/file/d/sertifikat1',
            ],
            [
                '3574025608900002',
                '9120007654321',
                'IPT2025137823',
                'AMILAS + Logo',
                '25',
                'DID2025066781',
                'https://drive.google.com/file/d/sample2',
                'Merek Dagang',
                '(TM) Didaftar',
                'https://drive.google.com/file/d/sertifikat2',
            ]
        ];
    }
}
