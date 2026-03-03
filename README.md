<h1 align="center">🔐 Flutter Login App</h1>

<p align="center">
  A professional, beautifully designed Flutter login UI with blue/cyan gradient wave design.
</p>

<p align="center">
  <img src="screenshots/login_preview.png" alt="Login Screen Preview" width="300"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.29.x-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/Status-Frontend%20Ready-brightgreen?style=for-the-badge"/>
</p>

---

## ✨ Features

- 🌊 **Blue → Cyan wave gradient** header (`#005BEA` → `#00C6FB`)
- 🔐 **Login Screen** with email & password validation
- 📝 **Sign Up Screen** with full form & confirm password check
- 👁 **Show / Hide password** toggle
- ⏳ **Loading spinner** on button press
- 🎞 **Smooth entry animations** (FadeIn + SlideIn via `animate_do`)
- 🔠 **Poppins font** via Google Fonts
- 📲 **Slide page transition** between Login ↔ Sign Up
- ✅ **Forgot Password** button

---

## 📱 Screenshots

| Login Screen | Sign Up Screen |
|:---:|:---:|
| ![Login](screenshots/login_preview.png) | *(Coming soon)* |

---

## 🚀 Getting Started

### 1. Install Flutter
Download from the official site 👉 [flutter.dev/get-started](https://docs.flutter.dev/get-started/install/windows)

Extract to `C:\tools\flutter` and add `C:\tools\flutter\bin` to your **PATH**.

### 2. Verify
```powershell
flutter doctor
```

### 3. Run the App
```powershell
git clone https://github.com/Prakhar2025/flutter-app.git
cd flutter-app
flutter pub get
flutter run
```

---

## 📁 Project Structure

```
login_app/
├── lib/
│   ├── main.dart                     # App entry point
│   └── screens/
│       ├── login_screen.dart         # Login UI
│       └── signup_screen.dart        # Sign Up UI
├── screenshots/
│   └── login_preview.png             # UI Preview
├── android/                          # Android config
├── pubspec.yaml                      # Dependencies
└── README.md
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `google_fonts` | ^6.2.1 | Poppins typography |
| `animate_do` | ^3.3.4 | Entry animations |

---

## 🛣 Roadmap

- [x] Login UI
- [x] Sign Up UI
- [x] Form validation
- [x] Animations & transitions
- [ ] Firebase Authentication (backend)
- [ ] Home screen after login
- [ ] Dark mode

---

## 👨‍💻 Author

Made by **Prakhar** · [@Prakhar2025](https://github.com/Prakhar2025)
