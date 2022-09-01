import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static stringSave({String? key, String? value}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(key.toString(), value.toString());
  }

  static stringGet({String? key}) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key.toString());
  }
}
