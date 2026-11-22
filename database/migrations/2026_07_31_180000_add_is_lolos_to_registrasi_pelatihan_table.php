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
        if (Schema::hasTable('registrasi_pelatihan')) {
            Schema::table('registrasi_pelatihan', function (Blueprint $table) {
                if (!Schema::hasColumn('registrasi_pelatihan', 'is_lolos')) {
                    $table->tinyInteger('is_lolos')->default(1)->after('target_6_bulan');
                }
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasTable('registrasi_pelatihan')) {
            Schema::table('registrasi_pelatihan', function (Blueprint $table) {
                if (Schema::hasColumn('registrasi_pelatihan', 'is_lolos')) {
                    $table->dropColumn('is_lolos');
                }
            });
        }
    }
};
