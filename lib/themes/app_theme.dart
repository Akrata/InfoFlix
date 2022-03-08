import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.red;

  static final ThemeData lightTheme = ThemeData().copyWith(
      appBarTheme: const AppBarTheme(
    centerTitle: true,
    color: primary,
    elevation: 0,
  ));
}
