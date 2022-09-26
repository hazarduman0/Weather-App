import 'package:flutter/material.dart';
import 'package:weather_app/theme/theme_constants.dart';
import 'package:weather_app/theme/theme_manager.dart';
import 'package:weather_app/ui/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: MainPage(),
    );
  }
}

