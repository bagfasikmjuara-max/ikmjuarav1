<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class KbliSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->command->info("Fetching KBLI data from TenderX API...");

        try {
            $response = Http::timeout(30)->get("https://tenderx.id/api/v1/kbli", [
                'limit' => 2000
            ]);

            if ($response->successful()) {
                $result = $response->json();
                $data = $result['data'] ?? [];

                if (count($data) > 0) {
                    $this->command->info("Found " . count($data) . " KBLI codes. Seeding database...");

                    $insertData = [];
                    foreach ($data as $item) {
                        if (empty($item['kode'])) continue;

                        $insertData[] = [
                            'kode' => $item['kode'],
                            'judul' => preg_replace('/\s+/', ' ', trim($item['judul'])),
                            'created_at' => now(),
                            'updated_at' => now(),
                        ];
                    }

                    // Insert in chunks of 200 using insertOrIgnore
                    foreach (array_chunk($insertData, 200) as $chunk) {
                        DB::table('kbli')->insertOrIgnore($chunk);
                    }

                    $this->command->info("KBLI database successfully seeded!");
                } else {
                    $this->command->error("API response returned empty data.");
                }
            } else {
                $this->command->error("Failed to connect to TenderX API. Status code: " . $response->status());
            }
        } catch (\Exception $e) {
            $this->command->error("An error occurred during seeding: " . $e->getMessage());
        }
    }
}
