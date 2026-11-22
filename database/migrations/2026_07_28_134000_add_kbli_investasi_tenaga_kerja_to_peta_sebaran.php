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
            $table->string('kbli', 20)->nullable()->after('kategori');
            $table->text('uraian_kbli')->nullable()->after('kbli');
            $table->decimal('investasi', 15, 2)->default(0)->after('uraian_kbli');
            $table->integer('tenaga_kerja')->default(1)->after('investasi');
        });

        // Seeder KBLI 2025, Investasi, dan Tenaga Kerja untuk ke-74 data peta_sebaran
        $kbliMap = [
            'Pangan' => [
                ['kode' => '10794', 'judul' => 'Industri Kerupuk, Keripik, Peyek Dan Sejenisnya'],
                ['kode' => '10710', 'judul' => 'Industri Produk Roti Dan Kue'],
                ['kode' => '10792', 'judul' => 'Industri Bumbu Masak Dan Penyedap Masakan'],
                ['kode' => '10799', 'judul' => 'Industri Produk Makanan Lainnya'],
                ['kode' => '11090', 'judul' => 'Industri Minuman Ringan Lainnya'],
            ],
            'Sandang' => [
                ['kode' => '14111', 'judul' => 'Industri Pakaian Jadi (Konveksi) Dari Tekstil'],
                ['kode' => '14120', 'judul' => 'Industri Pakaian Jadi Menurut Pesanan'],
                ['kode' => '15121', 'judul' => 'Industri Barang Dari Kulit Dan Buatan Kulit'],
            ],
            'Kimia & Furnitur' => [
                ['kode' => '20232', 'judul' => 'Industri Kosmetik Untuk Manusia'],
                ['kode' => '31001', 'judul' => 'Industri Furnitur Dari Kayu'],
                ['kode' => '20115', 'judul' => 'Industri Bahan Kimia Lainnya'],
            ],
            'Kriya' => [
                ['kode' => '32999', 'judul' => 'Industri Kerajinan Tangan / Kriya Lainnya'],
                ['kode' => '16299', 'judul' => 'Industri Kerajinan Kayu Dan Anyaman'],
                ['kode' => '23960', 'judul' => 'Industri Kerajinan Keramik Dan Gerabah'],
            ],
            'Logam & Mesin' => [
                ['kode' => '25920', 'judul' => 'Industri Jasa Pemotongan Dan Pengelasan Logam'],
                ['kode' => '25999', 'judul' => 'Industri Barang Dari Logam Lainnya'],
                ['kode' => '33111', 'judul' => 'Reparasi Produk Logam Siap Pasang'],
            ],
        ];

        $records = DB::table('peta_sebaran')->get();

        foreach ($records as $item) {
            $cat = $item->kategori ?: 'Pangan';
            if (!isset($kbliMap[$cat])) {
                $cat = 'Pangan';
            }

            // Pilih KBLI acak berdasarkan kategori
            $list = $kbliMap[$cat];
            $selectedKbli = $list[array_rand($list)];

            // Nilai investasi acak antara Rp 25.000.000 s/d Rp 350.000.000 (kelipatan 5 juta)
            $investasi = rand(5, 70) * 5000000;

            // Tenaga kerja acak antara 2 s/d 15 orang
            $tenagaKerja = rand(2, 15);

            DB::table('peta_sebaran')
                ->where('id', $item->id)
                ->update([
                    'kbli' => $selectedKbli['kode'],
                    'uraian_kbli' => $selectedKbli['judul'],
                    'investasi' => $investasi,
                    'tenaga_kerja' => $tenagaKerja,
                ]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('peta_sebaran', function (Blueprint $table) {
            $table->dropColumn(['kbli', 'uraian_kbli', 'investasi', 'tenaga_kerja']);
        });
    }
};
