<?php

namespace Tests\Feature;

use App\Models\Tag;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TagApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_create_and_fetch_tag(): void
    {
        $response = $this->postJson('/api/tags', [
            'name' => 'Urgent',
            'color' => '#ff0000',
        ]);

        $response->assertCreated()
            ->assertJsonPath('name', 'Urgent')
            ->assertJsonPath('color', '#ff0000');

        $tagId = $response->json('id');

        $this->assertDatabaseHas('tags', [
            'id' => $tagId,
            'name' => 'Urgent',
            'color' => '#ff0000',
        ]);

        $this->getJson("/api/tags/$tagId")
            ->assertOk()
            ->assertJsonPath('id', $tagId);
    }
}
