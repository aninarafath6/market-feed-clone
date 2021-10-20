import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  late SharedPreferences _prefs;

  Future<void> setUser(uid) async {
     _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('uid', uid);
  }

  Future<String?> getUserId() async {
     _prefs = await SharedPreferences.getInstance();
   return _prefs.getString('uid');
  }
}
