import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform, kIsWeb;
import 'package:supabase_flutter/supabase_flutter.dart';

/// Init Suopabase connector.
final SupabaseClient supabase = Supabase.instance.client;

/// Desktop devices getter.
/// See: https://github.com/bitsdojo/bitsdojo_window/issues/78
final bool isDesktop = (defaultTargetPlatform == TargetPlatform.macOS ||
    defaultTargetPlatform == TargetPlatform.windows ||
    defaultTargetPlatform == TargetPlatform.linux ||
    kIsWeb); // if app runs on the web

/// Define brand colors.
/// See: https://gist.github.com/mikemimik/5ac2fa98fe6d132098603c1bd40263d5
class BrandColor {
  // Makes instantiate this class.
  BrandColor._();

  static const Map<int, Color> primary = <int, Color>{
    // 50: Color(0xFF),
    100: Color(0xFFBFEAD4),
    // 200: Color(0xFF),
    300: Color(0xFF80D5AA),
    // 400: Color(0xFF),
    500: Color(0xFF00AB55),
    600: Color(0xFF008743),
    700: Color(0xFF006231),
    800: Color(0xFF004321),
    // 900: Color(0xFF),
  };

  static const Map<int, Color> secondary = <int, Color>{
    // 50: Color(0xFF),
    100: Color(0xFFFDFCFB),
    // 200: Color(0xFF),
    300: Color(0xFFF6F4EF),
    // 400: Color(0xFF),
    500: Color(0xFFE3DDCF),
    600: Color(0xFF626268),
    700: Color(0xFF3E3E41),
    800: Color(0xFF333333),
    // 900: Color(0xFF),
  };
}
