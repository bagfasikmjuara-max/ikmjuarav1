@extends('layouts.admin')

@section('content')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>

<div class="space-y-8" x-data="{ searchQuery: '', activeTab: 'all' }">
    
    {{-- HEADER BANNER FULL-COLOUR --}}
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 p-8 rounded-[35px] text-white shadow-xl relative overflow-hidden">
        <div class="relative z-10">
            <span class="text-xs font-black text-indigo-400 uppercase tracking-[0.2em] bg-indigo-900/50 px-3 py-1 rounded-full border border-indigo-700/50">Modul Keamanan & Kredensial</span>
            <h2 class="text-3xl lg:text-4xl font-black mt-2 tracking-tight">Pengaturan <span class="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 via-indigo-300 to-indigo-400">Hak Akses Admin</span></h2>
            <p class="text-slate-300 text-sm mt-1 max-w-xl font-medium">Kelola kredensial akun, peranan (role), serta hak otorisasi administrator sistem IKM JUARA.</p>
        </div>
        
        <button onclick="openTambahModal()" class="relative z-10 group inline-flex items-center gap-3 bg-gradient-to-r from-amber-400 to-amber-500 hover:from-amber-500 hover:to-amber-600 text-slate-950 px-6 py-4 rounded-2xl font-black text-sm shadow-xl shadow-amber-500/20 transition-all duration-300 transform hover:scale-[1.02] active:scale-95 shrink-0">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 group-hover:rotate-90 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M12 4v16m8-8H4" />
            </svg>
            <span>Tambah Administrator Baru</span>
        </button>

        {{-- BACKGROUND DECORATION GLOW --}}
        <div class="absolute -right-16 -bottom-16 w-64 h-64 bg-indigo-600/30 rounded-full blur-3xl pointer-events-none"></div>
        <div class="absolute -left-16 -top-16 w-64 h-64 bg-amber-500/20 rounded-full blur-3xl pointer-events-none"></div>
    </div>

    {{-- METRICS OVERVIEW CARDS --}}
    @php
        $totalUserCount = count($users);
        $totalAdminUtama = $users->filter(fn($u) => in_array(strtolower($u->role ?? ''), ['admin', 'superadmin', '']))->count();
        $totalDukungan = $users->filter(fn($u) => strtolower($u->role ?? '') === 'dukungan')->count();
    @endphp

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-white p-6 rounded-3xl border border-slate-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-indigo-50 text-indigo-600 flex items-center justify-center font-black text-xl shadow-inner">
                👥
            </div>
            <div>
                <span class="text-xs font-extrabold text-slate-400 uppercase tracking-wider block">Total Pengguna</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalUserCount) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-indigo-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-indigo-100 text-indigo-700 flex items-center justify-center font-black text-xl shadow-inner">
                ⚡
            </div>
            <div>
                <span class="text-xs font-extrabold text-indigo-600 uppercase tracking-wider block">Admin Utama</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalAdminUtama) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-emerald-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center font-black text-xl shadow-inner">
                🎧
            </div>
            <div>
                <span class="text-xs font-extrabold text-emerald-600 uppercase tracking-wider block">Admin Dukungan</span>
                <span class="text-3xl font-black text-slate-800">{{ number_format($totalDukungan) }}</span>
            </div>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-amber-100 shadow-sm flex items-center gap-5 hover:shadow-md transition">
            <div class="w-14 h-14 rounded-2xl bg-amber-50 text-amber-600 flex items-center justify-center font-black text-xl shadow-inner">
                🔒
            </div>
            <div>
                <span class="text-xs font-extrabold text-amber-600 uppercase tracking-wider block">Enkripsi Password</span>
                <span class="text-sm font-black text-emerald-600 block mt-1">Bcrypt Hashing</span>
            </div>
        </div>
    </div>

    {{-- MAIN BOARD LAYOUT --}}
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {{-- TABLE SECTION (2 COLUMNS) --}}
        <div class="lg:col-span-2 bg-white rounded-[35px] border border-slate-200 shadow-sm overflow-hidden flex flex-col justify-between">
            
            <div>
                {{-- TOOLBAR & FILTER --}}
                <div class="p-6 border-b border-slate-100 bg-slate-50/50 flex flex-col sm:flex-row justify-between items-stretch sm:items-center gap-4">
                    {{-- SEARCH BAR --}}
                    <div class="relative flex-1 max-w-sm">
                        <span class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            </svg>
                        </span>
                        <input type="text" x-model="searchQuery" placeholder="Cari nama atau username..." class="w-full pl-10 pr-4 py-2.5 bg-white border border-slate-200 rounded-2xl text-xs font-bold text-slate-700 outline-none focus:border-indigo-500 focus:ring-2 focus:ring-indigo-100 transition">
                    </div>

                    {{-- TAB NAVIGATION --}}
                    <div class="flex bg-slate-200/60 p-1 rounded-xl gap-1">
                        <button type="button" @click="activeTab = 'all'" :class="activeTab === 'all' ? 'bg-white text-indigo-700 shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-3 py-1.5 text-xs font-extrabold rounded-lg transition uppercase tracking-wider">
                            Semua ({{ $totalUserCount }})
                        </button>
                        <button type="button" @click="activeTab = 'admin'" :class="activeTab === 'admin' ? 'bg-indigo-600 text-white shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-3 py-1.5 text-xs font-extrabold rounded-lg transition uppercase tracking-wider">
                            Admin Utama ({{ $totalAdminUtama }})
                        </button>
                        <button type="button" @click="activeTab = 'dukungan'" :class="activeTab === 'dukungan' ? 'bg-emerald-600 text-white shadow-xs' : 'text-slate-500 hover:text-slate-800'" class="px-3 py-1.5 text-xs font-extrabold rounded-lg transition uppercase tracking-wider">
                            Dukungan ({{ $totalDukungan }})
                        </button>
                    </div>
                </div>

                {{-- TABLE USERS --}}
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="text-[10px] font-black text-slate-400 uppercase tracking-widest bg-slate-50 border-b border-slate-100">
                                <th class="px-6 py-5">Nama Administrator</th>
                                <th class="px-6 py-5">Username</th>
                                <th class="px-6 py-5">Role / Otorisasi</th> 
                                <th class="px-6 py-5 text-center">Aksi Pengelolaan</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            @forelse($users as $user)
                            @php
                                $roleKey = strtolower($user->role ?? 'admin');
                                $isAdminRole = in_array($roleKey, ['admin', 'superadmin', '']);
                                $searchableText = strtolower(addslashes($user->name . ' ' . $user->username . ' ' . $user->role));
                                $initial = strtoupper(substr($user->name, 0, 1));
                            @endphp
                            <tr x-show="(activeTab === 'all' || (activeTab === 'admin' && {{ $isAdminRole ? 'true' : 'false' }}) || (activeTab === 'dukungan' && '{{ $roleKey }}' === 'dukungan')) && ('{{ $searchableText }}'.includes(searchQuery.toLowerCase()))" 
                                x-transition 
                                class="hover:bg-indigo-50/30 transition duration-150">
                                
                                {{-- NAMA & AVATAR --}}
                                <td class="px-6 py-5">
                                    <div class="flex items-center gap-3">
                                        <div class="w-10 h-10 rounded-2xl bg-gradient-to-br from-indigo-500 to-indigo-700 text-white flex items-center justify-center font-black text-sm shadow-sm shrink-0">
                                            {{ $initial }}
                                        </div>
                                        <div>
                                            <div class="font-black text-slate-800 text-sm leading-snug">{{ $user->name }}</div>
                                            <span class="text-[10px] text-slate-400 font-medium">Terdaftar di Sistem</span>
                                        </div>
                                    </div>
                                </td>

                                {{-- USERNAME --}}
                                <td class="px-6 py-5">
                                    <span class="text-xs font-mono font-bold text-slate-700 bg-slate-100 px-2.5 py-1 rounded-lg border border-slate-200/60">
                                        @ {{ $user->username }}
                                    </span>
                                </td>

                                {{-- ROLE --}}
                                <td class="px-6 py-5 whitespace-nowrap">
                                    @if($roleKey === 'dukungan')
                                        <span class="inline-flex items-center gap-1 text-[10px] px-3 py-1 rounded-full bg-emerald-50 text-emerald-700 border border-emerald-200 font-black uppercase tracking-wider">
                                            🎧 Admin Dukungan
                                        </span>
                                    @else
                                        <span class="inline-flex items-center gap-1 text-[10px] px-3 py-1 rounded-full bg-indigo-50 text-indigo-700 border border-indigo-200 font-black uppercase tracking-wider">
                                            ⚡ Admin Utama
                                        </span>
                                    @endif
                                </td>

                                {{-- AKSI --}}
                                <td class="px-6 py-5">
                                    <div class="flex items-center justify-center gap-2">
                                        <button type="button" 
                                                onclick="openEditModal({{ $user->id }}, '{{ addslashes($user->name) }}', '{{ addslashes($user->username) }}', '{{ $user->role ?? 'admin' }}')" 
                                                class="h-9 w-9 flex items-center justify-center rounded-2xl bg-amber-50 text-amber-600 hover:bg-amber-500 hover:text-white transition shadow-xs"
                                                title="Edit Administrator">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                                            </svg>
                                        </button>

                                        <button type="button" 
                                                onclick="confirmDelete({{ $user->id }}, '{{ addslashes($user->username) }}')" 
                                                class="h-9 w-9 flex items-center justify-center rounded-2xl bg-rose-50 text-rose-500 hover:bg-rose-600 hover:text-white transition shadow-xs"
                                                title="Cabut Akses">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                            </svg>
                                        </button>
                                        
                                        <form id="delete-form-{{ $user->id }}" action="{{ route('admin.users.destroy', $user->id) }}" method="POST" class="hidden">
                                            @csrf
                                            @method('DELETE')
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="4" class="text-center py-12 text-slate-400 font-medium">
                                    📭 Belum ada data administrator.
                                </td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="p-6 bg-slate-50 border-t border-slate-100 flex items-center justify-between text-xs font-bold text-slate-400">
                <span>Diperbarui secara real-time dari database</span>
                <span>Terjaga oleh Enkripsi Bcrypt</span>
            </div>
        </div>

        {{-- SIDE PANEL SECURITY GUIDELINES --}}
        <div class="space-y-6">
            <div class="bg-gradient-to-br from-indigo-900 via-slate-900 to-indigo-950 rounded-[35px] p-8 text-white relative overflow-hidden shadow-xl border border-indigo-800/50">
                <div class="relative z-10">
                    <span class="text-[10px] font-black uppercase tracking-widest text-amber-400 bg-amber-400/10 px-3 py-1 rounded-full border border-amber-400/20">Panduan Otorisasi</span>
                    <h4 class="text-xl font-black mt-3 mb-3 tracking-tight">Keamanan Akun & Hak Akses</h4>
                    
                    <ul class="space-y-3 text-xs text-slate-300 font-medium">
                        <li class="flex items-start gap-2.5">
                            <span class="text-emerald-400 font-black">✓</span>
                            <span><strong>Admin Utama</strong> memiliki akses penuh ke seluruh modul termasuk Pengaturan Akses & Pendaftar.</span>
                        </li>
                        <li class="flex items-start gap-2.5">
                            <span class="text-amber-400 font-black">✓</span>
                            <span><strong>Admin Dukungan</strong> difokuskan untuk memverifikasi usulan data IKM dan pengusulan publikasi.</span>
                        </li>
                        <li class="flex items-start gap-2.5">
                            <span class="text-indigo-400 font-black">✓</span>
                            <span>Sistem mencegah akun menghapus dirinya sendiri atau menghapus admin terakhir.</span>
                        </li>
                    </ul>
                </div>
                
                <div class="absolute -right-10 -bottom-10 opacity-10 pointer-events-none">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-44 w-44" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 00-2 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                    </svg>
                </div>
            </div>

            <div class="bg-amber-50/70 border border-amber-200/80 rounded-[35px] p-7 text-amber-900 shadow-xs">
                <div class="flex items-center gap-3 mb-2">
                    <span class="text-xl">💡</span>
                    <h5 class="font-black text-sm uppercase tracking-wider">Tips Password Kuat</h5>
                </div>
                <p class="text-xs leading-relaxed text-amber-800 font-medium">Gunakan kombinasi minimal 8 karakter dengan campuran huruf besar, angka, dan simbol untuk mencegah akses yang tidak sah.</p>
            </div>
        </div>
    </div>
