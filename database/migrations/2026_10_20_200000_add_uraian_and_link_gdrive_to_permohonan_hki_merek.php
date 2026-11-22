<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('permohonan_hki_merek', function (Blueprint $table) {
            if (!Schema::hasColumn('permohonan_hki_merek', 'uraian_barang_jasa')) {
                $table->text('uraian_barang_jasa')->nullable()->after('kelas_merek');
            }
            if (!Schema::hasColumn('permohonan_hki_merek', 'link_gdrive_rekom')) {
                $table->text('link_gdrive_rekom')->nullable()->after('catatan_admin');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('permohonan_hki_merek', function (Blueprint $table) {
            if (Schema::hasColumn('permohonan_hki_merek', 'uraian_barang_jasa')) {
                $table->dropColumn('uraian_barang_jasa');
            }
            if (Schema::hasColumn('permohonan_hki_merek', 'link_gdrive_rekom')) {
                $table->dropColumn('link_gdrive_rekom');
            }
        });
    }
};
