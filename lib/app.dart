import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/counter_example/counter_screen.dart';
import 'package:provider_statemanagement/counter_example/dark_theme.dart';
import 'package:provider_statemanagement/counter_example/example_one_screen.dart';
import 'package:provider_statemanagement/counter_example/favourite_provider.dart';
import 'package:provider_statemanagement/counter_example/simple_calculator_screen.dart';
import 'package:provider_statemanagement/provider/calulator_provider.dart';
import 'package:provider_statemanagement/provider/count_provider.dart';
import 'package:provider_statemanagement/provider/example_one_provider.dart';
import 'package:provider_statemanagement/provider/theme_change_providor.dart';
import 'package:provider_statemanagement/screen/favourite/favourite_screen.dart';
import 'package:provider_statemanagement/screen/notify_listener_screen.dart';
import 'package:provider_statemanagement/view/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> CountProvider()),
          ChangeNotifierProvider(create: (_)=> ExampleOneProvider()),
          ChangeNotifierProvider(create: (_)=> CalculatorProvider()),
          ChangeNotifierProvider(create: (_)=> FavouriteProvider()),
          ChangeNotifierProvider(create: (_)=> ThemeChangeProvider()),
        ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            primaryColor: Colors.red,
          ),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.blue,
              primarySwatch: Colors.purple,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal
              ),
              iconTheme: const IconThemeData(
              color: Colors.red
          )
          ),
          home: LoginScreen(),
        );
      },),
    );

  }
}