</div>

{{-- MODAL TAMBAH ADMIN --}}
<div id="modalTambah" class="fixed inset-0 bg-slate-900/70 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
    <div class="bg-white w-full max-w-md rounded-[35px] p-8 lg:p-10 shadow-2xl animate-in fade-in zoom-in duration-200">
        <div class="flex justify-between items-center mb-6">
            <div>
                <h3 class="text-2xl font-black text-slate-800 uppercase tracking-tight">Tambah Admin Baru</h3>
                <p class="text-xs text-slate-400 font-medium mt-0.5">Isi kredensial untuk administrator baru.</p>
            </div>
            <button type="button" onclick="closeTambahModal()" class="w-10 h-10 rounded-full bg-slate-100 text-slate-400 hover:bg-slate-200 hover:text-slate-700 flex items-center justify-center transition">
                ✕
            </button>
        </div>
        
        <form action="{{ route('admin.users.store') }}" method="POST" class="space-y-5">
            @csrf
            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nama Lengkap</label>
                <input type="text" name="name" required placeholder="Contoh: Admin Pengelola Utama" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Username</label>
                <input type="text" name="username" required placeholder="username_admin" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
            </div>

            <div class="relative">
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Password</label>
                <input type="password" name="password" id="add_password" required placeholder="••••••••" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                <button type="button" onclick="togglePassword('add_password')" class="absolute right-5 top-11 text-slate-400 hover:text-indigo-600 transition">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                    </svg>
                </button>
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Role / Hak Akses</label>
                <select name="role" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                    <option value="admin">⚡ Admin Utama</option>
                    <option value="dukungan">🎧 Admin Dukungan</option>
                </select>
            </div>
            
            <div class="flex gap-4 pt-4">
                <button type="button" onclick="closeTambahModal()" class="flex-1 px-6 py-4 rounded-2xl font-bold text-slate-400 hover:bg-slate-100 transition text-sm">Batal</button>
                <button type="submit" class="flex-1 bg-gradient-to-r from-indigo-600 to-indigo-700 text-white px-6 py-4 rounded-2xl font-bold text-sm shadow-xl shadow-indigo-600/30 hover:from-indigo-700 hover:to-indigo-800 transition">Daftarkan Admin</button>
            </div>
        </form>
    </div>
