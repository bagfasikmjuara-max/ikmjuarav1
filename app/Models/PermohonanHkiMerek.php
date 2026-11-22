<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PermohonanHkiMerek extends Model
{
    use HasFactory;

    protected $table = 'permohonan_hki_merek';

    protected $fillable = [
        'nama_lengkap',
        'nik',
        'nib',
        'nama_merek',
        'kelas_merek',
        'uraian_barang_jasa',
        'alamat_ktp',
        'alamat_usaha',
        'no_hp',
        'file_ktp',
        'file_nib',
        'file_etiket_merek',
        'file_surat_pernyataan',
        'status',
        'catatan_admin',
        'link_gdrive_rekom'
    ];
}
