import 'package:calculator/core/constants/theme/theme_controller.dart';
import 'package:calculator/feature/calculator/controller/calculator_controller.dart';
import 'package:provider/single_child_widget.dart';
import 'package:calculator/core/_core_exports.dart';

class MainProviderList {
  /// This list includes providers that should stand up when the application starts.
  static List<SingleChildWidget> mainProviderlist = [
    ChangeNotifierProvider<ThemeController>(create: (_) => sl<ThemeController>()),
    ChangeNotifierProvider<BaseController>(create: (_) => sl<BaseController>()),
    ChangeNotifierProvider<CalculatorController>(create: (_) => sl<CalculatorController>()),
  ];

  /// This method returns the provider list that should stand up at the beginning of the application.
  static List<SingleChildWidget> getMainProviderList() {
    return mainProviderlist;
  }
}
