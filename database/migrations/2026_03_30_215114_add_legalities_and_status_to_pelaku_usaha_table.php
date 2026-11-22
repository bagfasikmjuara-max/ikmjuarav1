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
        Schema::table('pelaku_usaha', function (Blueprint $table) {
            if (!Schema::hasColumn('pelaku_usaha', 'status')) {
                $table->string('status')->default('Aktif');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'sertifikat_halal')) {
                $table->string('sertifikat_halal')->nullable();
            }
            if (!Schema::hasColumn('pelaku_usaha', 'bpom')) {
                $table->string('bpom')->nullable();
            }
            if (!Schema::hasColumn('pelaku_usaha', 'cppob')) {
                $table->string('cppob')->nullable();
            }
            if (!Schema::hasColumn('pelaku_usaha', 'sni')) {
                $table->string('sni')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pelaku_usaha', function (Blueprint $table) {
            $table->dropColumn(['status', 'sertifikat_halal', 'bpom', 'cppob', 'sni']);
        });
    }
};
