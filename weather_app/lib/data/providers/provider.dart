import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/notifiers/app_page_notifier.dart';
import 'package:weather_app/notifiers/form_notifier.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/data/models/main_models/weather_current.dart';
import 'package:weather_app/data/models/main_models/weather_forecast.dart';
import 'package:weather_app/data/models/search.dart';
import 'package:weather_app/data/providers/service_provider.dart';
import 'package:weather_app/data/service/weather/current_service.dart';
import 'package:weather_app/data/service/weather/forecast_service.dart';
import 'package:weather_app/data/service/weather/search_autocomplete.dart';

// Current weather response
final currentWeatherResponse =
    FutureProvider.family<CurrentWeather?, String>((ref, city) async {
  final currentDio =
      ref.watch<CurrentWeatherService>(currentWeatherServiceProvider);
  return await currentDio.getCurrentWeather(city);
});

// Forecast weather response
final forecastWeatherResponse =
    FutureProvider.family<ForecastWeather?, Map<String, int>>(
        (ref, forecastInfos) async {
  final forecastDio =
      ref.watch<ForecastWeatherService>(forecastWeatherServiceProvider);
  await ref.read(addedProvider.future);
  return await forecastDio.getForecastWeather(
      forecastInfos.values.first, forecastInfos.keys.first);
});

// search response
final searchProvider = FutureProvider.family
    .autoDispose<List<SearchModel>?, String>((ref, search) async {
  final searchResponse = ref.watch<SearchService>(searchServiceProvider);
  return await searchResponse.getAutoCompleteResult(search);
});

final addedProvider = FutureProvider<List<CurrentWeather>?>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final locationList = prefs.getStringList('locations');
  if (locationList == null) return [];

  final currentDio =
      ref.watch<CurrentWeatherService>(currentWeatherServiceProvider);
  List<CurrentWeather> currentList = [];

  for (int i = 0; i < locationList.length; i++) {
    final city = locationList[i];
    final currentWeather = await currentDio.getCurrentWeather(city);
    currentList.add(currentWeather!);
  }

  return currentList;
});

//Location() provider
final locationProvider = Provider((ref) {
  final forecastInfos =
      ref.watch(forecastWeatherResponse(ref.watch(cityAndDay)));
  return forecastInfos.value?.location;
});

//Current() provider
final currentProvider = Provider((ref) {
  final forecastInfos =
      ref.watch(forecastWeatherResponse(ref.watch(cityAndDay)));
  return forecastInfos.value?.current;
});

//Forecast() provider
final forecastProvider = Provider((ref) {
  final forecastInfos =
      ref.watch(forecastWeatherResponse(ref.watch(cityAndDay)));
  return forecastInfos.value?.forecast;
});

//Condition() provider
final conditionProvider = Provider((ref) {
  final forecastInfos =
      ref.watch(forecastWeatherResponse(ref.watch(cityAndDay)));
  return forecastInfos.value?.current?.condition;
});

//Weekly forecast provider
final weeklyForecastProvider = Provider((ref) {
  final forecastInfos =
      ref.watch(forecastWeatherResponse(ref.watch(cityAndDay)));
  return forecastWeekFormar(forecastInfos.value?.forecast?.forecastday);
});

//Todays data
final todayData = Provider((ref) {
  final forecastInfos = ref.watch(forecastProvider);
  return forecastInfos?.forecastday?.first;
});

//Tomorrows data
final tomorrowData = Provider((ref) {
  final forecastInfos = ref.watch(forecastProvider);
  return forecastInfos?.forecastday?[1];
});

//UV Provider
final uvProvider = Provider((ref) {
  final currentInfo = ref.watch(currentProvider);
  return currentInfo!.uv;
});

//Sunrise provider
final sunriseProvider = Provider((ref) {
  final currentInfo = ref.watch(todayData);
  return currentInfo?.astro?.sunrise;
});

//Sunset provider
final sunsetProvider = Provider((ref) {
  final todayResponse = ref.watch(todayData);
  return todayResponse?.astro?.sunset;
});

//Feels like C
final feelsLikeCProvider = Provider((ref) {
  final currentInfo = ref.watch(currentProvider);
  return currentInfo!.feelslikeC;
});

//Feels like F
final feelsLikeFProvider = Provider((ref) {
  final currentInfo = ref.watch(currentProvider);
  return currentInfo!.feelslikeF;
});

//visibility km
final visibilityKmProvider = Provider((ref) {
  final currentInfo = ref.watch(currentProvider);
  return currentInfo!.visKm;
});

//visibility miles
final visibilityMilesProvider = Provider((ref) {
  final currentInfo = ref.watch(currentProvider);
  return currentInfo!.visMiles;
});

//wind kph
final windKphProvider = Provider((ref) {
  final currentInfo = ref.watch(currentProvider);
  return currentInfo!.windKph;
});

//TODO: windmph ekle

final windDirectionProvider = Provider((ref) {
  final currentInfo = ref.watch(currentProvider);
  return currentInfo!.windDir;
});

// AppPageController() provider
final appPageControllerProvider =
    ChangeNotifierProvider((ref) => AppPageController());

//FormController() provider
final formControllerProvider =
    ChangeNotifierProvider((ref) => FormController());

// city and day info
final cityAndDay = Provider((ref) => const {'San Francisco': 8});
