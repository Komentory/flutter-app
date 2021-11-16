import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:komentory/screens/application.dart';

Future<void> main() async {
  // Add license for Google Fonts.
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

  // Add environment variables to app.
  // See: https://pub.dev/packages/flutter_dotenv#usage
  await dotenv.load(fileName: '.env');

  // Run application.
  runApp(const KomentoryApp());

  // Set default settings for the desktop app window.
  // See: https://pub.dev/packages/bitsdojo_window
  doWhenWindowReady(() {
    const initialSize = Size(800, 500);
    appWindow.title = 'Komentory > Your online focus group for everything';
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
