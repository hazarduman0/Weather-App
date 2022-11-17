import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/data/providers/temp_provider.dart';
import 'package:weather_app/ui/widgets/consumer/temp_consumer_widget.dart';
import 'package:weather_app/ui/widgets/detail/detail_info.dart';
import 'package:weather_app/ui/widgets/divider_widget.dart';
import 'package:weather_app/ui/widgets/forecast/hourly_forecast_widget.dart';
import 'package:weather_app/ui/widgets/forecast/weekly_forecast_widget.dart';
import 'package:weather_app/ui/widgets/loading/detail_loading.dart';

class WeatherDetail extends StatelessWidget {
  WeatherDetail(
      {super.key,
      required this.name,
      required this.decoration,
      required this.header,
      required this.height,
      required this.search});

  String name;
  double height;
  Widget header;
  bool search;
  BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: height,
        width: size.width,
        decoration: decoration,
        child: TempConsumerWidget(
            widget: searchDetail(size, context),
            loadingWidget: DetailPageLoading(height: height, search: search),
            name: name));
  }

  Widget searchDetail(Size size, BuildContext context) => Column(
        children: [
          header,
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  title: titleWidget,
                  toolbarHeight: size.height * 0.2,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: size.height * 0.18,
                  pinned: true,
                  backgroundColor: solidColor5,
                  title: Consumer(
                    builder: (context, ref, child) {
                      final today = ref.watch<Forecastday?>(
                          tempTodayData(SearchParams(name: name, day: 8)));
                      final tomorrow = ref.watch<Forecastday?>(
                          tempTomorrowData(SearchParams(name: name, day: 8)));
                      return HourlyForecastWidget(
                          today: today, tomorrow: tomorrow);
                    },
                  ),
                ),
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: size.height * 0.5,
                  pinned: false,
                  backgroundColor: solidColor5,
                  title: Consumer(
                    builder: (context, ref, child) {
                      final weeklyForecast = ref.watch(
                          tempWeeklyForecastProvider(
                              SearchParams(name: name, day: 8)));
                      return WeeklyForecastWidget(
                          weeklyForecast: weeklyForecast,
                          physics: const NeverScrollableScrollPhysics());
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: DividerWidget(intent: 0.0),
                ),
                SliverToBoxAdapter(
                  child: Wrap(
                    children: [
                      Consumer(builder: (context, ref, child) {
                        final sunrise = ref.watch(
                            tempSunrise(SearchParams(name: name, day: 8)));
                        return DetailInfoWidget(
                            status: 'SUNRISE', value: sunrise ?? '--');
                      }),
                      Consumer(builder: (context, ref, child) {
                        final sunset = ref.watch(
                            tempSunset(SearchParams(name: name, day: 8)));
                        return DetailInfoWidget(
                            status: 'SUNSET', value: sunset ?? '--');
                      }),
                      DividerWidget(intent: size.width * 0.03),
                      Consumer(builder: (context, ref, child) {
                        final humidity = ref.watch(
                            tempHumidity(SearchParams(name: name, day: 8)));
                        return DetailInfoWidget(
                            status: 'HUMIDITY', value: humidity ?? '--');
                      }),
                      Consumer(builder: (context, ref, child) {
                        final wind = ref
                            .watch(tempWind(SearchParams(name: name, day: 8)));
                        return DetailInfoWidget(
                            status: 'WIND', value: wind ?? '--');
                      }),
                      DividerWidget(intent: size.width * 0.03),
                      Consumer(builder: (context, ref, child) {
                        final feelsLike = ref.watch(
                            tempFeelsLike(SearchParams(name: name, day: 8)));
                        return DetailInfoWidget(
                            status: 'FEELSLIKE', value: feelsLike ?? '--');
                      }),
                      Consumer(builder: (context, ref, child) {
                        final visibility = ref.watch(
                            tempVisibilityKm(SearchParams(name: name, day: 8)));
                        return DetailInfoWidget(
                            status: 'VISIBILITY', value: visibility ?? '--');
                      }),
                      DividerWidget(intent: size.width * 0.03),
                      Consumer(builder: (context, ref, child) {
                        final uv =
                            ref.watch(tempUv(SearchParams(name: name, day: 8)));
                        return DetailInfoWidget(
                            status: 'UV', value: uv ?? '--');
                      }),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );

  Widget get titleWidget => Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final locationName =
                ref.watch(tempLocationName(SearchParams(name: name, day: 8)));
            return AutoSizeText(locationName ?? '--',
                style: sfPro500Weight.copyWith(fontSize: 30.0));
          }),
          Consumer(builder: (context, ref, child) {
            final conditionText = ref.watch(
                tempConditionStatusText(SearchParams(name: name, day: 8)));
            return AutoSizeText(conditionText ?? '--',
                style: sfPro500Weight.copyWith(fontSize: 15.0));
          }),
          Consumer(builder: (context, ref, child) {
            final tempText = ref
                .watch(tempTemperatureText(SearchParams(name: name, day: 8)));
            return AutoSizeText(tempText ?? '--',
                style: sfPro500Weight.copyWith(fontSize: 35.0));
          }),
          Consumer(builder: (context, ref, child) {
            final maxMinInfo = ref
                .watch(tempMaxMinTemperature(SearchParams(name: name, day: 8)));
            return AutoSizeText('H:${maxMinInfo.first} L:${maxMinInfo[1]}',
                style: sfPro500Weight.copyWith(fontSize: 15.0));
          })
        ],
      );
}
