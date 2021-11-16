import 'package:flutter/material.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:komentory/utils/constants.dart';
import 'package:komentory/screens/sign_in/form.dart';

/// Screen for the Sign In page.
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return MoveWindow(
      child: Container(
        color: MediaQuery.of(context).platformBrightness == Brightness.light
            ? KomentoryLightTheme.background.color
            : KomentoryDarkTheme.background.color,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            body: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Center(
                    child: SizedBox(
                      width: 300.0,
                      height: 300.0,
                      child: SignInForm(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/images/magic-link.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
