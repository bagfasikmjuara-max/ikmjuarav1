<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('kategori_konsultasis', function (Blueprint $table) {
            $table->id();
            $table->string('nama_kategori')->unique();
            $table->string('deskripsi')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        // Insert initial default categories
        DB::table('kategori_konsultasis')->insert([
            [
                'nama_kategori' => 'Pendampingan Manajemen Usaha',
                'deskripsi' => 'Konsultasi mengenai tata kelola usaha, manajemen kas, dan legalitas',
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'nama_kategori' => 'Strategi Pemasaran Digital',
                'deskripsi' => 'Konsultasi seputar promosi media sosial, TikTok/FB Ads, marketplace, dan branding',
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'nama_kategori' => 'Keluhan / Aspirasi Industri',
                'deskripsi' => 'Penyampaian keluhan operasional, perizinan industri, dan fasilitasi dinas',
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kategori_konsultasis');
    }
};
