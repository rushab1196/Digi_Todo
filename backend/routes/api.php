<?php

use App\Http\Controllers\TaskController;

use App\Http\Controllers\TagController;
use Illuminate\Support\Facades\Route;

Route::apiResource('tasks', TaskController::class);
Route::apiResource('tags', TagController::class);


