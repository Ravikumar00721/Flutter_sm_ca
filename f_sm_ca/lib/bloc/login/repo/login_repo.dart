import 'dart:convert';

import 'package:f_sm_ca/bloc/login/model/login_req_model.dart';
import 'package:f_sm_ca/bloc/login/model/login_response_model.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  Future<LoginResModel> login(String username, String password) async {
    var url = "https://dummyjson.com/auth/login";

    print("🔹 API URL: $url");
    print("🔹 Username: $username");
    print("🔹 Password: $password");

    LoginReqModel loginReqModel = LoginReqModel(
      username: username,
      password: password,
    );

    print("🔹 Request Body: ${loginReqModel.toJson()}");

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json", // ✅ Important for DummyJSON
      },
      body: jsonEncode(loginReqModel.toJson()),
    );

    print("🔹 Status Code: ${response.statusCode}");
    print("🔹 Raw Response Body: ${response.body}");

    try {
      if (response.statusCode == 200) {
        var respbody = jsonDecode(response.body);

        print("✅ Decoded Response: $respbody");

        return LoginResModel.fromJson(respbody);
      } else {
        print("❌ API Error: ${response.body}");
        return LoginResModel();
      }
    } catch (e) {
      print("🔥 Exception Caught: $e");
      throw Exception("Something went wrong");
    }
  }
}
