import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:komentory/utils/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:komentory/screens/application.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:komentory/utils/secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  // Add instance of the WidgetsBinding.
  // See: https://github.com/supabase/supabase-flutter#getting-started
  WidgetsFlutterBinding.ensureInitialized();

  // Add environment variables to app.
  // See: https://pub.dev/packages/flutter_dotenv#usage
  await dotenv.load(fileName: '.env');

  // Add Supabase connector.
  // See: https://github.com/supabase-community/supabase-flutter-quickstart/blob/main/lib/main.dart
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_ENDPOINT_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
    authCallbackUrlHostname: 'login-callback',
    localStorage: SecureLocalStorage(),
    debug: true,
  );

  // Add license for Google Fonts via Flutter license generator.
  //
  // Once you've decided on the fonts you want in your published app,
  // you should add the appropriate licenses to your flutter
  // app's LicenseRegistry.
  //
  // See: https://pub.dev/packages/google_fonts
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  // Run main application widget.
  runApp(const KomentoryApp());

  // Set default settings for the desktop app window.
  // Skip this step for mobile platforms.
  // See: https://pub.dev/packages/bitsdojo_window
  if (isDesktop) {
    doWhenWindowReady(() {
      const initialSize = Size(800, 500);
      appWindow.title = 'Komentory > Your online focus group for everything';
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}
