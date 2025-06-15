<?php

namespace Database\Seeders;

use App\Models\Task;
use App\Models\User;
use Illuminate\Database\Seeder;

class TaskSeeder extends Seeder
{
    public function run(): void
    {
        if (!User::first()) {
            User::factory()->create(['email' => 'seed@example.com']);
        }

        Task::factory()->count(5)->create();
    }
}
