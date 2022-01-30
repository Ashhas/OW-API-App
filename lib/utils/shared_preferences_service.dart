import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences? _sharedPreferences;

  factory SharedPreferencesService() => SharedPreferencesService._internal();

  SharedPreferencesService._internal();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static const isOnboardedKey = 'is_onboarded';
  static const mainAccountNameKey = 'main_account_name';
  static const mainAccountPlatformKey = 'main_account_platform';
  static const isDarkModeKey = 'dark_mode';

  Future<void> clear() async => await _sharedPreferences?.clear();

  // Onboarding
  bool get isOnboarded =>
      _sharedPreferences?.getBool(
        isOnboardedKey,
      ) ??
      false;

  set setIsOnboarded(bool isOnboarded) => _sharedPreferences?.setBool(
        isOnboardedKey,
        isOnboarded,
      );

  // Main Account Name
  String get getMainAccountName =>
      _sharedPreferences?.getString(
        mainAccountNameKey,
      ) ??
      '';

  set setMainAccountName(String mainAccountName) =>
      _sharedPreferences?.setString(
        mainAccountNameKey,
        mainAccountName,
      );

  // Main Account Platform
  String get getMainAccountPlatform =>
      _sharedPreferences?.getString(
        mainAccountPlatformKey,
      ) ??
      '';

  set setMainAccountPlatform(String platform) =>
      _sharedPreferences?.setString(mainAccountPlatformKey, platform);

  // Themes
  bool get getThemeDarkMode =>
      _sharedPreferences?.getBool(
        isDarkModeKey,
      ) ??
      false;

  set setThemeDarkMode(bool isDarkMode) => _sharedPreferences?.setBool(
        isDarkModeKey,
        isDarkMode,
      );
}
