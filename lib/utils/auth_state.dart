import 'package:flutter/material.dart';

import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:komentory/utils/constants.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    // Users will be sent back to the Sign In screen, if they sign out.
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/sign-in',
        (route) => false,
      );
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/account',
        (route) => false,
      );
    }
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    context.showErrorSnackBar(message: message);
  }
}
