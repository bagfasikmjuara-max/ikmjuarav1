<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PermohonanHkiMerek;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\Services\FonnteService;

class LayananMppController extends Controller
{
    /**
     * Tampilan Halaman Formulir Permohonan HKI Merek di Layanan MPP.
     */
    public function index()
    {
        return view('layananmpp');
    }

    /**
     * Memproses Pengajuan Formulir Permohonan Rekomendasi HKI Merek.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama_lengkap'          => 'required|string|max:255',
            'nik'                   => 'required|string|size:16',
            'nib'                   => 'required|string|size:13',
            'nama_merek'            => 'required|string|max:255',
            'kelas_merek'           => 'required|string|max:100',
            'uraian_barang_jasa'    => 'required|string',
            'alamat_ktp'            => 'required|string',
            'alamat_usaha'          => 'required|string',
            'no_hp'                 => 'required|string|max:20',
            'file_ktp'              => 'required|file|mimes:jpg,jpeg,png,pdf|max:10240',
            'file_nib'              => 'required|file|mimes:jpg,jpeg,png,pdf|max:10240',
            'file_etiket_merek'     => 'required|file|mimes:jpg,jpeg,png,pdf|max:10240',
            'file_surat_pernyataan' => 'required|file|mimes:jpg,jpeg,png,pdf|max:10240',
            'pernyataan'            => 'required'
        ], [
            'nik.size' => 'NIK harus berjumlah persis 16 digit.',
            'nib.size' => 'NIB harus berjumlah persis 13 digit.',
            'pernyataan.required' => 'Anda harus menyetujui pernyataan keabsahan data.'
        ]);

        try {
            $uploadPath = public_path('uploads/hki_merek');
            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }

            // Upload & Kompresi Berkas jika > 500 KB
            $fileKtpPath = $this->processAndCompressFile($request->file('file_ktp'), 'ktp');
            $fileNibPath = $this->processAndCompressFile($request->file('file_nib'), 'nib');
            $fileEtiketPath = $this->processAndCompressFile($request->file('file_etiket_merek'), 'etiket');
            $fileSuratPath = $this->processAndCompressFile($request->file('file_surat_pernyataan'), 'surat');

            $permohonan = PermohonanHkiMerek::create([
                'nama_lengkap'          => $request->nama_lengkap,
                'nik'                   => $request->nik,
                'nib'                   => $request->nib,
                'nama_merek'            => $request->nama_merek,
                'kelas_merek'           => $request->kelas_merek,
                'uraian_barang_jasa'    => $request->uraian_barang_jasa,
                'alamat_ktp'            => $request->alamat_ktp,
                'alamat_usaha'          => $request->alamat_usaha,
                'no_hp'                 => $request->no_hp,
                'file_ktp'              => $fileKtpPath,
                'file_nib'              => $fileNibPath,
                'file_etiket_merek'     => $fileEtiketPath,
                'file_surat_pernyataan' => $fileSuratPath,
                'status'                => 'Pending'
            ]);

            // Kirim Notifikasi Pengingat ke WA Admin jika aktif
            FonnteService::sendNotificationToAdmin(
                $request->nama_lengkap . ' (' . $request->no_hp . ')',
                'Permohonan Rekomendasi HKI Merek (' . $request->nama_merek . ')',
                "Pengajuan rekomendasi HKI Merek baru di Layanan MPP Kota Madiun.\nNama Merek: {$request->nama_merek}\nKelas: {$request->kelas_merek}\nNIB: {$request->nib}",
                $permohonan->id
            );

            return response()->json([
                'success' => true,
                'message' => 'Permohonan rekomendasi HKI Merek berhasil dikirim!',
                'data' => $permohonan
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal memproses permohonan: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Dashboard Otorisasi & Pengelolaan Permohonan HKI Merek di Admin Dukungan.
     */
    public function adminIndex()
    {
        $permohonanList = PermohonanHkiMerek::orderBy('id', 'desc')->get();
        
        $totalPelakuUsaha = DB::table('pelaku_usaha')->count();
        $totalAdmin = DB::table('users')->count();
        $totalKegiatan = DB::table('list_kegiatan')->count();

        return view('admin.rekomhkimerek', compact('permohonanList', 'totalPelakuUsaha', 'totalAdmin', 'totalKegiatan'));
    }

