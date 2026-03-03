# Login App - Professional Flutter Login UI

A beautiful, professional login app built with Flutter, featuring a blue/cyan gradient wave design.

## 📱 Features
- ✅ Professional blue gradient wave header (matches design reference)
- ✅ Login screen with email & password validation
- ✅ Show/hide password toggle
- ✅ Loading spinner on Sign In
- ✅ Sign Up screen with full form validation
- ✅ Smooth slide page transitions
- ✅ Fade + slide entry animations (animate_do)
- ✅ Google Fonts (Poppins)
- ✅ Forgot Password button

## 🚀 How to Run (Once Flutter is Installed)

### 1. Install Flutter SDK
Go to **https://docs.flutter.dev/get-started/install/windows** and download Flutter.

Or use this direct download link for Flutter 3.29.x (stable):
```
https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.29.2-stable.zip
```

Extract to `C:\tools\flutter` and add `C:\tools\flutter\bin` to your **PATH** environment variable.

### 2. Verify Installation
```powershell
flutter doctor
```
Fix any issues shown (usually Android Studio / SDK setup).

### 3. Run the App
```powershell
cd C:\Users\prakh\OneDrive\Desktop\kuldeep\login_app
flutter pub get
flutter run
```

## 📁 Project Structure
```
login_app/
├── lib/
│   ├── main.dart                  # App entry point
│   └── screens/
│       ├── login_screen.dart      # Login UI (main screen)
│       └── signup_screen.dart     # Sign Up UI
├── android/                       # Android config
├── pubspec.yaml                   # Dependencies
└── README.md
```

## 📦 Dependencies
| Package | Purpose |
|---------|---------|
| `google_fonts ^6.2.1` | Poppins font |
| `animate_do ^3.3.4` | FadeIn/SlideIn animations |

## 🎨 Design
- Colors: `#005BEA` → `#00C6FB` gradient
- Font: Poppins (Google Fonts)
- Wave clipper header
- Floating card form with shadow
