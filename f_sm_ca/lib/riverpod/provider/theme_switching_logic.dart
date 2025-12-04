import 'package:f_sm_ca/riverpod/provider/theme_state.dart';
import 'package:flutter/material.dart';

import 'model.dart';

ThemeData getAppTheme(ThemeState state) {
  switch (state.themeType) {
    case AppThemeType.blue:
      return state.isDark ? BlueTheme.dark : BlueTheme.light;
    case AppThemeType.green:
      return state.isDark ? GreenTheme.dark : GreenTheme.light;
    case AppThemeType.purple:
      return state.isDark ? PurpleTheme.dark : PurpleTheme.light;

  }
}
