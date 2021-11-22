import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:komentory/utils/constants.dart';
import 'package:komentory/utils/extensions.dart';
import 'package:komentory/utils/auth_state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Action for the Sign In screen.
class SignInAction extends StatefulWidget {
  const SignInAction({Key? key}) : super(key: key);

  @override
  _SignInActionState createState() => _SignInActionState();
}

/// State for the Sign In screen.
class _SignInActionState extends AuthState<SignInAction> {
  // Define initial state.
  bool _isLoading = false;

  // Function for sign in with third-party provider.
  Future<void> _signInWithProvider(Provider provider) async {
    // Change state for loader.
    setState(() => _isLoading = true);

    // Supabase authenticator for the third-party provider.
    final response = await supabase.auth.signInWithProvider(
      provider,
      options: AuthOptions(
        redirectTo: dotenv.get('SUPABASE_LOGIN_CALLBACK_URL'),
      ),
    );

    // If auth failed, show error message in snack bar.
    if (!response) {
      context.showErrorSnackBar(
        message: 'Oops... Authentication failed! Please try again.',
      );
    }

    // Change state for loader.
    setState(() => _isLoading = false);
  }

  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/google_logo.svg',
                width: 24,
              ),
              const SizedBox(width: 8.0),
              Text(
                'sign_in.button.google'.tr(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: const Color(0xFF333333),
            primary: const Color(0xFFFFFFFF),
          ),
          onPressed: () =>
              _isLoading ? null : _signInWithProvider(Provider.google),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/facebook_logo.svg',
                width: 24,
              ),
              const SizedBox(width: 8.0),
              Text(
                'sign_in.button.facebook'.tr(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: const Color(0xFFFFFFFF),
            primary: const Color(0xFF1877F2),
          ),
          onPressed: () =>
              _isLoading ? null : _signInWithProvider(Provider.facebook),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/discord_logo.svg',
                width: 24,
              ),
              const SizedBox(width: 8.0),
              Text(
                'sign_in.button.discord'.tr(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: const Color(0xFFFFFFFF),
            primary: const Color(0xFF5865F2),
          ),
          onPressed: () =>
              _isLoading ? null : _signInWithProvider(Provider.discord),
        ),
      ],
    );
  }
}
