<?php

namespace App\Exports;

use App\Models\TnaDigital;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class TnaDigitalExport implements FromQuery, WithHeadings, WithMapping, ShouldAutoSize, WithStyles
{
    protected $topik;
    protected $kecamatan;
    protected $search;

    public function __construct($topik = null, $kecamatan = null, $search = null)
    {
        $this->topik = $topik;
        $this->kecamatan = $kecamatan;
        $this->search = $search;
    }

    public function query()
    {
        $query = TnaDigital::query();

        if ($this->topik) {
            $topik = $this->topik;
            $query->whereJsonContains('topik_pelatihan_prioritas', $topik);
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
                  ->orWhere('nik', 'like', "%{$search}%");
            });
        }

        return $query->orderBy('created_at', 'desc');
    }

    public function headings(): array
    {
        return [
            'ID',
            'Nama IKM / Usaha',
            'Nama Pemilik',
            'NIK',
            'NIB',
            'No. HP / WhatsApp',
            'Kecamatan',
            'Kelurahan',
            'Kendala Operasional',
            'Keterampilan Paling Kurang',
            'Topik Pelatihan Prioritas (Max 3)',
            'Materi Praktik Spesifik',
            'Kebutuhan Ilmu Baru',
            'Metode Pembinaan Efektif',
            'Komitmen Penerapan & Pelaporan',
            'Tag Antrean Pelatihan Otomatis',
            'Tanggal Assessment',
        ];
    }

    public function map($row): array
    {
        $kendala = is_array($row->kendala_operasional) ? implode(', ', $row->kendala_operasional) : '-';
        $keterampilan = is_array($row->keterampilan_kurang) ? implode(', ', $row->keterampilan_kurang) : '-';
        $topik = is_array($row->topik_pelatihan_prioritas) ? implode(', ', $row->topik_pelatihan_prioritas) : '-';
        $tags = is_array($row->tag_antrean_pelatihan) ? implode(' | ', $row->tag_antrean_pelatihan) : '-';

        return [
            $row->id,
            $row->nama_usaha,
            $row->pemilik,
            $row->nik ?: '-',
            $row->nib ?: '-',
            $row->no_hp ?: '-',
            $row->kecamatan ?: 'Manguharjo',
            $row->kelurahan ?: '-',
            $kendala,
            $keterampilan,
            $topik,
            $row->materi_praktik_spesifik ?: '-',
            $row->kebutuhan_ilmu_baru ?: '-',
            $row->metode_efektif ?: '-',
            $row->komitmen_penerapan ?: 'Ya',
            $tags,
            $row->created_at ? $row->created_at->format('d/m/Y H:i') : '-',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            1 => [
                'font' => ['bold' => true, 'color' => ['argb' => 'FFFFFF']],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'startColor' => ['argb' => '059669']
                ]
            ],
        ];
    }
}
