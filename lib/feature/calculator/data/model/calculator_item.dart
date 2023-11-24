import 'package:calculator/core/_core_exports.dart';

class CalculatorItem {
  final String asset;
  String? value;
  Color darkColor;
  Color lightColor;

  CalculatorItem({
    required this.asset,
    this.value,
    required this.darkColor,
    required this.lightColor,
  });
}
