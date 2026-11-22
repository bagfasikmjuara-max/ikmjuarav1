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
            $table->string('tingkat_risiko')->nullable()->after('skala_usaha');
        });

        // Bersihkan kategori Kuliner -> Pangan, Fashion -> Sandang
        DB::table('peta_sebaran')
            ->where('kategori', 'Kuliner')
            ->orWhere('kategori', 'Makanan')
            ->update(['kategori' => 'Pangan']);

        DB::table('peta_sebaran')
            ->where('kategori', 'Fashion')
            ->update(['kategori' => 'Sandang']);

        // Pastikan semua kategori kosong terisi default
        DB::table('peta_sebaran')
            ->whereNull('kategori')
            ->orWhere('kategori', '')
            ->update(['kategori' => 'Pangan']);

        // Salin tingkat_risiko dari pelaku_usaha jika ada
        $sebarans = DB::table('peta_sebaran')->get();
        foreach ($sebarans as $s) {
            $pu = DB::table('pelaku_usaha')
                ->where('nama_usaha', $s->nama_usaha)
                ->orWhere('nama_perusahaan', $s->nama_usaha)
                ->first();

            $risiko = 'Rendah';
            if ($pu && $pu->tingkat_risiko && $pu->tingkat_risiko !== 'Mikro') {
                $risiko = $pu->tingkat_risiko;
            }

            DB::table('peta_sebaran')
                ->where('id', $s->id)
                ->update(['tingkat_risiko' => $risiko]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->dropColumn('tingkat_risiko');
        });
    }
};
