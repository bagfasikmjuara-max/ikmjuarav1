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
        Schema::create('database_hki_mereks', function (Blueprint $table) {
            $table->id();
            $table->string('nik', 16)->nullable();
            $table->string('nib', 13)->nullable();
            $table->string('nomor_transaksi')->nullable();
            $table->string('merek');
            $table->string('kelas')->nullable();
            $table->string('nomor_permohonan')->nullable();
            $table->text('link_tanda_daftar')->nullable();
            $table->string('tipe_permohonan')->default('Merek Dagang');
            $table->string('status_permohonan_merek')->default('(TM) Didaftar');
            $table->text('link_sertifikat_merek')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('database_hki_mereks');
    }
};
