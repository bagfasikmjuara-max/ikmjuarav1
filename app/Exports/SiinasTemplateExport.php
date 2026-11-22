<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class SiinasTemplateExport implements FromArray, WithHeadings, WithStyles, WithColumnWidths
{
    public function array(): array
    {
        return [
            [
                1,
                'PT Contoh Industri Madiun (Persero)',
                'Jl. Yos Sudarso No. 71, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur',
                'Jl. Yos Sudarso No. 71, Madiun Lor, Manguharjo, Kota Madiun, Jawa Timur',
                '28193, 30200',
                'Industri Pembuatan Mesin dan Karoseri Kereta',
                date('d/m/Y H:i'),
                'Besar',
                'Terverifikasi SIINas'
            ],
            [
                2,
                'PR Sambel Pecel Juara Madiun',
                'Jl. Thamrin No. 15, Klegen, Kartoharjo, Kota Madiun, Jawa Timur',
                'Jl. Thamrin No. 15, Klegen, Kartoharjo, Kota Madiun, Jawa Timur',
                '10793',
                'Industri Pengolahan Bumbu Sambel Pecel Khas Madiun',
                date('d/m/Y H:i'),
                'Kecil',
                'Terverifikasi SIINas'
            ]
        ];
    }

    public function headings(): array
    {
        return [
            'No',
            'Nama Perusahaan',
            'Alamat Kantor Pusat',
            'Alamat Pabrik',
            'KBLI',
            'Bidang Usaha',
            'Tanggal Registrasi',
            'Skala Usaha',
            'Status Pelaporan'
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 8,
            'B' => 35,
            'C' => 45,
            'D' => 45,
            'E' => 15,
            'F' => 40,
            'G' => 20,
            'H' => 15,
            'I' => 22,
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => [
                'font' => ['bold' => true, 'color' => ['rgb' => 'FFFFFF'], 'size' => 11],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'startColor' => ['rgb' => '0F172A']
                ],
                'alignment' => [
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ]
            ],
        ];
    }
}
