import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/custom_consumer_widget.dart';
import 'package:weather_app/ui/widgets/empty_info_widget.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomCosumerWidget(
        widget: sunStatus(size), loadingWidget: const EmptyInfoWidget());
  }

  Widget sunStatus(Size size) => Container(
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
              Consumer(
                builder: (context, ref, child) {
                  final forecastInfo = ref.watch(cityAndDay);
                  final sunrise = ref.watch(sunRiseProvider(forecastInfo));
                  return Text(
                    sunrise!,
                    style: sfPro600Weight.copyWith(
                        color: Colors.white, fontSize: size.width * 0.07),
                  );
                },
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
              Consumer(
                builder: (context, ref, child) {
                  final forecastInfo = ref.watch(cityAndDay);
                  final sunset = ref.watch(sunSetProvider(forecastInfo));
                  return Text(
                    sunset!,
                    style: sfPro600Weight.copyWith(
                        color: Colors.white, fontSize: size.width * 0.07),
                  );
                },
              ),
            ],
          ),
        ),
      );
}
