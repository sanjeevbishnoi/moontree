import 'package:flutter/material.dart';
import 'package:moontree_layer_flutter/presentation/components/colors.dart'
    as colors;
import 'package:moontree_layer_flutter/presentation/components/styles/text.dart'
    as text_styles;

extension ValueColorExtension on ThemeData {
  Color? get good =>
      brightness == Brightness.light ? colors.success : colors.success;
  Color? get bad =>
      brightness == Brightness.light ? colors.error : colors.error;
}

extension TextThemeStyleExtension on TextTheme {
  TextStyle? get link => text_styles.link;
  TextStyle? get softButton => text_styles.softButton;
  TextStyle? get invertButton => text_styles.invertButton;
  TextStyle? get disabledButton => text_styles.disabledButton;
  TextStyle? get enabledButton => text_styles.enabledButton;
  TextStyle? get checkoutSubAsset => text_styles.checkoutSubAsset;
  TextStyle? get checkoutItem => text_styles.checkoutItem;
  TextStyle? get checkoutFees => text_styles.checkoutFees;
  TextStyle? get checkoutFee => text_styles.checkoutFee;
}

extension TextStyleExtension on ThemeData {}
