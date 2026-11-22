<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class FonnteService
{
    /**
     * Mengirim notifikasi pesan WhatsApp pengingat ke Admin via Fonnte Gateway.
     *
     * @param string $pengirim Nama atau Email pengirim konsultasi
     * @param string $topik Topik atau Kategori Konsultasi
     * @param string $pesan Isi pesan dari pengirim
     * @param int|null $konsultasiId ID data konsultasi (opsional)
     * @return array Status pengiriman notifikasi
     */
    public static function sendNotificationToAdmin($pengirim, $topik, $pesan, $konsultasiId = null)
    {
        try {
            // Ambil pengaturan Fonnte dari database (statistik_kecamatan) atau config
            $config = DB::table('statistik_kecamatan')->first();

            $token = $config->fonnte_token ?? env('FONNTE_TOKEN');
            $adminWaNumber = $config->admin_wa_number ?? env('ADMIN_WA_NUMBER', '081234567890');
            $isActive = (bool)($config->wa_notif_active ?? true);

            // Jika notifikasi WA dinonaktifkan atau token belum diisi, lewati pengiriman dengan log
            if (!$isActive) {
                Log::info('Notifikasi WhatsApp Fonnte dinonaktifkan di pengaturan.');
                return ['success' => false, 'message' => 'Notifikasi WhatsApp dinonaktifkan.'];
            }

            if (empty($token)) {
                Log::warning('Token Fonnte belum diisi di Pengaturan Akses Admin.');
                return ['success' => false, 'message' => 'Token Fonnte belum diatur.'];
            }

            // Sanitasi nomor telepon admin (Ubah 08xx -> 628xx)
            $targetWa = preg_replace('/[^0-9]/', '', $adminWaNumber);
            if (str_starts_with($targetWa, '08')) {
                $targetWa = '628' . substr($targetWa, 2);
            }

            // Format Pesan Notifikasi WhatsApp Pengingat Admin
            $nowStr = now()->translatedFormat('d F Y H:i') . ' WIB';
            $linkUrl = url('/dukungan/konsultasi');

            $waMessage = "🔔 *PENGINGAT KONSULTASI BARU - IKM JUARA*\n\n"
                       . "Halo Admin Dinas! Ada pesan konsultasi/pertanyaan baru yang membutuhkan tanggapan Anda:\n\n"
                       . "👤 *Pengirim:* {$pengirim}\n"
                       . "📌 *Topik:* {$topik}\n"
                       . "⏰ *Waktu Masuk:* {$nowStr}\n\n"
                       . "✉️ *Isi Pesan:*\n\"{$pesan}\"\n\n"
                       . "👉 *Tanggapi Langsung di Dashboard Admin:*\n"
                       . "{$linkUrl}\n\n"
                       . "_Sistem Notifikasi Otomatis IKM JUARA Kota Madiun_";

            // Kirim HTTP POST request ke Fonnte API Gateway
            $response = Http::withHeaders([
                'Authorization' => $token,
            ])->timeout(10)->post('https://api.fonnte.com/send', [
                'target' => $targetWa,
                'message' => $waMessage,
                'countryCode' => '62',
            ]);

            $result = $response->json();
            Log::info('Fonnte WhatsApp Notification Dispatch Result:', $result ?? []);

            return [
                'success' => $response->successful() && ($result['status'] ?? false),
                'response' => $result
            ];

        } catch (\Exception $e) {
            Log::error('Fonnte WhatsApp Notification Error: ' . $e->getMessage());
            return [
                'success' => false,
                'message' => 'Error API Fonnte: ' . $e->getMessage()
            ];
        }
    }
}
