<?php

namespace App\Http\Controllers\Pusat;

use App\Http\Controllers\Controller;
use App\Models\PelakuUsaha; // Pastikan nama Model Anda benar
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UsahaController extends Controller
{
    public function index()
    {
        $data = PelakuUsaha::latest()->get();
        return view('pusat.usaha.index', compact('data'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_usaha' => 'required|string|max:255',
            'pemilik'    => 'required|string',
            'kategori'   => 'required',
            'kelurahan'  => 'required',
            'alamat'     => 'required',
            'latitude'   => 'required',
            'longitude'  => 'required',
        ]);

        PelakuUsaha::create($request->all());

        return redirect()->back()->with('success', 'Data Usaha berhasil ditambahkan!');
    }

    public function update(Request $request, $id)
    {
        $usaha = PelakuUsaha::findOrFail($id);

        $request->validate([
            'nama_usaha' => 'required|string|max:255',
            'pemilik'    => 'required|string',
            'kategori'   => 'required',
            'kelurahan'  => 'required',
            'alamat'     => 'required',
            'latitude'   => 'required',
            'longitude'  => 'required',
        ]);

        $usaha->update($request->all());

        return redirect()->back()->with('success', 'Data Usaha berhasil diperbarui!');
    }

    public function destroy($id)
    {
        $usaha = PelakuUsaha::findOrFail($id);
        $usaha->delete();

        return redirect()->back()->with('success', 'Data Usaha berhasil dihapus!');
    }

    // Fungsi placeholder untuk export/import/peta
    public function export() { /* Logika Excel Export */ }
    public function import(Request $request) { /* Logika Excel Import */ }
    public function peta() { return view('pusat.peta'); }
}