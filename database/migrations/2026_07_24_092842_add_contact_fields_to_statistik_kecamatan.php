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
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            $table->string('telp_dinas')->nullable()->default('(0351) 454288')->after('sosial_media');
            $table->string('email_dinas')->nullable()->default('disnaker@madiunkota.go.id')->after('telp_dinas');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            $table->dropColumn(['telp_dinas', 'email_dinas']);
        });
    }
};
