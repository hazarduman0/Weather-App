import 'dart:ui' as ui;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_paddings.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/ui/widgets/svg_widget/weather_media.dart';

class WeatherWidget extends StatelessWidget {
   WeatherWidget({super.key, required this.temp, required this.condition, required this.name, required this.isDay});

  String temp;
  String condition;
  String name;
  bool isDay;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.6116959064327485,
      width: size.width,
      child: Stack(
        children: [
          CustomPaint(
            size:
                Size(size.width, (size.width * 0.5116959064327485).toDouble()),
            painter: WeatherTrapezoid(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: (size.width * 0.5116959064327485) * 0.9,
              width: size.width,
              child: Padding(
                padding: weatherWidgetInnerPadding(size),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: ((size.width * 0.5116959064327485) * 0.9) * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(temp,
                              style: sfPro400Weight.copyWith(fontSize: 60.0)),
                          WeatherMedia(isDay: isDay, condition: condition, boxSize: size.width * 0.5116959064327485 * 0.9 * 0.7)
                        ],
                      ),
                    ),
                    SizedBox(
                        height:
                            ((size.width * 0.5116959064327485) * 0.9) * 0.24,
                        child: Padding(
                          padding:
                              weatherWidgetInformationHorizontalPadding(size),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(name,
                                  style:
                                      sfPro300Weight.copyWith(fontSize: 25.0)),
                              AutoSizeText(condition,
                                  style:
                                      sfPro600Weight.copyWith(fontSize: 20.0))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WeatherTrapezoid extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.3796549);
    path_0.cubicTo(0, size.height * 0.1808314, 0, size.height * 0.08141943,
        size.width * 0.03311696, size.height * 0.02994537);
    path_0.cubicTo(
        size.width * 0.06623363,
        size.height * -0.02152880,
        size.width * 0.1157971,
        size.height * 0.0008455886,
        size.width * 0.2149243,
        size.height * 0.04559434);
    path_0.lineTo(size.width * 0.9003012, size.height * 0.3549931);
    path_0.cubicTo(
        size.width * 0.9481257,
        size.height * 0.3765817,
        size.width * 0.9720351,
        size.height * 0.3873766,
        size.width * 0.9860175,
        size.height * 0.4217320);
    path_0.cubicTo(size.width, size.height * 0.4560880, size.width,
        size.height * 0.5040491, size.width, size.height * 0.5999714);
    path_0.lineTo(size.width, size.height * 0.7485714);
    path_0.cubicTo(
        size.width,
        size.height * 0.8670971,
        size.width,
        size.height * 0.9263600,
        size.width * 0.9811579,
        size.height * 0.9631771);
    path_0.cubicTo(size.width * 0.9623187, size.height, size.width * 0.9319942,
        size.height, size.width * 0.8713450, size.height);
    path_0.lineTo(size.width * 0.1286550, size.height);
    path_0.cubicTo(
        size.width * 0.06800643,
        size.height,
        size.width * 0.03768216,
        size.height,
        size.width * 0.01884108,
        size.height * 0.9631771);
    path_0.cubicTo(0, size.height * 0.9263600, 0, size.height * 0.8670971, 0,
        size.height * 0.7485714);
    path_0.lineTo(0, size.height * 0.3796549);
    path_0.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(Offset(0, size.height * 0.7314286),
        Offset(size.width * 1.035503, size.height * 0.7314286), [
      const Color(0xff5936B4).withOpacity(1),
      const Color(0xff362A84).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
