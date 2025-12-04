import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider=StateProvider<int>((ref)=>0);

final colorProvider=StateProvider<bool>((ref)=>false);

final textSizeProvider=StateProvider<double>((ref)=>20.0);
