<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Setting::create([
            'phone'    => 123456789,
            'phone2'   => 123456789,
            'tel'      => 'https://mangjornal.com',
            'website'  => 'https://mangjornal.com',
            'twitter'  => 'https://twitter.com',
            'linkedin' => 'https://www.linkedin.com',
            'email'    => 'admin@admin.com',
            'whatsapp' => 'https://web.whatsapp.com',
            'facebook' => 'https://www.facebook.com',
        ]);
    }
}
