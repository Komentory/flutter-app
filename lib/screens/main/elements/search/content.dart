import 'package:flutter/material.dart';
import 'package:komentory/utils/auth_state.dart';

class MainElementSearchContent extends StatefulWidget {
  const MainElementSearchContent({Key? key}) : super(key: key);

  @override
  State<MainElementSearchContent> createState() =>
      _MainElementSearchContentState();
}

class _MainElementSearchContentState
    extends AuthState<MainElementSearchContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Search'),
      ],
    );
  }
}
