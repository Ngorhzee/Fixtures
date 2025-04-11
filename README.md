
# ⚽ Fixtures Betting UI

A clean and interactive football betting UI built with Flutter. Users can view upcoming and live matches, place bets with odds, and track rounds — all in a responsive and smooth interface.

---

## 🎥 Demo

- [📹 Watch Video](https://drive.google.com/file/d/1MIguZZaE0-ChVGw9f7prsGlitQ_PVDYN/view?usp=sharing)
- [📦 GitHub Repository](https://github.com/Ngorhzee/Fixtures)

---

## 🧱 Project Structure

```
lib/
│
├── core/
│   ├── utils/
│   │   └── date_formatter.dart
│   ├── colors.dart
│   └── text_styles.dart
│
├── model/
│   └── fixture_model.dart
│
├── providers/
│   └── fixture_provider.dart
│
├── services/
│   └── fixture_service.dart
│
├── view/
│   ├── dashboard/
│   └── home/
│
├── widget/
│   ├── app_button.dart
│   ├── fixtures_widget.dart
│   └── live_game_widget.dart
│
└── main.dart
```

---

## 🛠 Tech Stack

- **Flutter** — UI framework
- **Provider** — State management
- **Dart** — Language
- **Custom Widgets** — Clean UI with `Stack`, `Positioned`, `SvgPicture`, and modular components

---

## 🚀 Getting Started

Follow these steps to run the app locally:

### 1. Clone the Repository

```bash
git clone https://github.com/Ngorhzee/Fixtures.git
cd Fixtures
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```

> Make sure you have a device or emulator connected.

---

## 🧠 State Management

This project uses **Provider** for state management.

- `lib/providers/fixture_provider.dart`: contains all the logic for managing fixtures and notifying listeners.
- Integrated across views using `ChangeNotifierProvider`.

---

## 💡 Contribution

Feel free to open issues, fork the repo, or submit PRs to improve the app. Contributions are welcome!

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

Made with 💙 using Flutter
