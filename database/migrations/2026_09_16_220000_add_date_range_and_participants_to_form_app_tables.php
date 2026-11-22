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
        Schema::table('form_app_templates', function (Blueprint $table) {
            if (!Schema::hasColumn('form_app_templates', 'tanggal_selesai')) {
                $table->date('tanggal_selesai')->nullable()->after('tanggal');
            }
            if (!Schema::hasColumn('form_app_templates', 'peserta_list')) {
                $table->longText('peserta_list')->nullable()->after('structure');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('form_app_templates', function (Blueprint $table) {
            if (Schema::hasColumn('form_app_templates', 'tanggal_selesai')) {
                $table->dropColumn('tanggal_selesai');
            }
            if (Schema::hasColumn('form_app_templates', 'peserta_list')) {
                $table->dropColumn('peserta_list');
            }
        });
    }
};
