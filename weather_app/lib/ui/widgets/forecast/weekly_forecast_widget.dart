import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/core/helpers/icon_helper.dart';
import 'package:weather_app/data/models/day.dart';
import 'package:weather_app/ui/widgets/divider_widget.dart';
import 'package:weather_app/ui/widgets/forecast/weekly_listtile_widget.dart';

class WeeklyForecastWidget extends StatelessWidget {
  WeeklyForecastWidget(
      {super.key, required this.weeklyForecast, required this.physics});

  List<Map<String, Day>>? weeklyForecast;
  ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: ListView.separated(
          physics: physics,
          itemCount: weeklyForecast!.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return WeeklyListtileWidget(
                day: dayOfWeek(weeklyForecast![index].keys.first),
                weatherCondition: dayIconPath(conditionFormat(
                    weeklyForecast![index].values.first.condition!.text!))!,
                maxTemp: weeklyForecast![index].values.first.maxtempC!.floor(),
                minTemp: weeklyForecast![index].values.first.mintempC!.floor());
          },
          separatorBuilder: (context, index) {
            return DividerWidget(intent: size.width * 0.03);
          }),
    );
  }
}
