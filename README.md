# 📱 Flutter Signup Adventure — MAD In-Class Activity 10

A multi-screen Flutter app built for Mobile App Development (MAD) ICA 10 at Georgia State University. This is Part 2 of the Signup Adventure, extending the validated form from Activity 09 into a complete, polished app flow with animations, confetti, and a clean multi-file architecture.

---

## ✨ Features

- **Welcome Screen** — animated typewriter title, rotating subtitle messages, gradient background, and a Get Started button
- **Signup Screen** — full validated form with avatar picker, date of birth picker, password visibility toggles, and a loading spinner on submit
- **Success Screen** — confetti celebration, personalized "Welcome, [Name]!" message, animated avatar scale-in, and a replay confetti button
- **Multi-screen navigation** — `Navigator.push` from Welcome → Signup, `Navigator.pushReplacement` from Signup → Success (prevents accidental resubmission)
- **Clean file structure** — each screen lives in its own file inside `lib/screens/`

---

## 📸 Screenshots

| Welcome | Signup | Success |
|---|---|---|
| <img width="200" src="https://github.com/user-attachments/assets/4269af52-ab0e-4184-983f-45307ed49f33" /> | <img width="200" src="https://github.com/user-attachments/assets/013830fa-205f-47b8-94a0-aa31c0fa2168" /> | <img width="200" src="https://github.com/user-attachments/assets/10bfc307-0f5d-4660-a08d-c5793451f594" /> |
---

## 🗂️ Project Structure

```
lib/
├── main.dart                  # Entry point — launches WelcomeScreen
└── screens/
    ├── welcome_screen.dart    # Animated intro screen
    ├── signup_screen.dart     # Enhanced form with date picker & toggles
    └── success_screen.dart    # Confetti celebration screen
```

---

## 🧭 App Flow

```
WelcomeScreen
    │
    │  Navigator.push()
    ▼
SignupScreen
    │
    │  Navigator.pushReplacement()  (prevents back-navigation to form)
    ▼
SuccessScreen
    │
    │  Navigator.popUntil(first)
    ▼
WelcomeScreen
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed — [flutter.dev](https://flutter.dev/docs/get-started/install)
- VS Code with the Flutter extension
- Android emulator or physical device

Verify your setup:
```bash
flutter doctor
```

### Install & Run

```bash
git clone https://github.com/adrit-ganeriwala-05/in-class-10-MAD.git
cd in-class-10-MAD
flutter pub get
flutter run
```

### Build APK

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  animated_text_kit: ^4.2.2   # Typewriter & fade animations on Welcome screen
  confetti: ^0.7.0             # Confetti cannon on Success screen
```

Install with:
```bash
flutter pub add animated_text_kit
flutter pub add confetti
```

---

## ✅ Validation Rules

| Field | Rules |
|---|---|
| Full Name | Required, minimum 2 characters |
| Email | Required, must match `user@domain.tld` format (RegExp) |
| Password | Required, minimum 6 characters |
| Confirm Password | Required, must match Password field exactly |
| Birth Date | Required, selected via date picker |

---

## 🎓 Concepts Demonstrated

| Concept | Where |
|---|---|
| Multi-screen navigation | Welcome → Signup → Success |
| `Navigator.pushReplacement` | Prevents resubmission from Success screen |
| `animated_text_kit` | Typewriter & fade animations on Welcome screen |
| `confetti` package | Celebration on Success screen |
| Password visibility toggle | `suffixIcon` with `obscureText` state |
| Date picker | `showDatePicker()` in Signup screen |
| Loading state | `CircularProgressIndicator` while form submits |
| `dispose()` | All controllers properly cleaned up |
| Separated file structure | One file per screen in `lib/screens/` |

---

## 👥 Authors

- **Student:** Adrit Ganeriwala
- **Course:** Mobile App Development (MAD 4360) — Georgia State University
- **Activity:** ICA 10 — Part 2 of 2
- **Due:** March 30, 2026
