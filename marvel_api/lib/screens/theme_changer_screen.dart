import 'package:flutter/material.dart';
import 'package:marvel_api/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({super.key});

  @override
  State<ThemeChangerScreen> createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen> {
  @override
  Widget build(BuildContext context) {
    var themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Theme changer"),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: themeChanger.theme,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile(
            title: Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeChanger.theme,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile(
            title: Text("System Mode"),
            value: ThemeMode.system,
            groupValue: themeChanger.theme,
            onChanged: themeChanger.setTheme,
          ),
        ],
      ),
    );
  }
}
