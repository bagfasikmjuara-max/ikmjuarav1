<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PetaSebaran extends Model
{
    protected $table = 'peta_sebaran';

    protected $fillable = [
        'nama_usaha',
        'pemilik',
        'nib',
        'nik',
        'no_hp',
        'produk',
        'alamat_jalan',
        'alamat_no',
        'kelurahan',
        'kecamatan',
        'kota_madiun',
        'kategori',
        'kbli',
        'uraian_kbli',
        'investasi',
        'tenaga_kerja',
        'skala_usaha',
        'tingkat_risiko',
        'latitude',
        'longitude',
        'status_halal',
        'no_halal',
        'status_bpom_cppob',
        'no_bpom_cppob',
        'status_sni',
        'no_sni',
        'status_hki_merek',
        'no_hki_merek',
        'nama_merek',
        'tgl_terbit_legalitas',
        'link_gdrive_legalitas',
        'link_gdrive_nib',
        'link_gdrive_halal',
        'link_gdrive_bpom_cppob',
        'link_gdrive_sni',
        'link_gdrive_hki_merek',
        'tgl_berakhir_hki',
        'status_tkdn',
        'no_sertifikat_tkdn',
        'persentase_tkdn',
        'link_gdrive_tkdn',
        'is_legalitas_tracked',
        'nomor_transaksi_hki',
        'kelas_merek',
        'link_tanda_daftar_hki',
        'tipe_permohonan_hki',
        'no_daftar_halal',
        'tgl_daftar_halal',
        'tgl_sertifikat_halal',
        'nama_fasilitator_halal',
    ];


    protected $casts = [
        'is_legalitas_tracked' => 'boolean',
    ];
}
