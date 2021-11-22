import 'package:flutter/material.dart';
import 'package:easy_localization/src/public_ext.dart';

/// Content for the Sign In screen.
class SignInScreenContent extends StatelessWidget {
  const SignInScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'sign_in.hey_friend'.tr(),
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 16),
        Text(
          'sign_in.choose_login_text'.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
