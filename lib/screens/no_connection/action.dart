import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Acton for the No Connection screen.
class NoConnectionScreenAction extends StatefulWidget {
  const NoConnectionScreenAction({Key? key}) : super(key: key);

  @override
  State<NoConnectionScreenAction> createState() =>
      _NoConnectionScreenActionState();
}

/// State for the No Connection action.
class _NoConnectionScreenActionState extends State<NoConnectionScreenAction> {
  // Cheking connection state.
  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    // Push Sign In screen, if connection is NOT `none`.
    if (result != ConnectivityResult.none) {
      Navigator.pushNamed(context, '/sign-in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18.0),
          ),
          onPressed: () => _checkConnectivityState(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(CupertinoIcons.refresh, size: 24.0),
              SizedBox(width: 16.0),
              Text(
                'Try to re-connect',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
