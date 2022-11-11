import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/providers/temp_provider.dart';

class TempConsumerWidget extends StatelessWidget {
  TempConsumerWidget(
      {super.key,
      required this.widget,
      required this.loadingWidget,
      required this.name});

  Widget widget;
  Widget loadingWidget;
  String name;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // final forecastInfo = ref.watch(cityAndDay);
        // final response = ref.watch(forecastWeatherResponse(forecastInfo));
        final response =  ref.watch(tempForecastWeatherResponse({name: 8}));
        return response.when(
          data: (data) => widget,
          error: (error, stackTrace) => Text('Something went wrong. Error: $error'),
          loading: () => loadingWidget,
        );
      },
    );
  }
}
