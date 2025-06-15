<?php

test('tasks endpoint returns empty array', function () {
    $response = $this->getJson('/api/tasks');
    $response->assertStatus(200)->assertExactJson([]);
});
