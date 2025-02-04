import 'package:calculator/core/_core_exports.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorViewModel extends BaseViewModel {
  /// Current equation displayed on calculator
  /// Hesap makinesinde görüntülenen mevcut denklem
  String _equation = '0';

  /// Current result of calculation
  /// Hesaplamanın mevcut sonucu
  String _result = '0';

  /// Flag to track if a new calculation is starting
  /// Yeni bir hesaplamanın başlayıp başlamadığını takip eden bayrak
  bool _isNewCalculation = true;

  /// Flag to track if last calculation resulted in an error
  /// Son hesaplamanın hatayla sonuçlanıp sonuçlanmadığını takip eden bayrak
  bool _hasError = false;

  /// Maximum number of decimal places to show in results
  /// Sonuçlarda gösterilecek maksimum ondalık basamak sayısı
  static const int maxDecimalPlaces = 8;

  // Public getters
  String get equation => _equation;
  String get result => _result;

  /// Handles all calculator button presses and manages state transitions
  /// Tüm hesap makinesi düğme basışlarını işler ve durum geçişlerini yönetir
  void handleButtonPress(String buttonText) {
    if (_hasError && buttonText != 'C') {
      _clearCalculator();
      _hasError = false;
    }

    switch (buttonText) {
      case 'C':
        _clearCalculator();
        break;

      case 'Del':
        _handleDelete();
        break;

      case '=':
        if (!_isLastCharOperator()) {
          _calculateResult();
          _isNewCalculation = true;
        }
        break;

      case '%':
        _handlePercent();
        break;

      case '.':
        _handleDecimalPoint();
        break;

      default:
        if (_isOperator(buttonText)) {
          _handleOperator(buttonText);
        } else {
          _handleNumber(buttonText);
        }
    }

    notifyListeners();
  }

  /// Handles numeric input (0-9)
  /// Sayısal girişi işler (0-9)
  void _handleNumber(String number) {
    if (_isNewCalculation) {
      _equation = number;
      _isNewCalculation = false;
    } else if (_equation == '0') {
      _equation = number;
    } else {
      _equation += number;
    }
  }

  /// Handles operator input (+, -, ×, ÷)
  /// Operatör girişini işler (+, -, ×, ÷)
  void _handleOperator(String operator) {
    if (_isNewCalculation && _result != 'Error') {
      _equation = _result + operator;
      _isNewCalculation = false;
    } else if (_isLastCharOperator()) {
      _equation = _equation.substring(0, _equation.length - 1) + operator;
    } else if (_equation != '0') {
      _equation += operator;
    }
  }

  /// Handles percentage calculations with different scenarios
  /// Farklı senaryolarla yüzde hesaplamalarını işler
  void _handlePercent() {
    try {
      if (_isLastCharOperator()) return;

      final parts = _equation.split(RegExp(r'[+\-×÷]'));
      final lastNumber = double.parse(parts.last);

      // Handle direct percentage
      if (parts.length == 1) {
        _result = (lastNumber / 100).toString();
        _equation = _result;
        return;
      }

      // Find last operator and calculate
      String? lastOperator;
      for (int i = _equation.length - 1; i >= 0; i--) {
        if (_isOperator(_equation[i])) {
          lastOperator = _equation[i];
          break;
        }
      }

      if (lastOperator == null) return;

      final baseEquation = _equation.substring(0, _equation.lastIndexOf(lastOperator));
      final baseResult = _calculatePartialResult(baseEquation);

      switch (lastOperator) {
        case '+':
          _result = (baseResult + (baseResult * lastNumber / 100)).toString();
          break;
        case '-':
          _result = (baseResult - (baseResult * lastNumber / 100)).toString();
          break;
        case '×':
          _result = (baseResult * (lastNumber / 100)).toString();
          break;
        case '÷':
          if (lastNumber == 0) {
            _handleError();
            return;
          }
          _result = (baseResult / (lastNumber / 100)).toString();
          break;
      }

      _equation = _result;
      _isNewCalculation = true;
    } catch (e) {
      _handleError();
    }
  }

  /// Handles decimal point input
  /// Ondalık nokta girişini işler
  void _handleDecimalPoint() {
    if (_isNewCalculation) {
      _equation = '0.';
      _isNewCalculation = false;
      return;
    }

    final parts = _equation.split(RegExp(r'[+\-×÷]'));
    final lastNumber = parts.last;

    if (!lastNumber.contains('.')) {
      if (_isLastCharOperator()) {
        _equation += '0.';
      } else {
        _equation += '.';
      }
    }
  }

  /// Handles deletion of characters
  /// Karakterlerin silinmesini işler
  void _handleDelete() {
    if (_hasError || _isNewCalculation) {
      _clearCalculator();
      return;
    }

    if (_equation.length > 1) {
      _equation = _equation.substring(0, _equation.length - 1);
    } else {
      _equation = '0';
    }
  }

  /// Clears calculator state
  /// Hesap makinesi durumunu temizler
  void _clearCalculator() {
    _equation = '0';
    _result = '0';
    _isNewCalculation = true;
    _hasError = false;
  }

  /// Calculates partial results for complex operations
  /// Karmaşık işlemler için kısmi sonuçları hesaplar
  double _calculatePartialResult(String expression) {
    try {
      final prepared = expression.replaceAll('×', '*').replaceAll('÷', '/');

      Parser p = Parser();
      Expression exp = p.parse(prepared);
      ContextModel cm = ContextModel();

      return exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      throw Exception('Invalid expression');
    }
  }

  /// Calculates final result
  /// Son sonucu hesaplar
  void _calculateResult() {
    try {
      String expression = _equation.replaceAll('×', '*').replaceAll('÷', '/');

      if (expression.startsWith('*') || expression.startsWith('/')) {
        expression = '0' + expression;
      }

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double evalResult = exp.evaluate(EvaluationType.REAL, cm);

      if (evalResult.isInfinite || evalResult.isNaN) {
        _handleError();
        return;
      }

      _result = _formatResult(evalResult);
      _equation = _result;
    } catch (e) {
      _handleError();
    }
  }

  /// Formats numerical results
  /// Sayısal sonuçları formatlar
  String _formatResult(double result) {
    if (result == result.toInt()) {
      return result.toInt().toString();
    }

    String formatted = result.toStringAsFixed(maxDecimalPlaces);
    while (formatted.contains('.') && (formatted.endsWith('0') || formatted.endsWith('.'))) {
      formatted = formatted.substring(0, formatted.length - 1);
    }

    return formatted;
  }

  /// Handles calculation errors
  /// Hesaplama hatalarını işler
  void _handleError() {
    _result = 'Error';
    _equation = '0';
    _isNewCalculation = true;
    _hasError = true;
  }

  /// Checks if a value is an operator
  /// Bir değerin operatör olup olmadığını kontrol eder
  bool _isOperator(String value) => ['+', '-', '×', '÷'].contains(value);

  /// Checks if last character is an operator
  /// Son karakterin bir operatör olup olmadığını kontrol eder
  bool _isLastCharOperator() {
    if (_equation.isEmpty) return false;
    return _isOperator(_equation[_equation.length - 1]);
  }
}
