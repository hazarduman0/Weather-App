import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/core/helpers/icon_helper.dart';
import 'package:weather_app/data/models/main_models/weather_forecast.dart';

class ForecastInfoWidget extends StatelessWidget {
  ForecastInfoWidget({super.key});

  //ForecastWeather forecastWeather;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.15,
      decoration: forecastInfoDecoration(0.2, 0.1),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('12 AM',
              style: sfPro600Weight.copyWith(fontSize: size.width * 0.04)),
          SvgPicture.asset(nightIconPath(conditionFormat('Clear'))!, // gündüz gece kontrolü yap uygun fonksiyonun çalışmasını sağla
              height: size.width * 0.1, width: size.width * 0.1),
          Text('19°',
              style: sfPro400Weight.copyWith(fontSize: size.width * 0.05))
        ],
      )),
    );
  }
}
