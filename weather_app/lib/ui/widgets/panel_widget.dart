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
import 'package:weather_app/ui/widgets/humidity_widget.dart';
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
                hourlyForecastView(size), //tabbarview oluştur
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40.0),
                  child: Wrap(
                      spacing: size.width * 0.05,
                      runSpacing: size.width * 0.05,
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
            ),
          ),
        ),
      ),
    );
  }

  Widget hourlyForecastView(Size size) => Consumer(
        builder: (context, ref, child) {
          final forecastInfo = ref.watch(cityAndDay);
          final response = ref.watch(forecastWeatherResponse(forecastInfo));
          //bilgiler provider den mi yoksa üst widgetten mi alınsın değerlendir.
          //provider, scroll hareketinde ekranın yeniden çizilmesine neden oluyor.
          final forecastResponse = ref.watch(forecastProvider(forecastInfo));
          return response.map(
            data: (data) {
              List<Hour>? hourList = forecastHourFormar([
                forecastResponse!.forecastday!.first,
                forecastResponse.forecastday![1]
              ]);
              int currentHour = DateTime.now().hour;
              return SizedBox(
                //tabview
                height: size.height * 0.15,
                width: size.width,
                child: ListView.builder(
                  padding: weatherWidgetInformationHorizontalPadding(size),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      hourList!.length, //tabbar controllerine göre değer ver
                  itemBuilder: (context, index) {
                    DateTime dt = DateTime.parse(hourList[index].time!);
                    TimeOfDay formarHour = TimeOfDay(
                        hour: int.parse(dt.hour.toString()),
                        minute: int.parse('0'));

                    return Padding(
                        padding: forecastInfoWidgetHorizontalPadding(size),
                        child: ForecastInfoWidget(
                          condition: hourList[index].condition!.text!,
                          hour:
                              formarHour.format(context).replaceAll(':00', ''),
                          temp: hourList[index].tempC!.floor(),
                          isDay: hourList[index].isDay == 1,
                          isNow: dt.hour == currentHour,
                        ));
                  },
                ),
              );
            },
            error: (error) => Text('Something went wrong. Error: $error'),
            loading: (loading) => loadingInfo(size),
          );
        },
      );

  Widget tabBarBuild(Size size) => TabBar(
      labelStyle: sfPro600Weight.copyWith(fontSize: size.width * 0.04),
      labelColor: darkSecondary,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const BoxDecoration(
        gradient: tabIndicatorGradient,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      indicatorWeight: 0,
      indicatorPadding: const EdgeInsets.only(top: 45), //size.height * 0.055
      tabs: const [Tab(text: hourlyForecast), Tab(text: weeklyForecast)]);

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

  Widget loadingInfo(Size size) => SizedBox(
        //tabview
        height: size.height * 0.15,
        width: size.width,
        child: ListView.builder(
          padding: weatherWidgetInformationHorizontalPadding(size),
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
                padding: forecastInfoWidgetHorizontalPadding(size),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.15,
                  decoration: forecastInfoDecoration(false),
                ));
          },
        ),
      );

  //void tooglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();
}
