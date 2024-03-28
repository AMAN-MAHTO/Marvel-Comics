import 'package:flutter/material.dart';
import 'package:marvel_api/screens/character/character_list_screen.dart';
import 'package:marvel_api/screens/comic/comics_list_screen.dart';
import 'package:marvel_api/screens/event/event_list_screen.dart';
import 'package:marvel_api/screens/theme_changer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  var titles = [
    'C H A R A C T E R S',
    'C O M I C S',
    'E V E N T S',
    'S E T T I N G'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentPageIndex]),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: navigation_destinations,
      ),
      body: <Widget>[
        CharacterListScreen(),
        ComicsListScreen(),
        EventListScreen(),
        ThemeChangerScreen(),
      ][currentPageIndex],
    );
  }

  List<Widget> get navigation_destinations {
    return const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(Icons.person_2),
        icon: Icon(Icons.person_2_outlined),
        label: 'Characters',
      ),
      NavigationDestination(
        selectedIcon: Icon(Icons.note),
        icon: Icon(Icons.note_outlined),
        label: 'Comics',
      ),
      NavigationDestination(
        selectedIcon: Icon(Icons.event),
        icon: Icon(Icons.event_outlined),
        label: 'Events',
      ),
      NavigationDestination(
        selectedIcon: Icon(Icons.settings),
        icon: Icon(Icons.settings_outlined),
        label: 'Settings',
      ),
    ];
  }
}
