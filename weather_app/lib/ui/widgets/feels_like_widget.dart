import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/custom_consumer_widget.dart';
import 'package:weather_app/ui/widgets/empty_info_widget.dart';

class FeelsLikeWidget extends StatelessWidget {
  const FeelsLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomCosumerWidget(
        widget: feelsLike(size), loadingWidget: const EmptyInfoWidget());
  }

  Widget feelsLike(Size size) => Container(
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
              Consumer(
                builder: (context, ref, child) {
                  final forecastInfo = ref.watch(cityAndDay);
                  final feelsLikeC =
                      ref.watch(feelsLikeCProvider(forecastInfo));
                  // TODO: C ile F farkını ayıracak satırları yaz
                  final feelsLikeString = feelsLikeC!.floor().toString();
                  return Text('$feelsLikeString °C',
                      style: sfPro500Weight.copyWith(
                          color: Colors.white, fontSize: size.width * 0.12));
                },
              )
            ],
          ),
        ),
      );
}
