<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasTable('peta_sebaran')) {
            Schema::create('peta_sebaran', function (Blueprint $table) {
                $table->id();
                $table->string('nama_usaha')->nullable();
                $table->string('pemilik')->nullable();
                $table->text('alamat')->nullable();
                $table->string('kelurahan')->nullable();
                $table->string('kategori')->nullable();
                $table->string('latitude')->nullable();
                $table->string('longitude')->nullable();
                $table->timestamps();
            });
        }

        if (Schema::hasColumn('pelaku_usaha', 'latitude') && Schema::hasColumn('pelaku_usaha', 'longitude')) {
            $query = DB::table('pelaku_usaha')
                ->whereNotNull('latitude')
                ->whereNotNull('longitude');

            if (DB::getDriverName() !== 'pgsql') {
                $query->where('latitude', '!=', '')->where('longitude', '!=', '');
            }

            $usahaMapped = $query->limit(68)->get();

            foreach ($usahaMapped as $u) {
                DB::table('peta_sebaran')->insert([
                    'nama_usaha' => $u->nama_usaha ?? $u->nama_perusahaan ?? 'IKM Tanpa Nama',
                    'pemilik' => $u->pemilik ?? $u->nama_pemilik ?? '-',
                    'alamat' => $u->alamat ?? $u->alamat_usaha ?? '-',
                    'kelurahan' => $u->kelurahan ?? '-',
                    'kategori' => $u->kategori ?? 'IKM',
                    'latitude' => $u->latitude,
                    'longitude' => $u->longitude,
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
            }

            DB::table('pelaku_usaha')->update([
                'latitude' => null,
                'longitude' => null
            ]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('peta_sebaran');
    }
};
