import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/panel_widget.dart';

class CurrentLocationWeatherPage extends ConsumerWidget {
  const CurrentLocationWeatherPage({super.key});

  //final panelController = PanelController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final controllerWatch = ref.watch<AppPageController>(appPageController);
    final controllerRead = ref.read<AppPageController>(appPageController);
    final response = ref.watch(currentWeatherResponse('London'));
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SlidingUpPanel(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.2),
            response.map(
                data: (data) => weatherInformationTexts(
                    size,
                    data.value!.location!.name!,
                    data.value!.current!.tempC!.toString(),
                    data.value!.current!.condition!.text!),
                error: (error) => Text('Something went wrong. Error: $error'),
                loading: (loading) => const CircularProgressIndicator())
          ],
        ),
        color: Colors.black.withOpacity(0.3),
        controller: controllerWatch.panelController,
        backdropTapClosesPanel: true,
        minHeight: size.height * 0.3,
        maxHeight: size.height * 0.8,
        parallaxEnabled: true,
        parallaxOffset: .5,
        panelSnapping: true,

        // onPanelSlide: (position) {
        //   //log(position.toString());
        //   if (position == 1) {
        //     controllerRef.openPanel();
        //   } else if (position == 0) {
        //     controllerRef.closePanel();
        //   }
        // },

        onPanelOpened: () {
          controllerRead.openPanel();
        },

        onPanelClosed: () {
          controllerRead.closePanel();
        },

        // onPanelClosed: controllerRef.panelController.isAttached &&
        //         controllerRef.panelController.isPanelClosed
        //     ? () {
        //         log('Kapandı Fonksiyon');
        //         controllerRef.closePanel();
        //       }
        //     : () {
        //         log('Açıldı Fonksiyon');
        //         controllerRef.openPanel();
        //       },

        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        panelBuilder: (sc) => PanelWidget(
          controller: sc,
          panelController: controllerWatch.panelController,
        ),
      ),
    );
  }
}

Widget weatherInformationTexts(
        Size size, String district, String temp, String condition) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(district,
            style: sfPro400Weight.copyWith(fontSize: size.width * 0.07)),
        Text(
          '$temp°',
          style: sfPro200Weight.copyWith(fontSize: size.width * 0.16),
        ),
        Text(
          condition,
          style: sfPro600Weight.copyWith(fontSize: size.width * 0.05),
        ),
      ],
    );
