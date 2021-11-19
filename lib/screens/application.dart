import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:komentory/utils/constants.dart';
import 'package:komentory/utils/auth_state.dart';
import 'package:komentory/utils/theme_styles.dart';
import 'package:komentory/screens/splash/screen.dart';
import 'package:komentory/screens/account/screen.dart';
import 'package:komentory/screens/sign_in/screen.dart';
import 'package:komentory/screens/no_connection/screen.dart';

/// Main application widget.
class KomentoryApp extends StatefulWidget {
  const KomentoryApp({Key? key}) : super(key: key);

  @override
  _KomentoryAppState createState() => _KomentoryAppState();
}

class _KomentoryAppState extends AuthState<KomentoryApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Komentory',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
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
        '/account': (_) => isDesktop
            ? MoveWindow(child: const AccountScreen())
            : const AccountScreen(),
        '/no-connection': (_) => isDesktop
            ? MoveWindow(child: const NoConnectionScreen())
            : const NoConnectionScreen(),
      },
    );
  }
}
