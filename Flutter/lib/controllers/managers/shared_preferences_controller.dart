import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/constants/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager{

  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // theme mode

  static ThemeMode? getThemeMode(){
    if(_prefs.containsKey(AppSettings.themeMode)){
      return ThemeMode.values[_prefs.getInt(AppSettings.themeMode)??0];
    }
  }

  static setThemeMode(ThemeMode value){
    _prefs.setInt(AppSettings.themeMode, value.index);
  }

  // text scale factor

  static double? getTextScaleFactor(){
    if(_prefs.containsKey(AppSettings.textScaleFactor)){
      return _prefs.getDouble(AppSettings.textScaleFactor);
    }
  }

  static setTextScaleFactor(double value){
    _prefs.setDouble(AppSettings.textScaleFactor, value);
  }
}