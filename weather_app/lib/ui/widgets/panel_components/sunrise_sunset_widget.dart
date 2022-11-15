import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/ui/widgets/svg_widget/svg_widget.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.width * 0.42,
        width: size.width * 0.42,
        constraints: const BoxConstraints(maxWidth: 250.0, maxHeight: 250.0),
        decoration: curretDataWidgetsDecorations,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                SvgWidget(svgPath: 'assets/weather_icons/sunrise.svg'),
                AutoSizeText('SUNRISE',
                    style: sfPro600Weight.copyWith(
                        color: Colors.grey, fontSize: 16.0),
                    maxFontSize: 25.0)
              ]),
              Consumer(
                builder: (context, ref, child) {
                  final sunrise = ref.watch(sunriseProvider);
                  return AutoSizeText(sunrise!,
                      style: sfPro600Weight.copyWith(
                          color: Colors.white, fontSize: 25.0));
                },
              ),
              Row(children: [
                SvgWidget(svgPath: 'assets/weather_icons/sunset.svg'),
                AutoSizeText('SUNSET',
                    style: sfPro600Weight.copyWith(
                        color: Colors.grey, fontSize: 16.0))
              ]),
              Consumer(
                builder: (context, ref, child) {
                  final sunset = ref.watch(sunsetProvider);
                  return AutoSizeText(
                    sunset!,
                    style: sfPro600Weight.copyWith(
                        color: Colors.white, fontSize: 25.0),
                  );
                },
              ),
            ],
          ),
        ),
      );
  }
}
