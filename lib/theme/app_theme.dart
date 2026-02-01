import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF002FA7);

  // Bluish white: White with a very subtle blue hue
  static const Color lightBackground = Color(0xFFF5F7FA);

  // Bluish black: Charcoal with a blue tint
  static const Color darkBackground = Color(0xFF151922);

  static const Color lightSurface = Colors.white;
  static const Color darkSurface = Color(0xFF1E232E);
  static const Color onPrimary = Colors.white;

  // Text Theme
  static TextTheme _textTheme(bool isDark) {
    final baseTextTheme = isDark
        ? ThemeData.dark().textTheme
        : ThemeData.light().textTheme;

    return baseTextTheme.copyWith(
      // Display/Headlines use Bebas Neue
      displayLarge: GoogleFonts.bebasNeue(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 57,
      ),
      displayMedium: GoogleFonts.bebasNeue(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 45,
      ),
      displaySmall: GoogleFonts.bebasNeue(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 36,
      ),
      headlineLarge: GoogleFonts.bebasNeue(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 32,
      ),
      headlineMedium: GoogleFonts.bebasNeue(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 28,
      ),
      headlineSmall: GoogleFonts.bebasNeue(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 24,
      ),

      // Body styles use Lexend
      titleLarge: GoogleFonts.lexend(
        color: isDark ? Colors.white : Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
      titleMedium: GoogleFonts.lexend(
        color: isDark ? Colors.white : Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      titleSmall: GoogleFonts.lexend(
        color: isDark ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      bodyLarge: GoogleFonts.lexend(
        color: isDark ? Colors.white70 : Colors.black87,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.lexend(
        color: isDark ? Colors.white70 : Colors.black87,
        fontSize: 14,
      ),
      bodySmall: GoogleFonts.lexend(
        color: isDark ? Colors.white60 : Colors.black54,
        fontSize: 12,
      ),
      labelLarge: GoogleFonts.lexend(
        color: isDark ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: primaryColor,
        surface: lightSurface,
        onPrimary: onPrimary,
        onSurface: Colors.black,
      ),
      textTheme: _textTheme(false),
      appBarTheme: AppBarTheme(
        backgroundColor: lightBackground,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: GoogleFonts.bebasNeue(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimary,
          textStyle: GoogleFonts.lexend(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      useMaterial3: true,
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: primaryColor,
        surface: darkSurface,
        onPrimary: onPrimary,
        onSurface: Colors.white,
      ),
      textTheme: _textTheme(true),
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.bebasNeue(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimary,
          textStyle: GoogleFonts.lexend(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      useMaterial3: true,
    );
  }
}
