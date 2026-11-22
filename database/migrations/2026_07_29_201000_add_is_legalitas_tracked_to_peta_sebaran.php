<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            if (!Schema::hasColumn('peta_sebaran', 'is_legalitas_tracked')) {
                $table->boolean('is_legalitas_tracked')->default(true)->after('link_gdrive_hki_merek');
            }
        });

        // Restore NIB for RUJAK BUAH MARIYADI (NIK: 3573010000000008) and set is_legalitas_tracked = 0
        DB::table('peta_sebaran')
            ->where('nik', '3573010000000008')
            ->orWhere('nama_usaha', 'like', '%RUJAK BUAH MARIYADI%')
            ->update([
                'nib' => '9120000000008',
                'is_legalitas_tracked' => false,
                'status_halal' => 'Belum',
                'no_halal' => null,
                'link_gdrive_halal' => null,
                'status_bpom_cppob' => 'Belum',
                'no_bpom_cppob' => null,
                'link_gdrive_bpom_cppob' => null,
                'status_sni' => 'Belum',
                'no_sni' => null,
                'link_gdrive_sni' => null,
                'status_hki_merek' => 'Belum',
                'no_hki_merek' => null,
                'nama_merek' => null,
                'tgl_berakhir_hki' => null,
                'link_gdrive_hki_merek' => null,
                'link_gdrive_nib' => null,
            ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            if (Schema::hasColumn('peta_sebaran', 'is_legalitas_tracked')) {
                $table->dropColumn('is_legalitas_tracked');
            }
        });
    }
};
