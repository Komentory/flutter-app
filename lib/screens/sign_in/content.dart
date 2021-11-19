import 'package:flutter/material.dart';

/// Content for the Sign In screen.
class SignInScreenContent extends StatelessWidget {
  const SignInScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hey, friend!',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 16),
        Text(
          'Please choose a comfortable way to login to Komentory and join us soon. We\'re waiting for you inside!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
