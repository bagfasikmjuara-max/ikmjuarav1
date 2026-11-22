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
        Schema::table('usulan_perubahan', function (Blueprint $table) {
            $table->string('tipe_usulan', 20)->default('perubahan')->after('status_usulan');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('usulan_perubahan', function (Blueprint $table) {
            $table->dropColumn('tipe_usulan');
        });
    }
};
