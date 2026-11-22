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
        Schema::table('usulan_perubahan', function (Blueprint $table) {
            $table->string('nama_proyek')->nullable()->after('nama_perusahaan');
            $table->string('kbli')->nullable()->after('nama_pemilik');
            $table->string('uraian_kbli')->nullable()->after('kbli');
            $table->date('tgl_terbit')->nullable()->after('email');
            $table->string('status')->nullable()->after('tgl_terbit');
            $table->string('sertifikat_halal')->nullable()->after('status');
            $table->string('bpom')->nullable()->after('sertifikat_halal');
            $table->string('cppob')->nullable()->after('bpom');
            $table->string('sni')->nullable()->after('cppob');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('usulan_perubahan', function (Blueprint $table) {
            $table->dropColumn([
                'nama_proyek',
                'kbli',
                'uraian_kbli',
                'tgl_terbit',
                'status',
                'sertifikat_halal',
                'bpom',
                'cppob',
                'sni'
            ]);
        });
    }
};