</div>

{{-- MODAL EDIT ADMIN --}}
<div id="modalEdit" class="fixed inset-0 bg-slate-900/70 backdrop-blur-sm z-50 hidden flex items-center justify-center p-4">
    <div class="bg-white w-full max-w-md rounded-[35px] p-8 lg:p-10 shadow-2xl animate-in fade-in zoom-in duration-200">
        <div class="flex justify-between items-center mb-6">
            <div>
                <h3 class="text-2xl font-black text-slate-800 uppercase tracking-tight">Edit Administrator</h3>
                <p class="text-xs text-slate-400 font-medium mt-0.5">Kosongkan password jika tidak ingin diubah.</p>
            </div>
            <button type="button" onclick="closeEditModal()" class="w-10 h-10 rounded-full bg-slate-100 text-slate-400 hover:bg-slate-200 hover:text-slate-700 flex items-center justify-center transition">
                ✕
            </button>
        </div>
        
        <form id="formEditAdmin" method="POST" class="space-y-5">
            @csrf
            @method('PUT')
            
            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Nama Lengkap</label>
                <input type="text" name="name" id="edit_name" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Username</label>
                <input type="text" name="username" id="edit_username" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
            </div>

            <div class="relative">
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Password Baru (Opsional)</label>
                <input type="password" name="password" id="edit_password" placeholder="••••••••" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                <button type="button" onclick="togglePassword('edit_password')" class="absolute right-5 top-11 text-slate-400 hover:text-indigo-600 transition">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                    </svg>
                </button>
            </div>

            <div>
                <label class="block text-[10px] font-black text-slate-400 uppercase tracking-widest mb-2 px-1">Role / Hak Akses</label>
                <select name="role" id="edit_role" required class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4 text-sm font-bold text-slate-700 outline-none focus:border-indigo-500 transition">
                    <option value="admin">⚡ Admin Utama</option>
                    <option value="dukungan">🎧 Admin Dukungan</option>
                </select>
            </div>
            
            <div class="flex gap-4 pt-4">
                <button type="button" onclick="closeEditModal()" class="flex-1 px-6 py-4 rounded-2xl font-bold text-slate-400 hover:bg-slate-100 transition text-sm">Batal</button>
                <button type="submit" class="flex-1 bg-gradient-to-r from-amber-500 to-amber-600 text-slate-950 px-6 py-4 rounded-2xl font-black text-sm shadow-xl shadow-amber-500/20 hover:from-amber-600 hover:to-amber-700 transition">Simpan Perubahan</button>
            </div>
        </form>
    </div>
