<?php

namespace App\Exports;

use App\Models\SiinasIndustry;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class SiinasExport implements FromCollection, WithHeadings, WithMapping
{
    public function collection()
    {
        return SiinasIndustry::all();
    }

    public function headings(): array
    {
        return [
            'No',
            'Nama Perusahaan',
            'Alamat Kantor Pusat',
            'Provinsi Kantor',
            'Kabkota Kantor',
            'Alamat Pabrik',
            'Provinsi Pabrik',
            'Kabkota Pabrik',
            'KBLI',
            'Bidang Usaha',
            'Tanggal Registrasi',
            'Skala Usaha',
            'Status Pelaporan'
        ];
    }

    public function map($row): array
    {
        return [
            $row->no_urut ?? $row->id,
            $row->nama_perusahaan,
            $row->alamat_kantor_pusat,
            $row->provinsi_kantor,
            $row->kabkota_kantor,
            $row->alamat_pabrik,
            $row->provinsi_pabrik,
            $row->kabkota_pabrik,
            $row->kbli,
            $row->bidang_usaha,
            $row->tanggal_registrasi,
            $row->skala_usaha,
            $row->status_pelaporan
        ];
    }
}
