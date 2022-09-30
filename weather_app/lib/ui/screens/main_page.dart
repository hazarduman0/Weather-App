import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/ui/screens/added_locations.dart';
import 'package:weather_app/ui/screens/current_location.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: mainPageDecoration,
        child: PageView(
          children: const [CurrentLocationWeatherPage(), AddedLocation()],
        ),
      ),
    );
  }
}
