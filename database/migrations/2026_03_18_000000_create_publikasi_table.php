<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('publikasi')) {
            Schema::create('publikasi', function (Blueprint $table) {
                $table->id();
                $table->string('judul');
                $table->string('gambar');
                $table->date('tanggal');
                $table->string('waktu')->nullable();
                $table->text('deskripsi');
                $table->string('status')->default('Informasi');
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('publikasi');
    }
};
