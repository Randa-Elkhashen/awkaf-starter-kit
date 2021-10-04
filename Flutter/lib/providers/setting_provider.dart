import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/managers/shared_preferences_controller.dart';

class SettingProvider extends ChangeNotifier{

  resetSettings() async {

    notifyListeners();
  }

  bool loaded = false;

  double _textScaleFactor = 1.0;
  double get textScaleFactor => _textScaleFactor;
  Future<void> setTextScaleFactor(double value) async {
    SharedPreferencesManager.setTextScaleFactor(value);
    _textScaleFactor = value;
    notifyListeners();
  }

  ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;
  Future<void> setThemeMode(ThemeMode value) async {
    SharedPreferencesManager.setThemeMode(value);
    _themeMode = value;
    notifyListeners();
  }

  // call loadSharedPreferences when provider initialise
  SettingProvider(){
    loadSharedPreferences();
  }

  // get app setting
  Future<void> loadSharedPreferences() async {
    await SharedPreferencesManager.initialize();

    _textScaleFactor = SharedPreferencesManager.getTextScaleFactor() ?? 1.0;
    _themeMode = SharedPreferencesManager.getThemeMode();

    loaded = true;
    notifyListeners();
  }

}