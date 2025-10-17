import 'package:flutter/material.dart';
import 'light_theme.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: lightTheme.primaryColor,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black87,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: lightTheme.textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
);
