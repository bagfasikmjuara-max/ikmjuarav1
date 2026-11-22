<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            if (!Schema::hasColumn('statistik_kecamatan', 'kunjungan_tahun_lalu')) {
                $table->integer('kunjungan_tahun_lalu')->default(0);
            }
        });
    }

    public function down(): void
    {
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            if (Schema::hasColumn('statistik_kecamatan', 'kunjungan_tahun_lalu')) {
                $table->dropColumn('kunjungan_tahun_lalu');
            }
        });
    }
};
