import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:komentory/utils/extensions.dart';
import 'package:komentory/utils/auth_required_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:komentory/screens/main/elements/search/content.dart';
import 'package:komentory/screens/main/elements/account/content.dart';
import 'package:komentory/screens/main/elements/projects/content.dart';
import 'package:komentory/screens/main/elements/new_project/content.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends AuthRequiredState<MainScreen> {
  // Define inizial state for selected bottom menu item.
  int _selectedIndex = 0;

  //
  late final List<Widget> _pages = const <Widget>[
    MainElementProjectsContent(),
    MainElementNewProjectContent(),
    MainElementSearchContent(),
    MainElementAccountContent(),
  ];

  // Switch to content of the bottom menu item, if clicked on it.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Define channel for cheking Internet connection on this screen.
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (mounted) {
      // Get initional connection status.
      context.initConnectivity();
    }

    // Subscribe to connection status updates.
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen(context.updateConnectivityStatus);
  }

  @override
  void dispose() {
    // Unsubscribe from connection status updates.
    _connectivitySubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeAutoSwitcher(),
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            mouseCursor: SystemMouseCursors.click,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Projects',
                icon: Icon(CupertinoIcons.folder),
              ),
              BottomNavigationBarItem(
                label: 'New project',
                icon: Icon(CupertinoIcons.plus),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(CupertinoIcons.search),
              ),
              BottomNavigationBarItem(
                label: 'Account',
                icon: Icon(CupertinoIcons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
