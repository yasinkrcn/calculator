import 'package:calculator/core/_core_exports.dart';
import 'package:calculator/feature/calculator/view/widgets/calculator_display.dart';

class CalculatorKeyButton extends StatelessWidget {
  final CalculatorButton button;
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

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CalculatorController>(
          builder: (context, calculator, _) {
            return Column(
              children: [
                const ThemeToggle(),
                const SizedBox(height: 8),
                _buildDisplay(context, calculator),
                const SizedBox(height: 16),
                _buildKeypad(calculator),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDisplay(BuildContext context, CalculatorController calculator) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CalculatorDisplay(
          equation: calculator.equation,
          result: calculator.result,
        ),
      ),
    );
  }

  Widget _buildKeypad(CalculatorController calculator) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0).copyWith(top: 0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: CalculatorButton.calculatorButtons.length,
      itemBuilder: (context, index) {
        final button = CalculatorButton.calculatorButtons[index];
        return CalculatorKeyButton(
          button: button,
          onPressed: () => calculator.handleButtonPress(button.value),
        );
      },
    );
  }
}
