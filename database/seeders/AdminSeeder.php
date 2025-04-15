<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Admin;
use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'ahmed',
            'email' => 'am9514994@gmail.com',
            'phone' => '01208982815',
            'code'  => 'asdaasd',
            'password' => bcrypt('123456789'),
        ]);

        Admin::create([
            'name' => 'ahmed',
            'email' => 'ahmedmaher0110@gmail.com',
            'phone' => '01208982815',
            'password' => bcrypt('123456789'),
        ]);
    }
}
