// lib/features/calculator/domain/models/calculator_button.dart
import 'package:calculator/core/constants/asset_paths.dart';
import 'package:calculator/core/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// A model representing a calculator button with its display and styling properties.
///
/// This immutable class defines all necessary properties for rendering and handling
/// calculator buttons, including their appearance in both light and dark themes.
class CalculatorModel {
  /// The path to the SVG asset used as the button's icon
  final String icon;

  /// The value associated with this button (e.g., "1", "+", "C")
  /// This value is used for calculations and display purposes
  final String value;

  /// The background color of the button in dark theme mode
  final Color darkModeColor;

  /// The background color of the button in light theme mode
  final Color lightModeColor;

  /// Indicates whether this button represents an operator
  /// Operators receive special styling and handling
  final bool isOperator;

  /// Creates a constant [CalculatorModel].
  ///
  /// All parameters except [isOperator] are required.
  /// Example:
  /// ```dart
  /// const CalculatorButton(
  ///   icon: AssetPaths.plus,
  ///   value: '+',
  ///   darkModeColor: AppColors.purple,
  ///   lightModeColor: AppColors.purple,
  ///   isOperator: true,
  /// );
  /// ```
  const CalculatorModel({
    required this.icon,
    required this.value,
    required this.darkModeColor,
    required this.lightModeColor,
    this.isOperator = false,
  });

  /// Creates a copy of this [CalculatorModel] with the given fields replaced with
  /// new values.
  CalculatorModel copyWith({
    String? icon,
    String? value,
    Color? darkModeColor,
    Color? lightModeColor,
    bool? isOperator,
  }) {
    return CalculatorModel(
      icon: icon ?? this.icon,
      value: value ?? this.value,
      darkModeColor: darkModeColor ?? this.darkModeColor,
      lightModeColor: lightModeColor ?? this.lightModeColor,
      isOperator: isOperator ?? this.isOperator,
    );
  }

  /// Returns a string representation of the button for debugging purposes.
  @override
  String toString() {
    return 'CalculatorButton(value: $value, isOperator: $isOperator)';
  }

  /// Compares this button with another [CalculatorModel] for equality.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CalculatorModel &&
        other.icon == icon &&
        other.value == value &&
        other.darkModeColor == darkModeColor &&
        other.lightModeColor == lightModeColor &&
        other.isOperator == isOperator;
  }

  /// Generates a hash code for this button.
  @override
  int get hashCode {
    return Object.hash(
      icon,
      value,
      darkModeColor,
      lightModeColor,
      isOperator,
    );
  }

  static List<CalculatorModel> calculatorButtons = [
    CalculatorModel(
      icon: AssetPaths().clear,
      value: 'C',
      darkModeColor: AppColors.darkGrey,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().percent,
      value: '%',
      darkModeColor: AppColors.darkGrey,
      lightModeColor: AppColors.lightGrey,
      isOperator: true,
    ),
    CalculatorModel(
      icon: AssetPaths().delete,
      value: 'Del',
      darkModeColor: AppColors.darkGrey,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().divide,
      value: '÷',
      darkModeColor: AppColors.purple,
      lightModeColor: AppColors.purple,
      isOperator: true,
    ),
    // Numbers 7-9
    CalculatorModel(
      icon: AssetPaths().seven,
      value: '7',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().eight,
      value: '8',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().nine,
      value: '9',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().multiply,
      value: '×',
      darkModeColor: AppColors.purple,
      lightModeColor: AppColors.purple,
      isOperator: true,
    ),
    // Numbers 4-6
    CalculatorModel(
      icon: AssetPaths().four,
      value: '4',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().five,
      value: '5',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().six,
      value: '6',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().minus,
      value: '-',
      darkModeColor: AppColors.purple,
      lightModeColor: AppColors.purple,
      isOperator: true,
    ),
    // Numbers 1-3
    CalculatorModel(
      icon: AssetPaths().one,
      value: '1',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().two,
      value: '2',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().three,
      value: '3',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().plus,
      value: '+',
      darkModeColor: AppColors.purple,
      lightModeColor: AppColors.purple,
      isOperator: true,
    ),
    // Bottom row
    CalculatorModel(
      icon: AssetPaths().dot,
      value: '.',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().zero,
      value: '0',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().delete,
      value: 'Del',
      darkModeColor: AppColors.lightBlack,
      lightModeColor: AppColors.lightGrey,
    ),
    CalculatorModel(
      icon: AssetPaths().equal,
      value: '=',
      darkModeColor: AppColors.green,
      lightModeColor: AppColors.green,
      isOperator: true,
    ),
  ];
}
