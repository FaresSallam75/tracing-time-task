import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracing_time/business_logic/state/theme_state.dart';
import 'package:tracing_time/constants/theme.dart';
import 'package:tracing_time/main.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit()
    : super(AppSettingsState(themeData: themeLight, isDarkMode: false)) {
    _initSettings();
  }

  /// Initialize settings from local storage
  Future<void> _initSettings() async {
    final isDark = myBox!.get("isDark") ?? false;
    final theme = isDark ? themeDark : themeLight;
    emit(state.copyWith(themeData: theme, isDarkMode: isDark));
  }

  /// Toggle between light and dark themes
  Future<void> changeThemeMode() async {
    final newDarkMode = !state.isDarkMode;
    await myBox!.put("isDark", newDarkMode);
    final theme = newDarkMode ? themeDark : themeLight;
    emit(state.copyWith(isDarkMode: newDarkMode, themeData: theme));
  }
}
