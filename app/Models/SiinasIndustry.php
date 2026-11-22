<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SiinasIndustry extends Model
{
    use HasFactory;

    protected $table = 'siinas_industries';

    protected $fillable = [
        'no_urut',
        'nama_perusahaan',
        'alamat_kantor_pusat',
        'provinsi_kantor',
        'kode_provinsi_kantor',
        'kabkota_kantor',
        'kode_kabkota_kantor',
        'kode_kelurahan_kantor',
        'kode_kecamatan_kantor',
        'alamat_pabrik',
        'provinsi_pabrik',
        'kode_provinsi_pabrik',
        'kabkota_pabrik',
        'kode_kabkota_pabrik',
        'kode_kelurahan_pabrik',
        'kode_kecamatan_pabrik',
        'kbli',
        'bidang_usaha',
        'tanggal_registrasi',
        'skala_usaha',
        'status_pelaporan',
    ];
}
