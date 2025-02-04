import 'package:get_it/get_it.dart';
import 'package:calculator/core/_core_exports.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<BaseViewModel>(() => BaseViewModel());
  sl.registerLazySingleton<ThemeViewModel>(() => ThemeViewModel());
  sl.registerLazySingleton<CalculatorViewModel>(() => CalculatorViewModel());
}
