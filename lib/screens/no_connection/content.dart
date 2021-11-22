import 'package:flutter/material.dart';
import 'package:easy_localization/src/public_ext.dart';

/// Content for the No Connection screen.
class NoConnectionScreenContent extends StatelessWidget {
  const NoConnectionScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'no_connection.oops'.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 16.0),
        Text(
          'no_connection.no_internet_text'.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
