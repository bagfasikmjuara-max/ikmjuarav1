@extends('layouts.admin')

@section('title', 'Daftar Usulan Perubahan Data IKM')

@section('content')
<div class="space-y-6">
    <div class="bg-white p-6 rounded-[32px] border border-slate-100 shadow-sm flex justify-between items-center">
        <div>
            @if(request()->query('tipe') === 'baru')
                <h3 class="text-xl font-bold text-slate-800">Usulan Mandiri Pelaku Usaha Baru</h3>
                <p class="text-xs text-slate-500">Daftar pelaku usaha baru yang mendaftar secara mandiri dan memerlukan verifikasi.</p>
            @elseif(request()->query('tipe') === 'perubahan')
                <h3 class="text-xl font-bold text-slate-800">Usulan Perubahan Profil Pelaku Usaha</h3>
                <p class="text-xs text-slate-500">Daftar permohonan perubahan data pelaku usaha yang sudah terdaftar.</p>
            @else
                <h3 class="text-xl font-bold text-slate-800">Usulan Pemutakhiran & Pendaftaran Profil</h3>
                <p class="text-xs text-slate-500">Daftar seluruh permohonan pendaftaran baru maupun perubahan data pelaku usaha secara mandiri.</p>
            @endif
        </div>
        <a href="{{ route('admin.data-ikm') }}" class="px-5 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-xl text-xs font-bold transition">
            ← Kembali ke Data IKM
        </a>
    </div>

    @if(session('success'))
        <div class="p-4 bg-emerald-50 border border-emerald-200 text-emerald-700 text-sm rounded-2xl flex items-center gap-2">
            <svg class="w-5 h-5 text-emerald-500 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
            <span>{{ session('success') }}</span>
        </div>
    @endif

    <div class="bg-white rounded-[32px] border border-slate-100 shadow-sm overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse text-sm">
                <thead>
                    <tr class="bg-slate-50 border-b border-slate-100 text-slate-500 font-bold">
                        <th class="p-4 text-xs uppercase tracking-wider">Tanggal Pengajuan</th>
                        <th class="p-4 text-xs uppercase tracking-wider">Pelaku Usaha (NIB/NIK)</th>
                        <th class="p-4 text-xs uppercase tracking-wider">Perbandingan Perubahan Data (Lama → Baru)</th>
                        <th class="p-4 text-xs uppercase tracking-wider">Status</th>
                        <th class="p-4 text-xs uppercase tracking-wider text-right">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                    @forelse($usulanList as $usulan)
                        <tr class="hover:bg-slate-50/50 transition">
                            <td class="p-4 text-slate-500 font-semibold text-xs whitespace-nowrap">
                                {{ $usulan->created_at->translatedFormat('d F Y, H:i') }} WIB
                            </td>
                            <td class="p-4">
                                <div class="font-extrabold text-slate-800">{{ $usulan->pelakuUsaha->nama_perusahaan ?? $usulan->nama_perusahaan }}</div>
                                <div class="text-xs text-slate-400">NIB: {{ $usulan->nib }}</div>
                                <div class="text-xs text-slate-400">NIK: {{ $usulan->nik }}</div>
                            </td>
                            <td class="p-4">
                                <div class="space-y-1.5 max-w-lg">
                                    @php
                                        $fields = [
                                            'nama_perusahaan' => 'Nama Perusahaan',
                                            'nama_pemilik' => 'Nama Pemilik',
                                            'no_telp' => 'No. Telp',
                                            'email' => 'Email',
                                            'alamat_usaha' => 'Alamat Usaha',
                                            'kecamatan' => 'Kecamatan',
                                            'kelurahan' => 'Kelurahan',
                                            'skala_usaha' => 'Skala Usaha',
                                            'jenis_perusahaan' => 'Jenis Perusahaan',
                                            'tingkat_risiko' => 'Tingkat Risiko',
                                            'investasi' => 'Investasi',
                                            'tenaga_kerja' => 'Tenaga Kerja',
                                            'nama_proyek' => 'Nama Proyek',
                                            'kbli' => 'KBLI',
                                            'uraian_kbli' => 'Uraian KBLI',
                                            'tgl_terbit' => 'Tanggal Terbit',
                                            'status' => 'Status',
                                            'sertifikat_halal' => 'Sertifikat Halal',
                                            'bpom' => 'BPOM',
                                            'cppob' => 'CPPOB',
                                            'sni' => 'SNI',
                                        ];
                                    @endphp
                                    @foreach($fields as $field => $label)
                                        @php
                                            $valLama = $usulan->pelakuUsaha ? ($usulan->pelakuUsaha->$field ?? '') : '';
                                            // Handle fallback fields for old table naming
                                            if ($field === 'nama_perusahaan' && empty($valLama)) {
                                                $valLama = $usulan->pelakuUsaha->nama_usaha ?? '';
                                            }
                                            if ($field === 'nama_pemilik' && empty($valLama)) {
                                                $valLama = $usulan->pelakuUsaha->pemilik ?? '';
                                            }
                                            if ($field === 'alamat_usaha' && empty($valLama)) {
                                                $valLama = $usulan->pelakuUsaha->alamat ?? '';
                                            }
                                            
                                            $valBaru = $usulan->$field;
                                            $isChanged = trim($valLama) !== trim($valBaru);
                                        @endphp
                                        @if($isChanged)
                                            <div class="text-xs flex gap-2 items-start">
                                                <span class="font-bold text-slate-500 w-32 shrink-0">{{ $label }}:</span>
                                                @if($usulan->pelaku_usaha_id)
                                                    <span class="text-rose-500 line-through shrink-0">{{ $valLama ?: '-' }}</span>
                                                    <span class="text-slate-400">→</span>
                                                @endif
                                                <span class="text-emerald-600 font-extrabold">{{ $valBaru ?: '-' }}</span>
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                            </td>
                            <td class="p-4 whitespace-nowrap">
                                @if($usulan->status_usulan === 'pending')
                                    <span class="px-2.5 py-1 bg-amber-50 text-amber-700 text-xs font-bold rounded-full border border-amber-200">Menunggu</span>
                                @elseif($usulan->status_usulan === 'disetujui')
                                    <span class="px-2.5 py-1 bg-emerald-50 text-emerald-700 text-xs font-bold rounded-full border border-emerald-200">Disetujui</span>
                                @else
                                    <span class="px-2.5 py-1 bg-rose-50 text-rose-700 text-xs font-bold rounded-full border border-rose-200" title="{{ $usulan->catatan_admin }}">Ditolak</span>
                                @endif
                            </td>
                            <td class="p-4 text-right whitespace-nowrap">
                                @if($usulan->status_usulan === 'pending')
                                    <div class="flex gap-2 justify-end" x-data="{ showReject: false, note: '' }">
                                        <div x-show="!showReject" class="flex gap-2">
                                            <form action="{{ route('admin.usulan-perubahan.verifikasi', $usulan->id) }}" method="POST">
                                                @csrf
                                                <button type="submit" class="px-3.5 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold shadow-sm transition">
                                                    Setujui
                                                </button>
                                            </form>
                                            <button @click="showReject = true" class="px-3.5 py-2 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-bold shadow-sm transition">
                                                Tolak
                                            </button>
                                        </div>
                                        
                                        <div x-show="showReject" class="flex flex-col gap-2 items-end" style="display:none;">
                                            <input type="text" x-model="note" placeholder="Catatan penolakan..." class="px-3 py-1.5 border rounded-xl text-xs outline-none focus:ring-1 focus:ring-rose-500 w-48">
                                            <div class="flex gap-1.5">
                                                <form :action="'{{ route('admin.usulan-perubahan.tolak', $usulan->id) }}'" method="POST">
                                                    @csrf
                                                    <input type="hidden" name="catatan_admin" :value="note">
                                                    <button type="submit" class="px-3 py-1.5 bg-rose-600 hover:bg-rose-700 text-white rounded-lg text-[10px] font-bold transition">
                                                        Kirim Penolakan
                                                    </button>
                                                </form>
                                                <button @click="showReject = false" class="px-3 py-1.5 bg-slate-100 hover:bg-slate-200 text-slate-500 rounded-lg text-[10px] font-bold transition">
                                                    Batal
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                @else
                                    <span class="text-xs text-slate-400 italic">Selesai</span>
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="p-8 text-center text-slate-400 font-bold">
                                Tidak ada usulan perubahan data pelaku usaha.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        
        {{-- Custom Modern Pagination --}}
        @if($usulanList->hasPages())
            <div class="px-6 py-4 bg-slate-50 border-t border-slate-100 flex flex-col sm:flex-row justify-between items-center gap-4">
                <div class="text-xs font-bold text-slate-500">
                    Menampilkan {{ $usulanList->firstItem() }} - {{ $usulanList->lastItem() }} dari {{ $usulanList->total() }} usulan
                </div>
                <div class="flex items-center gap-1">
                    {{-- Prev Button --}}
                    @if($usulanList->onFirstPage())
                        <span class="p-2 text-slate-300 cursor-not-allowed bg-white border border-slate-200 rounded-xl">
                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" /></svg>
                        </span>
                    @else
                        <a href="{{ $usulanList->previousPageUrl() }}" class="p-2 text-slate-600 hover:bg-slate-100 active:scale-95 bg-white border border-slate-200 rounded-xl transition duration-150">
                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" /></svg>
                        </a>
                    @endif

                    {{-- Page numbers list --}}
                    @foreach ($usulanList->getUrlRange(1, $usulanList->lastPage()) as $page => $url)
                        @if ($page == $usulanList->currentPage())
                            <span class="w-9 h-9 flex items-center justify-center bg-indigo-600 text-white font-extrabold rounded-xl text-xs shadow-md shadow-indigo-600/20">
                                {{ $page }}
                            </span>
                        @else
                            <a href="{{ $url }}" class="w-9 h-9 flex items-center justify-center text-slate-600 hover:bg-slate-100 active:scale-95 bg-white border border-slate-200 rounded-xl font-bold text-xs transition duration-150">
                                {{ $page }}
                            </a>
                        @endif
                    @endforeach

                    {{-- Next Button --}}
                    @if($usulanList->hasMorePages())
                        <a href="{{ $usulanList->nextPageUrl() }}" class="p-2 text-slate-600 hover:bg-slate-100 active:scale-95 bg-white border border-slate-200 rounded-xl transition duration-150">
                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" /></svg>
                        </a>
                    @else
                        <span class="p-2 text-slate-300 cursor-not-allowed bg-white border border-slate-200 rounded-xl">
                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3"><path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" /></svg>
                        </span>
                    @endif
                </div>
            </div>
        @endif
    </div>
</div>
@endsection
