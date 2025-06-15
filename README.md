# Digi Task

This repository contains a Laravel API and a Flutter mobile client.

## Backend (Laravel)

1. Copy `backend/.env.example` to `backend/.env` and adjust the database
   connection or other settings as needed.
2. From the `backend` directory run `composer install` to install PHP
   dependencies.
3. Generate an application key with `php artisan key:generate`.
4. Run `php artisan migrate --seed` to build and seed the database.
5. Start the API server with `php artisan serve`.

API routes are available under `/api`.

The API now supports managing tasks and tags. Tasks can be assigned multiple
tags by including a `tags` array of tag IDs when creating or updating a task.


## Mobile (Flutter)

1. Copy `mobile/.env.example` to `mobile/.env` and set `API_BASE_URL` to the
   URL where the Laravel API is running.
2. From the `mobile` directory run `flutter pub get` to install Dart
   dependencies.
3. Launch the app with `flutter run` on your simulator or device.

The Flutter app uses BLoC for state management and fetches tasks from the API.

Refer to the project guidelines in the repository wiki for coding standards,
CI configuration and sprint planning details.
