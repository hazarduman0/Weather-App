import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/ui/widgets/svg_widget.dart';

class WeeklyListtileWidget extends StatelessWidget {
  WeeklyListtileWidget(
      {super.key,
      required this.day,
      required this.weatherCondition,
      required this.maxTemp,
      required this.minTemp});

  String day;
  String weatherCondition;
  int maxTemp;
  int minTemp;

  double fontSize = 20.0;
  double maxFontSize = 50.0;
  double rightPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.3,
              child: AutoSizeText(day,
                  style: sfPro400Weight.copyWith(fontSize: fontSize),
                  maxFontSize: maxFontSize),
            ),
            const Spacer(
              flex: 1
            ),
            SvgWidget(
                svgPath: weatherCondition, boxSize: size.longestSide * 0.04),
            const Spacer(flex: 2),
            SizedBox(
              width: size.width * 0.2,
              child: Center(
                child: AutoSizeText(maxTemp.toString(),
                    style: sfPro500Weight.copyWith(fontSize: fontSize),
                    maxFontSize: maxFontSize),
              ),
            ),
            const Spacer(flex: 1),
            SizedBox(
              width: size.width * 0.2,
              child: Center(
                child: AutoSizeText(minTemp.toString(),
                    style: sfPro500Weight.copyWith(fontSize: fontSize),
                    maxFontSize: maxFontSize),
              ),
            )
          ],
        ),
      ),
    );
  }
}
