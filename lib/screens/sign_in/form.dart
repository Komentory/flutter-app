import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// Form for the Sign In screen.
class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Hey, friend!',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 16),
        Text(
          'Choose the login method that is most convenient for you and we\'re already waiting for you inside.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/google_logo.png',
                scale: 24,
              ),
              const SizedBox(width: 16),
              const Text(
                'Continue with Google',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.black87,
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
          ),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/facebook_logo.png',
                scale: 24,
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
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
          ),
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/discord_logo.png',
                scale: 24,
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
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
