<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('registrasi_pelatihan', function (Blueprint $table) {
            $table->id();
            
            // Data Kegiatan
            $table->string('nama_kegiatan');
            
            // Data Diri
            $table->string('nama_lengkap');
            $table->string('nik', 16);
            $table->string('nib', 255)->nullable();
            $table->string('email');
            $table->string('whatsapp');
            $table->enum('jenis_kelamin', ['Laki-laki', 'Perempuan'])->nullable();
            $table->date('tanggal_lahir')->nullable();
            $table->string('foto_ktp')->nullable();
            $table->json('foto_produk')->nullable();

            // Informasi Usaha
            $table->string('nama_usaha');
            $table->string('produk_diproduksi')->nullable();
            $table->text('alamat_usaha')->nullable();
            $table->string('kelurahan')->nullable();
            $table->string('kecamatan')->nullable();
            $table->string('kota')->default('Madiun');
            $table->string('jenis_usaha')->nullable();
            $table->string('tahun_mulai', 10)->nullable();
            $table->string('skala_usaha')->nullable();

            // Omzet & Tantangan
            $table->string('omzet_bulanan')->nullable();
            $table->string('stabilitas_omzet')->nullable();
            $table->json('tantangan_usaha')->nullable();
            $table->json('media_penjualan')->nullable();
            $table->json('cakupan_pemasaran')->nullable();
            $table->integer('karyawan_tetap')->default(0);
            $table->integer('karyawan_tidak_tetap')->default(0);
            $table->string('sistem_usaha')->nullable();

            // Insight & Digital
            $table->string('level_digital')->nullable();
            $table->string('pernah_pelatihan')->nullable();
            $table->text('harapan_pelatihan')->nullable();
            $table->text('target_6_bulan')->nullable();
            $table->boolean('is_lolos')->default(false);

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('registrasi_pelatihan');
    }
};