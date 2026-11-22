<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KategoriKonsultasi extends Model
{
    protected $table = 'kategori_konsultasis';

    protected $fillable = [
        'nama_kategori',
        'deskripsi',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];
}
