import 'package:flutter/material.dart';

class AppSettingsState {
  final ThemeData themeData;
  final bool isDarkMode;

  AppSettingsState({required this.themeData, required this.isDarkMode});

  AppSettingsState copyWith({ThemeData? themeData, bool? isDarkMode}) {
    return AppSettingsState(
      themeData: themeData ?? this.themeData,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
