import 'package:flutter/material.dart';
import 'package:komentory/utils/constants.dart';
import 'package:komentory/utils/extensions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:komentory/utils/auth_required_state.dart';
import 'package:easy_localization/easy_localization.dart';

class MainElementAccountContent extends StatefulWidget {
  const MainElementAccountContent({Key? key}) : super(key: key);

  @override
  State<MainElementAccountContent> createState() =>
      _MainElementAccountContentState();
}

class _MainElementAccountContentState
    extends AuthRequiredState<MainElementAccountContent> {
  // Define initial state.
  String _username = '';
  String _avatarUrl = dotenv.get('APP_DEFAULT_AVATAR_URL');
  String _websiteUrl = '';

  // Called once a user id is received within `onAuthenticated()`.
  Future<void> _getProfile(String userId) async {
    try {
      final response = await supabase
          .from('profiles')
          .select('username, avatar_url, website_url')
          .eq('id', userId)
          .single()
          .execute();

      if (response.error != null && response.status != 406) {
        throw "Failed to load account: ${response.error?.message}";
      }

      setState(() {
        _username = response.data['username'] as String;
        _avatarUrl = response.data['avatar_url'] as String;
        _websiteUrl = response.data['website_url'] as String;
      });
    } catch (e) {
      if (mounted) {
        context.showErrorSnackBar(message: e.toString());
      }
    }
  }

  // Method for the user sign out.
  Future<void> _signOut() async {
    try {
      final response = await supabase.auth.signOut();
      // Throw error if request failed.
      if (response.error != null) {
        throw 'Failed to sign out! Details: ${response.error?.message}';
      }
    } catch (e) {
      context.showErrorSnackBar(message: e.toString());
    }
  }

  @override
  void onAuthenticated(Session session) {
    final user = session.user;
    if (user != null) {
      _getProfile(user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            _avatarUrl,
            width: 128.0,
            height: 128.0,
          ),
        ),
        Text(_username),
        Text(_websiteUrl),
        ElevatedButton(
          onPressed: _signOut,
          child: const Text('Log out'),
        ),
      ],
    );
  }
}
