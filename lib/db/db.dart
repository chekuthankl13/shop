import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

setUser({username, email, gender, img, id, token}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('username', username);
  await prefs.setString('email', email);
  // await prefs.setString('psw', psw);
  await prefs.setString('img', img);
  await prefs.setString('id', id);
  await prefs.setString('token', token);

  await prefs.setString('gender', gender);

  log("inserted to db");
}

Future<Map> getUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var name = prefs.getString("username");
  var email = prefs.getString("email");
  var img = prefs.getString("img");
  var gender = prefs.getString("gender");
  // var psw = prefs.getString("psw");
  var id = prefs.getString("id");
  var token = prefs.getString("token");

  return {
    "user": name,
    // "psw": psw,
    "img": img,
    "gender": gender,
    "email": email,
    "id": id,
    "token": token
  };
}

Future<bool> checkIuser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return !prefs.containsKey('username') || prefs.getString('username')!.isEmpty;
}
