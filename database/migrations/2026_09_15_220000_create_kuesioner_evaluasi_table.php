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
        Schema::create('kuesioner_evaluasi', function (Blueprint $table) {
            $table->id();
            $table->string('penyelenggara')->default('Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun');
            $table->string('lokasi');
            $table->date('tanggal');
            $table->string('nama_ikm')->nullable();
            $table->json('jawaban_bagian_a'); // Q1 - Q10
            $table->json('jawaban_bagian_b'); // Q11 - Q17
            $table->json('jawaban_bagian_c'); // Q18 - Q22
            $table->json('jawaban_bagian_d'); // Q23 - Q25
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kuesioner_evaluasi');
    }
};
