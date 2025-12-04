import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home_jwt.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  Future<void> loginUser() async {
    final response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailCtrl.text,
        "password": passwordCtrl.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", data["token"]);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${jsonDecode(response.body)["error"]}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordCtrl, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: loginUser, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
