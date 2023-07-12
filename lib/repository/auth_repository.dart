import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/models/auth/auth_model.dart';

import '../config/config.dart';

class AuthREpository {
  var client = http.Client();
  login({required name, required password}) async {
    try {
      //'username="kminchelle"' \
// --form 'password="0lelplR"'
      Map params = {"username": name, "password": password};
      var res = await client.post(Uri.parse(Config.authUrl),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: params);
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        if (body['message'] == null) {
          return {"status": "ok", "data": AuthModel.fromJson(body)};
        } else {
          return {"status": "failed", "message": body['message']};
        }
      } else {
        return {
          "status": "failed",
          "message": res.statusCode.toString() +
              jsonDecode(res.body)['message'].toString()
        };
      }
    } catch (e) {
      return {"status": "failed", "message": "some server error occured"};
    }
  }
}
