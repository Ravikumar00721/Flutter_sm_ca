enum AppThemeType {
  blue,
  green,
  purple,
}

class ThemeState{
  final bool isDark;
  final AppThemeType themeType;

  ThemeState({
    this.isDark = false,
    this.themeType = AppThemeType.blue,
  });


  ThemeState copyWith({
    bool? isDark,
    AppThemeType? themeType,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      themeType: themeType ?? this.themeType,
    );
  }
}