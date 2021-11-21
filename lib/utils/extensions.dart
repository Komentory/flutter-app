import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:komentory/utils/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Checker for [MediaQuery] in context.
extension MediaQueryChecker on BuildContext {
  /// Check if current theme is light.
  bool isLightTheme() =>
      MediaQuery.of(this).platformBrightness == Brightness.light;

  /// Check if current theme is dark.
  bool isDarkTheme() =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;

  /// Auto switcher color of the [Container] to current theme.
  /// - Light theme: [BrandColor.light] 500;
  /// - Dark theme: [BrandColor.dark] 500;
  Color themeAutoSwitcher() {
    switch (MediaQuery.of(this).platformBrightness) {
      case Brightness.light:
        return BrandColor.secondary[500] as Color;
      case Brightness.dark:
        return BrandColor.secondary[700] as Color;
    }
  }
}

/// Checker for [Connectivity] in context.
extension ConnectivityChecker on BuildContext {
  /// Initialize connectivity status.
  ///
  /// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    try {
      ConnectivityResult result = await (Connectivity().checkConnectivity());

      return updateConnectivityStatus(result);
    } on PlatformException catch (e) {
      // Platform messages may fail, so we use a try/catch PlatformException.
      developer.log('Couldn\'t check connectivity status', error: e);

      return;
    }
  }

  /// Update connectivity status.
  Future<void> updateConnectivityStatus(ConnectivityResult result) async {
    // Push No Connection screen, if connection status is `none`.
    if (result == ConnectivityResult.none) {
      Navigator.of(this).pushNamedAndRemoveUntil(
        '/no-connection',
        (route) => false,
      );
    }
  }

  /// Cheking Internet connection on device.
  Future<void> checkConnectivityStatus() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    // Push Sign In screen, if connection is NOT `none`.
    if (result != ConnectivityResult.none) {
      Navigator.of(this).pushNamedAndRemoveUntil(
        '/main',
        (route) => false,
      );
    }
  }
}

/// Snack bar with message.
extension ShowSnackBar on BuildContext {
  // Define function for generating snack bar.
  void _showSnackBar({
    Color? textColor,
    Color? backgroundColor,
    Color? iconColor,
    IconData? icon,
    required String message,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: backgroundColor,
        content: Row(
          children: <Widget>[
            Icon(icon, color: iconColor, size: 24.0),
            const SizedBox(width: 16.0),
            Text(message, style: TextStyle(color: textColor)),
          ],
        ),
      ),
    );
  }

  /// Show the default snack bar.
  void showDefaultSnackBar({required String message}) {
    _showSnackBar(
      textColor: BrandColor.secondary[700],
      backgroundColor: Colors.grey[300],
      iconColor: BrandColor.secondary[700],
      icon: CupertinoIcons.chat_bubble,
      message: message,
    );
  }

  /// Show the info snack bar.
  void showInfoSnackBar({required String message}) {
    _showSnackBar(
      textColor: BrandColor.secondary[700],
      backgroundColor: Colors.blue[300],
      iconColor: BrandColor.secondary[700],
      icon: CupertinoIcons.info_circle,
      message: message,
    );
  }

  /// Show the success snack bar.
  void showSuccessSnackBar({required String message}) {
    _showSnackBar(
      textColor: BrandColor.secondary[700],
      backgroundColor: BrandColor.primary[300],
      iconColor: BrandColor.secondary[700],
      icon: CupertinoIcons.checkmark_alt_circle,
      message: message,
    );
  }

  /// Show the warning snack bar.
  void showWarningSnackBar({required String message}) {
    _showSnackBar(
      textColor: BrandColor.secondary[700],
      backgroundColor: Colors.yellow[300],
      iconColor: BrandColor.secondary[700],
      icon: CupertinoIcons.exclamationmark_triangle,
      message: message,
    );
  }

  /// Show the error snack bar.
  void showErrorSnackBar({required String message}) {
    _showSnackBar(
      textColor: BrandColor.secondary[500],
      backgroundColor: Colors.red[300],
      iconColor: BrandColor.secondary[500],
      icon: CupertinoIcons.hand_raised,
      message: message,
    );
  }
}
