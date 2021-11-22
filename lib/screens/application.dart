import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:komentory/utils/constants.dart';
import 'package:komentory/utils/theme_styles.dart';
import 'package:komentory/screens/main/screen.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:komentory/screens/splash/screen.dart';
import 'package:komentory/screens/sign_in/screen.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:komentory/screens/no_connection/screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Main application widget.
class KomentoryApp extends StatelessWidget {
  const KomentoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Komentory',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: context.lightThemeData(),
      darkTheme: context.darkThemeData(),
      themeMode: ThemeMode.system,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: PHONE),
          ResponsiveBreakpoint.resize(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.resize(1680, name: 'XL'),
        ],
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => isDesktop
            ? MoveWindow(child: const SplashScreen())
            : const SplashScreen(),
        '/sign-in': (_) => isDesktop
            ? MoveWindow(child: const SignInScreen())
            : const SignInScreen(),
        '/main': (_) => isDesktop
            ? MoveWindow(child: const MainScreen())
            : const MainScreen(),
        '/no-connection': (_) => isDesktop
            ? MoveWindow(child: const NoConnectionScreen())
            : const NoConnectionScreen(),
      },
    );
  }
}
