import 'package:calculator/core/_core_exports.dart';
import 'package:calculator/core/constants/theme/app_theme.dart';
import 'package:calculator/feature/calculator/data/model/calculator_item.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends BaseController {
  String equation = "0";
  String result = "0";
  String expression = "";

  calculate(String buttonText) {
    if (buttonText == "C") {
      equation = "0";
      result = "0";
    } else if (buttonText == "Del") {
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
    } else if (buttonText == "=") {
      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');
      // expression = expression.replaceAll('.', ',');

      try {
        print(expression);
        Parser p = Parser();
        Expression exp = p.parse(expression);

        print(exp);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        //TODO: custom messenger ile uyarı verilebilir "Geçersiz biçim kullanıldı"
        result = "Error";
      }
    } else {
      if (equation == "0") {
        equation = buttonText;
      } else {
        equation = equation + buttonText;
      }
    }

    refreshView();
  }

  bool isDark = true;

  List<CalculatorItem> calculatorItemList = [
    //! Row One
    CalculatorItem(
        asset: AssetPaths().clear, darkColor: AppColors.darkGrey, lightColor: AppColors.lightGrey, value: "C"),
    CalculatorItem(asset: AssetPaths().unknow, darkColor: AppColors.darkGrey, lightColor: AppColors.lightGrey),
    CalculatorItem(
        asset: AssetPaths().percent, darkColor: AppColors.darkGrey, lightColor: AppColors.lightGrey, value: "%"),
    CalculatorItem(asset: AssetPaths().divide, darkColor: AppColors.purple, lightColor: AppColors.purple, value: "÷"),
    //! Row Two
    CalculatorItem(asset: AssetPaths().seven, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "7"),
    CalculatorItem(asset: AssetPaths().eight, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "8"),
    CalculatorItem(asset: AssetPaths().nine, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "9"),
    CalculatorItem(asset: AssetPaths().multiply, darkColor: AppColors.purple, lightColor: AppColors.purple, value: "×"),
    //! Row Three
    CalculatorItem(asset: AssetPaths().four, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "4"),
    CalculatorItem(asset: AssetPaths().five, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "5"),
    CalculatorItem(asset: AssetPaths().six, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "6"),
    CalculatorItem(asset: AssetPaths().minus, darkColor: AppColors.purple, lightColor: AppColors.purple, value: "-"),
    //! Row Four
    CalculatorItem(asset: AssetPaths().one, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "1"),
    CalculatorItem(asset: AssetPaths().two, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "2"),
    CalculatorItem(asset: AssetPaths().three, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "3"),
    CalculatorItem(asset: AssetPaths().plus, darkColor: AppColors.purple, lightColor: AppColors.purple, value: "+"),
    //! Row Five
    CalculatorItem(asset: AssetPaths().dot, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "."),
    CalculatorItem(asset: AssetPaths().zero, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "0"),
    CalculatorItem(
        asset: AssetPaths().delete, darkColor: AppColors.lightBlack, lightColor: AppColors.white, value: "Del"),
    CalculatorItem(asset: AssetPaths().equal, darkColor: Colors.green, lightColor: AppColors.purple, value: "="),
  ];
}
