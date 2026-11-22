@extends('layouts.dukungan')

@section('title', 'Data Usulan IKM Terintegrasi')
@section('hide_header_title', true)

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<div class="space-y-10">
    {{-- Header Top Bar --}}
    <div class="flex flex-col lg:flex-row justify-between items-start lg:items-center gap-4">
        <div>
            <h2 class="text-3xl font-black text-slate-800 tracking-tighter uppercase">DATA USULAN <span class="text-emerald-600">IKM TERINTEGRASI</span></h2>
            <p class="text-slate-400 font-medium mt-1 text-sm">Kelola verifikasi usulan pemutakhiran data profil dan pendaftaran mandiri pelaku usaha baru.</p>
        </div>
    </div>

    @if(session('success'))
        <div id="success-alert" class="bg-emerald-50 border border-emerald-200 text-emerald-700 px-6 py-4 rounded-2xl font-bold text-sm shadow-sm flex items-center gap-2">
            <span>🎉 {{ session('success') }}</span>
        </div>
    @endif

    @if(session('wa_url'))
        <div class="bg-gradient-to-r from-emerald-600 to-teal-700 text-white p-6 rounded-3xl shadow-xl flex flex-col md:flex-row items-center justify-between gap-4 animate-bounce">
            <div class="flex items-center gap-3">
                <span class="text-3xl">📱</span>
                <div>
                    <strong class="text-base font-black">Notifikasi Persetujuan Untuk {{ session('wa_name') }} Siap Dikirim!</strong>
                    <p class="text-xs text-emerald-100 font-medium">Klik tombol di kanan untuk langsung membuka WhatsApp ke pelaku usaha.</p>
                </div>
            </div>
            <a href="{{ session('wa_url') }}" target="_blank" class="px-6 py-3 bg-white text-emerald-800 hover:bg-emerald-50 rounded-2xl font-black text-xs shadow-md transition flex items-center gap-2 shrink-0">
                <span>🟢 Buka WhatsApp Ke Pelaku Usaha</span>
            </a>
        </div>
    @endif

    {{-- Quick Filter Pills --}}
    <div class="bg-white rounded-[32px] border border-slate-200 p-6 shadow-sm space-y-6">
        <div class="flex flex-wrap items-center gap-3">
            <a href="{{ route('dukungan.usuldata.index') }}" 
               class="px-5 py-2.5 rounded-2xl text-xs font-bold transition flex items-center gap-2 {{ !request('tipe') && !request('status') ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-50 text-slate-600 hover:bg-slate-100 border border-slate-200' }}">
                <span>Semua Usulan</span>
                <span class="px-2 py-0.5 rounded-full text-[10px] font-black {{ !request('tipe') && !request('status') ? 'bg-white/20 text-white' : 'bg-slate-200 text-slate-700' }}">{{ $pendingCount }}</span>
            </a>

            <a href="{{ route('dukungan.usuldata.index', ['tipe' => 'baru']) }}" 
               class="px-5 py-2.5 rounded-2xl text-xs font-bold transition flex items-center gap-2 {{ request('tipe') === 'baru' ? 'bg-emerald-600 text-white shadow-md shadow-emerald-600/20' : 'bg-slate-50 text-slate-600 hover:bg-slate-100 border border-slate-200' }}">
                <span>🆕 Pendaftaran Usaha Baru</span>
                @if($pendingBaruCount > 0)
                    <span class="px-2 py-0.5 rounded-full text-[10px] font-black {{ request('tipe') === 'baru' ? 'bg-white/20 text-white' : 'bg-emerald-100 text-emerald-700 animate-pulse' }}">{{ $pendingBaruCount }}</span>
                @endif
            </a>

            <a href="{{ route('dukungan.usuldata.index', ['tipe' => 'perubahan']) }}" 
               class="px-5 py-2.5 rounded-2xl text-xs font-bold transition flex items-center gap-2 {{ request('tipe') === 'perubahan' ? 'bg-indigo-600 text-white shadow-md shadow-indigo-600/20' : 'bg-slate-50 text-slate-600 hover:bg-slate-100 border border-slate-200' }}">
                <span>✏️ Permohonan Ubah Profil</span>
                @if($pendingPerubahanCount > 0)
                    <span class="px-2 py-0.5 rounded-full text-[10px] font-black {{ request('tipe') === 'perubahan' ? 'bg-white/20 text-white' : 'bg-indigo-100 text-indigo-700 animate-pulse' }}">{{ $pendingPerubahanCount }}</span>
                @endif
            </a>

            <a href="{{ route('dukungan.usuldata.index', ['status' => 'disetujui']) }}" 
               class="px-5 py-2.5 rounded-2xl text-xs font-bold transition flex items-center gap-2 {{ request('status') === 'disetujui' ? 'bg-emerald-600 text-white shadow-md' : 'bg-slate-50 text-slate-600 hover:bg-slate-100 border border-slate-200' }}">
                <span>Disetujui</span>
                <span class="px-2 py-0.5 rounded-full text-[10px] font-black {{ request('status') === 'disetujui' ? 'bg-white/20 text-white' : 'bg-emerald-100 text-emerald-700' }}">{{ $approvedCount }}</span>
            </a>

            <a href="{{ route('dukungan.usuldata.index', ['status' => 'ditolak']) }}" 
               class="px-5 py-2.5 rounded-2xl text-xs font-bold transition flex items-center gap-2 {{ request('status') === 'ditolak' ? 'bg-rose-600 text-white shadow-md' : 'bg-slate-50 text-slate-600 hover:bg-slate-100 border border-slate-200' }}">
                <span>Ditolak</span>
                <span class="px-2 py-0.5 rounded-full text-[10px] font-black {{ request('status') === 'ditolak' ? 'bg-white/20 text-white' : 'bg-rose-100 text-rose-700' }}">{{ $rejectedCount }}</span>
            </a>
        </div>

        {{-- Search Input --}}
        <form action="{{ route('dukungan.usuldata.index') }}" method="GET" class="flex flex-col md:flex-row gap-4 items-center justify-between pt-2 border-t border-slate-100">
            @if(request('tipe')) <input type="hidden" name="tipe" value="{{ request('tipe') }}"> @endif
            @if(request('status')) <input type="hidden" name="status" value="{{ request('status') }}"> @endif
            
            <div class="flex-1 w-full relative">
                <input type="text" name="search" value="{{ request('search') }}" 
                       placeholder="Cari usulan berdasarkan NIB, NIK, Nama Pemilik, atau Nama Usaha..." 
                       class="w-full bg-slate-50 border border-slate-200 focus:border-emerald-500 rounded-2xl pl-12 pr-6 py-3.5 text-sm font-bold text-slate-700 outline-none transition duration-300">
                <div class="absolute left-5 top-4 text-slate-400">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </div>
            </div>
            <div class="flex gap-3 w-full md:w-auto">
                <button type="submit" class="flex-1 md:flex-none bg-emerald-600 text-white px-6 py-3.5 rounded-2xl font-bold text-sm shadow-md hover:bg-emerald-700 transition">
                    Cari Usulan
                </button>
                @if(request('search'))
                    <a href="{{ route('dukungan.usuldata.index', array_filter(['tipe' => request('tipe'), 'status' => request('status')])) }}" class="flex-1 md:flex-none bg-slate-100 text-slate-600 px-6 py-3.5 rounded-2xl font-bold text-sm hover:bg-slate-200 transition text-center flex items-center justify-center">
                        Reset
                    </a>
                @endif
            </div>
        </form>
    </div>

    {{-- Main Proposal Table --}}
    <div class="bg-white rounded-[40px] border border-slate-200 shadow-sm overflow-hidden">
        <div class="p-8 border-b border-slate-100 bg-slate-50/50 flex justify-between items-center">
            <h3 class="font-black text-slate-800 text-sm uppercase tracking-widest">Daftar Usulan Pemutakhiran Data & Registrasi Baru</h3>
            <span class="text-[11px] font-bold text-emerald-600 bg-emerald-50 px-3 py-1 rounded-full border border-emerald-100">Total: {{ $usulanList->total() }} Usulan</span>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="text-[10px] font-black text-slate-400 uppercase tracking-widest border-b border-slate-100 whitespace-nowrap">
                        <th class="px-6 py-5 text-center">No</th>
                        <th class="px-6 py-5">Tanggal & Kategori Usulan</th>
                        <th class="px-6 py-5">Pelaku Usaha (NIB/NIK)</th>
                        <th class="px-6 py-5">Rincian Data Usulan</th>
                        <th class="px-6 py-5 text-center">Status</th>
                        <th class="px-6 py-5 text-center">Aksi Verifikasi & WA</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-50">
                    @forelse($usulanList as $usulan)
                    <tr class="hover:bg-slate-50/50 transition">
                        <td class="px-6 py-5 text-center font-mono text-xs font-bold text-slate-400">
                            {{ ($usulanList->currentPage() - 1) * $usulanList->perPage() + $loop->iteration }}
                        </td>
                        <td class="px-6 py-5 whitespace-nowrap">
                            <span class="text-xs font-bold text-slate-700 block">{{ $usulan->created_at->translatedFormat('d M Y, H:i') }} WIB</span>
                            @if($usulan->tipe_usulan === 'baru')
                                <span class="inline-flex items-center gap-1 bg-emerald-600 text-white px-2.5 py-0.5 rounded-full text-[10px] font-black uppercase shadow-sm mt-1">
                                    <span>✨ PENDAFTARAN BARU</span>
                                </span>
                            @else
                                <span class="inline-flex items-center gap-1 bg-indigo-600 text-white px-2.5 py-0.5 rounded-full text-[10px] font-black uppercase shadow-sm mt-1">
                                    <span>✏️ UBAH DATA PROFIL</span>
                                </span>
                            @endif
                        </td>
                        <td class="px-6 py-5 whitespace-nowrap">
                            @php $orig = $usulan->original_record; @endphp
                            <span class="font-extrabold text-slate-800 block text-sm">{{ $orig ? ($orig->nama_usaha ?? $orig->nama_perusahaan ?? $usulan->nama_perusahaan) : $usulan->nama_perusahaan }}</span>
                            <span class="text-xs font-semibold text-slate-600 block mt-0.5">👤 {{ $orig ? ($orig->pemilik ?? $orig->nama_pemilik ?? $usulan->nama_pemilik) : $usulan->nama_pemilik }}</span>
                            <span class="text-[11px] font-mono text-slate-500 block mt-0.5">NIB: {{ $usulan->nib }} | NIK: {{ $usulan->nik }}</span>
                        </td>
                        <td class="px-6 py-5 max-w-lg">
                            @if($usulan->tipe_usulan === 'baru')
                                <div class="bg-emerald-50/60 border border-emerald-200/80 rounded-2xl p-4 space-y-2 text-xs">
                                    <div class="text-[10px] font-black text-emerald-800 uppercase tracking-widest border-b border-emerald-200/60 pb-1 flex justify-between items-center">
                                        <span>📋 DATA USULAN USAHA BARU</span>
                                        <span class="bg-emerald-600 text-white px-2 py-0.5 rounded-md text-[9px] font-black">{{ $usulan->jenis_perusahaan ?: 'Pangan' }}</span>
                                    </div>
                                    <div class="grid grid-cols-2 gap-x-4 gap-y-1 text-slate-700">
                                        <div><span class="text-slate-400 font-bold">Produk Utama:</span> <strong>{{ $usulan->nama_proyek ?: '-' }}</strong></div>
                                        <div><span class="text-slate-400 font-bold">No. HP/WA:</span> <strong>{{ $usulan->no_telp ?: '-' }}</strong></div>
                                        <div><span class="text-slate-400 font-bold">Kec/Kel:</span> <strong>{{ $usulan->kecamatan }}, {{ $usulan->kelurahan }}</strong></div>
                                        <div><span class="text-slate-400 font-bold">Skala/Risiko:</span> <strong>{{ $usulan->skala_usaha ?: 'Mikro' }} ({{ $usulan->tingkat_risiko ?: 'Rendah' }})</strong></div>
                                        <div class="col-span-2"><span class="text-slate-400 font-bold">Alamat Usaha:</span> <strong>{{ $usulan->alamat_usaha ?: '-' }}</strong></div>
                                        @if($usulan->kbli)
                                            <div class="col-span-2"><span class="text-slate-400 font-bold">KBLI 2025:</span> <strong class="font-mono text-indigo-600">{{ $usulan->kbli }}</strong> - {{ $usulan->uraian_kbli }}</div>
                                        @endif
                                        @if($usulan->investasi > 0 || $usulan->tenaga_kerja > 1)
                                            <div><span class="text-slate-400 font-bold">Nilai Investasi:</span> <strong>Rp {{ number_format($usulan->investasi, 0, ',', '.') }}</strong></div>
                                            <div><span class="text-slate-400 font-bold">Tenaga Kerja:</span> <strong>{{ $usulan->tenaga_kerja }} Orang</strong></div>
                                        @endif
                                    </div>
                                </div>
                            @else
                                <div class="space-y-1.5">
                                    @php
                                        $orig = $usulan->original_record;
                                        $fields = [
                                            'nama_perusahaan' => 'Nama Usaha',
                                            'nama_pemilik' => 'Nama Pemilik',
                                            'no_telp' => 'No. HP',
                                            'alamat_usaha' => 'Alamat Usaha',
                                            'kecamatan' => 'Kecamatan',
                                            'kelurahan' => 'Kelurahan',
                                            'jenis_perusahaan' => 'Kategori',
                                            'skala_usaha' => 'Skala Usaha',
                                            'tingkat_risiko' => 'Tingkat Risiko',
                                            'kbli' => 'KBLI 2025',
                                            'uraian_kbli' => 'Uraian KBLI',
                                            'investasi' => 'Investasi',
                                            'tenaga_kerja' => 'Tenaga Kerja',
                                            'nama_proyek' => 'Produk',
                                        ];
                                    @endphp
                                    @foreach($fields as $field => $label)
                                        @php
                                            $valLama = '';
                                            if ($orig) {
                                                if ($field === 'nama_perusahaan') $valLama = $orig->nama_usaha ?? $orig->nama_perusahaan ?? '';
                                                elseif ($field === 'nama_pemilik') $valLama = $orig->pemilik ?? $orig->nama_pemilik ?? '';
                                                elseif ($field === 'no_telp') $valLama = $orig->no_hp ?? $orig->no_telp ?? '';
                                                elseif ($field === 'alamat_usaha') $valLama = $orig->alamat_jalan ?? $orig->alamat_usaha ?? $orig->alamat ?? '';
                                                elseif ($field === 'jenis_perusahaan') $valLama = $orig->kategori ?? $orig->jenis_perusahaan ?? '';
                                                elseif ($field === 'nama_proyek') $valLama = $orig->produk ?? $orig->nama_proyek ?? '';
                                                else $valLama = $orig->$field ?? '';
                                            }
                                            
                                            $valBaru = $usulan->$field;
                                            $isChanged = trim((string)$valLama) !== trim((string)$valBaru);
                                        @endphp
                                        @if($isChanged && !empty($valBaru))
                                            <div class="text-xs flex flex-wrap gap-1.5 items-center">
                                                <span class="font-bold text-slate-400 w-28 shrink-0 text-[11px] uppercase tracking-wider">{{ $label }}:</span>
                                                @if($orig && !empty($valLama))
                                                    <span class="text-rose-500 line-through shrink-0 font-medium">{{ $valLama }}</span>
                                                    <span class="text-slate-300 font-bold">→</span>
                                                @endif
                                                <span class="text-emerald-600 font-extrabold bg-emerald-50 px-2 py-0.5 rounded-md border border-emerald-100">{{ $valBaru }}</span>
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                            @endif
                        </td>
                        <td class="px-6 py-5 text-center whitespace-nowrap">
                            @if($usulan->status_usulan === 'pending')
                                <span class="px-3 py-1 bg-amber-50 text-amber-700 text-xs font-black rounded-full border border-amber-200">Menunggu Verifikasi</span>
                            @elseif($usulan->status_usulan === 'disetujui')
                                <span class="px-3 py-1 bg-emerald-50 text-emerald-700 text-xs font-black rounded-full border border-emerald-200">Disetujui</span>
                            @else
                                <span class="px-3 py-1 bg-rose-50 text-rose-700 text-xs font-black rounded-full border border-rose-200 block" title="{{ $usulan->catatan_admin }}">Ditolak</span>
                                @if($usulan->catatan_admin)
                                    <span class="text-[10px] text-slate-400 italic block mt-1 max-w-[150px] truncate" title="{{ $usulan->catatan_admin }}">{{ $usulan->catatan_admin }}</span>
                                @endif
                            @endif
                        </td>
                        <td class="px-6 py-5 text-center whitespace-nowrap">
                            @if($usulan->status_usulan === 'pending')
                                <div class="flex flex-col items-center gap-2" x-data="{ showRejectModal: false, rejectNote: '' }">
                                    <div class="flex gap-2 justify-center">
                                        {{-- Form Approval --}}
                                        <form action="{{ route('dukungan.usuldata.verifikasi', $usulan->id) }}" method="POST" onsubmit="return confirmVerifikasi(event, '{{ addslashes($usulan->nama_perusahaan) }}')">
                                            @csrf
                                            <button type="submit" class="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl text-xs font-bold shadow-md shadow-emerald-600/20 transition active:scale-95 flex items-center gap-1">
                                                <i class="bi bi-check-circle-fill"></i> Setujui
                                            </button>
                                        </form>

                                        {{-- Trigger Rejection --}}
                                        <button @click="showRejectModal = true" class="px-4 py-2 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-bold shadow-md shadow-rose-600/20 transition active:scale-95 flex items-center gap-1">
                                            <i class="bi bi-x-circle-fill"></i> Tolak
                                        </button>
                                    </div>

                                    {{-- Reject Modal --}}
                                    <div x-show="showRejectModal" class="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-50 flex items-center justify-center p-4" style="display:none;">
                                        <div @click.away="showRejectModal = false" class="bg-white rounded-3xl p-6 shadow-2xl max-w-md w-full text-left space-y-4 border-2 border-rose-100">
                                            <h4 class="text-lg font-black text-slate-800">Tolak Usulan IKM</h4>
                                            <p class="text-xs text-slate-500">Berikan catatan atau alasan penolakan agar pelaku usaha dapat memperbaiki usulannya.</p>
                                            <form action="{{ route('dukungan.usuldata.tolak', $usulan->id) }}" method="POST">
                                                @csrf
                                                <textarea name="catatan_admin" x-model="rejectNote" required rows="3" placeholder="Contoh: Dokumen NIB kurang jelas atau alamat lokasi usaha tidak sesuai..." class="w-full p-3 bg-slate-50 border border-slate-200 rounded-xl text-xs font-semibold outline-none focus:border-rose-500 transition resize-none"></textarea>
                                                <div class="flex justify-end gap-2 pt-3">
                                                    <button type="button" @click="showRejectModal = false" class="px-4 py-2 text-xs font-bold text-slate-500 hover:bg-slate-100 rounded-lg">Batal</button>
                                                    <button type="submit" class="px-5 py-2 bg-rose-600 hover:bg-rose-700 text-white text-xs font-bold rounded-xl shadow-md transition">Kirim Penolakan</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            @else
                                <div class="flex flex-col items-center gap-1.5">
                                    <span class="text-xs text-slate-400 font-semibold italic">Selesai Diverifikasi</span>
                                    @if($usulan->no_telp)
                                        @php
                                            $cleanPhone = preg_replace('/[^0-9]/', '', $usulan->no_telp);
                                            if (str_starts_with($cleanPhone, '0')) $cleanPhone = '62' . substr($cleanPhone, 1);
                                            $waMsg = "Halo Sdr/i " . ($usulan->nama_pemilik ?: 'Pelaku Usaha') . " (" . ($usulan->nama_perusahaan ?: 'IKM Madiun') . "), Pendaftaran Pelaku Usaha Baru Anda di IKM JUARA Kota Madiun telah DIVERIFIKASI & DISETUJUI oleh Admin Dinas. Terima kasih!";
                                        @endphp
                                        <a href="https://wa.me/{{ $cleanPhone }}?text={{ urlencode($waMsg) }}" target="_blank" 
                                           class="inline-flex items-center gap-1.5 px-3 py-1.5 bg-emerald-500 hover:bg-emerald-600 text-white rounded-xl text-[11px] font-bold shadow-md shadow-emerald-500/20 transition active:scale-95">
                                            <span>📱 Hubungi WA Pelaku Usaha</span>
                                        </a>
                                    @endif
                                </div>
                            @endif
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center py-12 text-slate-400 font-medium">Belum ada data usulan pemutakhiran profil atau pendaftaran baru.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        {{-- Modern Emerald Pagination --}}
        @if($usulanList->hasPages())
        <div class="flex items-center justify-between px-8 py-6 bg-white border-t border-slate-100">
            <div class="text-xs font-bold text-slate-450">
                Menampilkan <span class="text-slate-700">{{ $usulanList->firstItem() }}</span> sampai <span class="text-slate-700">{{ $usulanList->lastItem() }}</span> dari <span class="text-slate-700">{{ $usulanList->total() }}</span> usulan
            </div>
            <div class="flex gap-2">
                @if ($usulanList->onFirstPage())
                    <span class="px-4 py-2 text-xs font-bold text-slate-300 bg-slate-50 border border-slate-100 rounded-xl cursor-not-allowed">Sebelumnya</span>
                @else
                    <a href="{{ $usulanList->previousPageUrl() }}" class="px-4 py-2 text-xs font-bold text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-xl transition shadow-sm">Sebelumnya</a>
                @endif

                @foreach ($usulanList->getUrlRange(max(1, $usulanList->currentPage() - 2), min($usulanList->lastPage(), $usulanList->currentPage() + 2)) as $page => $url)
                    @if ($page == $usulanList->currentPage())
                        <span class="px-3.5 py-2 text-xs font-black text-white bg-emerald-600 rounded-xl shadow-md shadow-emerald-600/20">{{ $page }}</span>
                    @else
                        <a href="{{ $url }}" class="px-3.5 py-2 text-xs font-bold text-slate-500 hover:bg-slate-150 border border-transparent rounded-xl transition">{{ $page }}</a>
                    @endif
                @endforeach

                @if ($usulanList->hasMorePages())
                    <a href="{{ $usulanList->nextPageUrl() }}" class="px-4 py-2 text-xs font-bold text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-xl transition shadow-sm">Berikutnya</a>
                @else
                    <span class="px-4 py-2 text-xs font-bold text-slate-300 bg-slate-50 border border-slate-100 rounded-xl cursor-not-allowed">Berikutnya</span>
                @endif
            </div>
        </div>
        @endif
    </div>
</div>

<script>
    setTimeout(function() {
        let alert = document.getElementById('success-alert');
        if (alert) {
            alert.style.transition = "opacity 0.5s ease";
            alert.style.opacity = "0";
            setTimeout(() => alert.remove(), 500);
        }
    }, 4000);

    function confirmVerifikasi(event, name) {
        event.preventDefault();
        const form = event.target;
        
        Swal.fire({
            title: 'Setujui Usulan IKM?',
            text: "Data usulan '" + name + "' akan diverifikasi dan disinkronkan langsung ke Database Terintegrasi Peta Sebaran.",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#10b981',
            cancelButtonColor: '#64748b',
            confirmButtonText: 'Ya, Setujui & Sync!',
            cancelButtonText: 'Batal',
            borderRadius: '20px'
        }).then((result) => {
            if (result.isConfirmed) {
                form.submit();
            }
        });
        return false;
    }
</script>
@endsection
