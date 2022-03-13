<h1 align="center">OW-API-APP</h1>

<p align="center">  
OW-API-App is an application based on the BLoC pattern and Clean architecture. <br>
This project is for focusing on how the BLoC pattern would perform in an complete application.
</p>

## I. Introduction
To get more comfortable with the BLoC pattern, I decided to develop an app for practice purposes. Eventually that app turned into this little project for Overwatch Statistics. 
I always feel like it's hard to see your stats, progress and achievements through your phone. That's why I started working on this project and now share it with the community.

The first version of the project (~ v1.0) is just about viewing your competitive rank and building up backend of the application. I applied the BloC pattern by using `flutter_bloc` for state management and tried to implement some of the clean-architecture principles. In the next version (v2.0) i'm planning on addding mroe user statistics to the application and improving the UI. 

## II. Showcase
<p>
  <img src="https://github.com/Ashhas/OW-API-App/blob/master/screenshots/Screenshot_20210508-175330.jpg" width="200">
  <img src="https://github.com/Ashhas/OW-API-App/blob/master/screenshots/Screenshot_20210508-175556.jpg" width="200">
  <img src="https://github.com/Ashhas/OW-API-App/blob/master/screenshots/Screenshot_20210508-175434.jpg" width="200">
  <img src="https://github.com/Ashhas/OW-API-App/blob/master/screenshots/Screenshot_20210508-175352.jpg" width="200">
</p>

## III. API
This app is using the [OW-API](https://ow-api.com/) in the network layer. <br>
OW-API provides a RESTful API interface to profile information of all Overwatch players. 

(Example Request)
https://ow-api.com/v3/stats/pc/Ashhas-2396/profile

API | Usage
------------ | -------------
/profile | Return commonly used data for a specific profile
/complete | Return all profile data of a specific profile (heavy)

## IV. Plugins
Plugin | Usage
------------ | -------------
[hive](https://pub.dev/packages/hive) | NoSQL Database
[hive_flutter](https://pub.dev/packages/hive) | Extension for Hive, adding Flutter specfic control
[hive_generator](https://pub.dev/packages/hive_generator) | Extension for Hive. For storing classes
[shared_preferences](https://pub.dev/packages/shared_preferences) | Mostly for checking on startup
[package_info](https://pub.dev/packages/package_info) | Fetching App Version Info
[equatable](https://pub.dev/packages/equatable) | Implements value based comparisons
[path_provider](https://pub.dev/packages/path_provider) | Hive DB location
[connectivity](https://pub.dev/packages/connectivity) | Checking Internet Connection
[http](https://pub.dev/packages/http) | For doing REST Requests
[flutter_bloc](https://pub.dev/packages/flutter_bloc) | For app architecture & state management
[json_serializable](https://pub.dev/packages/json_serializable) | Formatting JSON
[build_runner](http://build_runner) | SAA

## Development Environment
`flutter doctor -v`
```
flutter doctor -v
[√] Flutter (Channel stable, 2.0.5, on Microsoft Windows [Version 10.0.19042.928], locale nl-NL)
    • Flutter version 2.0.5 at C:\--------
    • Framework revision adc687823a (3 weeks ago), 2021-04-16 09:40:20 -0700
    • Engine revision b09f014e96
    • Dart version 2.12.3

[√] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Android SDK at C:\--------
    • Platform android-30, build-tools 30.0.3
    • Java binary at: C:\--------
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b01)
    • All Android licenses accepted.

[X] Chrome - develop for the web (Cannot find Chrome executable at .\Google\Chrome\Application\chrome.exe)
    ! Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.

[√] Android Studio (version 4.1.0)
    • Android Studio at C:\--------
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b01)

[√] IntelliJ IDEA Community Edition (version 2021.1)
    • IntelliJ at C:\--------
    • Flutter plugin version 55.1.5
    • Dart plugin version 211.7179

[√] VS Code, 64-bit edition (version 1.55.0)
    • VS Code at C:\--------
    • Flutter extension can be installed from:
       https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

[√] Connected device (2 available)
    • ONEPLUS A5000 (mobile) • deviceId • android-arm64  • Android 10 (API 29)
    • Edge (web)             • edge     • web-javascript • Microsoft Edge 90.0.818.51

! Doctor found issues in 1 category.
```

Before run project, execute commands:
- `flutter clean`
- `flutter pub get`
- `flutter pub run build_runner build` or `flutter pub run build_runner build --delete-conflicting-outputs`
- `flutter run` (if needed)

## License
The app is GPL-3.0 licensed.
