import 'package:calculator/core/constants/theme/theme_controller.dart';
import 'package:calculator/core/init/injection_container.dart';
import 'package:calculator/core/utils/base_controller.dart';
import 'package:calculator/feature/calculator/view_model/calculator_view_model.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static final List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<BaseViewModel>(create: (_) => sl<BaseViewModel>()),
    ChangeNotifierProvider<ThemeViewModel>(create: (_) => sl<ThemeViewModel>()),
    ChangeNotifierProvider<CalculatorViewModel>(create: (_) => sl<CalculatorViewModel>()),
  ];
}
