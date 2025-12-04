import 'package:f_sm_ca/jwt/login_jwt.dart';
import 'package:f_sm_ca/jwt/signup_jwt.dart';
import 'package:f_sm_ca/riverpod/statenotifierprovider/stp_screen.dart';
import 'package:f_sm_ca/riverpod/stateprovider/home_sp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()
{
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostScreen(),
    ),
  ));
}