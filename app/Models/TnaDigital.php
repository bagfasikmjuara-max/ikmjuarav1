<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TnaDigital extends Model
{
    protected $table = 'tna_digitals';

    protected $fillable = [
        'ikm_id',
        'nama_usaha',
        'pemilik',
        'nik',
        'nib',
        'no_hp',
        'kecamatan',
        'kelurahan',
        'kendala_operasional',
        'keterampilan_kurang',
        'topik_pelatihan_prioritas',
        'materi_praktik_spesifik',
        'kebutuhan_ilmu_baru',
        'metode_efektif',
        'komitmen_penerapan',
        'tag_antrean_pelatihan',
    ];

    protected $casts = [
        'kendala_operasional' => 'array',
        'keterampilan_kurang' => 'array',
        'topik_pelatihan_prioritas' => 'array',
        'tag_antrean_pelatihan' => 'array',
    ];

    public function ikm()
    {
        return $this->belongsTo(PetaSebaran::class, 'ikm_id');
    }
}
