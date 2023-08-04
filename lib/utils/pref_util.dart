import 'package:shared_preferences/shared_preferences.dart';

const String keyCurrentLanguage = 'CurrentLanguage';
const String keyFCMToken = 'FCMToken';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString({required String key}) {
    return _prefsInstance!.getString(key) ?? "";
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static int getInt({required String key}) {
    return _prefsInstance!.getInt(key) ?? 0;
  }

  static Future<bool> setInt(
      {required String key, required int value}) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static bool getBool({required String key}) {
    return _prefsInstance!.getBool(key) ?? false;
  }

  static Future<bool> setBool(
      {required String key, required bool value}) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static String getLanguage() {
    return _prefsInstance!.getString(keyCurrentLanguage) ?? "E";
  }

  static Future<bool> setLanguage({required String value}) async {
    var prefs = await _instance;
    return prefs.setString(keyCurrentLanguage, value);
  }

  static void clearSharedPreferences() async {
    var prefs = await _instance;
    await prefs.clear();
  }

  static void removeKey(key) async {
    var prefs = await _instance;
    await prefs.remove(key);
  }
}

