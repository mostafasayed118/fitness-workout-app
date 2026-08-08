# Fitness Workout App Recovery Plan

## Executive Summary

"NutriFix" is a cross-platform fitness and wellness app with workout tracking, meal planning, sleep/water tracking, BMI calculation, medicine reminders, and AI features (Gemini-powered calorie scanning, meal/workout plans). Firebase Auth + Firestore backend. **Critical security issue:** plaintext passwords stored in Firestore. Three competing state management systems (GetX, BLoC, Provider+RxDart). 157 Dart files, 258 assets. Previous recovery pass applied (dependency pinning, Gemini key removal, Firebase config gitignored).

## Tracking Table

| ID | Area | Severity | Planned action | Status | Verification |
|---|---|---|---|---|---|
| F-01 | Plaintext password in Firestore | Blocker | Remove password from addUser() | Not started | No passwords in Firestore |
| F-02 | Firebase options committed | Blocker | Restrict API keys in Console | Not started | Keys restricted |
| F-03 | Triple routing systems | Critical | Unify to single navigation | Not started | One routing system |
| F-04 | Duplicate auth implementations | Critical | Consolidate to single AuthService | Not started | One auth class |
| F-05 | Triple state management | Critical | Unify to GetX | Not started | One state system |
| F-06 | Multiple SharedPreferences instances | High | Use CacheHelper singleton | Not started | Single SP instance |
| F-07 | Error details leaked to users | High | Show friendly messages only | Not started | No error leaks |
| F-08 | Firestore reads all users | High | Restrict to current user | Not started | User-scoped queries |
| F-09 | ProfileView onTap crash | High | Add onTap callbacks | Not started | No crash |
| F-10 | Self-import in responsive.dart | High | Remove circular import | Not started | No circular imports |
| F-11 | intl version conflict override | High | Resolve and remove override | Not started | No overrides |
| F-12 | Vendored dev_lib with 21 errors | High | Delete dev_lib/ | Not started | No vendored code |
| F-13 | Default counter test | Medium | Replace with real tests | Not started | Tests pass |
| F-14 | 11 dead/commented files | Medium | Delete all dead code | Not started | No dead files |
| F-15 | Hardcoded dashboard data | Medium | Connect to real data | Not started | Real user data |
| F-16 | Raw SelectPage design | Medium | Redesign as feature grid | Not started | Polished grid |
| F-17 | Social login stubs | Medium | Implement or remove | Not started | Working or removed |
| F-18 | Misspelled directory names | Medium | Rename all | Not started | Correct spelling |
| F-19 | Competing color/theme files | Medium | Consolidate | Not started | Single theme |
| F-20 | Monolithic view files (500-1100 lines) | Medium | Break down | Not started | <200 lines each |
| F-21 | No accessibility | Medium | Add Semantics | Not started | Screen reader works |
| F-22 | No internationalization | Medium | Add i18n | Not started | ARB files |
| F-23 | Deprecated lint package | Low | Upgrade | Not started | Strict linting |
| F-24 | Default README | Low | Write project docs | Not started | Setup instructions |
| F-25 | Template description | Low | Update | Not started | Meaningful text |
| F-26 | Missing Poppins font | Low | Add font files | Not started | Font renders |
| F-27 | Empty FirestoreService | Low | Implement or delete | Not started | Working service |
| F-28 | Gemini regex bug | Low | Fix interpolation | Not started | Correct parsing |
| F-29 | BMI boundary gaps | Low | Fix ranges | Not started | Contiguous ranges |
| F-30 | Duplicate onboarding image | Low | Add distinct image | Not started | 4 unique images |
| F-31 | Placeholder bundle ID | Low | Replace com.example.* | Not started | Unique IDs |
| F-32 | Web platform unsupported | Low | Configure or document | Not started | Web works or documented |

## Baseline Build Results (Step 2)

| Check | Result | Notes |
|---|---|---|
| `flutter pub get` | Pass | 96 packages have updates, intl override present |
| `flutter analyze` | **357 issues** | 10+ errors (tooltipBgColor, foregroundColor mismatches), 30+ warnings, 300+ info |
| `flutter test` | N/A | Default counter test (irrelevant) |

### Compilation Errors Found

| ID | Error | File(s) |
|---|---|---|
| FE-01 | `tooltipBgColor` undefined parameter | home_view.dart, activity_tracker_view.dart, meal_planner_view.dart, sleep_tracker_view.dart, workout_tracker_view.dart, result_view.dart |
| FE-02 | `foregroundColor` required but missing / `foregrondColor` typo | home_view.dart, result_view.dart, sleep_schedule_view.dart, nutritions_row.dart, workout_row.dart |

### Key Stats
- 157 Dart files in lib/
- 357 analysis issues
- 10+ compilation errors
- 3 competing state management systems
- 11 dead/commented files
- Vendored dev_lib/ with 21 errors

## Security & Configuration Audit (Step 3)

