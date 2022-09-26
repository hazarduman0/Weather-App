import 'package:animated_svg/animated_svg.dart';
import 'package:animated_svg/animated_svg_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import 'package:weather_app/core/app_text_styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final SvgController controller;

  @override
  void initState() {
    // Initialize SvgController
    controller = AnimatedSvgController();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose SvgController
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.green,
        height: size.height,
        width: size.width,
        child: Center(
            child: Column(
          children: [
            Text('Test Text', style: caption1),
            SvgPicture.asset('assets/weather_icons/rain.svg',height: 500,)
          ],
        )),
      ),
    );
  }
}
