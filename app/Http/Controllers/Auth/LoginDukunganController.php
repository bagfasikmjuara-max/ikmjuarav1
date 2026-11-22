<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Border;

class LoginDukunganController extends Controller
{
    public function showLogin() {
        return view('admin.login_dukungan'); 
    }

    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);

        $credentials = $request->only('username', 'password');

        if (Auth::attempt($credentials)) {
            // Periksa role user yang login
            if (Auth::user()->role === 'dukungan') {
                $request->session()->regenerate();
                return redirect()->intended('/dukungan/dashboard');
            }

            // Jika bukan dukungan, logout
            Auth::logout();
            return back()->with('error', 'Akses ditolak! Akun ini bukan merupakan Admin Dukungan.');
        }

        return back()->with('error', 'Username atau password salah!');
    }

    public function logout(Request $request) {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/login-dukungan');
    }

    public function accessFormApp(Request $request)
    {
        $request->validate([
            'kode_masuk' => 'required',
        ]);

        $defaultCode = '232008';

        if (trim($request->kode_masuk) === $defaultCode) {
            $request->session()->put('formapp_access', true);
            return redirect()->route('formapp');
        }

        return back()->with('error_kode', 'Kode Masuk Form App tidak valid! Gunakan kode default 232008.');
    }

    public function showFormApp(Request $request)
    {
        $templates = \Illuminate\Support\Facades\DB::table('form_app_templates')
            ->orderBy('created_at', 'desc')
            ->get();

        $selectedTemplateId = $request->query('template_id', 'all');

        $query = \Illuminate\Support\Facades\DB::table('form_app_responses')
            ->join('form_app_templates', 'form_app_responses.template_id', '=', 'form_app_templates.id')
            ->select('form_app_responses.*', 'form_app_templates.title as template_title', 'form_app_templates.structure as template_structure');

        if (!empty($selectedTemplateId) && $selectedTemplateId !== 'all') {
            $query->where('form_app_responses.template_id', $selectedTemplateId);
        }

        $responses = $query->orderBy('form_app_responses.created_at', 'desc')->get();

        return view('formapp', compact('templates', 'responses', 'selectedTemplateId'));
    }

    public function exportExcel(Request $request)
    {
        $templateId = $request->query('template_id');

        $query = \Illuminate\Support\Facades\DB::table('form_app_responses')
            ->join('form_app_templates', 'form_app_responses.template_id', '=', 'form_app_templates.id')
            ->select('form_app_responses.*', 'form_app_templates.title as template_title', 'form_app_templates.penyelenggara', 'form_app_templates.lokasi', 'form_app_templates.tanggal', 'form_app_templates.tanggal_selesai', 'form_app_templates.structure as template_structure');

        $templateInfo = null;
        if (!empty($templateId) && $templateId !== 'all') {
            $query->where('form_app_responses.template_id', $templateId);
            $templateInfo = \Illuminate\Support\Facades\DB::table('form_app_templates')->where('id', $templateId)->first();
            $formTitle = $templateInfo ? $templateInfo->title : 'Semua Kegiatan';
        } else {
            $formTitle = 'Semua Kegiatan Formulir';
        }

        $responses = $query->orderBy('form_app_responses.created_at', 'desc')->get();

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setTitle('Rekap Evaluasi');

        // Title Block
        $sheet->setCellValue('A1', 'REKAPITULASI HASIL EVALUASI & SKOR RESPONDEN');
        $sheet->setCellValue('A2', 'Aplikasi Form Manager - IKM Juara Kota Madiun');
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(14);
        $sheet->getStyle('A2')->getFont()->setItalic(true)->setSize(11);

        // Meta Block
        $sheet->setCellValue('A4', 'Kegiatan / Formulir:');
        $sheet->setCellValue('B4', $formTitle);
        $sheet->getStyle('A4')->getFont()->setBold(true);

        $sheet->setCellValue('A5', 'Total Responden:');
        $sheet->setCellValue('B5', count($responses) . ' Orang');
        $sheet->getStyle('A5')->getFont()->setBold(true);

        $sheet->setCellValue('A6', 'Tanggal Export:');
        $sheet->setCellValue('B6', date('d F Y, H:i') . ' WIB');
        $sheet->getStyle('A6')->getFont()->setBold(true);

        // Determine dynamic list of questions
        $sampleStructure = [];
        if (!empty($templateId) && $templateId !== 'all' && isset($templateInfo->structure)) {
            $sampleStructure = json_decode($templateInfo->structure, true);
        } elseif (count($responses) > 0 && isset($responses[0]->template_structure)) {
            $sampleStructure = json_decode($responses[0]->template_structure, true);
        }

        $questionsList = [];
        if (isset($sampleStructure['sections'])) {
            $qNum = 0;
            foreach ($sampleStructure['sections'] as $sIdx => $sec) {
                $secTitle = $sec['title'] ?? ('Sub-Bagian ' . ($sIdx + 1));
                $secOptions = $sec['options'] ?? [];
                if (isset($sec['questions'])) {
                    foreach ($sec['questions'] as $q) {
                        $qNum++;
                        $questionsList[] = [
                            'num' => $qNum,
                            'id' => $q['id'],
                            'text' => $q['text'],
                            'section' => $secTitle,
                            'options' => $secOptions,
                        ];
                    }
                }
            }
        }

        // Table Header starting at Row 8
        $headerRow = 8;
        $sheet->setCellValue('A' . $headerRow, 'NO');
        $sheet->setCellValue('B' . $headerRow, 'WAKTU TANGGAPAN');
        $sheet->setCellValue('C' . $headerRow, 'NAMA LENGKAP RESPONDEN');
        $sheet->setCellValue('D' . $headerRow, 'FORMULIR KEGIATAN');

        $colIdx = 5; // Column E
        foreach ($questionsList as $q) {
            $colLetter = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIdx);
            $sheet->setCellValue($colLetter . $headerRow, "Q{$q['num']}: {$q['text']}");
            $colIdx++;
        }

        // Summary columns
        $colTotalScore = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIdx);
        $sheet->setCellValue($colTotalScore . $headerRow, 'SKOR TOTAL');
        $colIdx++;

        $colMaxScore = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIdx);
        $sheet->setCellValue($colMaxScore . $headerRow, 'SKOR MAKSIMAL');
        $colIdx++;

        $colPct = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIdx);
        $sheet->setCellValue($colPct . $headerRow, 'TINGKAT KEPUASAN (%)');
        $colIdx++;

        $colCat = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIdx);
        $sheet->setCellValue($colCat . $headerRow, 'PREDIKAT / KATEGORI');

        // Style Header Row
        $lastHeaderCol = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIdx);
        $headerRange = "A{$headerRow}:{$lastHeaderCol}{$headerRow}";
        $sheet->getStyle($headerRange)->getFont()->setBold(true)->setColor(new \PhpOffice\PhpSpreadsheet\Style\Color(\PhpOffice\PhpSpreadsheet\Style\Color::COLOR_WHITE));
        $sheet->getStyle($headerRange)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('FF1E293B');
        $sheet->getStyle($headerRange)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER)->setWrapText(true);

        // Data Rows
        $dataRow = 9;
        foreach ($responses as $rIdx => $resp) {
            $sheet->setCellValue('A' . $dataRow, $rIdx + 1);
            $sheet->setCellValue('B' . $dataRow, \Carbon\Carbon::parse($resp->created_at)->format('d/m/Y H:i'));
            $sheet->setCellValue('C' . $dataRow, $resp->nama_ikm ?: 'Anonim');
            $sheet->setCellValue('D' . $dataRow, $resp->template_title);

            $answers = json_decode($resp->answers, true) ?? [];

            $colIdx = 5;
            foreach ($questionsList as $q) {
                $colLetter = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($colIdx);
                $userVal = $answers[$q['id']] ?? null;

                $optLabel = '-';
                if ($userVal !== null) {
                    foreach ($q['options'] as $opt) {
                        if ((string)$userVal === (string)($opt['val'] ?? '') || (string)$userVal === (string)($opt['label'] ?? '')) {
                            $optLabel = ($opt['label'] ?? '') . ' (' . ($opt['score'] ?? 0) . ' Poin)';
                            break;
                        }
                    }
                    if ($optLabel === '-' && $userVal) {
                        $optLabel = (string)$userVal;
                    }
                }

                $sheet->setCellValue($colLetter . $dataRow, $optLabel);
                $colIdx++;
            }

            // Summary values
            $pct = $resp->max_score > 0 ? round(($resp->total_score / $resp->max_score) * 100, 1) : 0;
            $predikat = $pct >= 85 ? 'Sangat Baik' : ($pct >= 70 ? 'Baik' : ($pct >= 55 ? 'Cukup' : 'Kurang'));

            $sheet->setCellValue($colTotalScore . $dataRow, $resp->total_score);
            $sheet->setCellValue($colMaxScore . $dataRow, $resp->max_score);
            $sheet->setCellValue($colPct . $dataRow, $pct . '%');
            $sheet->setCellValue($colCat . $dataRow, $predikat);

            $dataRow++;
        }

        // Auto fit column widths
        $highestColumn = $sheet->getHighestColumn();
        for ($col = 'A'; $col !== $highestColumn; $col++) {
            $sheet->getColumnDimension($col)->setAutoSize(true);
        }

        $writer = new Xlsx($spreadsheet);
        $filename = 'Rekap_Evaluasi_FormApp_' . date('Y-m-d_H-i-s') . '.xlsx';

        return response()->streamDownload(function () use ($writer) {
            $writer->save('php://output');
        }, $filename, [
            'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            'Cache-Control' => 'max-age=0',
        ]);
    }

    public function storeFormTemplate(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'penyelenggara' => 'required|string|max:255',
            'lokasi' => 'required|string|max:255',
            'tanggal' => 'required|date',
            'tanggal_selesai' => 'nullable|date',
            'peserta_list' => 'nullable|string',
            'structure' => 'required',
            'template_id' => 'nullable',
        ]);

        try {
            $structureJson = is_string($request->structure) ? $request->structure : json_encode($request->structure);

            $pesertaListRaw = trim($request->input('peserta_list', ''));
            $pesertaArr = [];
            if (!empty($pesertaListRaw)) {
                $lines = explode("\n", str_replace("\r", "", $pesertaListRaw));
                foreach ($lines as $line) {
                    $clean = trim($line);
                    if ($clean !== '') {
                        $pesertaArr[] = $clean;
                    }
                }
            }

            $templateId = $request->input('template_id');
            if ($templateId) {
                $existing = \Illuminate\Support\Facades\DB::table('form_app_templates')->where('id', $templateId)->first();
                if ($existing) {
                    \Illuminate\Support\Facades\DB::table('form_app_templates')->where('id', $templateId)->update([
                        'title' => $request->title,
                        'penyelenggara' => $request->penyelenggara,
                        'lokasi' => $request->lokasi,
                        'tanggal' => $request->tanggal,
                        'tanggal_selesai' => $request->tanggal_selesai ?: $request->tanggal,
                        'structure' => $structureJson,
                        'peserta_list' => !empty($pesertaArr) ? json_encode($pesertaArr) : null,
                        'updated_at' => now(),
                    ]);
                    $slug = $existing->slug;
                    $shareUrl = url('/formapp/kuesioner/' . $slug);

                    if ($request->wantsJson() || $request->ajax()) {
                        return response()->json([
                            'success' => true,
                            'message' => 'Formulir berhasil diperbarui!',
                            'slug' => $slug,
                            'share_url' => $shareUrl
                        ]);
                    }
                    return back()->with('success', 'Formulir berhasil diperbarui!');
                }
            }

            $slug = \Illuminate\Support\Str::slug($request->title) . '-' . \Illuminate\Support\Str::random(6);

            $id = \Illuminate\Support\Facades\DB::table('form_app_templates')->insertGetId([
                'title' => $request->title,
                'penyelenggara' => $request->penyelenggara,
                'lokasi' => $request->lokasi,
                'tanggal' => $request->tanggal,
                'tanggal_selesai' => $request->tanggal_selesai ?: $request->tanggal,
                'slug' => $slug,
                'structure' => $structureJson,
                'peserta_list' => !empty($pesertaArr) ? json_encode($pesertaArr) : null,
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            $shareUrl = url('/formapp/kuesioner/' . $slug);

            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Formulir berhasil disimpan dan link akses publik telah dibuat!',
                    'slug' => $slug,
                    'share_url' => $shareUrl
                ]);
            }

            return back()->with('success', 'Formulir berhasil disimpan! Link Akses: ' . $shareUrl);
        } catch (\Exception $e) {
            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Gagal menyimpan template: ' . $e->getMessage()
                ], 500);
            }
            return back()->with('error', 'Gagal menyimpan template: ' . $e->getMessage());
        }
    }

    public function toggleFormTemplateStatus($id)
    {
        try {
            $template = \Illuminate\Support\Facades\DB::table('form_app_templates')->where('id', $id)->first();
            if (!$template) {
                return back()->with('error', 'Formulir tidak ditemukan.');
            }

            $newStatus = !$template->is_active;
            \Illuminate\Support\Facades\DB::table('form_app_templates')->where('id', $id)->update([
                'is_active' => $newStatus,
                'updated_at' => now(),
            ]);

            $statusText = $newStatus ? 'diaktifkan (dapat diakses publik)' : 'dinonaktifkan (akses publik ditutup)';
            return back()->with('success', "Status formulir berhasil $statusText.");
        } catch (\Exception $e) {
            return back()->with('error', 'Gagal mengubah status formulir: ' . $e->getMessage());
        }
    }

    public function destroyFormTemplate($id)
    {
        try {
            \Illuminate\Support\Facades\DB::table('form_app_templates')->where('id', $id)->delete();
            return back()->with('success', 'Formulir berhasil dihapus.');
        } catch (\Exception $e) {
            return back()->with('error', 'Gagal menghapus formulir: ' . $e->getMessage());
        }
    }

    public function destroyResponse($id)
    {
        try {
            \Illuminate\Support\Facades\DB::table('form_app_responses')->where('id', $id)->delete();

            if (request()->wantsJson() || request()->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Data responden berhasil dihapus.'
                ]);
            }

            return back()->with('success', 'Data responden berhasil dihapus.');
        } catch (\Exception $e) {
            if (request()->wantsJson() || request()->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Gagal menghapus data responden: ' . $e->getMessage()
                ], 500);
            }

            return back()->with('error', 'Gagal menghapus data responden: ' . $e->getMessage());
        }
    }

    public function showUserKuesioner($slug)
    {
        $template = \Illuminate\Support\Facades\DB::table('form_app_templates')
            ->where('slug', $slug)
            ->first();

        if (!$template) {
            abort(404, 'Halaman formulir kuesioner tidak ditemukan.');
        }

        $template->structure = json_decode($template->structure, true);

        $pesertaList = [];
        if (!empty($template->peserta_list)) {
            $pesertaList = json_decode($template->peserta_list, true) ?? [];
        }

        $alreadySubmittedNames = \Illuminate\Support\Facades\DB::table('form_app_responses')
            ->where('template_id', $template->id)
            ->pluck('nama_ikm')
            ->filter()
            ->map(fn($item) => strtolower(trim($item)))
            ->values()
            ->toArray();

        return view('formapp_user', compact('template', 'pesertaList', 'alreadySubmittedNames'));
    }

    public function submitUserKuesioner(Request $request, $slug)
    {
        $template = \Illuminate\Support\Facades\DB::table('form_app_templates')
            ->where('slug', $slug)
            ->first();

        if (!$template) {
            return response()->json(['success' => false, 'message' => 'Formulir tidak ditemukan'], 404);
        }

        if (!$template->is_active) {
            return response()->json(['success' => false, 'message' => 'Pengisian formulir kuesioner ini sedang dinonaktifkan oleh Admin.'], 403);
        }

        $namaLengkap = trim($request->input('nama_ikm', ''));
        if (empty($namaLengkap)) {
            return response()->json(['success' => false, 'message' => 'Nama Lengkap Anda wajib diisi agar data valid!'], 422);
        }

        // Anti-duplicate submission check per template
        $existing = \Illuminate\Support\Facades\DB::table('form_app_responses')
            ->where('template_id', $template->id)
            ->whereRaw('LOWER(TRIM(nama_ikm)) = ?', [strtolower($namaLengkap)])
            ->first();

        if ($existing) {
            return response()->json([
                'success' => false,
                'message' => "Maaf, peserta dengan nama '{$namaLengkap}' sudah pernah mengisi kuesioner evaluasi ini dan tidak dapat mengisi 2 kali."
            ], 422);
        }

        $structure = json_decode($template->structure, true) ?? [];
        $userAnswers = $request->input('answers', []);

        $totalScore = 0;
        $maxScore = 0;

        // Calculate score points from section options configuration
        if (isset($structure['sections'])) {
            foreach ($structure['sections'] as $section) {
                $sectionOptions = $section['options'] ?? [];
                
                // Max score possible for each question in this section
                $qMaxScore = 0;
                foreach ($sectionOptions as $opt) {
                    $score = (int)($opt['score'] ?? 0);
                    if ($score > $qMaxScore) $qMaxScore = $score;
                }

                if (isset($section['questions'])) {
                    foreach ($section['questions'] as $q) {
                        $qId = $q['id'];
                        $selectedVal = $userAnswers[$qId] ?? null;

                        $maxScore += $qMaxScore;

                        if ($selectedVal !== null) {
                            foreach ($sectionOptions as $opt) {
                                if ((string)$selectedVal === (string)($opt['val'] ?? '') || (string)$selectedVal === (string)($opt['label'] ?? '')) {
                                    $totalScore += (int)($opt['score'] ?? 0);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }

        try {
            \Illuminate\Support\Facades\DB::table('form_app_responses')->insert([
                'template_id' => $template->id,
                'nama_ikm' => $namaLengkap,
                'answers' => json_encode($userAnswers),
                'total_score' => $totalScore,
                'max_score' => $maxScore > 0 ? $maxScore : 100,
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Terima kasih! Tanggapan evaluasi Anda telah tersimpan secara resmi.',
                'total_score' => $totalScore,
                'max_score' => $maxScore,
                'percentage' => $maxScore > 0 ? round(($totalScore / $maxScore) * 100, 1) : 0
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Gagal menyimpan jawaban: ' . $e->getMessage()
            ], 500);
        }
    }

    public function simpanKuesioner(Request $request)
    {
        $request->validate([
            'penyelenggara' => 'required|string',
            'lokasi' => 'required|string',
            'tanggal' => 'required|date',
            'nama_ikm' => 'nullable|string|max:255',
            'jawaban_a' => 'required|array',
            'jawaban_b' => 'required|array',
            'jawaban_c' => 'required|array',
            'jawaban_d' => 'required|array',
        ]);

        try {
            \Illuminate\Support\Facades\DB::table('kuesioner_evaluasi')->insert([
                'penyelenggara' => $request->penyelenggara,
                'lokasi' => $request->lokasi,
                'tanggal' => $request->tanggal,
                'nama_ikm' => $request->nama_ikm,
                'jawaban_bagian_a' => json_encode($request->jawaban_a),
                'jawaban_bagian_b' => json_encode($request->jawaban_b),
                'jawaban_bagian_c' => json_encode($request->jawaban_c),
                'jawaban_bagian_d' => json_encode($request->jawaban_d),
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Terima kasih! Kuesioner evaluasi pelatihan berhasil disimpan.'
                ]);
            }

            return back()->with('success', 'Terima kasih! Kuesioner evaluasi pelatihan berhasil disimpan.');
        } catch (\Exception $e) {
            if ($request->wantsJson() || $request->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Gagal menyimpan kuesioner: ' . $e->getMessage()
                ], 500);
            }

            return back()->with('error', 'Gagal menyimpan kuesioner: ' . $e->getMessage());
        }
    }
}
