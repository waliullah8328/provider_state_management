import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_change_providor.dart';

class DarkThemeScreen extends StatelessWidget {
  const DarkThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Theme Change Screen"),centerTitle: true,),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),

          RadioListTile<ThemeMode>(
              title: const Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),

          Icon(Icons.favorite),

        ],
      ),
    );
  }
}
