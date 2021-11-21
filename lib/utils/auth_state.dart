import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:komentory/utils/extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      // Sent back to the Sign In screen, if user sign out.
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/sign-in',
        (route) => false,
      );
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      // Push Main screen, if user sign in.
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/main',
        (route) => false,
      );
    }
  }

  @override
  void onPasswordRecovery(Session session) {
    if (mounted) {
      // Show warning message in snack bar, if password recovery process started.
      context.showWarningSnackBar(message: 'Password recovery process started');
    }
  }

  @override
  void onErrorAuthenticating(String message) {
    if (mounted) {
      // Show error message in snack bar, if auth is failed.
      context.showErrorSnackBar(message: message);
    }
  }
}
