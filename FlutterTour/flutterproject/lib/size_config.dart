import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defautSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    defautSize = orientation == Orientation.landscape
        ? screenHeight * (1 / 36)
        : screenWidth * (1 / 36);
  }
}
