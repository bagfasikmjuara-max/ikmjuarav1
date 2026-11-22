<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            if (!Schema::hasColumn('statistik_kecamatan', 'fonnte_token')) {
                $table->string('fonnte_token')->nullable();
            }
            if (!Schema::hasColumn('statistik_kecamatan', 'admin_wa_number')) {
                $table->string('admin_wa_number')->nullable();
            }
            if (!Schema::hasColumn('statistik_kecamatan', 'wa_notif_active')) {
                $table->boolean('wa_notif_active')->default(true);
            }
        });
    }

    public function down(): void
    {
        Schema::table('statistik_kecamatan', function (Blueprint $table) {
            $table->dropColumn(['fonnte_token', 'admin_wa_number', 'wa_notif_active']);
        });
    }
};
