import 'package:flutter/material.dart';
import 'package:moontree_layer_flutter/presentation/components/colors.dart'
    as colors;
import 'package:moontree_layer_flutter/presentation/components/styles/text.dart'
    as text_styles;

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        backgroundColor: colors.primary,
        primaryColor: colors.primary,
        disabledColor: colors.disabled,
        fontFamily: 'Nunito',
        dividerTheme: const DividerThemeData(
          color: colors.divider,
          thickness: 1,
          indent: 70,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData.fallback(),
          centerTitle: false,
        ),
        tooltipTheme: const TooltipThemeData(preferBelow: true),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: colors.primary,
          selectionHandleColor: colors.primaryDisabled,
          selectionColor: colors.disabled,
        ),
        textTheme: const TextTheme(
          headline1: text_styles.h1,
          headline2: text_styles.h2,
          subtitle1: text_styles.subtitle1,
          subtitle2: text_styles.subtitle2,
          bodyText1: text_styles.body1,
          bodyText2: text_styles.body2,
          caption: text_styles.caption,
          button: text_styles.button,
          overline: text_styles.overline,
        ));
  }
}
