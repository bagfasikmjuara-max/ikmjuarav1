<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DatabaseHkiMerek extends Model
{
    use HasFactory;

    protected $table = 'database_hki_mereks';

    protected $fillable = [
        'nik',
        'nib',
        'nomor_transaksi',
        'merek',
        'kelas',
        'nomor_permohonan',
        'link_tanda_daftar',
        'tipe_permohonan',
        'status_permohonan_merek',
        'link_sertifikat_merek',
    ];
}
