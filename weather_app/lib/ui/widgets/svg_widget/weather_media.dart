import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/icon_helper.dart';
import 'package:weather_app/ui/widgets/svg_widget/svg_widget.dart';

class WeatherMedia extends StatelessWidget {
   WeatherMedia({super.key, required this.isDay, required this.condition, required this.boxSize});

  bool isDay;
  String condition;
  double boxSize;

  @override
  Widget build(BuildContext context) {
    return isDay
      ? SvgWidget(
          svgPath: dayIconPath(conditionFormat(condition))!, boxSize: boxSize)
      : SvgWidget(
          svgPath: nightIconPath(conditionFormat(condition))!, boxSize: boxSize);
  }
}