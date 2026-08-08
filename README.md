# NutriFix — Fitness & Nutrition AI App

A feature-rich cross-platform fitness and wellness app: workout tracking, meal planning, sleep & water tracking, BMI, medicine reminders, and AI-powered nutrition/workout generators (Gemini), with Firebase Auth + Firestore.

## Features

- **Auth & onboarding** — login, register, complete profile, goal selection.
- **Home dashboard** — activity overview, notifications, finished workouts.
- **Workout tracker** — schedules, workout details, add schedule, AI plan generation.
- **Meal planner** — schedules, food details, AI meal plan generation.
- **Sleep tracker** — schedules, alarms, learning content.
- **Water tracker** — daily hydration logging.
- **BMI calculator** — input + results with health categories.
- **Gemini AI modules** — calorie/nutrition scanning, AI meal plans, AI workout plans with form → result → saved-requests flows.
- **Medicine reminders** — recurring medication notifications (BLoC-based flow).
- **Photo progress** — side-by-side progress comparison.
- **Notifications** — `flutter_local_notifications` + timezone handling.

## Architecture

```
lib/
├── core/            # controllers, theme, constants, helpers
├── features/        # auth, home, workouts, meals, sleep, water, bmi, reminders, ai modules
└── providers/       # provider/rxdart integration points
```

State management: GetX controllers + BLoC Cubits + Provider/RxDart (mixed). DI via `get_it`, persistence via `get_storage`/`shared_preferences`.

## Configuration

Create a `.env` file from the `.env.example`:

```
GEMINI_API_KEY=your_key_here
```

The key is passed at build time with `--dart-define=GEMINI_API_KEY=...` (never hardcode it). Firebase is configured through `firebase_options.dart` (`google-services.json` is gitignored).

## Getting started

```bash
flutter pub get
flutter run --dart-define=GEMINI_API_KEY=your_key
```

## Status & notes

- Recovery: deps pinned, `lints` migrated, Firebase configs gitignored, API keys removed from source, Gradle/AGP/Kotlin upgraded.
- ⚠️ Known debt (see `RECOVERY_PLAN.md`): `dev_lib/` has vendored code with analyzer errors; 3 competing state-management systems in the codebase — a cleanup pass is recommended.

## License

All rights reserved. Demo/portfolio project.