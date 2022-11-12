import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/data/providers/service_provider.dart';
import 'package:weather_app/data/service/weather/forecast_service.dart';
import 'package:weather_app/data/models/main_models/weather_forecast.dart';

final tempForecastWeatherResponse =
    FutureProvider.family.autoDispose<ForecastWeather?, Map<EquatableParams, int>>(
        (ref, forecastInfos) async {
  final forecastDio =
      ref.watch<ForecastWeatherService>(forecastWeatherServiceProvider);
  return await forecastDio.getForecastWeather(
      forecastInfos.values.first, forecastInfos.keys.first.name);
});

// // Forecast weather response
// final forecastWeatherResponse =
//     FutureProvider.family<ForecastWeather?, Map<String, int>>(
//         (ref, forecastInfos) async {
//   //log('providere girildi');
//   final forecastDio =
//       ref.watch<ForecastWeatherService>(forecastWeatherServiceProvider);
//   return await forecastDio.getForecastWeather(
//       forecastInfos.values.first, forecastInfos.keys.first);
// });

//temp Location() provider
final tempLocationProvider = Provider.family.autoDispose((ref, EquatableParams equ) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse({equ: 8}));
  return forecastInfos.value?.location;
});

//temp Current() provider
final tempCurrentProvider = Provider.family.autoDispose((ref, EquatableParams equ) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse({equ: 8}));
  return forecastInfos.value?.current;
});

//temp Forecast() provider
final tempForecastProvider = Provider.family.autoDispose((ref, EquatableParams equ) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse({equ: 8}));
  return forecastInfos.value?.forecast;
});

//temp Condition() provider
final tempConditionProvider = Provider.family.autoDispose((ref, EquatableParams equ) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse({equ: 8}));
  return forecastInfos.value?.current?.condition;
});

//temp Weekly forecast provider
final tempWeeklyForecastProvider =
    Provider.family.autoDispose((ref, EquatableParams equ) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse({equ: 8}));
  return forecastWeekFormar(forecastInfos.value?.forecast?.forecastday);
});

//temp Todays data
final tempTodayData = Provider.family.autoDispose((ref, EquatableParams equ) {
  final forecastInfos = ref.watch(tempForecastProvider(equ));
  return forecastInfos?.forecastday?.first;
});

//temp Tomorrow data
final tempTomorrowData = Provider.family.autoDispose(
  (ref, EquatableParams equ) {
    final forecastInfos = ref.watch(tempForecastProvider(equ));
    return forecastInfos?.forecastday?[1];
  },
);

//final nameProvider = Provider.family.autoDispose((ref, String name) => name);

class EquatableParams extends Equatable{
  EquatableParams({required this.name});
  final String name;
  
  @override
  List<Object> get props => [name];
}