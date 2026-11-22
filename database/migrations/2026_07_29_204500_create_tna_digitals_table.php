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
        Schema::create('tna_digitals', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('ikm_id')->nullable();
            $table->string('nama_usaha');
            $table->string('pemilik');
            $table->string('nik')->nullable();
            $table->string('nib')->nullable();
            $table->string('no_hp')->nullable();
            $table->string('kecamatan')->nullable();
            $table->string('kelurahan')->nullable();
            $table->json('kendala_operasional')->nullable();
            $table->json('keterampilan_kurang')->nullable();
            $table->json('topik_pelatihan_prioritas')->nullable();
            $table->text('materi_praktik_spesifik')->nullable();
            $table->text('kebutuhan_ilmu_baru')->nullable();
            $table->string('metode_efektif')->nullable();
            $table->string('komitmen_penerapan')->default('Ya');
            $table->json('tag_antrean_pelatihan')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tna_digitals');
    }
};
