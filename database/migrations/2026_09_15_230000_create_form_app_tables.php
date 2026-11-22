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
        Schema::create('form_app_templates', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('penyelenggara')->default('Dinas Tenaga Kerja, Koperasi Usaha Kecil dan Menengah Kota Madiun');
            $table->string('lokasi')->default('Resto I Club Madiun (Aula Utama)');
            $table->date('tanggal');
            $table->string('slug')->unique(); // Unique shareable token URL
            $table->json('structure'); // Sections, Questions, Choice options, and Score points
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        Schema::create('form_app_responses', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('template_id');
            $table->string('nama_ikm')->nullable();
            $table->json('answers');
            $table->integer('total_score')->default(0);
            $table->integer('max_score')->default(100);
            $table->timestamps();

            $table->foreign('template_id')
                  ->references('id')
                  ->on('form_app_templates')
                  ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('form_app_responses');
        Schema::dropIfExists('form_app_templates');
    }
};
