import 'package:flutter/material.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:marvel_api/provider/theme_changer_provider.dart';
import 'package:marvel_api/routing.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  final isDark = pref.getBool("is_dark") ?? false;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChangerProvider(isDark)),
      ChangeNotifierProvider(create: (_) => DataProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeChanger = Provider.of<ThemeChangerProvider>(context);
    var dataProvider = Provider.of<DataProvider>(context);
    dataProvider.fetchData();
    return Builder(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeChanger.theme,
        theme: ThemeData(
          fontFamily: "YatraOne",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          fontFamily: "YatraOne",
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red, brightness: Brightness.dark),
        ),
        initialRoute: '/',
        onGenerateRoute: RoutGenerator.generateRoute,
      );
    });
  }
}
