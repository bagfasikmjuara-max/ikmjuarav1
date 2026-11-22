<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\SiinasIndustry;
use Illuminate\Support\Facades\DB;

class SiinasSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('siinas_industries')->truncate();

        $jsonFile = __DIR__ . '/siinas_data.json';
        if (file_exists($jsonFile)) {
            $data = json_decode(file_get_contents($jsonFile), true);
            foreach ($data as $item) {
                SiinasIndustry::create($item);
            }
        }
    }
}
