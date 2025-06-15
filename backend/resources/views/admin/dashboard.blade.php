@extends('layouts.admin')

@section('content')
    <h1 class="text-3xl font-semibold mb-4">Admin Dashboard</h1>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <div class="p-4 bg-white rounded shadow">Users</div>
        <div class="p-4 bg-white rounded shadow">Tasks</div>
        <div class="p-4 bg-white rounded shadow">Finance</div>
        <div class="p-4 bg-white rounded shadow">Analytics</div>
        <div class="p-4 bg-white rounded shadow">Settings</div>
    </div>
@endsection
