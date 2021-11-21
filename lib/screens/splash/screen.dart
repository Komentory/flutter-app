import 'dart:async';
import 'package:flutter/material.dart';
import 'package:komentory/utils/constants.dart';
import 'package:komentory/utils/extensions.dart';
import 'package:komentory/utils/auth_state.dart';

/// Screen for the Splash page (initial page of the app).
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// State for the splash screen.
class _SplashScreenState extends AuthState<SplashScreen> {
  Timer? recoverSessionTimer;

  @override
  void initState() {
    super.initState();

    /// a timer to slow down session restore
    /// If not user can't really see the splash screen
    const _duration = Duration(seconds: 1);
    recoverSessionTimer = Timer(_duration, () {
      recoverSupabaseSession();
    });
  }

  /// on received auth deeplink, we should cancel recoverSessionTimer
  /// and wait for auth deep link handling result
  @override
  void onReceivedAuthDeeplink(Uri uri) {
    if (recoverSessionTimer != null) {
      recoverSessionTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeAutoSwitcher(),
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: BrandColor.primary[500]),
          ),
        ),
      ),
    );
  }
}
