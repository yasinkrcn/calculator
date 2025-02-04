import 'dart:math';
import 'package:calculator/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._init();
  ScreenSize._init();

  factory ScreenSize() {
    return _instance;
  }

  factory ScreenSize.init() {
    final window = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single);
    double screenWidth = window.size.width;
    double screenHeight = window.size.height;
    _instance.screenSize = Size(screenWidth, screenHeight);
    _instance.bottomPadding = window.padding.bottom;
    _instance.topPadding = window.padding.top;

    return _instance;
  }

  late Size screenSize;
  late double topPadding;
  late double bottomPadding;

  double getHeightPercent(double percent) {
    return screenSize.height * percent;
  }

  double getWidthPercent(double percent) {
    return screenSize.width * percent;
  }

  double getHeight(num heightNum) {
    double height = (screenSize.height * heightNum) / AppConstants.designDeviceSize.height;
    return height;
  }

  double getWidth(num widthNum) {
    double width = (screenSize.width * widthNum) / AppConstants.designDeviceSize.width;
    return width;
  }

  double getRadius(num radius) {
    double scaledRadius = (screenSize.width * radius) / AppConstants.designDeviceSize.width;
    return scaledRadius;
  }

  double getFontSize(num fontSize) {
    double scaledFontSize = fontSize * _scaleText;
    return scaledFontSize;
  }

  double get _scaleText => min(_scaleWidth, _scaleHeight);

  double get _scaleWidth => screenSize.width / AppConstants.designDeviceSize.width;

  double get _scaleHeight => screenSize.height / AppConstants.designDeviceSize.height;
}
