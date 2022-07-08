import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';

extension StringBytesExtension on String {
  List<int> get bytes => utf8.encode(this);

  String toCapitalizedWord() =>
      1 < length ? substring(0, 1).toUpperCase() + substring(1) : toUpperCase();

  String toTitleCase({bool underscoresAsSpace = false}) =>
      replaceAll(RegExp(' +'), ' ')
          // for enums especially:
          .replaceAll(underscoresAsSpace ? RegExp('_+') : ' ', ' ')
          .split(' ')
          .map((String str) => str.toCapitalizedWord())
          .join(' ');
}

extension StringExtension on Uint8List {
  String get toEncodedString => hex.encode(this);
}
