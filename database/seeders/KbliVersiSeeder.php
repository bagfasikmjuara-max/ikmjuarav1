<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class KbliVersiSeeder extends Seeder
{
    public function run(): void
    {
        // Update existing KBLI to KBLI 2020
        DB::table('kbli')->whereNull('versi')->orWhere('versi', '')->update(['versi' => 'KBLI 2020']);

        // Insert / Update KBLI 2025 entries (Key transition KBLIs for manufacturing, food, apparel, tech, etc.)
        $kbli2025Data = [
            ['kode' => '10710', 'judul' => 'INDUSTRI PRODUK ROTI DAN KUE', 'versi' => 'KBLI 2025'],
            ['kode' => '10793', 'judul' => 'INDUSTRI MAKANAN DARI KEDELAI DAN KACANG-KACANGAN (SAMBEL PECEL)', 'versi' => 'KBLI 2025'],
            ['kode' => '10794', 'judul' => 'INDUSTRI KERUPIK, KERIPIK, PEYEK DAN SEJENISNYA', 'versi' => 'KBLI 2025'],
            ['kode' => '10613', 'judul' => 'INDUSTRI TEPUNG DARI PORANG', 'versi' => 'KBLI 2025'],
            ['kode' => '11051', 'judul' => 'PRODUKSI AIR MINUM DALAM KEMASAN (AMDK)', 'versi' => 'KBLI 2025'],
            ['kode' => '13134', 'judul' => 'INDUSTRI BATIK TULIS DAN CAP TRADISIONAL', 'versi' => 'KBLI 2025'],
            ['kode' => '14120', 'judul' => 'PENJAHITAN DAN PEMBUATAN PAKAIAN SESUAI PESANAN (KONVEKSI)', 'versi' => 'KBLI 2025'],
            ['kode' => '25920', 'judul' => 'JASA INDUSTRI UNTUK BERBAGAI PENGERJAAN KHUSUS LOGAM DAN BARANG DARI LOGAM', 'versi' => 'KBLI 2025'],
            ['kode' => '28193', 'judul' => 'INDUSTRI MESIN PENDINGIN & PERALATAN TEKNIK', 'versi' => 'KBLI 2025'],
            ['kode' => '30200', 'judul' => 'INDUSTRI LOKOMOTIF DAN GERBONG KERETA SERTA SUKU CADANGNYA', 'versi' => 'KBLI 2025'],
            ['kode' => '33141', 'judul' => 'REPARASI MOTOR LISTRIK, GENERATOR DAN TRANSFORMATOR', 'versi' => 'KBLI 2025'],
            ['kode' => '62019', 'judul' => 'AKTIVITAS PEMROGRAMAN KOMPUTER & TEKNOLOGI INFORMASI', 'versi' => 'KBLI 2025'],
            ['kode' => '62090', 'judul' => 'AKTIVITAS TEKNOLOGI INFORMASI DAN JASA KOMPUTER LAINNYA', 'versi' => 'KBLI 2025'],
            ['kode' => '21022', 'judul' => 'INDUSTRI PRODUK OBAT TRADISIONAL DAN HERBAL UNTUK MANUSIA', 'versi' => 'KBLI 2025'],
            ['kode' => '11090', 'judul' => 'INDUSTRI MINUMAN LAINNYA & JAMU BOTOLAN', 'versi' => 'KBLI 2025'],
            ['kode' => '18111', 'judul' => 'PERCETAKAN UMUM DAN KEMASAN KERTAS', 'versi' => 'KBLI 2025'],
            ['kode' => '16292', 'judul' => 'INDUSTRI KERAJINAN BARANG DARI KAYU, BAMBU, GONI DAN ANYAMAN', 'versi' => 'KBLI 2025'],
            ['kode' => '10750', 'judul' => 'INDUSTRI MAKANAN DAN MASAKAN OLAHAN SIAP SAJI', 'versi' => 'KBLI 2025'],
            ['kode' => '20292', 'judul' => 'INDUSTRI BAHAN PELEDAK DAN KEMBANG API', 'versi' => 'KBLI 2025'],
            ['kode' => '14111', 'judul' => 'INDUSTRI PAKAIAN JADI (KONFEKSI) DARI TEKSTIL', 'versi' => 'KBLI 2025']
        ];

        foreach ($kbli2025Data as $item) {
            DB::table('kbli')->updateOrInsert(
                ['kode' => $item['kode'], 'versi' => 'KBLI 2025'],
                ['judul' => $item['judul'], 'updated_at' => now(), 'created_at' => now()]
            );
        }
    }
}
