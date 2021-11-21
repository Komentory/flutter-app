import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:komentory/utils/extensions.dart';

/// Acton for the No Connection screen.
class NoConnectionScreenAction extends StatelessWidget {
  const NoConnectionScreenAction({Key? key}) : super(key: key);

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
          onPressed: context.checkConnectivityStatus,
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
