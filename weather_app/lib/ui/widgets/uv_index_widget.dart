import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/custom_consumer_widget.dart';
import 'package:weather_app/ui/widgets/custom_linear_progress_widget.dart';
import 'package:weather_app/ui/widgets/empty_info_widget.dart';
import 'package:weather_app/ui/widgets/svg_widget.dart';

class UvIndexWidget extends StatelessWidget {
  const UvIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomCosumerWidget(
        widget: uvWidget(size), loadingWidget: const EmptyInfoWidget());
  }

  Widget uvWidget(Size size) => Container(
        height: size.width * 0.42,
        width: size.width * 0.42,
        constraints: const BoxConstraints(maxWidth: 250.0,maxHeight: 250.0),
        decoration: curretDataWidgetsDecorations,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgWidget(svgPath: 'assets/weather_icons/uv-index.svg'),
                    AutoSizeText(
                      'UV INDEX',
                      style: sfPro600Weight.copyWith(
                          color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final forecastInfo = ref.watch(cityAndDay);
                    final uvResponse = ref.watch(uvProvider(forecastInfo));
                    return AutoSizeText(uvResponse!.floor().toString(),
                        style: sfPro400Weight.copyWith(
                            color: Colors.white, fontSize: 37.0));
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final forecastInfo = ref.watch(cityAndDay);
                    final uvResponse = ref.watch(uvProvider(forecastInfo));
                    return AutoSizeText(uvStatus(uvResponse!),
                        style: sfPro400Weight.copyWith(
                            color: Colors.white, fontSize: 20.0));
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final forecastInfo = ref.watch(cityAndDay);
                    final uvResponse = ref.watch(uvProvider(forecastInfo));
                    final numString = uvResponse!.floor().toString();
                    return CustomLinearProgress(uv: int.parse(numString));
                  },
                )
              ],
            )),
      );
}
