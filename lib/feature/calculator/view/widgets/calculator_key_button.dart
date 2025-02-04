import 'package:calculator/feature/calculator/model/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalculatorKeyButton extends StatelessWidget {
  final CalculatorModel button;
  final VoidCallback onPressed;

  const CalculatorKeyButton({
    super.key,
    required this.button,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: isDarkMode ? button.darkModeColor : button.lightModeColor,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        child: Center(
          child: SvgPicture.asset(
            button.icon,
            color: isDarkMode
                ? button.isOperator
                    ? Colors.white
                    : Colors.white
                : button.isOperator
                    ? Colors.white
                    : Colors.black,
          ),
        ),
      ),
    );
  }
}
