<?php

namespace Database\Seeders;

use App\Models\Task;
use App\Models\User;

use App\Models\Tag;



class TaskSeeder extends Seeder
{
    public function run(): void
    {
        if (!User::first()) {
            User::factory()->create(['email' => 'seed@example.com']);
        }


        $tags = Tag::all();
        Task::factory()->count(5)->create()->each(function (Task $task) use ($tags) {
            if ($tags->isNotEmpty()) {
                $task->tags()->attach($tags->random(rand(1, $tags->count())));
            }
        });

        Task::factory()->count(5)->create();

    }
}
