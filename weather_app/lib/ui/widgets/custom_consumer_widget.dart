import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/providers/providers.dart';

class CustomCosumerWidget extends StatelessWidget {
  CustomCosumerWidget(
      {super.key, required this.widget, required this.loadingWidget});

  Widget widget;
  Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final forecastInfo = ref.watch(cityAndDay);
        final response = ref.watch(forecastWeatherResponse(forecastInfo));
        return response.map(
          data: (data) => widget,
          error: (error) => Text('Something went wrong. Error: $error'),
          loading: (loading) => loadingWidget,
        );
      },
    );
  }
}
