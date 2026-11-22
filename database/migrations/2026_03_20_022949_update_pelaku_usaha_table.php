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
        Schema::dropIfExists('pelaku_usaha');
        Schema::create('pelaku_usaha', function (Blueprint $table) {
            $table->id();
            $table->string('nib', 13)->nullable();
            $table->string('nik', 16)->nullable();
            $table->string('skala_usaha')->nullable();
            $table->string('jenis_perusahaan')->nullable();
            $table->string('nama_perusahaan')->nullable();
            $table->string('nama_proyek')->nullable();
            $table->string('nama_pemilik')->nullable();
            $table->text('alamat_usaha')->nullable();
            $table->string('kecamatan')->nullable();
            $table->string('kelurahan', 100)->nullable();
            $table->char('kbli', 5)->nullable();
            $table->text('uraian_kbli')->nullable();
            $table->string('tingkat_risiko')->nullable();
            $table->bigInteger('investasi')->default(0);
            $table->integer('tenaga_kerja')->default(0);
            $table->string('no_telp')->nullable();
            $table->string('email')->nullable();
            $table->date('tgl_terbit')->nullable();
            $table->string('nama_usaha')->nullable();
            $table->string('pemilik')->nullable();
            $table->text('alamat')->nullable();
            $table->decimal('latitude', 10, 8)->nullable();
            $table->decimal('longitude', 11, 8)->nullable();
            $table->string('kategori', 100)->nullable();
            $table->string('status')->default('Aktif');
            $table->string('sertifikat_halal')->nullable();
            $table->string('bpom')->nullable();
            $table->string('cppob')->nullable();
            $table->string('sni')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pelaku_usaha');
    }
};
