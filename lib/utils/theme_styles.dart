import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komentory/utils/constants.dart';

/// Theme data for Komentory project.
extension BrandThemeData on BuildContext {
  /// Styles for the light theme.
  ThemeData lightThemeData() {
    return ThemeData().copyWith(
      textTheme: GoogleFonts.interTextTheme(Theme.of(this).textTheme).copyWith(
        bodyText2: TextStyle(color: BrandColor.secondary[700]),
        subtitle1: TextStyle(color: BrandColor.secondary[700]),
        headline4: TextStyle(color: BrandColor.primary[500]),
      ),
      scaffoldBackgroundColor: BrandColor.secondary[500],
      primaryColor: BrandColor.primary[500],
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: BrandColor.primary[500],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: BrandColor.primary[500],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18.0),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: BrandColor.primary[500],
          side: BorderSide(
            color: BrandColor.primary[500] as Color,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: BrandColor.secondary[300],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: BrandColor.primary[500],
        unselectedItemColor: BrandColor.primary[300],
        selectedLabelStyle: const TextStyle(fontSize: 11.0),
        unselectedLabelStyle: const TextStyle(fontSize: 11.0),
      ),
    );
  }

  /// Styles for the dark theme.
  ThemeData darkThemeData() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: BrandColor.secondary[700],
      primaryColor: BrandColor.primary[500],
      textTheme: GoogleFonts.interTextTheme(Theme.of(this).textTheme).copyWith(
        bodyText2: TextStyle(color: BrandColor.secondary[500]),
        subtitle1: TextStyle(color: BrandColor.secondary[500]),
        headline4: TextStyle(color: BrandColor.primary[500]),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: BrandColor.primary[500],
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: BrandColor.primary[500],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18.0),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: BrandColor.primary[500],
          side: BorderSide(
            color: BrandColor.primary[500] as Color,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: BrandColor.secondary[900],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: BrandColor.primary[500],
        unselectedItemColor: BrandColor.primary[300],
        selectedLabelStyle: const TextStyle(fontSize: 11.0),
        unselectedLabelStyle: const TextStyle(fontSize: 11.0),
      ),
    );
  }
}
