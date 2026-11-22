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
        Schema::table('konsultasi', function (Blueprint $table) {
            $table->string('email')->nullable()->after('nama_ikm');
            $table->text('jawaban')->nullable()->after('keluhan');
            $table->string('status')->default('Belum Dijawab')->after('jawaban');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('konsultasi', function (Blueprint $table) {
            $table->dropColumn(['email', 'jawaban', 'status']);
        });
    }
};
