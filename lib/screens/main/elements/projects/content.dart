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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
