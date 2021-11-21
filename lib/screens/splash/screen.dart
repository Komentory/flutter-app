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
  @override
  void initState() {
    // Recovery Supabase session.
    recoverSupabaseSession();

    // Init state.
    super.initState();
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
