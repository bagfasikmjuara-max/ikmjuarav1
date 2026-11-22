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
        Schema::create('database_halals', function (Blueprint $table) {
            $table->id();
            $table->string('nik', 16)->nullable();
            $table->string('nib', 13)->nullable();
            $table->string('no_daftar')->nullable();
            $table->string('nama_pu');
            $table->string('merk_dagang')->nullable();
            $table->string('tanggal_daftar')->nullable();
            $table->string('status')->default('Terbit');
            $table->string('tanggal_sertifikat')->nullable();
            $table->string('no_sertifikat')->nullable();
            $table->string('nama_fasilitator')->nullable();
            $table->string('jenis_produk')->nullable();
            $table->text('link_sertifikat_halal')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('database_halals');
    }
};
