import 'package:flutter/material.dart';
import 'package:marvel_api/provider/theme_changer_provider.dart';
import 'package:marvel_api/screens/character/character_list_screen.dart';
import 'package:marvel_api/screens/comic/comics_list_screen.dart';
import 'package:marvel_api/screens/event/event_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

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
            icon: Icon(themeIcon),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 255, 0, 0),
                const Color.fromARGB(255, 209, 14, 0)
              ], // Example gradient colors
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                getTitle(currentPageIndex), // Get the title dynamically
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Adjust the space between menu and text
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/header.png"),
                fit: BoxFit.cover,
              )),
              child: Text(
                "Marvel Comics",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20), // Increase text size
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text(
                "Series",
                style: TextStyle(fontSize: 20), // Increase text size
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/series_list');
              },
            ),
            ListTile(
              leading: Icon(Icons.auto_stories),
              title: Text(
                "Stories",
                style: TextStyle(fontSize: 20), // Increase text size
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/stories_list');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 20), // Increase text size
              ),
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
        EventListScreen(),
        CharacterListScreen(),
        ComicsListScreen(),
      ][currentPageIndex],
    );
  }

  // Method to get the title based on the current page index
  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'EVENTS';
      case 1:
        return 'CHARACTERS';
      case 2:
        return 'COMICS';
      default:
        return 'CHARACTERS';
    }
  }

  List<Widget> get navigation_destinations {
    return const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(Icons.event),
        icon: Icon(Icons.event_outlined),
        label: 'Events',
      ),
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
    ];
  }
}
