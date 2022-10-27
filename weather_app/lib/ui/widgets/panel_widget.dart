import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_keys.dart';
import 'package:weather_app/core/constants/app_paddings.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/data/models/hour.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/feels_like_widget.dart';
import 'package:weather_app/ui/widgets/forecast_info_widget.dart';
import 'package:weather_app/ui/widgets/hourly_forecast_widget.dart';
import 'package:weather_app/ui/widgets/humidity_widget.dart';
import 'package:weather_app/ui/widgets/loading_info_widget.dart';
import 'package:weather_app/ui/widgets/sunrise_sunset_widget.dart';
import 'package:weather_app/ui/widgets/uv_index_widget.dart';
import 'package:weather_app/ui/widgets/visibility_widget.dart';
import 'package:weather_app/ui/widgets/wind_widget.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  PanelWidget({
    super.key,
    required this.controller,
    required this.panelController,
  });

  @override
  Widget build(BuildContext context) {
    log('panelwidget çizildi');
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            decoration: slideUpDecoration,
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: controller,
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: size.height * 0.02),
                buildDragHandle(),
                SizedBox(height: size.height * 0.02),
                tabBarBuild(size),
                const Divider(),
                SizedBox(height: size.height * 0.02),
                tabBarView(size)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabBarBuild(Size size) => TabBar(

      labelStyle: sfPro600Weight.copyWith(fontSize: size.longestSide * 0.02),
      labelColor: darkSecondary,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const BoxDecoration(
        gradient: tabIndicatorGradient,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      indicatorWeight: 0,
      indicatorPadding: const EdgeInsets.only(top: 45), //size.height * 0.055
      tabs: const [Tab(text: hourlyForecast), Tab(text: weeklyForecast)]);

  Widget tabBarView(Size size) => SizedBox(
    height: size.height,
    width: size.width,
    child: TabBarView(children: [firstView(size), Container(height: 100,width: 100,color: Colors.green)]));

  Widget firstView(Size size) => Column(
    mainAxisSize: MainAxisSize.min,
        children: [
          const HourlyForecastWidget(), //tabbarview oluştur
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
            child: Wrap(
                spacing: size.width * 0.03,
                runSpacing: size.width * 0.03,
                children: const [
                  UvIndexWidget(),
                  SunriseSunsetWidget(),
                  WindWidget(),
                  FeelsLikeWidget(),
                  VisibilityWidget(),
                  HumidityWidget()
                ]),
          )
        ],
      );

  Widget buildDragHandle() => Consumer(
        builder: (context, ref, child) {
          final controllerRef =
              ref.watch<AppPageController>(appPageControllerProvider);
          return GestureDetector(
            onTap: () {
              controllerRef.tooglePanel();
            },
            child: Center(
              child: Container(
                height: 5.0,
                width: 30.0,
                decoration: dragHandleDecoration,
              ),
            ),
          );
        },
      );

  //void tooglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();
}
