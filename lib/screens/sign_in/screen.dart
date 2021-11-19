import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:komentory/utils/constants.dart';
import 'package:komentory/utils/auth_state.dart';
import 'package:komentory/screens/sign_in/action.dart';
import 'package:komentory/screens/sign_in/content.dart';

/// Screen for the Sign In page.
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

/// AuthState for the Sign In screen.
///
/// See: https://supabase.io/docs/guides/with-flutter#set-up-splash-screen
class _SignInScreenState extends AuthState<SignInScreen> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initConnectivity() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      ConnectivityResult result = await Connectivity().checkConnectivity();
      return _updateConnectionStatus(result);
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    // Push No Connection screen, if connection status is `none`.
    if (result == ConnectivityResult.none) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/no-connection',
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    // Get initional connection status.
    _initConnectivity();

    // Subscribe to connection status updates.
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    // Unsubscribe from connection status updates.
    _connectivitySubscription.cancel();

    super.dispose();
  }

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
                child: SvgPicture.asset(
                  "assets/images/welcome_${Theme.of(context).brightness}.svg",
                  width: 256.0,
                  height: 256.0,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SignInScreenContent(),
                    SizedBox(height: 32.0),
                    SizedBox(
                      width: 284.0,
                      child: SignInAction(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
