import 'package:flutter/material.dart';
import 'package:komentory/utils/constants.dart';
import 'package:komentory/utils/extensions.dart';
import 'package:komentory/utils/auth_required_state.dart';

class MainElementAccountContent extends StatefulWidget {
  const MainElementAccountContent({Key? key}) : super(key: key);

  @override
  State<MainElementAccountContent> createState() =>
      _MainElementAccountContentState();
}

class _MainElementAccountContentState
    extends AuthRequiredState<MainElementAccountContent> {
  // Method for the user sign out.
  Future<void> _signOut() async {
    final response = await supabase.auth.signOut();
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Account'),
          ElevatedButton(
            onPressed: _signOut,
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
