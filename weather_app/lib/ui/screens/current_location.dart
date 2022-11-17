import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/notifiers/app_page_notifier.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/data/models/condation.dart';
import 'package:weather_app/data/models/current.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/ui/widgets/consumer/custom_consumer_widget.dart';
import 'package:weather_app/ui/widgets/loading/current_loading.dart';
import 'package:weather_app/ui/widgets/panel_widget.dart';

class CurrentLocationWeatherPage extends StatelessWidget {
  const CurrentLocationWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCosumerWidget(
        widget: locationPage(context), loadingWidget: const CurrentLocation());
  }

  Widget locationPage(BuildContext context) =>
      Consumer(builder: (context, ref, child) {
        Size size = MediaQuery.of(context).size;
        final controllerWatch =
            ref.watch<AppPageController>(appPageControllerProvider);
        final controllerRead =
            ref.read<AppPageController>(appPageControllerProvider);

        return SizedBox(
          height: size.height,
          width: size.width,
          child: SlidingUpPanel(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.2),
                weatherInformationTexts(size)
              ],
            ),
            color: Colors.black.withOpacity(0.3),
            controller: controllerWatch.panelController,
            backdropTapClosesPanel: true,
            minHeight: size.height * (0.3),
            maxHeight: size.height * 0.8,
            parallaxEnabled: true,
            parallaxOffset: .5,
            panelSnapping: true,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30.0)),
            panelBuilder: (sc) => PanelWidget(
              controller: sc,
              panelController: controllerWatch.panelController,
            ),
          ),
        );
      });
}

Widget weatherInformationTexts(Size size) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final locationResponse = ref.watch<Location?>(locationProvider);
            return AutoSizeText(locationResponse?.name ?? '--',
                style: sfPro400Weight.copyWith(fontSize: 30.0));
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final currentResponse = ref.watch<Current?>(currentProvider);
            return AutoSizeText(
              '${currentResponse?.tempC?.floor().toString() ?? '--'}°',
              style: sfPro200Weight.copyWith(fontSize: 70.0),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return Consumer(
              builder: (context, ref, child) {
                final conditionResponse =
                    ref.watch<Condition?>(conditionProvider);
                return AutoSizeText(
                  conditionResponse?.text ?? '--',
                  style: sfPro600Weight.copyWith(fontSize: 25.0),
                );
              },
            );
          },
        ),
      ],
    );
