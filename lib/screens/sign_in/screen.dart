import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:komentory/screens/sign_in/content.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_svg/svg.dart';

import 'package:komentory/utils/constants.dart';
import 'package:komentory/screens/sign_in/action.dart';

/// Screen for the Sign In page.
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await Connectivity().checkConnectivity();
    } on PlatformException catch (_) {
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;

      // Push No Connection screen, if connection status is `none`.
      if (_connectionStatus == ConnectivityResult.none) {
        Navigator.pushNamed(context, '/no-connection');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    // Get initional connection status.
    initConnectivity();

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
