import 'package:flutter/material.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:marvel_api/provider/theme_changer_provider.dart';
import 'package:marvel_api/routing.dart';
import 'package:marvel_api/screens/character/character_list_screen.dart';
import 'package:marvel_api/screens/character/character_screen.dart';
import 'package:marvel_api/screens/comic/comics_list_screen.dart';

import 'package:marvel_api/screens/theme_changer_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
      ChangeNotifierProvider(create: (_) => DataProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Builder(builder: (context) {
      var themeChanger = Provider.of<ThemeChangerProvider>(context);
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeChanger.theme,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red, brightness: Brightness.dark),
        ),
        initialRoute: '/',
        onGenerateRoute: RoutGenerator.generateRoute,
      );
    });
  }
}
