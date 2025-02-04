import 'package:calculator/core/_core_exports.dart';
import 'package:calculator/feature/calculator/view/widgets/calculator_display.dart';
import 'package:calculator/feature/calculator/view/widgets/calculator_key_button.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CalculatorViewModel>(
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

  Widget _buildDisplay(BuildContext context, CalculatorViewModel calculator) {
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

  Widget _buildKeypad(CalculatorViewModel calculator) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0).copyWith(top: 0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: CalculatorModel.calculatorButtons.length,
      itemBuilder: (context, index) {
        final button = CalculatorModel.calculatorButtons[index];
        return CalculatorKeyButton(
          button: button,
          onPressed: () => calculator.handleButtonPress(button.value),
        );
      },
    );
  }
}
