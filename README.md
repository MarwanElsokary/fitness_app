# Fitness App

A comprehensive Flutter-based fitness application designed to help users track workouts, access gym routines, chat with AI for personalized advice, and manage their fitness journey.

## Features

- **Authentication**: Secure login with email/password, Google, and Apple sign-in.
- **Home Dashboard**: Overview of fitness progress and daily goals.
- **Workouts**: Guided workout plans with video support via YouTube integration.
- **Gym Tracking**: Track gym sessions and exercises.
- **Chat with AI**: Interact with an AI-powered chatbot for fitness tips and advice using Google Generative AI.
- **Smart Coach**: Personalized coaching recommendations.
- **Profile Management**: Update user profile, change password, and view history.
- **Onboarding**: Guided setup for new users.
- **Multi-language Support**: Localized for multiple languages.
- **Offline Support**: Works with caching and local storage.



## Technology Stack

- **Framework**: Flutter (Dart)
- **State Management**: BLoC, Provider
- **Networking**: Dio, Retrofit
- **Database**: Shared Preferences, Secure Storage
- **AI**: Google Generative AI for chat functionality
- **Media**: YouTube Player Flutter for workout videos
- **UI**: Material Design, SVG support, Image caching
- **Localization**: Flutter Localizations with Intl
- **Other Libraries**: Logger, Connectivity Plus, Flutter ScreenUtil, URL Launcher, etc.

## Prerequisites

- Flutter SDK (^3.9.2)
- Dart SDK (compatible with Flutter)
- Android Studio or VS Code for development
- Android/iOS emulator or physical device
- Google Services account for Firebase/Auth (if enabled)
- YouTube API key for video integration (if enabled)
- Google AI API key for chat with AI

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/MarwanElsokary/fitness_app.git
   cd fitness_app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate code (for Retrofit and JSON serialization)**:
   ```bash
   flutter pub run build_runner build
   ```

4. **Set up environment variables** (if needed for API keys):
   - Create a `.env` file in the root directory.
   - Add your API keys as required (e.g., Google AI key).

5. **Run the app**:
   ```bash
   flutter run
   ```

## Usage

- Launch the app on your device.
- Follow the onboarding process.
- Sign up or log in to access features.
- Navigate through Home, Workouts, Gym, AI Chat, and Profile sections.
- Customize your profile and change password in the settings.

## Building for Production

### Android
```bash
flutter build apk
```

### iOS
```bash
flutter build ios
```

### Web
```bash
flutter build web
```

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/new-feature`).
3. Make your changes and commit (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/new-feature`).
5. Create a Pull Request.

## Project Structure

```
lib/
├── core/                 # Core utilities, services, and configurations
├── features/             # Feature-specific modules
│   ├── auth/             # Authentication
│   ├── home/             # Home dashboard
│   ├── workouts/         # Workout management
│   ├── gym/              # Gym tracking
│   ├── chat_with_ai/     # AI chat
│   ├── profile/          # User profile
│   └── ...
└── main.dart             # App entry point
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



## Support

For support, please open an issue on GitHub or contact the maintainer.
