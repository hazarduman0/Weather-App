import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/data/models/condation.dart';
import 'package:weather_app/data/models/current.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/custom_consumer_widget.dart';
import 'package:weather_app/ui/widgets/panel_widget.dart';

class CurrentLocationWeatherPage extends ConsumerWidget {
  CurrentLocationWeatherPage({super.key});

  //var map = const {'London': 7};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('CurrentLocationWeatherPage çizildi');
    Size size = MediaQuery.of(context).size;
    final controllerWatch = ref.watch<AppPageController>(appPageControllerProvider);
    final controllerRead = ref.read<AppPageController>(appPageControllerProvider);
    //final response = ref.watch(currentWeatherResponse('London'));

    return SizedBox(
      height: size.height,
      width: size.width,
      child: SlidingUpPanel(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.2),
            CustomCosumerWidget(
                widget: weatherInformationTexts(size),
                loadingWidget: const CircularProgressIndicator())
          ],
        ),
        color: Colors.black.withOpacity(0.3),
        controller: controllerWatch.panelController,
        backdropTapClosesPanel: true,
        // minHeight: !controllerWatch.pageViewController.hasClients
        //     ? size.height * (0.3)
        //     : size.height * (0.3),
        //minHeight: panelMinHeightFormar(controllerWatch.pageViewController, size, (){controllerRead.update();}),
        //minHeight: controllerWatch.panelMinHeight,
        minHeight: size.height * (0.3),
        maxHeight: size.height * 0.8,
        parallaxEnabled: true,
        parallaxOffset: .5,
        panelSnapping: true,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        panelBuilder: (sc) => PanelWidget(
          controller: sc,
          panelController: controllerWatch.panelController,
          //forecastday: response.value?.forecast?.forecastday ,
        ),
      ),
    );
  }
}

Widget weatherInformationTexts(Size size) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final forecastInfo = ref.watch(cityAndDay);
            final locationResponse =
                ref.watch<Location?>(locationProvider(forecastInfo));
            return Text(locationResponse!.name!,
                style: sfPro400Weight.copyWith(fontSize: size.width * 0.07));
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final forecastInfo = ref.watch(cityAndDay);
            final currentResponse =
                ref.watch<Current?>(currentProvider(forecastInfo));
            return Text(
              '${currentResponse!.tempC!.floor().toString()}°',
              style: sfPro200Weight.copyWith(fontSize: size.width * 0.16),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return Consumer(
              builder: (context, ref, child) {
                final forecastInfo = ref.watch(cityAndDay);
                final conditionResponse =
                    ref.watch<Condition?>(conditionProvider(forecastInfo));
                return Text(
                  conditionResponse!.text!,
                  style: sfPro600Weight.copyWith(fontSize: size.width * 0.05),
                );
              },
            );
          },
        ),
      ],
    );

    // response.map(
    //         data: (data) => Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Text(data.value!.location!.name!,
    //                     style: sfPro400Weight.copyWith(
    //                         fontSize: size.width * 0.07)),
    //                 Text(
    //                   '${data.value!.current!.tempC!.floor().toString()}°',
    //                   style:
    //                       sfPro200Weight.copyWith(fontSize: size.width * 0.16),
    //                 ),
    //                 Text(
    //                   data.value!.current!.condition!.text!,
    //                   style:
    //                       sfPro600Weight.copyWith(fontSize: size.width * 0.05),
    //                 ),
    //               ],
    //             ),
    //         error: (error) => Text('Something went wrong. Error: $error'),
    //         loading: (loading) => const CircularProgressIndicator());
