import 'package:calculator/core/_core_exports.dart';

class ThemeSelectorWidget extends StatelessWidget {
  const ThemeSelectorWidget({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => sl<ThemeController>().toggleTheme(),
      child: Container(
        alignment: Alignment.center,
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: isDark ? AppColors.lightBlack : AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SvgPicture.asset(
          isDark ? AssetPaths().darkMode : AssetPaths().lightMode,
        ),
      ),
    );
  }
}
