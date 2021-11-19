import 'package:flutter/material.dart';

/// Content for the No Connection screen.
class NoConnectionScreenContent extends StatelessWidget {
  const NoConnectionScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Oops...',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 16),
        Text(
          'There doesn\'t seem to be an Internet connection here! Try connecting to another network and try again.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
