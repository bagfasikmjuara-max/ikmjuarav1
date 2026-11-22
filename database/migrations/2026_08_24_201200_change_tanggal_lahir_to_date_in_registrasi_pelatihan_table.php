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
        if (Schema::hasTable('registrasi_pelatihan') && Schema::hasColumn('registrasi_pelatihan', 'tanggal_lahir')) {
            Schema::table('registrasi_pelatihan', function (Blueprint $table) {
                $table->date('tanggal_lahir')->nullable()->change();
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasTable('registrasi_pelatihan') && Schema::hasColumn('registrasi_pelatihan', 'tanggal_lahir')) {
            Schema::table('registrasi_pelatihan', function (Blueprint $table) {
                $table->dateTime('tanggal_lahir')->nullable()->change();
            });
        }
    }
};
