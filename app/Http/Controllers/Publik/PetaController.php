<?php

namespace App\Http\Controllers\Publik;

use App\Http\Controllers\Controller;
use App\Models\PetaSebaran;
use Illuminate\Http\Request;

class PetaController extends Controller
{
public function index() {
    // Mengambil semua data dari tabel peta_sebaran di database
    $semua_usaha = \App\Models\PetaSebaran::all(); 

    return view('publik.peta_umum', compact('semua_usaha'));
}

    public function getDataApi(Request $request) {
        $lat = (float) $request->lat;
        $lng = (float) $request->lng;
        $radius = 0.2; // 200 meter (0.2 km)

        if (!$lat || !$lng) {
            return response()->json([]);
        }

        $items = PetaSebaran::whereNotNull('latitude')
            ->whereNotNull('longitude')
            ->where('latitude', '!=', '')
            ->where('longitude', '!=', '')
            ->where('latitude', '!=', '-')
            ->where('longitude', '!=', '-')
            ->get();

        $earthRadius = 6371; // km
        $filtered = $items->map(function ($item) use ($lat, $lng, $earthRadius) {
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

        return response()->json($filtered);
    }
    public function getUsahaPublik() {
    // Hanya ambil kolom yang boleh dilihat publik
    return PetaSebaran::select('nama_usaha', 'alamat', 'kelurahan', 'latitude', 'longitude', 'kategori')->get();
}
}