import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_paddings.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 200,
      width: 342,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(342, 175),
            painter: WeatherTrapezoid(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 184,
              width: 342,
              child: Padding(
                padding: weatherWidgetPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 130.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('23º',
                              style: largeTitle.copyWith(fontSize: 60.0)),
                          SvgPicture.asset(
                            'assets/weather_icons/clear-day.svg',
                            height: 130.0,
                            width: 130.0,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 44.0,
                        child: Padding(
                          padding: fifteenpxHorizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('London', style: title2),
                              Text('Sunny', style: title3)
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
    path_0.moveTo(0, 66.4396);
    path_0.cubicTo(0, 31.6455, 0, 14.2484, 11.326, 5.24044);
    path_0.cubicTo(22.6519, -3.76754, 39.6026, 0.147978, 73.5041, 7.97901);
    path_0.lineTo(307.903, 62.1238);
    path_0.cubicTo(324.259, 65.9018, 332.436, 67.7909, 337.218, 73.8031);
    path_0.cubicTo(342, 79.8154, 342, 88.2086, 342, 104.995);
    path_0.lineTo(342, 131);
    path_0.cubicTo(342, 151.742, 342, 162.113, 335.556, 168.556);
    path_0.cubicTo(329.113, 175, 318.742, 175, 298, 175);
    path_0.lineTo(44, 175);
    path_0.cubicTo(23.2582, 175, 12.8873, 175, 6.44365, 168.556);
    path_0.cubicTo(0, 162.113, 0, 151.742, 0, 131);
    path_0.lineTo(0, 66.4396);
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
