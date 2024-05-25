import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData(String key, String value) async {
    await _preferences.setString(key, value);
  }
}
