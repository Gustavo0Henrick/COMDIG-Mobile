import 'dart:developer';

import 'package:comdig/src/shared/storages/storage_manager.dart';
import 'package:comdig/src/themes/theme_keys.dart';
import 'package:flutter/material.dart';

class AppThemeModeProvider extends ChangeNotifier {
  static ValueNotifier<ThemeMode> themeMode =
      ValueNotifier<ThemeMode>(ThemeMode.light);

  ValueNotifier<ThemeMode> get getThemeMode => themeMode;

  themeNotifier() {
    StorageManager().readData(ThemeKeys.themeMode).then((value) {
      var theme = value ?? ThemeKeys.light;
      if (theme == ThemeKeys.light) {
        themeMode.value = ThemeMode.light;
      } else {
        themeMode.value = ThemeMode.dark;
      }
      notifyListeners();
    });
  }

  void setDarkMode() {
    themeMode.value = ThemeMode.dark;
    StorageManager().saveData(ThemeKeys.themeMode, ThemeKeys.dark);
    log(themeMode.value.toString());
    notifyListeners();
  }

  void setLightMode() {
    themeMode.value = ThemeMode.light;
    StorageManager().saveData(ThemeKeys.themeMode, ThemeKeys.light);
    log(themeMode.value.toString());
    notifyListeners();
  }
}
