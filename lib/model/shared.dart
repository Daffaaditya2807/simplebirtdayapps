import 'package:shared_preferences/shared_preferences.dart';

class Sharedd {
  static Future<void> saveStringToSharedPreferences(
      String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // Mengambil nilai String dari SharedPreferences
  static Future<String?> getStringFromSharedPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
