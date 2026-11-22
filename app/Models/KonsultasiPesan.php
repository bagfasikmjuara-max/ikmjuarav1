<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KonsultasiPesan extends Model
{
    protected $table = 'konsultasi_pesan';

    protected $fillable = [
        'konsultasi_id',
        'sender',
        'pesan'
    ];

    public function konsultasi()
    {
        return $this->belongsTo(Konsultasi::class, 'konsultasi_id');
    }
}
