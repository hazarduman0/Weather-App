import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/svg_widget/svg_widget.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black.withOpacity(0.5),
      child: Align(
          alignment: Alignment.center,
          child: SvgWidget(
              svgPath: 'assets/weather_icons/overcast-day.svg',
              boxSize: size.shortestSide * 0.3)),
    );
  }
}
