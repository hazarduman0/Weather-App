import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';

class FeelsLikeWidget extends StatelessWidget {
  const FeelsLikeWidget({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/weather_icons/thermometer.svg',
                  height: 30.0,
                  width: 30.0,
                ),
                Text(
                  'FEELS LIKE',
                  style: sfPro600Weight.copyWith(
                      color: Colors.grey, fontSize: size.width * 0.04),
                )
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Text('19 °C',style: sfPro500Weight.copyWith(color: Colors.white, fontSize: size.width * 0.12))
          ],
        ),
      ),
    );
  }
}
