import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/core/helpers/icon_helper.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/providers/temp_provider.dart';
import 'package:weather_app/ui/widgets/consumer/temp_consumer_widget.dart';
import 'package:weather_app/ui/widgets/forecast/hourly_forecast_widget.dart';
import 'package:weather_app/ui/widgets/loading/new_location_loading.dart';
import 'package:weather_app/ui/widgets/forecast/weekly_listtile_widget.dart';

class SearchDetail extends StatelessWidget {
  SearchDetail({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: Container(
          height: size.height,
          width: size.width,
          decoration: showModalDecoration(size),
          child: TempConsumerWidget(
              widget: searchDetail(size, context),
              loadingWidget: const NewLocationPageLoading(),
              name: name)),
    );
  }

  Widget searchDetail(Size size, BuildContext context) => Column(
        children: [
          addCancelRow(context),
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
                  //title: const HourlyForecastWidget(), // TempHourlyWidget(name: searchModel.name!)
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: 7,
                  (context, index) {
                    return WeeklyListtileWidget(
                        day: 'Monday',
                        weatherCondition: weatherIconAssetPath('clear-day'),
                        maxTemp: 26,
                        minTemp: 23);
                  },
                )),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      conta(size),
                      conta(size),
                      conta(size),
                      conta(size),
                      conta(size),
                      conta(size),
                      conta(size),
                      conta(size),
                      conta(size),
                      conta(size)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );

  Widget addCancelRow(BuildContext context) => Row(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const AutoSizeText('Cancel')),
          const Spacer(),
          TextButton(onPressed: () {}, child: const AutoSizeText('Add'))
        ],
      );

  Widget conta(Size size) => Container(
        height: size.height * 0.1,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: solidColor5, width: 5.0)),
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
            final maxMinInfo = ref.watch(tempMaxMinTemperature(SearchParams(name: name, day: 8)));
            return AutoSizeText('H:${maxMinInfo.first} L:${maxMinInfo[1]}',
                style: sfPro500Weight.copyWith(fontSize: 15.0));
          })
        ],
      );
}
