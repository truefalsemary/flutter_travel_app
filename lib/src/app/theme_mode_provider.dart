import 'package:flutter/material.dart';

class ThemeModeProvider extends ValueNotifier<ThemeMode> {
  ThemeModeProvider() : super(ThemeMode.system);

  void toggleTheme() {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  void setTheme(ThemeMode mode) => value = mode;
}
