# LingConnect

> Break the language barrier — video calls with live AI translation.

LingConnect is an open-source Flutter app that lets you talk to anyone, in any language, on any platform. Pick your preferred language, create or join a call, and see your conversation translated live as subtitles.

> **Status:** Early development. The UI, navigation, theming, and Clean Architecture layers are in place. Backend integrations (auth, real-time video, speech-to-text, translation) are currently mocked — see the [Roadmap](#roadmap).

---

## Table of Contents

- [Features](#features)
- [Screens](#screens)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Build](#build)
- [Testing](#testing)
- [Contributing](#contributing)
- [Roadmap](#roadmap)
- [License](#license)

---

## Features

- **Language onboarding** — pick a preferred language at first launch
- **Authentication flow** — sign in / sign up scaffold
- **Video calls with live translation** — create or join a call, see subtitles in both languages
- **Adaptive UI** — light & dark themes, frosted-glass cards, mesh-gradient backgrounds
- **Cross-platform** — Android, iOS, Web, macOS, Windows, Linux

## Screens

| Onboarding | Auth | Home | Call |
| --- | --- | --- | --- |
| Language selection | Sign in / sign up | Dashboard with quick actions | Live video + bilingual subtitles |

## Tech Stack

| Layer | Library |
| --- | --- |
| Framework | [Flutter](https://flutter.dev) (Dart SDK `^3.11.1`) |
| State management | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) + [`equatable`](https://pub.dev/packages/equatable) |
| Dependency injection | [`get_it`](https://pub.dev/packages/get_it) |
| Networking | [`dio`](https://pub.dev/packages/dio) |
| Error handling | [`dartz`](https://pub.dev/packages/dartz) — `Either<Failure, T>` |
| Typography | [`google_fonts`](https://pub.dev/packages/google_fonts) |
| Linting | [`flutter_lints`](https://pub.dev/packages/flutter_lints) |

## Architecture

The codebase follows **Clean Architecture** — each feature is split into three layers with strict dependency direction (`presentation` → `domain` ← `data`):

```
features/<feature>/
├── data/           # Data sources, models, repository implementations
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/         # Pure business logic — no Flutter, no I/O imports
│   ├── entities/
│   ├── repositories/   (abstract contracts)
│   └── usecases/
└── presentation/   # UI + state
    ├── bloc/
    ├── pages/
    └── widgets/
```

Use cases return `Either<Failure, T>` so BLoCs handle failures explicitly. Dependencies are wired up in `lib/core/services/service_locator.dart` via `get_it`, and routes are declared in `lib/core/utils/route_generator.dart`.

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── errors/                 # Failure types
│   ├── network/
│   ├── services/               # service_locator (get_it)
│   ├── theme/                  # AppTheme — light & dark
│   ├── utils/                  # route_generator
│   └── widgets/                # Shared UI (GlassCard, MeshGradientBackground)
├── features/
│   ├── auth/                   # Sign in / sign up
│   ├── call/                   # Create / join rooms, video call screen
│   ├── home/                   # Post-auth dashboard
│   ├── onboarding/             # Language selection, onboarding sign-in
│   └── settings/
└── main.dart
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **≥ 3.11**
- Dart SDK ≥ 3.11 (bundled with Flutter)
- Platform tooling for any target you want to build:
  - **iOS / macOS** — Xcode (latest stable)
  - **Android** — Android Studio + SDK
  - **Web** — Chrome
  - **Linux / Windows** — see [Flutter desktop setup](https://docs.flutter.dev/platform-integration/desktop)

Verify your environment:

```bash
flutter doctor
```

### Install & Run

```bash
git clone https://github.com/CharlesClayman/ling_connect.git
cd ling_connect
flutter pub get
flutter run
```

To target a specific device:

```bash
flutter devices                # list available devices
flutter run -d chrome          # web
flutter run -d macos           # macOS
flutter run -d <device-id>     # mobile / emulator
```

## Build

```bash
flutter build apk              # Android APK
flutter build appbundle        # Android App Bundle
flutter build ios              # iOS
flutter build web              # Web
flutter build macos            # macOS
flutter build windows          # Windows
flutter build linux            # Linux
```

## Testing

```bash
flutter analyze                # static analysis (uses analysis_options.yaml)
flutter test                   # run unit & widget tests
```

## Contributing

Contributions are very welcome! Whether it's a bug fix, a new feature, or improving docs:

1. **Fork** the repository and create a feature branch from `main`:
   ```bash
   git checkout -b feat/your-feature
   ```
2. **Build it** — keep the Clean Architecture boundaries:
   - `domain/` must not import Flutter, `dart:io`, or any `data/` code.
   - Data sources go behind a repository interface declared in `domain/`.
   - Register new dependencies in `lib/core/services/service_locator.dart`.
   - Add new routes in `lib/core/utils/route_generator.dart`.
3. **Verify** — run `flutter analyze` and `flutter test` before pushing.
4. **Open a PR** describing the change. For larger features, please open an issue first so we can discuss the approach.

### Code Style

- Follow `analysis_options.yaml` (extends [`flutter_lints`](https://pub.dev/packages/flutter_lints)).
- Prefer `Either<Failure, T>` for use-case return types.
- Use `Equatable` for value objects and BLoC events/states.
- Keep widgets small and composable; reuse `core/widgets/` where possible.

## Roadmap

- [ ] Replace mocked auth with a real backend
- [ ] Integrate a real-time video SDK (e.g. LiveKit, Agora, Daily, Jitsi)
- [ ] Wire up the live translation pipeline (speech-to-text → translation → text-to-speech)
- [ ] Persist user language and theme preferences
- [ ] Build out the settings page (theme, audio routing, captions display)
- [ ] CI pipeline: `flutter analyze`, `flutter test`, multi-platform builds on GitHub Actions
- [ ] Localize the app itself (i18n)

## License

LingConnect is released under the **GNU General Public License v3.0** — see the [`LICENSE`](LICENSE) file for the full text.

In short, GPL-3.0 lets anyone use, study, modify, and redistribute this software, **provided that any distributed derivative works are also released under GPL-3.0** (copyleft). For details, see the [GPL-3.0 summary on choosealicense.com](https://choosealicense.com/licenses/gpl-3.0/).

---

Built with [Flutter](https://flutter.dev). Contributions, issues, and ideas are all welcome.
