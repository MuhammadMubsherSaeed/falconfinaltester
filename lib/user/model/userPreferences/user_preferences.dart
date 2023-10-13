import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import '../user.dart';

class RememberUserPrefs {
  static Future<void> saveRememberUser(User userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.tojson());
    await preferences.setString("currentUser", userJsonData);
  }

  static Future<User?> getRememberUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userJsonData = preferences.getString("currentUser");
    if (userJsonData != null) {
      Map<String, dynamic> userData1 = jsonDecode(userJsonData);
      User users = User.fromjson(userData1);
      return users;
    }
    return null;
  }
}
