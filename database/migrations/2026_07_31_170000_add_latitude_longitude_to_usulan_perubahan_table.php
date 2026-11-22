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
        if (Schema::hasTable('usulan_perubahan')) {
            Schema::table('usulan_perubahan', function (Blueprint $table) {
                if (!Schema::hasColumn('usulan_perubahan', 'latitude')) {
                    $table->string('latitude', 50)->nullable()->after('tenaga_kerja');
                }
                if (!Schema::hasColumn('usulan_perubahan', 'longitude')) {
                    $table->string('longitude', 50)->nullable()->after('latitude');
                }
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasTable('usulan_perubahan')) {
            Schema::table('usulan_perubahan', function (Blueprint $table) {
                if (Schema::hasColumn('usulan_perubahan', 'longitude')) {
                    $table->dropColumn('longitude');
                }
                if (Schema::hasColumn('usulan_perubahan', 'latitude')) {
                    $table->dropColumn('latitude');
                }
            });
        }
    }
};
