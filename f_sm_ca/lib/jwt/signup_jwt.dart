import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login_jwt.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  Future<void> signupUser() async {
    final response = await http.post(
      Uri.parse("https://reqres.in/api/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailCtrl.text,
        "password": passwordCtrl.text,
      }),
    );

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(jsonDecode(response.body)["error"])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordCtrl, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: signupUser, child: Text("Signup")),
          ],
        ),
      ),
    );
  }
}
