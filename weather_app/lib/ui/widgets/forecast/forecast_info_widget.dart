import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/core/helpers/icon_helper.dart';
import 'package:weather_app/ui/widgets/svg_widget/svg_widget.dart';
import 'package:weather_app/ui/widgets/svg_widget/weather_media.dart';

class ForecastInfoWidget extends StatelessWidget {
  ForecastInfoWidget(
      {super.key,
      required this.hour,
      required this.condition,
      required this.temp,
      required this.isDay,
      required this.isNow});

  String hour;
  String condition;
  num temp;
  bool isDay;
  bool isNow;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 2,
      child: Container(
        decoration: forecastInfoDecoration(isNow),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              isNow ? 'Now' : hour,
              style: sfPro600Weight.copyWith(fontSize: 15.0),
              maxFontSize: 15.0,
            ),
            WeatherMedia(isDay: isDay, condition: condition, boxSize: 45.0),
            AutoSizeText('$temp°',
                style: sfPro400Weight.copyWith(fontSize: 19), maxFontSize: 19.0)
          ],
        )),
      ),
    );
  }
}
