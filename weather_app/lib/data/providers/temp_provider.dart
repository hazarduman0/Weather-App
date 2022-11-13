import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/data/models/day.dart';
import 'package:weather_app/data/providers/service_provider.dart';
import 'package:weather_app/data/service/weather/forecast_service.dart';
import 'package:weather_app/data/models/main_models/weather_forecast.dart';

final tempForecastWeatherResponse =
    FutureProvider.family.autoDispose<ForecastWeather?, SearchParams>(
        (ref, searchInfo) async {
  final forecastDio =
      ref.watch<ForecastWeatherService>(forecastWeatherServiceProvider);
  return await forecastDio.getForecastWeather(
      searchInfo.day, searchInfo.name);
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
final tempLocationProvider = Provider.family.autoDispose((ref, SearchParams search) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse(search));
  return forecastInfos.value?.location;
});

//temp Current() provider
final tempCurrentProvider = Provider.family.autoDispose((ref, SearchParams search) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse(search));
  return forecastInfos.value?.current;
});

//temp Forecast() provider
final tempForecastProvider = Provider.family.autoDispose((ref, SearchParams search) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse(search));
  return forecastInfos.value?.forecast;
});

//temp Condition() provider
final tempConditionProvider = Provider.family.autoDispose((ref, SearchParams search) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse(search));
  return forecastInfos.value?.current?.condition;
});

//temp Weekly forecast provider
final tempWeeklyForecastProvider =
    Provider.family.autoDispose((ref, SearchParams search) {
  final forecastInfos = ref.watch(tempForecastWeatherResponse(search));
  return forecastWeekFormar(forecastInfos.value?.forecast?.forecastday);
});

//temp Todays data
final tempTodayData = Provider.family.autoDispose((ref, SearchParams search) {
  final forecastInfos = ref.watch(tempForecastProvider(search));
  return forecastInfos?.forecastday?.first;
});

//temp Tomorrow data
final tempTomorrowData = Provider.family.autoDispose(
  (ref, SearchParams search) {
    final forecastInfos = ref.watch(tempForecastProvider(search));
    return forecastInfos?.forecastday?[1];
  },
);

//temp Location Name
final tempLocationName = Provider.family.autoDispose<String?, SearchParams>((ref, search) {
  final locationInfo = ref.watch(tempLocationProvider(search));
  return locationInfo?.name;
});

//temp Condition Status Text
final tempConditionStatusText = Provider.family.autoDispose<String?, SearchParams>((ref, search) {
  final conditionInfo = ref.watch(tempConditionProvider(search));
  return conditionInfo?.text;
});

//temp Temperature Text
final tempTemperatureText = Provider.family.autoDispose<String?, SearchParams>((ref, search) {
  final currentInfo = ref.watch(tempCurrentProvider(search));
  //TODO: Ayar bilgisi gözetilip F yada C verilecek
  final tempText = "${currentInfo?.tempC?.floor().toString()} °";
  return tempText;
});

//temp Max Min Temperature
final tempMaxMinTemperature = Provider.family.autoDispose<List<String>, SearchParams>((ref, search) {
  final forecastInfo = ref.watch(tempForecastProvider(search));
  //TODO: Ayar bilgisi gözetilip F yada C verilecek
  final maxTemp = "${forecastInfo?.forecastday?.first.day?.maxtempC?.floor()}";
  final mintTemp = "${forecastInfo?.forecastday?.first.day?.mintempC?.floor()}";
  return [maxTemp,mintTemp];
});

//final nameProvider = Provider.family.autoDispose((ref, String name) => name);

class SearchParams extends Equatable{
 const SearchParams({required this.name, required this.day});
  final String name;
  final int day;
  
  @override
  List<Object> get props => [name, day];
}

