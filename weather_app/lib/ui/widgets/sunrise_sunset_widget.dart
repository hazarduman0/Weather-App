import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.42,
      width: size.width * 0.42,
      decoration: curretDataWidgetsDecorations,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              SvgPicture.asset(
                'assets/weather_icons/sunrise.svg',
                height: 30.0,
                width: 30.0,
              ),
              Text('SUNRISE',
                  style: sfPro600Weight.copyWith(
                      color: Colors.grey, fontSize: size.width * 0.04))
            ]),
            Text(
              '5:28 AM',
              style: sfPro600Weight.copyWith(
                  color: Colors.white, fontSize: size.width * 0.07),
            ),
            Row(children: [
              SvgPicture.asset(
                'assets/weather_icons/sunset.svg',
                height: 30.0,
                width: 30.0,
              ),
              Text('SUNSET',
                  style: sfPro600Weight.copyWith(
                      color: Colors.grey, fontSize: size.width * 0.04))
            ]),
            Text(
              '7:25 PM',
              style: sfPro600Weight.copyWith(
                  color: Colors.white, fontSize: size.width * 0.07),
            )
          ],
        ),
      ),
    );
  }
}
