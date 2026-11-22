@extends('layouts.admin')

@section('content')
<div class="p-6">
    <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold text-gray-800 border-l-4 border-blue-600 pl-4">Pengaturan Kegiatan Pelatihan</h2>
        <button onclick="openModal()" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg font-bold flex items-center gap-2 transition-all shadow-md hover:shadow-lg">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
            Tambah Kegiatan
        </button>
    </div>

    {{-- Alert Success --}}
    @if(session('success'))
    <div class="bg-emerald-50 border-l-4 border-emerald-500 text-emerald-800 p-4 mb-6 rounded-xl shadow-sm flex items-center justify-between">
        <div class="flex items-center gap-3">
            <span class="text-xl">✅</span>
            <span class="text-sm font-semibold">{{ session('success') }}</span>
        </div>
    </div>
    @endif

    <div class="bg-white shadow-xl rounded-2xl overflow-hidden border border-gray-200">
        <div class="overflow-x-auto">
            <table class="min-w-full table-auto">
                <thead>
                    <tr class="bg-blue-600 text-white text-[11px] uppercase tracking-wider">
                        <th class="px-4 py-3 text-center">No</th>
                        <th class="px-4 py-3 text-left">Nama & Sub Pelaksana</th>
                        <th class="px-4 py-3 text-left">Jadwal & Tempat</th>
                        <th class="px-4 py-3 text-center">Kuota</th>
                        <th class="px-4 py-3 text-center">Status</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 text-sm">
                    @forelse($kegiatan as $index => $k)
                    <tr class="hover:bg-blue-50/40 transition-colors">
                        <td class="px-4 py-3 text-center text-gray-500 font-medium">{{ $index + 1 }}</td>
                        <td class="px-4 py-3">
                            <div class="font-bold text-blue-900">{{ $k->nama_kegiatan }}</div>
                            <div class="text-xs text-gray-500 italic">{{ $k->sub_pelaksana ?? '-' }}</div>
                        </td>
                        <td class="px-4 py-3">
                            <div class="text-xs font-semibold text-gray-700">📅 {{ $k->tgl_mulai }} s/d {{ $k->tgl_selesai }}</div>
                            <div class="text-xs text-rose-600 font-semibold">📍 {{ $k->tempat_kegiatan }}</div>
                        </td>
                        <td class="px-4 py-3 text-center font-bold text-emerald-600">{{ $k->kuota_peserta }}</td>
                        <td class="px-4 py-3 text-center">
                        @if($k->is_active)
                            <span class="px-3 py-1 bg-emerald-100 text-emerald-700 text-xs font-bold rounded-full border border-emerald-200">Aktif</span>
                        @else
                            <span class="px-3 py-1 bg-rose-100 text-rose-700 text-xs font-bold rounded-full border border-rose-200">Nonaktif</span>
                        @endif
                        </td>
                        <td class="px-4 py-3 text-center">
                            <div class="flex justify-center gap-2">
                                <button onclick='editKegiatan(@json($k))' title="Edit Kegiatan" class="bg-amber-100 text-amber-700 p-2 rounded-xl hover:bg-amber-600 hover:text-white transition-all shadow-xs">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path></svg>
                                </button>
                                <button type="button" onclick="openDeleteModal('{{ $k->id }}', '{{ addslashes($k->nama_kegiatan) }}', '{{ $k->tgl_mulai }} s/d {{ $k->tgl_selesai }}', '{{ addslashes($k->tempat_kegiatan ?? '-') }}', '{{ $k->kuota_peserta }}')" title="Hapus Kegiatan" class="bg-rose-100 text-rose-600 p-2 rounded-xl hover:bg-rose-600 hover:text-white transition-all shadow-xs">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                </button>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="px-4 py-10 text-center text-gray-400 italic">Belum ada data kegiatan pelatihan.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>

