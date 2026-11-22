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
        // 1. Ambil data peta_sebaran yang sudah ada (68 records) beserta koordinatnya
        $existingSebaran = DB::table('peta_sebaran')->get();

        // 2. Drop table lama
        Schema::dropIfExists('peta_sebaran');

        // 3. Create table baru dengan kolom lengkap
        Schema::create('peta_sebaran', function (Blueprint $table) {
            $table->id();
            $table->string('nama_usaha')->nullable();
            $table->string('pemilik')->nullable();
            $table->string('nib', 13)->nullable();
            $table->string('nik', 16)->nullable();
            $table->string('no_hp')->nullable();
            $table->string('produk')->nullable();
            $table->string('alamat_jalan')->nullable();
            $table->string('alamat_no')->nullable();
            $table->string('kelurahan')->nullable();
            $table->string('kecamatan')->nullable();
            $table->string('kota_madiun')->default('Kota Madiun');
            $table->string('kategori')->nullable();
            $table->string('skala_usaha')->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->timestamps();
        });

        // 4. Masukkan kembali data 68 record dengan data tambahan dari pelaku_usaha
        foreach ($existingSebaran as $es) {
            // Cari data di pelaku_usaha yang nama_usaha atau nama_perusahaan nya mirip
            $pu = DB::table('pelaku_usaha')
                ->where('nama_usaha', $es->nama_usaha)
                ->orWhere('nama_perusahaan', $es->nama_usaha)
                ->first();

            DB::table('peta_sebaran')->insert([
                'id' => $es->id,
                'nama_usaha' => $es->nama_usaha,
                'pemilik' => $es->pemilik,
                'nib' => $pu->nib ?? null,
                'nik' => $pu->nik ?? null,
                'no_hp' => $pu->no_telp ?? $pu->no_hp ?? null,
                'produk' => $pu->produk_utama ?? $pu->nama_proyek ?? '-',
                'alamat_jalan' => $es->alamat,
                'alamat_no' => '-',
                'kelurahan' => $es->kelurahan,
                'kecamatan' => $pu->kecamatan ?? '-',
                'kota_madiun' => 'Kota Madiun',
                'kategori' => $es->kategori,
                'skala_usaha' => $pu->skala_usaha ?? 'Mikro',
                'latitude' => $es->latitude,
                'longitude' => $es->longitude,
                'created_at' => $es->created_at,
                'updated_at' => $es->updated_at
            ]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('peta_sebaran');
    }
};
