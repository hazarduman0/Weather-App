import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/ui/widgets/svg_widget.dart';

class HumidityWidget extends StatelessWidget {
  const HumidityWidget({super.key});

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
                SvgWidget(svgPath: 'assets/weather_icons/humidity.svg'),
                AutoSizeText(
                  'HUMIDITY',
                  style: sfPro600Weight.copyWith(
                      color: Colors.grey, fontSize: 16.0),
                )
              ],
            ),
            SizedBox(height: size.height * 0.02),
            AutoSizeText('90%',
                style: sfPro500Weight.copyWith(
                    color: Colors.white, fontSize: 45.0))
          ],
        ),
      ),
    );
  }
}
