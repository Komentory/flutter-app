import 'package:flutter/material.dart';

import 'package:komentory/utils/constants.dart';
import 'package:komentory/utils/auth_required_state.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends AuthRequiredState<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text(supabase.auth.currentUser.toString()),
      ),
    );
  }
}
