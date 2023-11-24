import 'package:calculator/core/_core_exports.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = sl<ThemeController>().isDarkTheme;
    return Scaffold(
      body: Consumer<CalculatorController>(
        builder: (context, controller, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: ScreenSize().topMargin,
                ),
                ThemeSelectorWidget(isDark: isDark),
                const Spacer(),
                Text(
                  controller.equation,
                  style: AppTextStyles.equationText.getTextStyle,
                ),
                Text(
                  controller.result,
                  style: AppTextStyles.resultText.getTextStyle,
                ),
                const Spacer(),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.calculatorItemList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.w,
                  ),
                  itemBuilder: (context, index) {
                    CalculatorItem item = controller.calculatorItemList[index];
                    return InkWell(
                      onTap: () => controller.calculate(item.value!),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: isDark ? item.darkColor : item.lightColor, borderRadius: BorderRadius.circular(24)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            item.asset,
                            // ignore: deprecated_member_use
                            color: isDark ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: ScreenSize().bottomMargin,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
