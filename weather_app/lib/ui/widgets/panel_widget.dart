import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_keys.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/core/helpers/icon_helper.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/ui/widgets/forecast/weekly_forecast_widget.dart';
import 'package:weather_app/ui/widgets/panel_components/feels_like_widget.dart';
import 'package:weather_app/ui/widgets/forecast/hourly_forecast_widget.dart';
import 'package:weather_app/ui/widgets/humidity_widget.dart';
import 'package:weather_app/ui/widgets/panel_components/sunrise_sunset_widget.dart';
import 'package:weather_app/ui/widgets/panel_components/uv_index_widget.dart';
import 'package:weather_app/ui/widgets/panel_components/visibility_widget.dart';
import 'package:weather_app/ui/widgets/forecast/weekly_listtile_widget.dart';
import 'package:weather_app/ui/widgets/panel_components/wind_widget.dart';
import 'package:intl/intl.dart';

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
    //log('panelwidget çizildi');
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
      child: TabBarView(children: [firstView(size), secondView(size)]));

  Widget firstView(Size size) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final today = ref.watch<Forecastday?>(todayData);
              final tomorrow = ref.watch<Forecastday?>(tomorrowData);
              log("today: $today");
              return HourlyForecastWidget(today: today, tomorrow: tomorrow);
            },
          ), //tabbarview oluştur
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

  Widget secondView(Size size) => Consumer(builder: (context, ref, child) {
        final weeklyForecast = ref.watch(weeklyForecastProvider);
        return WeeklyForecastWidget(
            weeklyForecast: weeklyForecast,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()));
      });

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
