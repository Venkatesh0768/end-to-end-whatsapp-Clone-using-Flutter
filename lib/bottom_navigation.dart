import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/home_screen.dart';
import 'screens/update_screen.dart';
import 'screens/communities_screen.dart';
import 'screens/calls_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    UpdatesScreen(),
    CommunitiesScreen(),
    CallsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: appTheme.appBarTheme.backgroundColor,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.teal.shade900,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home ,color: Colors.white,),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.update_sharp ,color: Colors.white,)),
            label: 'Upadates',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(
                FontAwesomeIcons.userGroup,
                color: Colors.white,
              ),
            ),
            label: 'Communities',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.call , color: Colors.white),
            ),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}
