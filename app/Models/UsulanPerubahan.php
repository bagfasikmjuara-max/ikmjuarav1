<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsulanPerubahan extends Model
{
    protected $table = 'usulan_perubahan';

    protected $guarded = [];

    public function pelakuUsaha()
    {
        return $this->belongsTo(PelakuUsaha::class, 'pelaku_usaha_id');
    }

    public function petaSebaran()
    {
        return $this->belongsTo(PetaSebaran::class, 'pelaku_usaha_id');
    }

    public function getOriginalRecordAttribute()
    {
        // 1. Prioritize NIK or NIB matching in PetaSebaran
        if ($this->nik || $this->nib) {
            $peta = PetaSebaran::where(function($q) {
                if ($this->nik) $q->orWhere('nik', $this->nik);
                if ($this->nib) $q->orWhere('nib', $this->nib);
            })->first();
            if ($peta) return $peta;
        }

        // 2. Try NIK or NIB in PelakuUsaha
        if ($this->nik || $this->nib) {
            $pelaku = PelakuUsaha::where(function($q) {
                if ($this->nik) $q->orWhere('nik', $this->nik);
                if ($this->nib) $q->orWhere('nib', $this->nib);
            })->first();
            if ($pelaku) return $pelaku;
        }

        // 3. Fallback to pelaku_usaha_id in PetaSebaran if ID matches
        if ($this->pelaku_usaha_id) {
            $petaById = PetaSebaran::find($this->pelaku_usaha_id);
            if ($petaById && ($petaById->nik === $this->nik || $petaById->nib === $this->nib)) {
                return $petaById;
            }

            $pelakuById = PelakuUsaha::find($this->pelaku_usaha_id);
            if ($pelakuById && ($pelakuById->nik === $this->nik || $pelakuById->nib === $this->nib)) {
                return $pelakuById;
            }
        }

        return null;
    }
}
