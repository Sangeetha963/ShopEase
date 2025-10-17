// light_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.amber,
  ),
  fontFamily: 'Poppins',
  textTheme: GoogleFonts.poppinsTextTheme(),
);

// dark_theme.dart
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.amber,
  ),
  fontFamily: 'Poppins',
  textTheme: GoogleFonts.poppinsTextTheme(),
);