    /**
     * Mengubah Status Permohonan HKI Merek (Pending, Disetujui, Ditolak, Selesai).
     */
    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|string'
        ]);

        $item = PermohonanHkiMerek::findOrFail($id);
        $item->update([
            'status' => $request->status,
            'catatan_admin' => $request->catatan_admin ?? $item->catatan_admin,
            'link_gdrive_rekom' => $request->has('link_gdrive_rekom') ? $request->link_gdrive_rekom : $item->link_gdrive_rekom
        ]);

        return redirect()->back()->with('success', 'Status permohonan HKI Merek berhasil diperbarui!');
    }

    /**
     * Menyimpan / memperbarui Link Google Drive Surat Rekomendasi oleh Admin.
     */
    public function updateGdriveLink(Request $request, $id)
    {
        $request->validate([
            'link_gdrive_rekom' => 'nullable|url'
        ], [
            'link_gdrive_rekom.url' => 'Format tautan Google Drive harus berupa URL yang valid (misal: https://drive.google.com/...)'
        ]);

        $item = PermohonanHkiMerek::findOrFail($id);
        $item->update([
            'link_gdrive_rekom' => $request->link_gdrive_rekom
        ]);

        return redirect()->back()->with('success', 'Link Google Drive Surat Rekomendasi HKI Merek berhasil disimpan!');
    }

    /**
     * API Tracking Permohonan HKI Merek berdasarkan NIK, NIB, atau Nama Pemohon.
     */
    public function trackingApi(Request $request)
    {
        $q = trim($request->query('q', ''));
        if (empty($q)) {
            return response()->json([
                'success' => false,
                'message' => 'Masukkan NIK, NIB, atau Nama Pemohon untuk menelusuri progress.',
                'data' => []
            ]);
        }

        $results = PermohonanHkiMerek::where('nik', 'like', "%{$q}%")
            ->orWhere('nib', 'like', "%{$q}%")
            ->orWhere('nama_lengkap', 'like', "%{$q}%")
            ->orWhere('nama_merek', 'like', "%{$q}%")
            ->orderBy('id', 'desc')
            ->get();

        return response()->json([
            'success' => true,
            'count' => $results->count(),
            'data' => $results
        ]);
    }

    /**
     * Menghapus Data Permohonan HKI Merek.
     */
    public function destroy($id)
    {
        $item = PermohonanHkiMerek::findOrFail($id);
        $item->delete();

        return redirect()->back()->with('success', 'Data permohonan HKI Merek berhasil dihapus!');
    }

    /**
     * Helper Fungsi Kompresi Berkas (Mengkompres gambar > 500 KB secara otomatis).
     */
    private function processAndCompressFile($file, $prefix)
    {
        $ext = strtolower($file->getClientOriginalExtension());
        $filename = time() . '_' . $prefix . '_' . uniqid() . '.' . $ext;
        $destinationPath = public_path('uploads/hki_merek');

        // Jika gambar (jpg/jpeg/png) dan ukuran > 500 KB (512,000 bytes)
        if (in_array($ext, ['jpg', 'jpeg', 'png']) && $file->getSize() > 512000) {
            $srcPath = $file->getRealPath();
            $targetPath = $destinationPath . '/' . $filename;

            $imageInfo = @getimagesize($srcPath);
            if ($imageInfo !== false) {
                list($width, $height, $type) = $imageInfo;
                
                // Re-sample image menggunakan GD
                switch ($type) {
                    case IMAGETYPE_JPEG:
                        $image = @imagecreatefromjpeg($srcPath);
                        break;
                    case IMAGETYPE_PNG:
                        $image = @imagecreatefrompng($srcPath);
                        break;
                    default:
                        $image = null;
                }

                if ($image) {
                    // Resize jika dimensi terlalu besar (max 1600px width/height)
                    $maxDim = 1600;
                    if ($width > $maxDim || $height > $maxDim) {
                        $ratio = min($maxDim / $width, $maxDim / $height);
                        $newWidth = (int)($width * $ratio);
                        $newHeight = (int)($height * $ratio);
                        
                        $resized = imagecreatetruecolor($newWidth, $newHeight);
                        if ($type === IMAGETYPE_PNG) {
                            imagealphablending($resized, false);
                            imagesavealpha($resized, true);
                        }
                        imagecopyresampled($resized, $image, 0, 0, 0, 0, $newWidth, $newHeight, $width, $height);
                        imagedestroy($image);
                        $image = $resized;
                    }

                    // Simpan dengan kualitas terkompresi (~65% quality)
                    if ($type === IMAGETYPE_PNG) {
                        imagepng($image, $targetPath, 7); // 0-9 compression scale for PNG
                    } else {
                        imagejpeg($image, $targetPath, 65); // 0-100 quality scale for JPEG
                    }
                    imagedestroy($image);

                    return '/uploads/hki_merek/' . $filename;
                }
            }
        }

        // Jika PDF atau ukuran sudah <= 500 KB, simpan langsung
        $file->move($destinationPath, $filename);
        return '/uploads/hki_merek/' . $filename;
    }
}
