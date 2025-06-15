# Digi Task

This repository contains a Laravel API and a Flutter mobile client.

## Backend (Laravel)

1. Copy `backend/.env.example` to `backend/.env` and adjust settings.
2. Install dependencies with Composer.
3. Run `php artisan migrate --seed` to set up the database.
4. Start the server via `php artisan serve`.

API routes are available under `/api`.

## Mobile (Flutter)

1. Copy `mobile/.env.example` to `mobile/.env` and set `API_BASE_URL` to your backend URL.
2. Run `flutter pub get`.
3. Launch the app with `flutter run`.

The Flutter app uses BLoC for state management and fetches tasks from the API.
