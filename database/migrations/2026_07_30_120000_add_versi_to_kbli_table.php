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
        if (Schema::hasTable('kbli') && !Schema::hasColumn('kbli', 'versi')) {
            Schema::table('kbli', function (Blueprint $table) {
                $table->string('versi')->default('KBLI 2020')->after('judul');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasTable('kbli') && Schema::hasColumn('kbli', 'versi')) {
            Schema::table('kbli', function (Blueprint $table) {
                $table->dropColumn('versi');
            });
        }
    }
};
