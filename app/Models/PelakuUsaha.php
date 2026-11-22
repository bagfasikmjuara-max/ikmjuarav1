<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PelakuUsaha extends Model
{
    // Tambahkan baris ini:
    protected $table = 'pelaku_usaha'; 
    
// TAMBAHKAN INI: Karena tabel Anda tidak punya kolom updated_at
    public $timestamps = false; 

    protected $guarded = [];
}