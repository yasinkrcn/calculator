import 'package:calculator/calculator_app.dart';
import 'package:calculator/core/_core_exports.dart';
import 'package:calculator/core/init/providers.dart';
import 'package:calculator/core/init/startup_manager.dart';

void main() async {
  await StartupManager.initialize();

  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: const CalculatorApp(),
    ),
  );
}
