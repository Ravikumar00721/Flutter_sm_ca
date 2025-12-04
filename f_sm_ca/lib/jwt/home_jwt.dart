import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_jwt.dart';

class HomeScreen extends StatelessWidget {
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          )
        ],
      ),
      body: Center(child: Text("Welcome!")),
    );
  }
}
