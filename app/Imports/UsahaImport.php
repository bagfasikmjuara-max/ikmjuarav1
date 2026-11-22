<?php

namespace App\Imports;

use App\Models\PelakuUsaha;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class UsahaImport implements ToModel, WithHeadingRow
{
public function model(array $row)
    {
        if (!isset($row['nama_usaha']) || $row['nama_usaha'] == null) {
            return null;
        }

        return new \App\Models\PelakuUsaha([
            'nama_usaha' => $row['nama_usaha'],
            'pemilik'    => $row['pemilik'],
            'kategori'   => $row['kategori'],
            'kelurahan'  => $row['kelurahan'],
            'alamat'     => $row['alamat_lengkap'],
            'latitude'   => $row['latitude'],
            'longitude'  => $row['longitude'],
        ]);
    }
    public function rules(): array
{
    return [
        'latitude' => 'required|numeric|between:-90,90',
        'longitude' => 'required|numeric|between:-180,180',
    ];
}
}