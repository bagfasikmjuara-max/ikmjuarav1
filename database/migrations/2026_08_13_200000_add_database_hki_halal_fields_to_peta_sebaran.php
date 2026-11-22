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
        Schema::table('peta_sebaran', function (Blueprint $table) {
            if (!Schema::hasColumn('peta_sebaran', 'nomor_transaksi_hki')) {
                $table->string('nomor_transaksi_hki')->nullable()->after('no_hki_merek');
            }
            if (!Schema::hasColumn('peta_sebaran', 'kelas_merek')) {
                $table->string('kelas_merek')->nullable()->after('nomor_transaksi_hki');
            }
            if (!Schema::hasColumn('peta_sebaran', 'link_tanda_daftar_hki')) {
                $table->text('link_tanda_daftar_hki')->nullable()->after('kelas_merek');
            }
            if (!Schema::hasColumn('peta_sebaran', 'tipe_permohonan_hki')) {
                $table->string('tipe_permohonan_hki')->nullable()->after('link_tanda_daftar_hki');
            }

            if (!Schema::hasColumn('peta_sebaran', 'no_daftar_halal')) {
                $table->string('no_daftar_halal')->nullable()->after('no_halal');
            }
            if (!Schema::hasColumn('peta_sebaran', 'tgl_daftar_halal')) {
                $table->string('tgl_daftar_halal')->nullable()->after('no_daftar_halal');
            }
            if (!Schema::hasColumn('peta_sebaran', 'tgl_sertifikat_halal')) {
                $table->string('tgl_sertifikat_halal')->nullable()->after('tgl_daftar_halal');
            }
            if (!Schema::hasColumn('peta_sebaran', 'nama_fasilitator_halal')) {
                $table->string('nama_fasilitator_halal')->nullable()->after('tgl_sertifikat_halal');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->dropColumn([
                'nomor_transaksi_hki',
                'kelas_merek',
                'link_tanda_daftar_hki',
                'tipe_permohonan_hki',
                'no_daftar_halal',
                'tgl_daftar_halal',
                'tgl_sertifikat_halal',
                'nama_fasilitator_halal',
            ]);
        });
    }
};
