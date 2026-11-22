<?php

namespace App\Exports;

use App\Models\DatabaseHkiMerek;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class DatabaseHkiExport implements FromCollection, WithHeadings, WithMapping, ShouldAutoSize
{
    protected $search;

    public function __construct($search = null)
    {
        $this->search = $search;
    }

    public function collection()
    {
        $query = DatabaseHkiMerek::query();
        if ($this->search) {
            $search = $this->search;
            $query->where(function($q) use ($search) {
                $q->where('merek', 'like', "%{$search}%")
                  ->orWhere('nik', 'like', "%{$search}%")
                  ->orWhere('nib', 'like', "%{$search}%")
                  ->orWhere('nomor_transaksi', 'like', "%{$search}%")
                  ->orWhere('nomor_permohonan', 'like', "%{$search}%")
                  ->orWhere('tipe_permohonan', 'like', "%{$search}%");
            });
        }
        return $query->orderBy('created_at', 'desc')->get();
    }

    public function headings(): array
    {
        return [
            'No.',
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

    public function map($row): array
    {
        static $no = 0;
        $no++;

        return [
            $no,
            $row->nik ?: '-',
            $row->nib ?: '-',
            $row->nomor_transaksi ?: '-',
            $row->merek,
            $row->kelas ?: '-',
            $row->nomor_permohonan ?: '-',
            $row->link_tanda_daftar ?: '-',
            $row->tipe_permohonan ?: 'Merek Dagang',
            $row->status_permohonan_merek ?: '(TM) Didaftar',
            $row->link_sertifikat_merek ?: '-',
        ];
    }
}
