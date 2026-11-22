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
            if (!Schema::hasColumn('pelaku_usaha', 'nib')) {
                $table->string('nib', 13)->nullable()->after('id');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'nik')) {
                $table->string('nik', 16)->nullable()->after('nib');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'skala_usaha')) {
                $table->string('skala_usaha')->nullable()->after('nik');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'jenis_perusahaan')) {
                $table->string('jenis_perusahaan')->nullable()->after('skala_usaha');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'nama_perusahaan')) {
                $table->string('nama_perusahaan')->nullable()->after('jenis_perusahaan');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'nama_proyek')) {
                $table->string('nama_proyek')->nullable()->after('nama_perusahaan');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'nama_pemilik')) {
                $table->string('nama_pemilik')->nullable()->after('nama_proyek');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'alamat_usaha')) {
                $table->text('alamat_usaha')->nullable()->after('nama_pemilik');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'kecamatan')) {
                $table->string('kecamatan')->nullable()->after('alamat_usaha');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'kbli')) {
                $table->char('kbli', 5)->nullable()->after('kecamatan');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'uraian_kbli')) {
                $table->text('uraian_kbli')->nullable()->after('kbli');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'tingkat_risiko')) {
                $table->string('tingkat_risiko')->nullable()->after('uraian_kbli');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'investasi')) {
                $table->bigInteger('investasi')->default(0)->after('tingkat_risiko');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'tenaga_kerja')) {
                $table->integer('tenaga_kerja')->default(0)->after('investasi');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'no_telp')) {
                $table->string('no_telp')->nullable()->after('tenaga_kerja');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'email')) {
                $table->string('email')->nullable()->after('no_telp');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'tgl_terbit')) {
                $table->date('tgl_terbit')->nullable()->after('email');
            }
            if (!Schema::hasColumn('pelaku_usaha', 'updated_at')) {
                $table->timestamp('updated_at')->nullable()->after('created_at');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pelaku_usaha', function (Blueprint $table) {
            $table->dropColumn([
                'nib', 'nik', 'skala_usaha', 'jenis_perusahaan', 'nama_perusahaan',
                'nama_proyek', 'nama_pemilik', 'alamat_usaha', 'kecamatan', 'kbli',
                'uraian_kbli', 'tingkat_risiko', 'investasi', 'tenaga_kerja', 'no_telp',
                'email', 'tgl_terbit', 'updated_at'
            ]);
        });
    }
};
