import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:komentory/utils/constants.dart';
import 'package:komentory/screens/sign_in/screen.dart';
import 'package:komentory/screens/no_connection/screen.dart';

/// Main application widget.
class KomentoryApp extends StatelessWidget {
  const KomentoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Komentory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
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
      ),
      darkTheme: ThemeData.dark().copyWith(
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
      ),
      themeMode: ThemeMode.system,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.resize(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.resize(1700, name: 'XL'),
        ],
      ),
      initialRoute: '/sign-in',
      routes: <String, WidgetBuilder>{
        '/sign-in': (_) => isDesktop
            ? MoveWindow(child: const SignInScreen())
            : const SignInScreen(),
        '/no-connection': (_) => isDesktop
            ? MoveWindow(child: const NoConnection())
            : const NoConnection(),
      },
    );
  }
}
