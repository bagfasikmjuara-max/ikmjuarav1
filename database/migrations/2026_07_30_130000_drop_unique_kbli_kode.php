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
        try {
            if (DB::getDriverName() === 'pgsql') {
                DB::statement("ALTER TABLE kbli DROP CONSTRAINT IF EXISTS kbli_kode_unique");
                DB::statement("DROP INDEX IF EXISTS kbli_kode_unique");
            } else {
                DB::statement("ALTER TABLE kbli DROP INDEX kbli_kode_unique");
            }
        } catch (\Exception $e) {
            // Index might already be dropped
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
    }
};
