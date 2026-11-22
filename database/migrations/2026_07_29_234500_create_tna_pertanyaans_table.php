<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tna_pertanyaans', function (Blueprint $table) {
            $table->id();
            $table->integer('bagian')->default(1); // 1, 2, 3
            $table->integer('nomor_soal')->unique(); // 1 s/d 7
            $table->string('teks_pertanyaan');
            $table->string('jenis_soal')->default('checkbox'); // checkbox, radio, text, textarea
            $table->json('opsi_jawaban')->nullable(); // array of choices
            $table->string('placeholder')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tna_pertanyaans');
    }
};
