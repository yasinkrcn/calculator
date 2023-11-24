import 'package:calculator/core/_core_exports.dart';
import 'package:calculator/core/constants/theme/app_theme.dart';
import 'package:calculator/feature/calculator/controller/calculator_controller.dart';

class ThemeController with ChangeNotifier {
  void refreshView() => notifyListeners();

  ThemeData _themeData = AppTheme.darkTheme;

  bool isDarkTheme = true;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    refreshView();
  }

  toggleTheme() {
    if (_themeData == AppTheme.lightTheme) {
      isDarkTheme = true;
      themeData = AppTheme.darkTheme;
    } else {
      isDarkTheme = false;
      themeData = AppTheme.lightTheme;
    }
  }

  // toggleTheme(bool isDark) {
  //   themeData = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  //   refreshView();
  // }
}
