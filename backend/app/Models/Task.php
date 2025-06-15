<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'due_date',
        'completed'
    ];

    protected $casts = [
        'completed' => 'boolean',
        'due_date' => 'datetime',
    ];
}