| ID | Severity | Finding | File(s) | Action Required |
|---|---|---|---|---|
| SEC-F01 | **CRITICAL** | Plaintext passwords stored in Firestore | register_view.dart:416-417 | Remove password from addUser() immediately |
| SEC-F02 | High | Firebase API keys, OAuth IDs in source | firebase_options.dart, google-services.json | Restrict keys in Console |
| SEC-F03 | High | Release signed with debug keys | build.gradle:60 | Create release keystore |
| SEC-F04 | High | Full user collection dumped to console | profile_view.dart:67-72 | Query only current user |
| SEC-F05 | High | Unauthenticated Firestore write, no await | register_view.dart:205-206 | Await addUser(), add null check |
| SEC-F06 | High | No Firestore Security Rules | (missing file) | Create and deploy rules |
| SEC-F07 | Medium | Raw exception details shown to users | register_view.dart:263, login_view.dart:208 | Show friendly messages only |
| SEC-F08 | Medium | Gemini API key embedded in binary | gemini_service.dart:5-8 | Use backend proxy |
| SEC-F09 | Medium | Overly broad Android permissions | AndroidManifest.xml:2-8 | Use scoped storage |
| SEC-F10 | Medium | Verbose logging of user data | profile_view.dart:72 | Remove log() calls |
| SEC-F11 | Medium | Silent exception swallowing | auth_service.dart:18-20 | Re-throw or log to crashlytics |

## Dependency & Platform Modernization (Step 4)

### Key Dependencies

| Package | Current | Target | Breaking? | Risk |
|---|---|---|---|---|
| firebase_core | 2.32.0 | 4.12.1 | **Major** | High — Firebase migration |
| firebase_auth | 4.20.0 | 6.5.6 | **Major** | High — Firebase migration |
| cloud_firestore | 4.17.5 | 6.7.1 | **Major** | High — Firebase migration |
| fl_chart | 0.69.2 | 1.2.0 | **Major** | Medium — API changes (tooltipBgColor error) |
| flutter_bloc | 8.1.5 | 9.1.1 | **Major** | Medium — if kept |
| get_it | 7.7.0 | 9.2.1 | **Major** | Medium |
| shared_preferences | 2.2.3 | 2.5.5 | Patch | Low — **upgrade now** (security advisory) |
| intl | 0.18.1 (overridden) | 0.20.3 | Major | Medium — resolve override |
| syncfusion_flutter_sliders | 25.2.7 | 34.1.33 | **Major** | High — major version jump |
| flutter_local_notifications | 18.0.1 | 22.2.0 | **Major** | Medium |

### Upgrade Batches

| Batch | Risk | Items | Effort |
|---|---|---|---|
| 1 | Low | Patch updates: cupertino_icons, flutter_native_splash, flutter_svg, percent_indicator | 10 min |
| 2 | Medium | shared_preferences 2.2.3 -> 2.5.5 (security fix) | 5 min |
| 3 | Medium | fl_chart 0.69 -> 1.2 (fixes tooltipBgColor errors) | 2-4 hrs |
| 4 | High | Firebase 2.x/4.x -> 4.x/6.x (requires FlutterFire migration) | 1-2 days |
| 5 | High | Remove intl override, resolve dependency conflict | 2-4 hrs |
| 6 | High | syncfusion 25.x -> 34.x | 4-8 hrs |

### Critical: fl_chart Upgrade
The `tooltipBgColor` compilation errors are caused by fl_chart 0.69 API. Upgrading to 1.2.0 fixes these errors but requires API migration.

### Critical: Firebase Migration
Firebase Core 2.x -> 4.x and Firebase Auth 4.x -> 6.x are major migrations. Consider using `flutterfire upgrade` CLI.

## Phased Recovery Plan

### Phase 0: Security Emergency (1-2 days)
- Remove plaintext password from Firestore addUser()
- Restrict Firebase API keys in Console
- Add Firestore Security Rules
- **Acceptance:** No passwords in Firestore, keys restricted, rules deployed

### Phase 1: Build Health (2-3 days)
- Delete 11 dead/commented files
- Remove vendored dev_lib/
- Fix self-import in responsive.dart
- Remove unused dependencies
- Resolve intl version conflict
- Fix Gemini regex bug
- Fix BMI boundary conditions
- **Acceptance:** flutter analyze clean, no overrides, no dead code

### Phase 2: Architecture Consolidation (5-7 days)
- Consolidate auth to single AuthService
- Migrate GlobalBloc to GetX
- Migrate LoginCubit to GetX
- Remove provider dependency
- Unify navigation
- Fix splash race condition
- Fix ProfileView crash
- **Acceptance:** One state system, one auth class, one routing system

### Phase 3: Functional Data Flow (5-7 days)
- Implement FirestoreService for user CRUD
- Connect HomeView to real data
- Implement profile editing
- Implement onboarding goal persistence
- Implement or remove social login
- **Acceptance:** Real user data displayed, profile editable

### Phase 4: Testing & Quality (5-7 days)
- Replace boilerplate test
- Unit tests for BMI, validators, auth
- Widget tests for login, register, splash
- Integration test for login->home
- Upgrade analysis_options
- Add CI pipeline
- **Acceptance:** >80% coverage, CI passes

### Phase 5: Polish & Ship (3-5 days)
- Change bundle IDs
- Break down monolithic views
- Redesign SelectView
- Add i18n
- Add accessibility
- Write README
- Configure release signing
- **Acceptance:** Production-ready quality
