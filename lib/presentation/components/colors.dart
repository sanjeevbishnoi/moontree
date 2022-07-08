// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:collection/src/iterable_extensions.dart'
    show IterableIntegerExtension;
import 'package:flutter/material.dart';

const List<Color> colors = [
  error,
  Color(0xFFEC407A),
  Color(0xFFAB47BC),
  Color(0xFF7E57C2),
  primary,
  Color(0xFF42A5F5),
  Color(0xFF29B6F6),
  Color(0xFF26C6DA),
  Color(0xFF26A69A),
  success,
  lightGreen,
  lime,
  yellow,
  Color(0xFFFFCA28),
  Color(0xFFFFA726),
  Color(0xFFFF7043),
];

const Color error = Color(0xFFEF5350);
const Color success = Color(0xFF66BB6A);
const Color lightGreen = Color(0xFF9CCC65);
const Color primary = Color(0xFF5C6BC0);
const Color lime = Color(0xFFD4E157);
const Color yellow = Color(0xFFFFEE58);
const Color primaryDisabled = Color(0xFFC1C7E7); //38
const Color primary60 = Color(0xFF9DA6D9);
const Color snackBar = Color(0xFF212121);
const Color logoGreen = Color(0xFF94DF3F);
const Color logoBlue = Color(0xFF54A3E3);

// .12 Colors.white.withAlpha(12)
const Color white12 = Color(0x1FFFFFFF);
const Color white38 = Color(0x61FFFFFF);
const Color white60 = Color(0x99FFFFFF);
const Color white87 = Color(0xDEFFFFFF);
const Color white = Color(0xFFFFFFFF);
const Color black12 = Color(0x1F000000);
const Color black38 = Color(0x61000000);
const Color black60 = Color(0x99000000);
const Color black87 = Color(0xDE000000);
const Color black = Color(0xFF000000);
const Color divider = black12;
const Color disabled = black38;
const Color offBlack = black87;
const Color offWhite = white87;

const List<Color> primaries = [
  Color(0xFFE8EAF6),
  Color(0xFFC5CAE9),
  Color(0xFF9FA8DA),
  Color(0xFF7986CB),
  primary,
  Color(0xFF3F51B5),
  Color(0xFF3949AB),
  Color(0xFF303F9F),
  Color(0xFF283593),
  Color(0xFF1A237E),
];

const List<int> primaryNumbers = [
  50,
  100,
  200,
  300,
  400,
  500,
  600,
  700,
  800,
  900
];

Color androidSystemBar = primary.withOpacity(1 - .12);

List<Color> backgroundColors = colors
    .where((Color color) => ![lime, yellow, primary].contains(color))
    .toList();

List<Color> foregroundColors(Color background) {
  var index = backgroundColors.indexOf(background);
  var allIndex = colors.indexOf(background);
  var length = backgroundColors.length;
  var ret = <Color>[];
  if (index == 0) {
    ret = colors.sublist(2, colors.length - 1);
  } else if (index == length - 1) {
    ret = colors.sublist(1, colors.length - 2);
  } else {
    ret = colors.where((Color color) {
      if (![colors[index - 1], colors[index], colors[index + 1]]
          .contains(color)) {
        return true;
      }
      return false;
    }).toList();
  }
  return ret
      .where((Color color) =>
          color != primary && !noGood(allIndex).contains(color))
      .toList();
}

List<int> tooClose(int index) =>
    {
      1: [15],
      5: [8, 6],
      6: [7, 9],
      7: [9, 10],
      8: [5],
      9: [5, 6, 7],
      10: [7],
      13: [11],
    }[index] ??
    <int>[];

List<int> tooClash(int index) =>
    {
      0: [5, 6, 8],
      5: [0, 1, 15],
      6: [0, 1, 14, 15],
      7: [0, 1, 14, 15],
      8: [0, 1, 15],
      9: [15],
      10: [14],
      14: [6, 7],
      15: [5, 6, 7, 8],
    }[index] ??
    <int>[];

Set<Color> noGood(int index) =>
    {for (var i in tooClose(index) + tooClash(index)) colors[i]};

Color backgroundColor(String name) =>
    backgroundColors[name.codeUnits.sum % backgroundColors.length];

Color foregroundColor(String name, {Color? backColor}) {
  var foreColors = foregroundColors(backColor ?? backgroundColor(name));
  return foreColors[name.codeUnits.sum % foreColors.length];
}

List<int> rgb(Color color) => [color.red, color.green, color.blue];
