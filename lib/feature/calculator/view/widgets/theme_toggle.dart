import 'package:calculator/core/constants/asset_paths.dart';
import 'package:calculator/core/constants/theme/app_colors.dart';
import 'package:calculator/core/constants/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(
      builder: (context, themeController, _) {
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: themeController.toggleTheme,
          child: Container(
            alignment: Alignment.center,
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: themeController.isDarkTheme ? AppColors.lightBlack : AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SvgPicture.asset(
              themeController.isDarkTheme ? AssetPaths().darkMode : AssetPaths().lightMode,
              color: !themeController.isDarkTheme ? AppColors.purple : AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
