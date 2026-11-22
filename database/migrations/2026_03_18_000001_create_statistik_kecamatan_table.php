<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('statistik_kecamatan')) {
            Schema::create('statistik_kecamatan', function (Blueprint $table) {
                $table->id();
                $table->string('kecamatan')->unique();
                $table->integer('jumlah_ikm')->default(0);
                $table->integer('jumlah')->default(0);
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('statistik_kecamatan');
    }
};
