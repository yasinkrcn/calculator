import 'package:calculator/core/_core_exports.dart';

import 'package:calculator/core/init/injection_container.dart' as locator;
import 'package:calculator/core/constants/theme/app_theme.dart';
import 'package:calculator/core/utils/main_provider_list.dart';
import 'package:calculator/feature/calculator/view/page/calculator_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await locator.init();
  runApp(
    MultiProvider(
      providers: MainProviderList.getMainProviderList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants().appName,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeController>(context).themeData,
      navigatorKey: GlobalContextKey.instance.globalKey,
      home: CalculatorPage(),
    );
  }
}
