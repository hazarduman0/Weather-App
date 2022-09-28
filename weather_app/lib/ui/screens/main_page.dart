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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: backgroundDecoration,
          height: size.height,
          width: size.width,
          child: Padding(
            padding: weatherWidgetPadding(size),
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
