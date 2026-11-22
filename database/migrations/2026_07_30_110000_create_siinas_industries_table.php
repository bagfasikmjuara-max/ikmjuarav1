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
        Schema::create('siinas_industries', function (Blueprint $table) {
            $table->id();
            $table->integer('no_urut')->nullable();
            $table->string('nama_perusahaan');
            $table->text('alamat_kantor_pusat')->nullable();
            $table->string('provinsi_kantor')->default('Jawa Timur')->nullable();
            $table->string('kode_provinsi_kantor')->nullable();
            $table->string('kabkota_kantor')->default('Kota Madiun')->nullable();
            $table->string('kode_kabkota_kantor')->nullable();
            $table->string('kode_kelurahan_kantor')->nullable();
            $table->string('kode_kecamatan_kantor')->nullable();
            
            $table->text('alamat_pabrik')->nullable();
            $table->string('provinsi_pabrik')->default('Jawa Timur')->nullable();
            $table->string('kode_provinsi_pabrik')->nullable();
            $table->string('kabkota_pabrik')->default('Kota Madiun')->nullable();
            $table->string('kode_kabkota_pabrik')->nullable();
            $table->string('kode_kelurahan_pabrik')->nullable();
            $table->string('kode_kecamatan_pabrik')->nullable();
            
            $table->string('kbli')->nullable();
            $table->text('bidang_usaha')->nullable();
            $table->string('tanggal_registrasi')->nullable();
            $table->string('skala_usaha')->nullable(); // Besar, Menengah, Kecil, Belum Melapor/Mengisi Investasi
            $table->string('status_pelaporan')->default('Terverifikasi SIINas')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('siinas_industries');
    }
};
