import 'package:flutter/material.dart';
import 'package:komentory/utils/auth_state.dart';

class MainElementProjectsContent extends StatefulWidget {
  const MainElementProjectsContent({Key? key}) : super(key: key);

  @override
  State<MainElementProjectsContent> createState() =>
      _MainElementProjectsContentState();
}

class _MainElementProjectsContentState
    extends AuthState<MainElementProjectsContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text('Projects'),
        ],
      ),
    );
  }
}
