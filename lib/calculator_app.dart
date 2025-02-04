import 'package:calculator/core/constants/app_constants.dart';
import 'package:calculator/core/constants/theme/theme_controller.dart';
import 'package:calculator/core/keys/global_key.dart';
import 'package:calculator/feature/calculator/view/page/calculator_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(
      builder: (context, controller, _) {
        return MaterialApp(
          title: AppConstants().appName,
          debugShowCheckedModeBanner: kDebugMode,
          theme: controller.theme,
          navigatorKey: GlobalContextKey.instance.globalKey,
          home: CalculatorPage(),
        );
      },
    );
  }
}
