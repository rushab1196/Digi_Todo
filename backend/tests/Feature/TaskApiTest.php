<?php

namespace Tests\Feature;

use App\Models\Task;

use App\Models\Tag;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TaskApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_create_and_fetch_task(): void
    {
        $user = User::factory()->create();

        $tags = Tag::factory()->count(2)->create();


        $response = $this->postJson('/api/tasks', [
            'user_id' => $user->id,
            'title' => 'Test Task',
            'due_at' => '2025-06-30 12:00:00',

            'tags' => $tags->pluck('id')->all(),

        ]);

        $response->assertCreated()
            ->assertJsonPath('title', 'Test Task')
            ->assertJsonPath('due_at', '2025-06-30T12:00:00.000000Z');

        $taskId = $response->json('id');


        $this->assertDatabaseHas('tasks', [
            'id' => $taskId,
            'user_id' => $user->id,
            'title' => 'Test Task',
            'due_at' => '2025-06-30 12:00:00',
        ]);

        $this->getJson("/api/tasks/$taskId")
            ->assertOk()

            ->assertJsonPath('id', $taskId)
            ->assertJsonCount(2, 'tags');

    }
}
