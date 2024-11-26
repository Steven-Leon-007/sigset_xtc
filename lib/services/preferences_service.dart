import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static Future<void> saveUserType(String type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_type', type);
  }

  static Future<String> getUserType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_type') ?? "";
  }
}
