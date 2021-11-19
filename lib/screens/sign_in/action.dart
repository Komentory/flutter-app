import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

/// Action for the Sign In screen.
class SignInAction extends StatefulWidget {
  const SignInAction({Key? key}) : super(key: key);

  @override
  _SignInActionState createState() => _SignInActionState();
}

/// State for the Sign In screen.
class _SignInActionState extends State<SignInAction> {
  // TODO: Implement Supabase auth actions.

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
              const SizedBox(width: 16),
              const Text(
                'Continue with Google',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: const Color(0xFF333333),
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18.0),
          ),
          onPressed: () {},
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
              const SizedBox(width: 16),
              const Text(
                'Continue with Facebook',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: const Color(0xFF1877F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18.0),
          ),
          onPressed: () {},
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
              const SizedBox(width: 16),
              const Text(
                'Continue with Discord',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: const Color(0xFF5865F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18.0),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
