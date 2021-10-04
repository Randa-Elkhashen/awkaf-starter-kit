import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/view_helpers/app_colors.dart';

class Themes{

  static ThemeData lightTheme = ThemeData(
    fontFamily: "almarai",
    primaryColor: AppColors.orange,
    colorScheme: ColorScheme.light(
      primary: AppColors.orange,
      primaryVariant: AppColors.deepOrange,
      secondary: AppColors.grey,
      onSecondary: AppColors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    //fontFamily: "almarai",
    primaryColor: AppColors.orange,
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      textTheme: CupertinoTextThemeData(
          textStyle: ThemeData(brightness: Brightness.dark).textTheme.subtitle2
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.orange,
      onPrimary: AppColors.white,
      primaryVariant: AppColors.deepOrange,
      secondary: AppColors.grey,
      onSecondary: AppColors.white,
    ),
  );

}