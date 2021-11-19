import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:komentory/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:komentory/screens/no_connection/action.dart';
import 'package:komentory/screens/no_connection/content.dart';

/// Screen for the No Connection page.
class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

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
                  "assets/images/no-connection_${Theme.of(context).brightness}.svg",
                  width: 256.0,
                  height: 256.0,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    NoConnectionScreenContent(),
                    SizedBox(height: 32.0),
                    SizedBox(
                      width: 284.0,
                      child: NoConnectionScreenAction(),
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
