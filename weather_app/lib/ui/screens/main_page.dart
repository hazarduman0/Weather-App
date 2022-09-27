import 'package:animated_svg/animated_svg_controller.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_paddings.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/ui/widgets/weather_widget.dart';

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
          decoration: backgroundDecoration,
          height: size.height,
          width: size.width,
          child: Padding(
            padding: fifteenpxSymmetric,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 5,
                itemBuilder: (context, index) =>
                    const Center(child: WeatherWidget())),
          )),
    );
  }
}
