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
        Schema::create('usulan_perubahan', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pelaku_usaha_id')->nullable();
            $table->string('nib', 13)->nullable();
            $table->string('nik', 16)->nullable();
            $table->string('nama_perusahaan')->nullable();
            $table->string('nama_pemilik')->nullable();
            $table->text('alamat_usaha')->nullable();
            $table->string('kecamatan')->nullable();
            $table->string('kelurahan')->nullable();
            $table->string('skala_usaha')->nullable();
            $table->string('jenis_perusahaan')->nullable();
            $table->string('tingkat_risiko')->nullable();
            $table->bigInteger('investasi')->nullable();
            $table->integer('tenaga_kerja')->nullable();
            $table->string('no_telp')->nullable();
            $table->string('email')->nullable();
            $table->string('status_usulan')->default('pending'); // pending, disetujui, ditolak
            $table->text('catatan_admin')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('usulan_perubahan');
    }
};
