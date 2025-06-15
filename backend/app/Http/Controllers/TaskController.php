<?php

namespace App\Http\Controllers;

use App\Models\Task;

use Illuminate\Http\Request;
use Illuminate\Http\Request; 

use Illuminate\Http\Response;

class TaskController extends Controller
{
    /**
     * Display a listing of tasks.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(): \Illuminate\Http\JsonResponse
    {
        return response()->json(Task::all());
    }

    /**
     * Store a newly created task.
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request): \Illuminate\Http\JsonResponse
    {
        $data = $request->validate([
            'user_id' => ['required', 'exists:users,id'],
            'title' => ['required', 'string', 'max:255'],
            'description' => ['nullable', 'string'],
            'due_at' => ['nullable', 'date'],
        ]);

        $task = Task::create($data);

        return response()->json($task, Response::HTTP_CREATED);
    }

    /**
     * Display the specified task.
     *
     * @param Task $task
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Task $task): \Illuminate\Http\JsonResponse
    {
        return response()->json($task);
    }

    /**
     * Update the specified task.
     *
     * @param Request $request
     * @param Task $task
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Task $task): \Illuminate\Http\JsonResponse
    {
        $data = $request->validate([
            'title' => ['sometimes', 'string', 'max:255'],
            'description' => ['sometimes', 'nullable', 'string'],
            'due_at' => ['sometimes', 'nullable', 'date'],
            'is_completed' => ['sometimes', 'boolean'],
        ]);

        $task->update($data);

        return response()->json($task);
    }

    /**
     * Remove the specified task.
     *
     * @param Task $task
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Task $task): \Illuminate\Http\JsonResponse
    {
        $task->delete();

        return response()->json(null, Response::HTTP_NO_CONTENT);
    }

}
=======


