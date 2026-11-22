<?php

namespace App\Http\Controllers\Pusat;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use App\Models\PelakuUsaha;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\UsahaExport;
use App\Imports\UsahaImport;

class DashboardController extends Controller
{
    /**
     * Menampilkan Dashboard Utama
     */
    public function index()
    {
        $semua_usaha = PelakuUsaha::all(); 
        
        $data = [
            'title' => 'Panel Kendali Pusat',
            'user'  => auth()->user(),
            'tanggal' => date('d F Y'),
            'semua_usaha' => $semua_usaha 
        ];

        return view('pusat.dashboard', $data);
    }

/**
     * Menampilkan halaman khusus Peta Sebaran (Superadmin)
     */
    public function peta()
    {
        // 1. Definisikan variabel title terlebih dahulu agar tidak error saat di-compact
        $semua_usaha = PelakuUsaha::all();

        // 2. Total keseluruhan
        $title = "Peta Kontrol";
        $totalUsaha = $semua_usaha->count();

        // 3. Statistik berdasarkan Kategori
        $statistikKategori = PelakuUsaha::select('kategori', DB::raw('count(*) as total'))
                                ->groupBy('kategori')
                                ->get();

        // 4. Statistik berdasarkan Kecamatan/Kelurahan
        $statistikWilayah = PelakuUsaha::select('kelurahan', DB::raw('count(*) as total'))
                                ->groupBy('kelurahan')
                                ->get();

        // 5. Kirim semua data ke view
return view('pusat.peta', compact(
        'semua_usaha', 
        'title', 
        'totalUsaha', 
        'statistikKategori', 
        'statistikWilayah'
    ));
    }

    /**
     * API untuk mencari usaha dalam radius 50 meter saat peta diklik
     */
    public function getUsahaSekitar(Request $request)
    {
        $lat = (float) $request->lat;
        $lng = (float) $request->lng;
        $radius = 0.05; // 50 meter dalam km

        if (!$lat || !$lng) {
            return response()->json([]);
        }

        $items = PelakuUsaha::whereNotNull('latitude')
            ->whereNotNull('longitude')
            ->where('latitude', '!=', '')
            ->where('longitude', '!=', '')
            ->where('latitude', '!=', '-')
            ->where('longitude', '!=', '-')
            ->get();

        $earthRadius = 6371; // km
        $usaha = $items->map(function ($item) use ($lat, $lng, $earthRadius) {
            $itemLat = (float) $item->latitude;
            $itemLng = (float) $item->longitude;
            if ($itemLat == 0 && $itemLng == 0) return null;

            $dLat = deg2rad($itemLat - $lat);
            $dLng = deg2rad($itemLng - $lng);
            $a = sin($dLat / 2) * sin($dLat / 2) +
                 cos(deg2rad($lat)) * cos(deg2rad($itemLat)) *
                 sin($dLng / 2) * sin($dLng / 2);
            $c = 2 * atan2(sqrt($a), sqrt(max(0.0, 1 - $a)));
            $item->distance = $earthRadius * $c;

            return $item;
        })
        ->filter(function ($item) use ($radius) {
            return $item !== null && $item->distance <= $radius;
        })
        ->sortBy('distance')
        ->values();

        return response()->json($usaha);
    }

    /**
     * Menyimpan data baru (Fix: Menghapus penyebab data ganda)
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama_usaha' => 'required|string|max:255',
            'pemilik'    => 'required|string|max:255',
            'kelurahan'  => 'nullable|string|max:100', // Pastikan divalidasi
            'kategori'   => 'required',
            'latitude'   => 'required',
            'longitude'  => 'required',
            'alamat'     => 'required',
        ]);

        // CUKUP SATU KALI CREATE (Agar data tidak double)
        PelakuUsaha::create([
            'nama_usaha' => $request->nama_usaha,
            'pemilik'    => $request->pemilik,
            'kategori'   => $request->kategori,
            'latitude'   => $request->latitude,
            'longitude'  => $request->longitude,
            'alamat'     => $request->alamat,
            'kelurahan'  => $request->kelurahan,
        ]);

        return redirect()->route('pusat.peta')->with('success', 'Data berhasil disimpan!');
    }

    /**
     * Mengupdate data pelaku usaha (Saran yang digabungkan)
     */
    public function update(Request $request, $id)
    {
        // 1. Validasi data
        $request->validate([
            'nama_usaha' => 'required',
            'pemilik'    => 'required',
            'latitude'   => 'required',
            'longitude'  => 'required',
        ]);

        // 2. Cari data berdasarkan ID
        $usaha = PelakuUsaha::find($id);

        // 3. Jika data tidak ditemukan
        if (!$usaha) {
            return redirect()->back()->with('error', 'Data tidak ditemukan!');
        }

        // 4. Update data secara spesifik
        $usaha->update([
            'nama_usaha' => $request->nama_usaha,
            'pemilik'    => $request->pemilik,
            'kategori'   => $request->kategori,
            'alamat'     => $request->alamat,
            'kelurahan'  => $request->kelurahan,
            'latitude'   => $request->latitude,
            'longitude'  => $request->longitude,
        ]);

        return redirect()->route('pusat.peta')->with('success', 'Data berhasil diperbarui!');
    }

    /**
     * Menghapus data pelaku usaha
     */
    public function destroy($id)
    {
        $usaha = PelakuUsaha::findOrFail($id);
        $usaha->delete();

        return redirect()->route('pusat.peta')->with('success', 'Data usaha berhasil dihapus!');
    }
public function indexUsaha()
{
    // Gunakan nama model yang benar: PelakuUsaha
    $data = \App\Models\PelakuUsaha::all(); 
    return view('pusat.usaha_index', compact('data'));
}
// Fungsi Export
public function export() 
{
    return Excel::download(new UsahaExport, 'data_pelaku_usaha.xlsx');
}

// Fungsi Import
public function import(Request $request) 
{
    $request->validate(['file_excel' => 'required|mimes:xlsx,xls']);
    
    Excel::import(new UsahaImport, $request->file('file_excel'));
    
    return back()->with('success', 'Data berhasil diimport!');
}

public function hapusUsaha($id)
{
    try {
        $usaha = PelakuUsaha::findOrFail($id);
        $usaha->delete();

        return redirect()->back()->with('success', 'Data usaha ' . $usaha->nama_usaha . ' berhasil dihapus!');
    } catch (\Exception $e) {
        return redirect()->back()->with('error', 'Gagal menghapus data: ' . $e->getMessage());
    }
}
}