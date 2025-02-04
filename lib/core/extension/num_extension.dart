import 'package:calculator/core/utils/screen_size.dart';

extension NumExtension on num {
  double get h => ScreenSize().getHeight(this);

  double get w => ScreenSize().getWidth(this);

  double get sp => ScreenSize().getFontSize(this);

  double get r => ScreenSize().getRadius(this);
}

extension NumNullableExtension on num? {
  bool get isNotNull => this != null;

  num get getValueOrDefault => this ?? 0;
}
