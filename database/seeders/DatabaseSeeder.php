<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use Faker\Factory as Faker;
use App\Models\PrivacyPolicy;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $faker = Faker::create();

        foreach (range(1, 100) as $index) {
            DB::table('invited_users')->insert([         
                'name' => $faker->name,
                'phone' => $faker->phoneNumber,
                'code' => $faker->unique()->bothify('INV-####'),
                'qr' => $faker->uuid, // You could use UUID or generate QR codes using another method
                'status' => 1,
                'user_invitations_id' => $faker->numberBetween(1, 100), 
                'created_at' => $faker->dateTimeThisYear,
                'updated_at' => $faker->dateTimeThisYear,
            ]);
        }

    }
}
