<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TnaPertanyaan extends Model
{
    protected $table = 'tna_pertanyaans';

    protected $fillable = [
        'bagian',
        'nomor_soal',
        'teks_pertanyaan',
        'jenis_soal',
        'opsi_jawaban',
        'placeholder',
        'is_active',
    ];

    protected $casts = [
        'opsi_jawaban' => 'array',
        'is_active' => 'boolean',
    ];

    /**
     * Seeds or resets the 7 default questions if missing or requested.
     */
    public static function seedDefaults()
    {
        $defaults = [
            [
                'bagian' => 1,
                'nomor_soal' => 1,
                'teks_pertanyaan' => 'Apa kendala operasional terbesar yang paling menghambat perkembangan usaha Anda saat ini?',
                'jenis_soal' => 'checkbox',
                'opsi_jawaban' => [
                    'Pemasaran/penjualan rendah',
                    'Kesulitan akses permodalan',
                    'Kualitas/kapasitas produksi terbatas',
                    'Belum memiliki legalitas/sertifikasi',
                    'Pembukuan keuangan berantakan'
                ],
                'placeholder' => null,
            ],
            [
                'bagian' => 1,
                'nomor_soal' => 2,
                'teks_pertanyaan' => 'Keterampilan teknis apa yang saat ini dirasa paling kurang dan sangat Anda butuhkan?',
                'jenis_soal' => 'checkbox',
                'opsi_jawaban' => [
                    'Penggunaan media sosial/marketplace',
                    'Cara produksi sesuai standar mutu',
                    'Manajemen kas',
                    'Prosedur izin usaha',
                    'Strategi pengemasan/packaging'
                ],
                'placeholder' => null,
            ],
            [
                'bagian' => 2,
                'nomor_soal' => 3,
                'teks_pertanyaan' => 'Topik pelatihan apa yang paling mendesak dan relevan untuk usaha Anda tahun depan?',
                'jenis_soal' => 'checkbox',
                'opsi_jawaban' => [
                    'Fasilitasi Sertifikasi (Halal/BPOM/SNI)',
                    'Digital Marketing & TikTok Shop',
                    'Manajemen Keuangan & Pembukuan',
                    'Desain Kemasan & Branding Produk',
                    'Peningkatan Kualitas & Inovasi Produk'
                ],
                'placeholder' => null,
            ],
            [
                'bagian' => 2,
                'nomor_soal' => 4,
                'teks_pertanyaan' => 'Materi praktik spesifik yang paling ingin Anda pelajari secara langsung?',
                'jenis_soal' => 'text',
                'opsi_jawaban' => [],
                'placeholder' => 'Contoh: Cara membuat iklan FB/TikTok Ads...',
            ],
            [
                'bagian' => 2,
                'nomor_soal' => 5,
                'teks_pertanyaan' => 'Kebutuhan ilmu baru dalam menghadapi persaingan bisnis saat ini?',
                'jenis_soal' => 'text',
                'opsi_jawaban' => [],
                'placeholder' => 'Contoh: Penggunaan AI untuk desain promosi...',
            ],
            [
                'bagian' => 3,
                'nomor_soal' => 6,
                'teks_pertanyaan' => 'Metode pelatihan apa yang paling efektif bagi Anda?',
                'jenis_soal' => 'radio',
                'opsi_jawaban' => [
                    'Kelas tatap muka',
                    'Pelatihan daring/Zoom',
                    'Pendampingan langsung (On-site)'
                ],
                'placeholder' => null,
            ],
            [
                'bagian' => 3,
                'nomor_soal' => 7,
                'teks_pertanyaan' => 'Apakah Anda berkomitmen menerapkan hasil pelatihan demi kemajuan usaha?',
                'jenis_soal' => 'radio',
                'opsi_jawaban' => [
                    'Ya',
                    'Tidak'
                ],
                'placeholder' => null,
            ],
        ];

        foreach ($defaults as $item) {
            self::firstOrCreate(
                ['nomor_soal' => $item['nomor_soal']],
                $item
            );
        }
    }

    /**
     * Force resets all questions to default values.
     */
    public static function resetDefaults()
    {
        $defaults = [
            [
                'bagian' => 1,
                'nomor_soal' => 1,
                'teks_pertanyaan' => 'Apa kendala operasional terbesar yang paling menghambat perkembangan usaha Anda saat ini?',
                'jenis_soal' => 'checkbox',
                'opsi_jawaban' => [
                    'Pemasaran/penjualan rendah',
                    'Kesulitan akses permodalan',
                    'Kualitas/kapasitas produksi terbatas',
                    'Belum memiliki legalitas/sertifikasi',
                    'Pembukuan keuangan berantakan'
                ],
                'placeholder' => null,
            ],
            [
                'bagian' => 1,
                'nomor_soal' => 2,
                'teks_pertanyaan' => 'Keterampilan teknis apa yang saat ini dirasa paling kurang dan sangat Anda butuhkan?',
                'jenis_soal' => 'checkbox',
                'opsi_jawaban' => [
                    'Penggunaan media sosial/marketplace',
                    'Cara produksi sesuai standar mutu',
                    'Manajemen kas',
                    'Prosedur izin usaha',
                    'Strategi pengemasan/packaging'
                ],
                'placeholder' => null,
            ],
            [
                'bagian' => 2,
                'nomor_soal' => 3,
                'teks_pertanyaan' => 'Topik pelatihan apa yang paling mendesak dan relevan untuk usaha Anda tahun depan?',
                'jenis_soal' => 'checkbox',
                'opsi_jawaban' => [
                    'Fasilitasi Sertifikasi (Halal/BPOM/SNI)',
                    'Digital Marketing & TikTok Shop',
                    'Manajemen Keuangan & Pembukuan',
                    'Desain Kemasan & Branding Produk',
                    'Peningkatan Kualitas & Inovasi Produk'
                ],
                'placeholder' => null,
            ],
            [
                'bagian' => 2,
                'nomor_soal' => 4,
                'teks_pertanyaan' => 'Materi praktik spesifik yang paling ingin Anda pelajari secara langsung?',
                'jenis_soal' => 'text',
                'opsi_jawaban' => [],
                'placeholder' => 'Contoh: Cara membuat iklan FB/TikTok Ads...',
            ],
            [
                'bagian' => 2,
                'nomor_soal' => 5,
                'teks_pertanyaan' => 'Kebutuhan ilmu baru dalam menghadapi persaingan bisnis saat ini?',
                'jenis_soal' => 'text',
                'opsi_jawaban' => [],
                'placeholder' => 'Contoh: Penggunaan AI untuk desain promosi...',
            ],
            [
                'bagian' => 3,
                'nomor_soal' => 6,
                'teks_pertanyaan' => 'Metode pelatihan apa yang paling efektif bagi Anda?',
                'jenis_soal' => 'radio',
                'opsi_jawaban' => [
                    'Kelas tatap muka',
                    'Pelatihan daring/Zoom',
                    'Pendampingan langsung (On-site)'
                ],
                'placeholder' => null,
            ],
            [
                'bagian' => 3,
                'nomor_soal' => 7,
                'teks_pertanyaan' => 'Apakah Anda berkomitmen menerapkan hasil pelatihan demi kemajuan usaha?',
                'jenis_soal' => 'radio',
                'opsi_jawaban' => [
                    'Ya',
                    'Tidak'
                ],
                'placeholder' => null,
            ],
        ];

        foreach ($defaults as $item) {
            self::updateOrCreate(
                ['nomor_soal' => $item['nomor_soal']],
                $item
            );
        }
    }
}
