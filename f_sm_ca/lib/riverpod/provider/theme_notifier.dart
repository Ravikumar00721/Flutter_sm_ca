import 'package:f_sm_ca/riverpod/provider/theme_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeState>{
  ThemeNotifier():super(ThemeState());

  void toogleState(){
    state=state.copyWith(isDark: !state.isDark);
  }

  void changeTheme(AppThemeType type)
  {
    state=state.copyWith(themeType: type);
  }
}

final themeProvider =
StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});

