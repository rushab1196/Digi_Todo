<?php

namespace Tests\Feature;

use App\Models\Task;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TaskApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_create_and_fetch_task(): void
    {
        $user = User::factory()->create();

        $response = $this->postJson('/api/tasks', [
            'user_id' => $user->id,
            'title' => 'Test Task',
        ]);

        $response->assertCreated()
            ->assertJsonPath('title', 'Test Task');

        $taskId = $response->json('id');

        $this->getJson("/api/tasks/$taskId")
            ->assertOk()
            ->assertJsonPath('id', $taskId);
    }
}
