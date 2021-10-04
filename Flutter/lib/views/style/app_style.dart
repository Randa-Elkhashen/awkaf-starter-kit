import 'package:flutter/material.dart';
class AppStyle {
  AppStyle._();

  static MediaQueryData? mediaQueryData;

  static late double _scaleFactor;

  static double get scaleFactor => _scaleFactor;

  static Size get size => mediaQueryData!.size;

  /// call when app initialized to save MediaQueryData and set [scaleFactor]
  static setMedia(MediaQueryData media){

    _scaleFactor = media.size.shortestSide/(360) > 1.5
        ? 1.5 : media.size.shortestSide/(360);

    mediaQueryData = media.copyWith(
      textScaleFactor: media.textScaleFactor * scaleFactor
    );

  }

}