</div>

<script>
    function openTambahModal() {
        document.getElementById('modalTambah').classList.remove('hidden');
    }

    function closeTambahModal() {
        document.getElementById('modalTambah').classList.add('hidden');
    }

    function togglePassword(inputId) {
        const input = document.getElementById(inputId);
        if (input) {
            input.type = input.type === 'password' ? 'text' : 'password';
        }
    }

    function openEditModal(id, name, username, role) {
        document.getElementById('edit_name').value = name;
        document.getElementById('edit_username').value = username;
        document.getElementById('edit_role').value = role;
        document.getElementById('formEditAdmin').action = "/admin/pengaturan/update/" + id; 
        document.getElementById('modalEdit').classList.remove('hidden');
    }

    function closeEditModal() {
        document.getElementById('modalEdit').classList.add('hidden');
    }

    function confirmDelete(id, username) {
        Swal.fire({
            title: 'Konfirmasi Hapus Akses',
            text: "Apakah Anda yakin ingin mencabut akses untuk @" + username + "? Tindakan ini tidak dapat dibatalkan.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#ef4444',
            cancelButtonColor: '#64748b',
            confirmButtonText: 'Ya, Cabut Akses!',
            cancelButtonText: 'Batal',
            borderRadius: '20px'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('delete-form-' + id).submit();
            }
        });
    }

    @if(session('success'))
        Swal.fire({
            title: 'Berhasil!',
            text: "{{ session('success') }}",
            icon: 'success',
            timer: 3000,
            showConfirmButton: false,
            borderRadius: '20px'
        });
    @endif

    @if(session('error'))
        Swal.fire({
            title: 'Gagal!',
            text: "{{ session('error') }}",
            icon: 'error',
            confirmButtonColor: '#4f46e5',
            borderRadius: '20px'
        });
    @endif
</script>
@endsection