import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';

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
    return Container(
      color: MediaQuery.of(context).platformBrightness == Brightness.light
          ? KomentoryLightTheme.background.color
          : KomentoryDarkTheme.background.color,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowPadding: const EdgeInsets.all(32.0),
            columnPadding: const EdgeInsets.all(32.0),
            columnSpacing: 32.0,
            layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Image.asset('assets/images/magic-link.png'),
              ),
              const ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Center(
                  child: SizedBox(
                    width: 300.0,
                    child: SignInForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
