<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->string('status_halal', 20)->default('Belum')->after('tingkat_risiko');
            $table->string('no_halal', 50)->nullable()->after('status_halal');
            
            $table->string('status_bpom_cppob', 20)->default('Belum')->after('no_halal');
            $table->string('no_bpom_cppob', 50)->nullable()->after('status_bpom_cppob');
            
            $table->string('status_sni', 20)->default('Belum')->after('no_bpom_cppob');
            $table->string('no_sni', 50)->nullable()->after('status_sni');
            
            $table->string('status_hki_merek', 20)->default('Belum')->after('no_sni');
            $table->string('no_hki_merek', 50)->nullable()->after('status_hki_merek');
            $table->string('nama_merek', 100)->nullable()->after('no_hki_merek');
            
            $table->date('tgl_terbit_legalitas')->nullable()->after('nama_merek');
        });

        // Seed realistic initial sample data for existing records
        $records = DB::table('peta_sebaran')->get();
        foreach ($records as $index => $item) {
            $halalStatus = ($index % 2 === 0) ? 'Ada' : (($index % 5 === 0) ? 'Proses' : 'Belum');
            $bpomStatus  = ($index % 3 === 0) ? 'Ada' : (($index % 4 === 0) ? 'Proses' : 'Belum');
            $sniStatus   = ($index % 6 === 0) ? 'Ada' : 'Belum';
            $hkiStatus   = ($index % 3 === 1) ? 'Ada' : (($index % 7 === 0) ? 'Proses' : 'Belum');

            $noHalal = ($halalStatus === 'Ada') ? 'ID35110000' . rand(100000, 999999) : null;
            $noBpom  = ($bpomStatus === 'Ada')  ? 'MD ' . rand(2000, 9999) . rand(100000, 999999) : null;
            $noSni   = ($sniStatus === 'Ada')   ? 'SNI 01-' . rand(1000, 9999) . '-2025' : null;
            $noHki   = ($hkiStatus === 'Ada')   ? 'IPT2025' . rand(100000, 999999) : null;
            $namaMerek = ($hkiStatus !== 'Belum') ? $item->nama_usaha : null;

            DB::table('peta_sebaran')->where('id', $item->id)->update([
                'status_halal' => $halalStatus,
                'no_halal' => $noHalal,
                'status_bpom_cppob' => $bpomStatus,
                'no_bpom_cppob' => $noBpom,
                'status_sni' => $sniStatus,
                'no_sni' => $noSni,
                'status_hki_merek' => $hkiStatus,
                'no_hki_merek' => $noHki,
                'nama_merek' => $namaMerek,
                'tgl_terbit_legalitas' => now()->subDays(rand(10, 300))->format('Y-m-d'),
            ]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->dropColumn([
                'status_halal',
                'no_halal',
                'status_bpom_cppob',
                'no_bpom_cppob',
                'status_sni',
                'no_sni',
                'status_hki_merek',
                'no_hki_merek',
                'nama_merek',
                'tgl_terbit_legalitas',
            ]);
        });
    }
};
