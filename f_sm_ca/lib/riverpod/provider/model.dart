import 'package:flutter/material.dart';

class BlueTheme{
  static final ThemeData light= ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
    floatingActionButtonTheme:
    const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
  );
}

class GreenTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
  );
}

class PurpleTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.purple,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.purple),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purple,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.purple),
  );
}
