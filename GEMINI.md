# GEMINI.md — Project Intelligence File

> This file is automatically read by Google Gemini AI to understand the project before any session.

## 🗂 Project Overview

**Name:** Flutter Login App  
**Type:** Mobile App (Flutter / Dart)  
**Status:** Frontend complete — Firebase backend pending  
**Repo:** https://github.com/Prakhar2025/flutter-app  
**Author:** Prakhar (@Prakhar2025)

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.29.x (Dart 3.x) |
| Font | Poppins (via `google_fonts ^6.2.1`) |
| Animations | `animate_do ^3.3.4` |
| State | `setState` (local, simple) |
| Backend | ❌ Not yet — Firebase planned |

---

## 🎨 Design System

- **Primary gradient:** `#005BEA` → `#00C6FB` (left to right)
- **Card style:** White, `borderRadius: 28`, soft blue shadow
- **Input fields:** `borderRadius: 14`, grey fill, cyan focus border
- **Button:** Full-width, gradient, `borderRadius: 14`, cyan glow shadow
- **Font:** Poppins everywhere (no other fonts)
- **Wave header:** Custom `CustomClipper<Path>` — do NOT replace with an image

---

## 📁 Project Structure

```
lib/
├── main.dart                  # Entry point, MaterialApp setup
└── screens/
    ├── login_screen.dart      # Login UI (main screen)
    └── signup_screen.dart     # Sign Up UI
screenshots/
└── login_preview.png          # UI preview for README
```

---

## 📐 Code Conventions

- **Widgets:** All screens are `StatefulWidget`
- **Text:** Always use `GoogleFonts.poppins(...)` — never `TextStyle()` directly
- **Colors:** Use hex constants, never `Colors.blue` or generic colors
- **Validation:** All form fields must have a `validator:` function
- **Animations:** Wrap new screen content in `FadeInDown` (header) and `FadeInUp` (card)
- **Navigation:** Use `PageRouteBuilder` with `SlideTransition` — not `MaterialPageRoute`

---

## ✅ What's Done

- [x] Login screen (wave header, form, validation, loading state)
- [x] Sign Up screen (4 fields, confirm password, same design)
- [x] Forgot Password button (UI only)
- [x] Slide page transitions

## 🔲 What's Next (Planned)

- [ ] Firebase Authentication
- [ ] Home/Dashboard screen after login
- [ ] Dark mode support
- [ ] Splash screen

---

## ⚠️ Important Notes for AI

1. **Do NOT change the color palette** — matches the reference design
2. **Do NOT use `MaterialPageRoute`** — always `PageRouteBuilder` with slide transition
3. **Do NOT use `TextStyle()` directly** — always `GoogleFonts.poppins()`
4. **The wave clipper** (`_WaveClipper`) is intentional — keep it
5. When adding new screens, copy the wave header + card pattern from `login_screen.dart`
6. Run `flutter pub get` after any `pubspec.yaml` changes
