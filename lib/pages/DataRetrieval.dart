import 'package:shared_preferences/shared_preferences.dart';

class DataRetrieval {
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getData(String key) {
    return _preferences.getString(key);
  }
}
