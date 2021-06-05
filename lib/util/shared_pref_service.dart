import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKeys {
  SharedPrefKeys._();

  //User Prefs
  static const onBoardingSeenBefore = 'onboardingscreen';
  static const mainAccountName = 'mainAccountName';
  static const mainAccountPlatform = 'mainAccountPlatform';
}

class SharedPreferencesService {
  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  SharedPreferencesService._internal();

  static Future<SharedPreferencesService> get instance async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<void> setOnBoardingSeenBefore(bool onBoardingSeenBefore) async =>
      await _preferences.setBool(
          SharedPrefKeys.onBoardingSeenBefore, onBoardingSeenBefore);

  Future<void> setMainAccountName(String mainAccountName) async =>
      await _preferences.setString(
          SharedPrefKeys.mainAccountName, mainAccountName);

  Future<void> setMainAccountPlatform(String mainAccountPlatform) async =>
      await _preferences.setString(
          SharedPrefKeys.mainAccountPlatform, mainAccountPlatform);

  bool get getOnBoardingSeenBefore =>
      _preferences.getBool(SharedPrefKeys.onBoardingSeenBefore);

  String get getMainAccountName =>
      _preferences.getString(SharedPrefKeys.mainAccountName);

  String get getMainAccountPlatform =>
      _preferences.getString(SharedPrefKeys.mainAccountPlatform);
}
