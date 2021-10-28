import 'package:flutter/widgets.dart';

class AppDimensions {
  static double? width;
  static double? height;

  AppDimensions(context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  static double convertToH(double value) {
    return (value / 760) * height!; // 760 device height used in design
  }

  static double convertToW(double value) {
    return (value / 360) * width!; // 360 device width used in design
  }

  static double getFullHeight() {
    return height!;
  }

  static double getFullWidth() {
    return width!;
  }
}
