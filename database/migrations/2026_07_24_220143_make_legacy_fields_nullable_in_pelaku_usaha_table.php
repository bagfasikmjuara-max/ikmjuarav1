<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('pelaku_usaha', function (Blueprint $table) {
            if (Schema::hasColumn('pelaku_usaha', 'nama_usaha')) {
                $table->string('nama_usaha')->nullable()->change();
            }
            if (Schema::hasColumn('pelaku_usaha', 'latitude')) {
                $table->decimal('latitude', 10, 8)->nullable()->change();
            }
            if (Schema::hasColumn('pelaku_usaha', 'longitude')) {
                $table->decimal('longitude', 11, 8)->nullable()->change();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pelaku_usaha', function (Blueprint $table) {
            if (Schema::hasColumn('pelaku_usaha', 'nama_usaha')) {
                $table->string('nama_usaha')->nullable(false)->change();
            }
            if (Schema::hasColumn('pelaku_usaha', 'latitude')) {
                $table->decimal('latitude', 10, 8)->nullable(false)->change();
            }
            if (Schema::hasColumn('pelaku_usaha', 'longitude')) {
                $table->decimal('longitude', 11, 8)->nullable(false)->change();
            }
        });
    }
};
