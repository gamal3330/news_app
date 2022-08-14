import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setValue(
      {required bool isDark, required String key}) async {
    return await sharedPreferences.setBool(key, isDark);
  }

  static bool? getValue({required String key}) {
    return sharedPreferences.getBool(key);
  }

  

  
}
