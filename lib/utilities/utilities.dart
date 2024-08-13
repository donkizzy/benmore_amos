import 'dart:math';
import 'package:flutter/material.dart';



extension StringExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize()).join(' ');

}

extension Precision on double {
  double toPrecision(int fractionDigits) {
    double mod = pow(1, fractionDigits.toDouble()).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}

bool checksEqual(String? first, String? second) {
  return (first?.toLowerCase().trim() == second?.toLowerCase().trim());
}

bool checksNotEqual(String first, String second) {
  return (first.toLowerCase().trim() != second.toLowerCase().trim());
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) =>
    String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

///MediaQuery Width
double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///MediaQuery Height
double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

ThemeData theme(BuildContext context) {
  return Theme.of(context);
}




