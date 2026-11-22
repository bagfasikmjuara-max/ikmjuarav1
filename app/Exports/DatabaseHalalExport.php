<?php

namespace App\Exports;

use App\Models\DatabaseHalal;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class DatabaseHalalExport implements FromCollection, WithHeadings, WithMapping, ShouldAutoSize
{
    protected $search;

    public function __construct($search = null)
    {
        $this->search = $search;
    }

    public function collection()
    {
        $query = DatabaseHalal::query();
        if ($this->search) {
            $search = $this->search;
            $query->where(function($q) use ($search) {
                $q->where('nama_pu', 'like', "%{$search}%")
                  ->orWhere('nik', 'like', "%{$search}%")
                  ->orWhere('nib', 'like', "%{$search}%")
                  ->orWhere('no_daftar', 'like', "%{$search}%")
                  ->orWhere('merk_dagang', 'like', "%{$search}%")
                  ->orWhere('no_sertifikat', 'like', "%{$search}%")
                  ->orWhere('nama_fasilitator', 'like', "%{$search}%")
                  ->orWhere('jenis_produk', 'like', "%{$search}%");
            });
        }
        return $query->orderBy('created_at', 'desc')->get();
    }

    public function headings(): array
    {
        return [
            'No',
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

    public function map($row): array
    {
        static $no = 0;
        $no++;

        return [
            $no,
            $row->nik ?: '-',
            $row->nib ?: '-',
            $row->no_daftar ?: '-',
            $row->nama_pu,
            $row->merk_dagang ?: '-',
            $row->tanggal_daftar ?: '-',
            $row->status ?: 'Terbit',
            $row->tanggal_sertifikat ?: '-',
            $row->no_sertifikat ?: '-',
            $row->nama_fasilitator ?: '-',
            $row->jenis_produk ?: '-',
            $row->link_sertifikat_halal ?: '-',
        ];
    }
}
