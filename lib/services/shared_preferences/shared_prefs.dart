import 'dart:convert';
import 'package:ideal_smart_app_demo/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._internal();
  static SharedPrefs instance = SharedPrefs._internal();
  factory SharedPrefs() => instance;

  final _userKey = "current-user";

  Future<bool> saveUser({required UserModel userModel}) async {
    final sharedPrefObject = await SharedPreferences.getInstance();
    await sharedPrefObject.setString(_userKey, jsonEncode(userModel.toJson()));

    return true;
  }

  Future<UserModel?> getUser() async {
    final sharedPrefObject = await SharedPreferences.getInstance();
    String? userModelJson = sharedPrefObject.getString(_userKey);

    if (userModelJson != null) {
      return UserModel.fromJson(map: jsonDecode(userModelJson));
    }

    return null;
  }

  Future<bool> deleteUser() async {
    final sharedPrefObject = await SharedPreferences.getInstance();
    sharedPrefObject.remove(_userKey);

    return true;
  }
}
