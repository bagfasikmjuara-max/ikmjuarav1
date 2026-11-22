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
        Schema::create('permohonan_hki_merek', function (Blueprint $table) {
            $table->id();
            $table->string('nama_lengkap');
            $table->string('nik', 16);
            $table->string('nib', 13);
            $table->string('nama_merek');
            $table->string('kelas_merek');
            $table->text('uraian_barang_jasa')->nullable();
            $table->text('alamat_ktp');
            $table->text('alamat_usaha');
            $table->string('no_hp');
            $table->string('file_ktp')->nullable();
            $table->string('file_nib')->nullable();
            $table->string('file_etiket_merek')->nullable();
            $table->string('file_surat_pernyataan')->nullable();
            $table->string('status')->default('Pending'); // Pending, Disetujui, Ditolak, Selesai
            $table->text('catatan_admin')->nullable();
            $table->text('link_gdrive_rekom')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('permohonan_hki_merek');
    }
};
