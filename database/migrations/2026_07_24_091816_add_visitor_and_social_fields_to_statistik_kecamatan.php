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
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            $table->integer('kunjungan_hari_ini')->default(0)->after('ikm_terdaftar');
            $table->integer('kunjungan_bulan_ini')->default(0)->after('kunjungan_hari_ini');
            $table->integer('kunjungan_tahun_ini')->default(0)->after('kunjungan_bulan_ini');
            $table->integer('kunjungan_total')->default(0)->after('kunjungan_tahun_ini');
            $table->text('sosial_media')->nullable()->after('kunjungan_total');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            $table->dropColumn([
                'kunjungan_hari_ini',
                'kunjungan_bulan_ini',
                'kunjungan_tahun_ini',
                'kunjungan_total',
                'sosial_media'
            ]);
        });
    }
};