{{-- MODAL FORM TAMBAH / EDIT --}}
<div id="modalKegiatan" class="hidden fixed inset-0 bg-slate-900/60 backdrop-blur-xs flex items-center justify-center p-4 z-50 transition-all">
    <div class="bg-white rounded-2xl w-full max-w-2xl p-6 shadow-2xl transform transition-all border border-slate-100">
        <div class="flex justify-between items-center mb-5 pb-3 border-b border-slate-100">
            <h3 id="modalTitle" class="text-lg font-black text-slate-800">Tambah Kegiatan Baru</h3>
            <button type="button" onclick="closeModal()" class="text-slate-400 hover:text-slate-600 p-1 rounded-lg transition font-bold">✕</button>
        </div>
        <form id="formKegiatan" action="{{ route('admin.kegiatan.store') }}" method="POST">
            @csrf
            <input type="hidden" name="id" id="kegiatan_id">
            <div class="grid grid-cols-2 gap-4">
                <div class="col-span-2">
                    <label class="text-xs font-bold text-gray-600 uppercase tracking-wider">Nama Kegiatan</label>
                    <input type="text" name="nama_kegiatan" id="nama_kegiatan" class="w-full border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none transition" required>
                </div>
                <div>
                    <label class="text-xs font-bold text-gray-600 uppercase tracking-wider">Sub Pelaksana</label>
                    <input type="text" name="sub_pelaksana" id="sub_pelaksana" class="w-full border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none transition">
                </div>
                <div>
                    <label class="text-xs font-bold text-gray-600 uppercase tracking-wider">Kuota</label>
                    <input type="number" name="kuota_peserta" id="kuota_peserta" class="w-full border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none transition">
                </div>
                <div>
                    <label class="text-xs font-bold text-gray-600 uppercase tracking-wider">Tanggal Mulai</label>
                    <input type="date" name="tgl_mulai" id="tgl_mulai" class="w-full border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none transition">
                </div>
                <div>
                    <label class="text-xs font-bold text-gray-600 uppercase tracking-wider">Tanggal Selesai</label>
                    <input type="date" name="tgl_selesai" id="tgl_selesai" class="w-full border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none transition">
                </div>
                <div class="col-span-2">
                    <label class="text-xs font-bold text-gray-600 uppercase tracking-wider">Tempat Kegiatan</label>
                    <input type="text" name="tempat_kegiatan" id="tempat_kegiatan" class="w-full border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none transition">
                </div>
                <div class="col-span-2">
                    <label class="text-xs font-bold text-gray-600 uppercase tracking-wider">Deskripsi</label>
                    <textarea name="deskripsi_kegiatan" id="deskripsi_kegiatan" rows="3" class="w-full border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none transition"></textarea>
                </div>
                <div class="col-span-2">
                     <label class="text-xs font-bold text-gray-600 uppercase tracking-wider">Status Publikasi</label>
                    <select name="is_active" id="is_active" class="w-full border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm outline-none focus:ring-2 focus:ring-blue-500 transition">
                        <option value="1">Tampilkan di Pendaftaran (Aktif)</option>
                        <option value="0">Sembunyikan (Nonaktif)</option>
                    </select>
                </div>
            </div>
            <div class="mt-6 flex justify-end gap-3 pt-3 border-t border-slate-100">
                <button type="button" onclick="closeModal()" class="bg-slate-100 hover:bg-slate-200 px-5 py-2.5 rounded-xl text-sm font-bold text-slate-600 transition-all">Batal</button>
                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2.5 rounded-xl text-sm font-bold transition-all shadow-md">Simpan Data</button>
            </div>
        </form>
    </div>
</div>

