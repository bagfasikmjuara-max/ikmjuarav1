<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $records = DB::table('peta_sebaran')->get();

        foreach ($records as $r) {
            $kelurahan = trim($r->kelurahan);

            // Standarisasi jika nama kelurahan adalah Oro Oro Ombo (baik dengan strip maupun spasi)
            if (strcasecmp(str_replace('-', ' ', $kelurahan), 'oro oro ombo') === 0) {
                $kelurahan = 'Oro-Oro Ombo';
            } else {
                // Konversi string ke Title Case (Banjarejo, Kejuron, dll)
                $kelurahan = ucwords(strtolower($kelurahan));
            }

            DB::table('peta_sebaran')
                ->where('id', $r->id)
                ->update(['kelurahan' => $kelurahan]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Normalisasi bersifat satu arah dan aman
    }
};
