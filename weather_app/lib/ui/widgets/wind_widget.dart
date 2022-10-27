import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/custom_consumer_widget.dart';
import 'package:weather_app/ui/widgets/empty_info_widget.dart';
import 'package:weather_app/ui/widgets/svg_widget.dart';

class WindWidget extends StatelessWidget {
  const WindWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomCosumerWidget(
        widget: windWidget(size), loadingWidget: const EmptyInfoWidget());
  }

  Widget windWidget(Size size) => Container(
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
                    SvgWidget(svgPath: 'assets/weather_icons/windsock.svg'),
                    AutoSizeText(
                      'WIND',
                      style: sfPro600Weight.copyWith(
                          color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final forecastInfo = ref.watch(cityAndDay);
                    final direction =
                        ref.watch(windDirectionProvider(forecastInfo));
                    return AutoSizeText(direction ?? 'N/A',
                        style: sfPro600Weight.copyWith(fontSize: 25.0));
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final forecastInfo = ref.watch(cityAndDay);
                    final windSpeed = ref.watch(windKphProvider(forecastInfo));
                    return AutoSizeText(windSpeed.toString(),
                        style: sfPro800Weight.copyWith(fontSize: 30.0));
                  },
                ),
                //TODO: kph mph durumunu kontrol edecek satırları yaz
                AutoSizeText('kph',
                    style: sfPro800Weight.copyWith(fontSize: 25.0))
              ],
            )),
      );
}
