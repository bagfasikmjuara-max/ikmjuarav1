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
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->text('link_gdrive_nib')->nullable()->after('nib');
            $table->text('link_gdrive_halal')->nullable()->after('no_halal');
            $table->text('link_gdrive_bpom_cppob')->nullable()->after('no_bpom_cppob');
            $table->text('link_gdrive_sni')->nullable()->after('no_sni');
            $table->text('link_gdrive_hki_merek')->nullable()->after('nama_merek');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->dropColumn([
                'link_gdrive_nib',
                'link_gdrive_halal',
                'link_gdrive_bpom_cppob',
                'link_gdrive_sni',
                'link_gdrive_hki_merek',
            ]);
        });
    }
};
