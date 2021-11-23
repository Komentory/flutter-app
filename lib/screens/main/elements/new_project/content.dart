import 'package:flutter/material.dart';
import 'package:komentory/utils/auth_state.dart';

class MainElementNewProjectContent extends StatefulWidget {
  const MainElementNewProjectContent({Key? key}) : super(key: key);

  @override
  State<MainElementNewProjectContent> createState() =>
      _MainElementNewProjectContentState();
}

class _MainElementNewProjectContentState
    extends AuthState<MainElementNewProjectContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('New project'),
      ],
    );
  }
}
