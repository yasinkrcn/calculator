import 'package:calculator/core/_core_exports.dart';

enum AppTextStyles {
  equationText,
  resultText,
}

extension AppTextStylesExtension on AppTextStyles {
  TextStyle get getTextStyle {
    switch (this) {
      case AppTextStyles.equationText:
        return TextStyle(
          fontSize: 36.sp,
          height: 1.2,
          letterSpacing: -1.1,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        );
      case AppTextStyles.resultText:
        return TextStyle(
          fontSize: 56.sp,
          height: 1.2,
          fontWeight: FontWeight.w500,
        );
    }
  }
}
