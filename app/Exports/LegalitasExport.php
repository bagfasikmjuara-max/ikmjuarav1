<?php

namespace App\Exports;

use App\Models\PetaSebaran;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class LegalitasExport implements FromQuery, WithHeadings, WithMapping, ShouldAutoSize
{
    protected $jenis;
    protected $kecamatan;
    protected $search;

    public function __construct($jenis = null, $kecamatan = null, $search = null)
    {
        $this->jenis = $jenis;
        $this->kecamatan = $kecamatan;
        $this->search = $search;
    }

    public function query()
    {
        $query = PetaSebaran::where('is_legalitas_tracked', true);

        if ($this->jenis === 'nib') {
            $query->whereNotNull('nib')->where('nib', '!=', '');
        } elseif ($this->jenis === 'halal') {
            $query->where('status_halal', '!=', 'Belum');
        } elseif ($this->jenis === 'bpom_cppob') {
            $query->where('status_bpom_cppob', '!=', 'Belum');
        } elseif ($this->jenis === 'sni') {
            $query->where('status_sni', '!=', 'Belum');
        } elseif ($this->jenis === 'hki_merek') {
            $query->where('status_hki_merek', '!=', 'Belum');
        } elseif ($this->jenis === 'tkdn') {
            $query->where('status_tkdn', '!=', 'Belum');
        }

        if ($this->kecamatan) {
            $query->where('kecamatan', $this->kecamatan);
        }

        if ($this->search) {
            $search = $this->search;
            $query->where(function($q) use ($search) {
                $q->where('nama_usaha', 'like', "%{$search}%")
                  ->orWhere('pemilik', 'like', "%{$search}%")
                  ->orWhere('nib', 'like', "%{$search}%")
                  ->orWhere('nik', 'like', "%{$search}%")
                  ->orWhere('no_halal', 'like', "%{$search}%")
                  ->orWhere('no_bpom_cppob', 'like', "%{$search}%")
                  ->orWhere('no_sni', 'like', "%{$search}%")
                  ->orWhere('no_hki_merek', 'like', "%{$search}%")
                  ->orWhere('nama_merek', 'like', "%{$search}%")
                  ->orWhere('no_sertifikat_tkdn', 'like', "%{$search}%");
            });
        }

        return $query->orderBy('created_at', 'desc');
    }

    public function headings(): array
    {
        return [
            'ID',
            'Nama IKM / Perusahaan',
            'Nama Pemilik',
            'Kecamatan',
            'Kelurahan',
            'No. HP / WhatsApp',
            'Status NIB',
            'Nomor NIB',
            'Link GDrive NIB',
            'Status Sertifikat Halal',
            'Nomor Sertifikat Halal',
            'Link GDrive Halal',
            'Status BPOM / CPPOB',
            'Nomor BPOM / CPPOB',
            'Link GDrive BPOM/CPPOB',
            'Status SNI',
            'Nomor SNI',
            'Link GDrive SNI',
            'Status HKI Merek',
            'Nama Merek Terdaftar',
            'Nomor Pendaftaran HKI',
            'Tanggal Berakhir HKI Merek',
            'Link GDrive HKI Merek',
            'Status TKDN',
            'Nomor Sertifikat TKDN',
            'Persentase TKDN (%)',
            'Link GDrive TKDN',
        ];
    }

    public function map($row): array
    {
        return [
            $row->id,
            $row->nama_usaha,
            $row->pemilik,
            $row->kecamatan,
            $row->kelurahan,
            $row->no_hp,
            !empty($row->nib) ? 'Ada' : 'Belum Ada',
            $row->nib ?: '-',
            $row->link_gdrive_nib ?: '-',
            $row->status_halal ?: 'Belum',
            $row->no_halal ?: '-',
            $row->link_gdrive_halal ?: '-',
            $row->status_bpom_cppob ?: 'Belum',
            $row->no_bpom_cppob ?: '-',
            $row->link_gdrive_bpom_cppob ?: '-',
            $row->status_sni ?: 'Belum',
            $row->no_sni ?: '-',
            $row->link_gdrive_sni ?: '-',
            $row->status_hki_merek ?: 'Belum',
            $row->nama_merek ?: '-',
            $row->no_hki_merek ?: '-',
            !empty($row->tgl_berakhir_hki) ? \Carbon\Carbon::parse($row->tgl_berakhir_hki)->format('d-m-Y') : '-',
            $row->link_gdrive_hki_merek ?: '-',
            $row->status_tkdn ?: 'Belum',
            $row->no_sertifikat_tkdn ?: '-',
            $row->persentase_tkdn ?: '-',
            $row->link_gdrive_tkdn ?: '-',
        ];
    }
}

