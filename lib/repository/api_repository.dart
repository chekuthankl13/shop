import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/config/config.dart';
import 'package:task/models/products/all_product_model.dart';
import 'package:task/models/products/single_product_model.dart';

class ApiRepository {
  var client = http.Client();
  getAll() async {
    try {
      var res = await client.get(
        Uri.parse(Config.allPdt),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);

        return {"status": "ok", "data": AllProductModel.fromJson(body)};
      } else {
        return {"status": "failed", "message": "!200"};
      }
    } catch (e) {
      return {"status": "failed", "message": "some server error occured"};
    }
  }

/////// single pdt

  singlePdt({required id}) async {
    try {
      var res = await client.get(
        Uri.parse(Config.pdt + id),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);

        return {"status": "ok", "data": SIngleProducts.fromJson(body)};
      } else {
        return {"status": "failed", "message": "!200"};
      }
    } catch (e) {
      return {"status": "failed", "message": "some server error occured"};
    }
  }
}
