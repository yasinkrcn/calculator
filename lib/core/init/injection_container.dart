import 'package:calculator/core/constants/theme/theme_controller.dart';
import 'package:calculator/feature/calculator/controller/calculator_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:calculator/core/_core_exports.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<ThemeController>(() => ThemeController());
  sl.registerLazySingleton<BaseController>(() => BaseController());
  sl.registerLazySingleton<CalculatorController>(() => CalculatorController());
}
