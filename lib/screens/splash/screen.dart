import 'package:flutter/material.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Color(0xFF00AB55)),
      ),
    );
  }
}
