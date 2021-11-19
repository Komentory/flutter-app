import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:komentory/utils/constants.dart';

/// Styles for the light theme.
ThemeData lightThemeData(BuildContext context) {
  return ThemeData().copyWith(
    textTheme: GoogleFonts.interTextTheme(
      Theme.of(context).textTheme,
    ).copyWith(
      bodyText2: TextStyle(color: KomentoryLightTheme.secondary.color),
      subtitle1: TextStyle(color: KomentoryLightTheme.secondary.color),
      headline4: TextStyle(color: KomentoryLightTheme.primary.color),
    ),
    scaffoldBackgroundColor: KomentoryLightTheme.background.color,
    primaryColor: KomentoryLightTheme.primary.color,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: KomentoryLightTheme.primary.color,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: KomentoryLightTheme.primary.color,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: KomentoryDarkTheme.primary.color,
        side: BorderSide(
          color: KomentoryDarkTheme.primary.color,
        ),
      ),
    ),
  );
}

/// Styles for the dark theme.
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: KomentoryDarkTheme.background.color,
    primaryColor: KomentoryDarkTheme.primary.color,
    textTheme: GoogleFonts.interTextTheme(
      Theme.of(context).textTheme,
    ).copyWith(
      bodyText2: TextStyle(color: KomentoryDarkTheme.secondary.color),
      subtitle1: TextStyle(color: KomentoryDarkTheme.secondary.color),
      headline4: TextStyle(color: KomentoryDarkTheme.primary.color),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: KomentoryDarkTheme.primary.color,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: KomentoryDarkTheme.primary.color,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: KomentoryDarkTheme.primary.color,
        side: BorderSide(
          color: KomentoryDarkTheme.primary.color,
        ),
      ),
    ),
  );
}
