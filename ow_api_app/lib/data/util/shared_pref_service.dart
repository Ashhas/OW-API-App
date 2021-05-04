import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKeys {
  SharedPrefKeys._();

  //User Prefs
  static const onBoardingSeenBefore = 'onboardingscreen';
  static const mainAccount = 'mainAccount';
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

  Future<void> setMainAccount(String mainAccount) async =>
      await _preferences.setString(SharedPrefKeys.mainAccount, mainAccount);

  bool get getOnBoardingSeenBefore =>
      _preferences.getBool(SharedPrefKeys.onBoardingSeenBefore);

  String get getMainAccount =>
      _preferences.getString(SharedPrefKeys.mainAccount);
}
