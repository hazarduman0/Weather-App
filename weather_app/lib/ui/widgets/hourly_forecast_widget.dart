

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_paddings.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/data/models/hour.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/forecast_info_widget.dart';
import 'package:weather_app/ui/widgets/loading_info_widget.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer(
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
            loading: (loading) => const LoadingInfoWidget(),
          );
        },
      );
  }
}