{{-- MODAL POPUP HAPUS KEGIATAN (FULL COLOUR & INFORMATIF) --}}
<div id="modalDeleteKegiatan" class="hidden fixed inset-0 bg-slate-950/70 backdrop-blur-xs flex items-center justify-center p-4 z-50 transition-all">
    <div class="bg-white rounded-3xl w-full max-w-md p-6 shadow-2xl transform transition-all border border-slate-100 text-center relative overflow-hidden">
        
        {{-- Header Accent Decorative Glow --}}
        <div class="absolute -top-12 -left-12 w-32 h-32 bg-rose-500/20 rounded-full blur-2xl"></div>
        <div class="absolute -top-12 -right-12 w-32 h-32 bg-amber-500/20 rounded-full blur-2xl"></div>

        {{-- Icon Header --}}
        <div class="mx-auto w-16 h-16 bg-gradient-to-tr from-rose-500 to-red-600 text-white rounded-2xl flex items-center justify-center shadow-lg shadow-rose-500/40 mb-4 relative z-10">
            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
            </svg>
        </div>

        <h3 class="text-xl font-black text-slate-900 mb-1">Hapus Kegiatan Pelatihan?</h3>
        <p class="text-xs text-slate-500 mb-4">Anda akan menghapus data kegiatan pelatihan ini secara permanen dari sistem.</p>

        {{-- Box Informasi Detail Kegiatan --}}
        <div class="bg-slate-50 border border-slate-200/80 rounded-2xl p-4 text-left mb-4 space-y-2 relative z-10">
            <div class="flex items-start gap-2">
                <span class="text-xs font-black text-slate-400 uppercase min-w-[70px]">Kegiatan:</span>
                <span id="deleteNamaKegiatan" class="text-xs font-bold text-slate-800 leading-tight"></span>
            </div>
            <div class="flex items-center gap-2">
                <span class="text-xs font-black text-slate-400 uppercase min-w-[70px]">Jadwal:</span>
                <span id="deleteJadwalKegiatan" class="text-xs font-semibold text-slate-700"></span>
            </div>
            <div class="flex items-center gap-2">
                <span class="text-xs font-black text-slate-400 uppercase min-w-[70px]">Tempat:</span>
                <span id="deleteTempatKegiatan" class="text-xs font-semibold text-rose-600"></span>
            </div>
            <div class="flex items-center gap-2">
                <span class="text-xs font-black text-slate-400 uppercase min-w-[70px]">Kuota:</span>
                <span id="deleteKuotaKegiatan" class="text-xs font-bold text-emerald-600"></span>
            </div>
        </div>

        {{-- Warning Note --}}
        <div class="bg-rose-50 border border-rose-200 text-rose-700 rounded-xl p-3 text-[11px] font-bold text-left flex items-center gap-2.5 mb-5">
            <span class="text-lg">⚠️</span>
            <span class="leading-tight">Tindakan ini tidak dapat dibatalkan. Harap pastikan kembali sebelum menghapus.</span>
        </div>

        {{-- Action Buttons --}}
        <div class="flex items-center justify-between gap-3">
            <button type="button" onclick="closeDeleteModal()" class="w-1/2 bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold py-2.5 rounded-xl text-xs transition">
                Batal
            </button>
            <form id="formDeleteKegiatan" action="" method="POST" class="w-1/2">
                @csrf
                @method('DELETE')
                <button type="submit" class="w-full bg-gradient-to-r from-rose-600 to-red-600 hover:from-rose-700 hover:to-red-700 text-white font-black py-2.5 rounded-xl text-xs shadow-md shadow-rose-500/30 transition transform hover:-translate-y-0.5 active:translate-y-0">
                    Ya, Hapus Kegiatan
                </button>
            </form>
        </div>
    </div>
</div>

<script>
    function openModal() {
        document.getElementById('formKegiatan').reset();
        document.getElementById('kegiatan_id').value = '';
        document.getElementById('modalTitle').innerText = 'Tambah Kegiatan Baru';
        document.getElementById('modalKegiatan').classList.remove('hidden');
    }

    function closeModal() {
        document.getElementById('modalKegiatan').classList.add('hidden');
    }

    function editKegiatan(data) {
        document.getElementById('modalTitle').innerText = 'Edit Kegiatan';
        document.getElementById('kegiatan_id').value = data.id;
        document.getElementById('nama_kegiatan').value = data.nama_kegiatan;
        document.getElementById('sub_pelaksana').value = data.sub_pelaksana;
        document.getElementById('kuota_peserta').value = data.kuota_peserta;
        document.getElementById('tgl_mulai').value = data.tgl_mulai;
        document.getElementById('tgl_selesai').value = data.tgl_selesai;
        document.getElementById('tempat_kegiatan').value = data.tempat_kegiatan;
        document.getElementById('deskripsi_kegiatan').value = data.deskripsi_kegiatan;
        document.getElementById('is_active').value = data.is_active ? "1" : "0";
        document.getElementById('modalKegiatan').classList.remove('hidden');
    }

    function openDeleteModal(id, nama, jadwal, tempat, kuota) {
        const form = document.getElementById('formDeleteKegiatan');
        form.action = "{{ url('admin/kegiatan') }}/" + id;
        
        document.getElementById('deleteNamaKegiatan').innerText = nama;
        document.getElementById('deleteJadwalKegiatan').innerText = jadwal;
        document.getElementById('deleteTempatKegiatan').innerText = tempat;
        document.getElementById('deleteKuotaKegiatan').innerText = kuota + ' Peserta';
        
        document.getElementById('modalDeleteKegiatan').classList.remove('hidden');
    }

    function closeDeleteModal() {
        document.getElementById('modalDeleteKegiatan').classList.add('hidden');
    }
</script>
@endsection