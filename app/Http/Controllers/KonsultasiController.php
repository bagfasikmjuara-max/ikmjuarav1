<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Konsultasi;
use Illuminate\Support\Facades\DB;

class KonsultasiController extends Controller
{
    /**
     * Menyimpan kritik, saran, atau pertanyaan dari masyarakat umum (homepage).
     */
    public function store(Request $request)
    {
        $request->validate([
            'email' => 'required|email|max:255',
            'keluhan' => 'required',
            'captcha' => 'required',
            'captcha_expected' => 'required'
        ]);

        // Verifikasi Captcha sederhana (karena diproses client-side secara aman)
        if (strtolower($request->captcha) !== strtolower($request->captcha_expected)) {
            return response()->json([
                'success' => false,
                'message' => 'Captcha yang Anda masukkan salah.'
            ], 422);
        }

        try {
            // Mengisi data konsultasi ke database
            $konsultasi = Konsultasi::create([
                'nama_ikm' => $request->email, // default field wajib di migrasi awal
                'jenis_usaha' => 'Kritik & Saran', // default jenis_usaha
                'email' => $request->email,
                'keluhan' => $request->keluhan,
                'status' => 'Belum Dijawab'
            ]);

            // Kirim Notifikasi Pengingat WhatsApp ke Admin via Fonnte
            \App\Services\FonnteService::sendNotificationToAdmin(
                $request->email,
                'Kritik & Saran Chatbox',
                $request->keluhan,
                $konsultasi->id
            );

            return response()->json([
                'success' => true,
                'message' => 'Kritik, saran, atau pertanyaan Anda berhasil dikirim!'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal mengirim pesan: ' . $e->getMessage()
            ], 500);
        }
    }

    public function adminIndex()
    {
        $konsultasi = Konsultasi::with('messages')->orderBy('id', 'desc')->get();
        $kategoriList = \App\Models\KategoriKonsultasi::orderBy('id', 'asc')->get();
        
        // PENTING: Untuk menjaga metrik dashboard di layout
        $totalPelakuUsaha = DB::table('pelaku_usaha')->count();
        $totalAdmin = DB::table('users')->count();
        $totalKegiatan = DB::table('list_kegiatan')->count();
        
        return view('admin.konsultasi.index', compact('konsultasi', 'kategoriList', 'totalPelakuUsaha', 'totalAdmin', 'totalKegiatan'));
    }

    /**
     * Menjawab konsultasi / kritik & saran dari halaman Admin.
     */
    public function adminReply(Request $request, $id)
    {
        $request->validate([
            'jawaban' => 'required'
        ]);

        try {
            $konsultasi = Konsultasi::findOrFail($id);

            // Verifikasi apakah sesi konsultasi sudah diakhiri atau kedaluwarsa (lebih dari 24 jam)
            if ($konsultasi->status === 'Selesai' || $konsultasi->updated_at->diffInHours(now()) >= 24) {
                return redirect()->back()->with('error', 'Sesi konsultasi ini telah ditutup atau diakhiri.');
            }

            // Simpan ke tabel konsultasi_pesan
            \App\Models\KonsultasiPesan::create([
                'konsultasi_id' => $konsultasi->id,
                'sender' => 'admin',
                'pesan' => $request->jawaban
            ]);

            // Perbarui data utama, sentuh timestamp (touch) untuk memperpanjang sesi 24 jam
            $konsultasi->touch();
            $konsultasi->update([
                'jawaban' => $request->jawaban, // Tetap isi untuk kompatibilitas data lama
                'status' => 'Sudah Dijawab'
            ]);

            return redirect()->back()->with('success', 'Balasan berhasil dikirim!');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Gagal membalas: ' . $e->getMessage());
        }
    }

    /**
     * Mengakhiri sesi konsultasi secara permanen dari halaman Admin.
     */
    public function adminEnd($id)
    {
        try {
            $konsultasi = Konsultasi::findOrFail($id);
            
            // Tandai status sebagai Selesai
            $konsultasi->update([
                'status' => 'Selesai'
            ]);

            // Buat pesan penutup sistem di chat thread
            \App\Models\KonsultasiPesan::create([
                'konsultasi_id' => $konsultasi->id,
                'sender' => 'admin',
                'pesan' => 'Sesi konsultasi ini telah diakhiri oleh Admin Dinas.'
            ]);

            return redirect()->back()->with('success', 'Sesi konsultasi berhasil diakhiri secara resmi!');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Gagal mengakhiri sesi konsultasi: ' . $e->getMessage());
        }
    }

    /**
     * Mengambil daftar topik kategori pengaduan/konsultasi yang aktif.
     */
    public function getKategori()
    {
        $kategori = \App\Models\KategoriKonsultasi::where('is_active', true)
            ->orderBy('id', 'asc')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $kategori
        ]);
    }

    /**
     * Menambahkan topik kategori konsultasi baru (khusus Admin).
     */
    public function tambahKategori(Request $request)
    {
        $request->validate([
            'nama_kategori' => 'required|string|max:255|unique:kategori_konsultasis,nama_kategori',
            'deskripsi' => 'nullable|string|max:255',
        ]);

        $kat = \App\Models\KategoriKonsultasi::create([
            'nama_kategori' => $request->nama_kategori,
            'deskripsi' => $request->deskripsi,
            'is_active' => true,
        ]);

        return redirect()->back()->with('success', 'Topik kategori pengaduan "' . $kat->nama_kategori . '" berhasil ditambahkan!');
    }

    /**
     * Menghapus topik kategori konsultasi (khusus Admin).
     */
    public function hapusKategori($id)
    {
        $kat = \App\Models\KategoriKonsultasi::findOrFail($id);
        $kat->delete();

        return redirect()->back()->with('success', 'Topik kategori berhasil dihapus.');
    }

    /**
     * Mengambil riwayat pesan real-time untuk sebuah konsultasi.
     */
    public function getPesan($id)
    {
        $konsultasi = Konsultasi::with('messages')->find($id);

        if (!$konsultasi) {
            return response()->json(['success' => false, 'message' => 'Konsultasi tidak ditemukan.'], 404);
        }

        return response()->json([
            'success' => true,
            'status' => $konsultasi->status,
            'updated_at' => $konsultasi->updated_at ? $konsultasi->updated_at->toDateTimeString() : null,
            'messages' => $konsultasi->messages
        ]);
    }

    /**
     * Pengguna mengirimkan balasan pesan di thread chat WhatsApp.
     */
    public function kirimPesanUser(Request $request)
    {
        $request->validate([
            'konsultasi_id' => 'required|exists:konsultasi,id',
            'pesan' => 'required|string',
        ]);

        $konsultasi = Konsultasi::findOrFail($request->konsultasi_id);

        if ($konsultasi->status === 'Selesai') {
            return response()->json([
                'success' => false,
                'message' => 'Sesi konsultasi ini telah diakhiri secara resmi oleh admin.'
            ], 422);
        }

        // Simpan pesan balasan dari user
        $pesanBaru = \App\Models\KonsultasiPesan::create([
            'konsultasi_id' => $konsultasi->id,
            'sender' => 'user',
            'pesan' => $request->pesan,
        ]);

        // Perbarui timestamp & status menjadi Belum Dijawab agar muncul di notifikasi admin
        $konsultasi->touch();
        if ($konsultasi->status === 'Sudah Dijawab') {
            $konsultasi->update(['status' => 'Belum Dijawab']);
        }

        return response()->json([
            'success' => true,
            'message' => 'Pesan berhasil dikirim!',
            'data' => $pesanBaru
        ]);
    }
}
