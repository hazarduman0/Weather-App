import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/custom_consumer_widget.dart';
import 'package:weather_app/ui/widgets/empty_info_widget.dart';

class VisibilityWidget extends StatelessWidget {
  const VisibilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomCosumerWidget(
        widget: visibilityWidget(size), loadingWidget: const EmptyInfoWidget());
  }

  Widget visibilityWidget(Size size) => Container(
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
                    const Icon(Icons.remove_red_eye_rounded,
                        size: 20.0, color: Colors.grey),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      'VISIBILITY',
                      style: sfPro600Weight.copyWith(
                          color: Colors.grey, fontSize: size.width * 0.04),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Consumer(
                  builder: (context, ref, child) {
                    final forecastInfo = ref.watch(cityAndDay);
                    final visibilityKm =
                        ref.watch(visibilityKmProvider(forecastInfo));
                    final visibilityKmString = visibilityKm!.floor().toString();
                    return Text('$visibilityKmString km',
                        style: sfPro500Weight.copyWith(
                            color: Colors.white, fontSize: size.width * 0.1));
                  },
                )
              ],
            )),
      );
}
