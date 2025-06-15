<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Digi Task</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.4.4/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex">
    <aside class="w-64 bg-white shadow-md">
        <div class="p-4 text-2xl font-bold">Digi Task</div>
        <nav class="mt-6">
            <a href="/admin" class="block px-4 py-2 hover:bg-gray-200">Dashboard</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-200">Users</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-200">Tasks</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-200">Finance</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-200">Settings</a>
        </nav>
    </aside>
    <main class="flex-1 p-6">
        @yield('content')
    </main>
</body>
</html>
