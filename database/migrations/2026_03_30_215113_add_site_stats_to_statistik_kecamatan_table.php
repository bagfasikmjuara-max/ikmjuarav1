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
            if (!Schema::hasColumn('statistik_kecamatan', 'total_kunjungan')) {
                $table->integer('total_kunjungan')->default(12840);
            }
            if (!Schema::hasColumn('statistik_kecamatan', 'pengunjung_aktif')) {
                $table->integer('pengunjung_aktif')->default(42);
            }
            if (!Schema::hasColumn('statistik_kecamatan', 'ikm_terdaftar')) {
                $table->integer('ikm_terdaftar')->default(560);
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            $table->dropColumn(['total_kunjungan', 'pengunjung_aktif', 'ikm_terdaftar']);
        });
    }
};
