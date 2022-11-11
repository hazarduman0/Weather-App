import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/ui/widgets/consumer/custom_consumer_widget.dart';
import 'package:weather_app/ui/widgets/loading/empty_info_widget.dart';

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
        constraints: const BoxConstraints(maxWidth: 250.0,maxHeight: 250.0),
        decoration: curretDataWidgetsDecorations,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //TODO: Svg widgetteki size ye uydur.
                    const Icon(Icons.remove_red_eye_rounded,
                        size: 20.0, color: Colors.grey),
                    SizedBox(width: size.width * 0.01),
                    AutoSizeText(
                      'VISIBILITY',
                      style: sfPro600Weight.copyWith(
                          color: Colors.grey, fontSize: 16.0),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Consumer(
                  builder: (context, ref, child) {
                    final visibilityKm =
                        ref.watch(visibilityKmProvider);
                    final visibilityKmString = visibilityKm!.floor().toString();
                    return AutoSizeText('$visibilityKmString km',
                        style: sfPro500Weight.copyWith(
                            color: Colors.white, fontSize: 40.0));
                  },
                )
              ],
            )),
      );
}
