# OW-API-APP

## I. Introduction
I’m an software engineering graduate aspiring to become an Android/Flutter Developer. I’m currently improving my skills in mobile development by making a lot of personal project and learning in the process.

I always felt like Blizzard never did much with the Overwatch IP on mobile. To view your stats, progress and achievements you have to really go out of your way to view them. That's why I build this project and now share it with the community. I hope that in the future this project can provide an easy way for the community to get insight into their performance at home & on-the-go. 

The first version of the project (v1.0) is just about viewing your competitive rank and building up backend of the application. I applied the BloC pattern by using Flutter Bloc for state management and tried to implement some of the clean-architecture principles. In the next version (v2.0) i'm planning on addding user statistics to the application and improving the UI by working with an UI Designer (still looking for one).

## II. Showcase

<p>
  <img src="https://github.com/Ashhas/OW-API-App/blob/develop_branch/ow_api_app/screenshots/Screenshot_20210508-175330.jpg" width="230">
  <img src="https://github.com/Ashhas/OW-API-App/blob/develop_branch/ow_api_app/screenshots/Screenshot_20210508-175556.jpg" width="230">
    <img src="https://github.com/Ashhas/OW-API-App/blob/develop_branch/ow_api_app/screenshots/Screenshot_20210508-175434.jpg" width="230">
   <img src="https://github.com/Ashhas/OW-API-App/blob/develop_branch/ow_api_app/screenshots/Screenshot_20210508-175352.jpg" width="230">
</p>

## III. API
API used: https://ow-api.com 

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
[flutter_dropdown](https://pub.dev/packages/flutter_dropdown) | For the dropdown menu containing platform
[persistent_bottom_nav_bar](https://pub.dev/packages/persistent_bottom_nav_bar) | Navigation Bar
[json_serializable](https://pub.dev/packages/json_serializable) | Formatting JSON
[build_runner](http://build_runner) | SAA

## V. Design credit
##### Author: -----
##### Design link: -----

## Development Environment
`flutter doctor -v`
```
flutter doctor -v
[√] Flutter (Channel stable, 2.0.5, on Microsoft Windows [Version 10.0.19042.928], locale nl-NL)
    • Flutter version 2.0.5 at C:\SDK\flutter
    • Framework revision adc687823a (3 weeks ago), 2021-04-16 09:40:20 -0700
    • Engine revision b09f014e96
    • Dart version 2.12.3

[√] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
    • Android SDK at C:\Users\aschw\AppData\Local\Android\sdk
    • Platform android-30, build-tools 30.0.3
    • Java binary at: C:\Program Files\Android\Android Studio\jre\bin\java
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b01)
    • All Android licenses accepted.

[X] Chrome - develop for the web (Cannot find Chrome executable at .\Google\Chrome\Application\chrome.exe)
    ! Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.

[√] Android Studio (version 4.1.0)
    • Android Studio at C:\Program Files\Android\Android Studio
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b01)

[√] IntelliJ IDEA Community Edition (version 2021.1)
    • IntelliJ at C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2020.3.3
    • Flutter plugin version 55.1.5
    • Dart plugin version 211.7179

[√] VS Code, 64-bit edition (version 1.55.0)
    • VS Code at C:\Program Files\Microsoft VS Code
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
