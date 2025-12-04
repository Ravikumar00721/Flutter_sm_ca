import 'package:f_sm_ca/jwt/login_jwt.dart';
import 'package:f_sm_ca/jwt/signup_jwt.dart';
import 'package:f_sm_ca/riverpod/provider/theme_notifier.dart';
import 'package:f_sm_ca/riverpod/provider/theme_switching_logic.dart';
import 'package:f_sm_ca/riverpod/provider/ui_theme_screen.dart';
import 'package:f_sm_ca/riverpod/statenotifierprovider/stp_screen.dart';
import 'package:f_sm_ca/riverpod/stateprovider/home_sp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(themeState),
      home: const ThemeScreen(),
    );
  }
}
