import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

import 'package:supabase_flutter/supabase_flutter.dart';

/// Init Suopabase connector.
final supabase = Supabase.instance.client;

/// Toast with messages.
extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

// See: https://stackoverflow.com/a/58552304

/// Desktop devices getter.
/// See: https://github.com/bitsdojo/bitsdojo_window/issues/78
get isDesktop {
  return defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux;
}

/// The enum for the Komentory brand's colors (light theme, by default).
enum KomentoryLightTheme {
  primary,
  secondary,
  background,
}

/// Extension for define the Komentory brand's colors (light theme).
extension KomentoryLightThemeExtension on KomentoryLightTheme {
  // Getter for colors.
  Color get color {
    switch (this) {
      case KomentoryLightTheme.primary:
        return const Color(0xFF00AB55);
      case KomentoryLightTheme.secondary:
        return const Color(0xFF3E3E41);
      case KomentoryLightTheme.background:
        return const Color(0xFFF6F4EF);
    }
  }
}

/// The enum for the Komentory brand's colors (dark theme).
enum KomentoryDarkTheme {
  primary,
  secondary,
  background,
}

/// Extension for define the Komentory brand's colors.
extension KomentoryDarkThemeExtension on KomentoryDarkTheme {
  // Getter for colors.
  Color get color {
    switch (this) {
      case KomentoryDarkTheme.primary:
        return const Color(0xFF00AB55);
      case KomentoryDarkTheme.secondary:
        return const Color(0xFFF6F4EF);
      case KomentoryDarkTheme.background:
        return const Color(0xFF3E3E41);
    }
  }
}
