import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs{
  SharedPreferences? prefs;

  Future<void>initPrefs() async {
    prefs=await SharedPreferences.getInstance();
  }

  void setToken(String token) async {
    await initPrefs();
    prefs!.setString('token', token);
  }
  Future<String> getToken() async {
    await initPrefs();
    return prefs!.getString('token')??'';
  }
}