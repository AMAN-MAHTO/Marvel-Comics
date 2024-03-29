import 'package:flutter/material.dart';
import 'package:marvel_api/provider/theme_changer_provider.dart';
import 'package:marvel_api/screens/character/character_list_screen.dart';
import 'package:marvel_api/screens/comic/comics_list_screen.dart';
import 'package:marvel_api/screens/event/event_list_screen.dart';
import 'package:marvel_api/screens/theme_changer_screen.dart';
import 'package:provider/provider.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    var themeChanger = Provider.of<ThemeChangerProvider>(context);
    late var themeIcon;
    if (themeChanger.theme == ThemeMode.light) {
      themeIcon = Icons.light_mode_outlined;
    } else {
      themeIcon = Icons.dark_mode_outlined;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (themeChanger.theme == ThemeMode.light) {
                  themeChanger.setTheme(ThemeMode.dark);
                  themeIcon = Icons.dark_mode_outlined;
                } else {
                  themeChanger.setTheme(ThemeMode.light);
                  themeIcon = Icons.light_mode_outlined;
                }
              },
              icon: Icon(themeIcon))
        ],
        title: Text(titles[currentPageIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Header")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Series"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/series_list');
              },
            ),
            ListTile(
              leading: Icon(Icons.auto_stories),
              title: Text("Stories"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/stories_list');
              },
            ),
            ListTile(
              leading: Icon(Icons.emoji_objects),
              title: Text("Creators"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/creators_list');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
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
    ];
  }
}
