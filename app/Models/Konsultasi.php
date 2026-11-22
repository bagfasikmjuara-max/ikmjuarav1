<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Konsultasi extends Model
{
    // Baris sakti ini memberitahu Laravel: "Nama tabelnya 'konsultasi', bukan 'konsultasis'!"
    protected $table = 'konsultasi';

    // Izinkan kolom-kolom ini diisi secara massal
    protected $fillable = [
        'nama_ikm', 
        'jenis_usaha', 
        'keluhan',
        'email',
        'nik',
        'sumber',
        'jawaban',
        'status'
    ];

    public function messages()
    {
        return $this->hasMany(KonsultasiPesan::class, 'konsultasi_id')->orderBy('created_at', 'asc');
    }
}