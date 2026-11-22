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
        Schema::table('registrasi_pelatihan', function (Blueprint $table) {
            if (!Schema::hasColumn('registrasi_pelatihan', 'produk_diproduksi')) {
                $table->string('produk_diproduksi')->nullable()->after('nama_usaha');
            }
            if (!Schema::hasColumn('registrasi_pelatihan', 'foto_produk')) {
                $table->text('foto_produk')->nullable()->after('foto_ktp');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('registrasi_pelatihan', function (Blueprint $table) {
            if (Schema::hasColumn('registrasi_pelatihan', 'produk_diproduksi')) {
                $table->dropColumn('produk_diproduksi');
            }
            if (Schema::hasColumn('registrasi_pelatihan', 'foto_produk')) {
                $table->dropColumn('foto_produk');
            }
        });
    }
};
