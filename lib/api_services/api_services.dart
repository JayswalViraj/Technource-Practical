import 'package:flutter/cupertino.dart';
import 'package:tech/models/login_api_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  LoginApiModel? loginApiModel;

  static Future<LoginApiModel?> callLoginApi() async {
    var client = http.Client();
    var uri = Uri.parse("https://myjson.dit.upm.es/api/bins/gbt5");

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return loginApiModelFromJson(json);
    } else {
      debugPrint("Api Code not +==200");
    }
  }
}
