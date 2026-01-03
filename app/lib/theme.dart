import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFE15876),
    scaffoldBackgroundColor: const Color(0xFF0F0F13),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFE15876),
      secondary: Color(0xFFFB7185),
      surface: Color(0xFF1A1A20),
      background: Color(0xFF0F0F13),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),
    textTheme: GoogleFonts.beVietnamProTextTheme(_textTheme),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFFE15876),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0x15E14D74),
      labelStyle: const TextStyle(color: Color(0xFFE14D74)),
      side: const BorderSide(color: Color(0x4DE14D74)),
    ),
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF9CA3AF)),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
  );
}
