import 'package:flutter/material.dart';
class AppStyle {
  AppStyle._();

  static MediaQueryData? mediaQueryData;

  static late double scaleFactor;

  static Size get size => mediaQueryData!.size;

  static setMedia(MediaQueryData media){

    scaleFactor = media.size.shortestSide/(360) > 1.5
        ? 1.5 : media.size.shortestSide/(360);

    mediaQueryData = media.copyWith(
      textScaleFactor: media.textScaleFactor * scaleFactor
    );

  }



}