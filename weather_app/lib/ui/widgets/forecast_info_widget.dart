import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/core/helpers/icon_helper.dart';

class ForecastInfoWidget extends StatelessWidget {
  ForecastInfoWidget(
      {super.key,
      required this.hour,
      required this.condition,
      required this.temp,
      required this.isDay,
      required this.isNow
      });

  //ForecastWeather forecastWeather;
  String hour;
  String condition;
  num temp;
  bool isDay;
  bool isNow;

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.15,
      decoration: forecastInfoDecoration(isNow),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(isNow ? 'Now' : hour,
              style: sfPro600Weight.copyWith(fontSize: size.width * 0.04)),
          isDay
              ? SvgPicture.asset(dayIconPath(conditionFormat(condition))!,
                  height: size.width * 0.1, width: size.width * 0.1)
              : SvgPicture.asset(nightIconPath(conditionFormat(condition))!,
                  height: size.width * 0.1, width: size.width * 0.1),
          Text('$temp°',
              style: sfPro400Weight.copyWith(fontSize: size.width * 0.05))
        ],
      )),
    );
  }
}
