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
            $table->date('tgl_berakhir_hki')->nullable()->after('nama_merek');
        });

        // Seed realistic initial sample dates for existing records with HKI
        $records = DB::table('peta_sebaran')->get();
        foreach ($records as $index => $item) {
            if ($item->status_hki_merek !== 'Belum') {
                // Generate a mix of dates (some expiring within 30-90 days, some long term)
                if ($index % 4 === 0) {
                    $expiryDate = now()->addDays(rand(10, 80))->format('Y-m-d'); // Hampir expired (lonceng aktif)
                } elseif ($index % 7 === 0) {
                    $expiryDate = now()->subDays(rand(5, 30))->format('Y-m-d'); // Sudah expired
                } else {
                    $expiryDate = now()->addYears(rand(2, 8))->format('Y-m-d');
                }

                DB::table('peta_sebaran')->where('id', $item->id)->update([
                    'tgl_berakhir_hki' => $expiryDate
                ]);
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->dropColumn('tgl_berakhir_hki');
        });
    }
};
