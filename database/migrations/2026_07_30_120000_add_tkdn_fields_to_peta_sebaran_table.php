<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->string('status_tkdn')->default('Belum')->after('link_gdrive_hki_merek');
            $table->string('no_sertifikat_tkdn')->nullable()->after('status_tkdn');
            $table->string('persentase_tkdn')->nullable()->after('no_sertifikat_tkdn');
            $table->string('link_gdrive_tkdn')->nullable()->after('persentase_tkdn');
        });
    }

    public function down(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->dropColumn(['status_tkdn', 'no_sertifikat_tkdn', 'persentase_tkdn', 'link_gdrive_tkdn']);
        });
    }
};
