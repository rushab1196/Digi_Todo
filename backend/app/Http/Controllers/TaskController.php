<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class TaskController extends Controller
{
    public function index(): Response
    {
        return response(Task::all());
    }

    public function store(Request $request): Response
    {
        $task = Task::create($request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'due_date' => 'nullable|date',
        ]));

        return response($task, 201);
    }

    public function show(Task $task): Response
    {
        return response($task);
    }

    public function update(Request $request, Task $task): Response
    {
        $task->update($request->validate([
            'title' => 'sometimes|required|string|max:255',
            'description' => 'nullable|string',
            'due_date' => 'nullable|date',
            'completed' => 'boolean',
        ]));

        return response($task);
    }

    public function destroy(Task $task): Response
    {
        $task->delete();

        return response(null, 204);
    }
}
