import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/controllers/data_controller.dart';
import 'package:weather_app/controllers/form_conroller.dart';
import 'package:weather_app/data/models/condation.dart';
import 'package:weather_app/data/models/current.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/main_models/weather_current.dart';
import 'package:weather_app/data/models/main_models/weather_forecast.dart';
import 'package:weather_app/data/models/search.dart';
import 'package:weather_app/data/service/weather/current_service.dart';
import 'package:weather_app/data/service/weather/forecast_service.dart';
import 'package:weather_app/data/service/weather/search_autocomplete.dart';

// CurrentWeatherService() provider
final currentWeatherServiceProvider =
    Provider((ref) => CurrentWeatherService());

// ForecastWeatherService() provider
final forecastWeatherServiceProvider =
    Provider((ref) => ForecastWeatherService());

// SearchService() provider
final searchServiceProvider = Provider((ref) => SearchService());

// Current weather response
final currentWeatherResponse =
    FutureProvider.family<CurrentWeather?, String>((ref, city) async {
  final currentDio =
      ref.watch<CurrentWeatherService>(currentWeatherServiceProvider);
  return await currentDio.getCurrentWeather(city);
});

// final loadingResponse = ChangeNotifierProvider(
//   (ref) => DataController().changeLoadingStatus(),
// );

// Forecast weather response
final forecastWeatherResponse =
    FutureProvider.family<ForecastWeather?, Map<String, int>>(
        (ref, forecastInfos) async {
  log('providere girildi');
  final forecastDio =
      ref.watch<ForecastWeatherService>(forecastWeatherServiceProvider);
  return await forecastDio.getForecastWeather(
      forecastInfos.values.first, forecastInfos.keys.first);
});

// search response
final searchProvider =
    FutureProvider.family<List<SearchModel>?, String>((ref, search) async {
  log('providere girildi');
  final searchResponse = ref.watch<SearchService>(searchServiceProvider);
  return await searchResponse.getAutoCompleteResult(search);
});

// //Location() provider
// final locationInfos =
//     FutureProvider.family<Location?, Map<String, int>>((ref, infos) async {
//   final forecastInfos = ref.watch(forecastWeatherResponse(infos));
//   return await forecastInfos.value?.location;
// });

// //Current() provider
// final currentInfos =
//     FutureProvider.family<Current?, Map<String, int>>((ref, infos) async {
//   final forecastInfos = ref.watch(forecastWeatherResponse(infos));
//   return await forecastInfos.value?.current;
// });

// //Forecast() provider
// final forecastInfos =
//     FutureProvider.family<Forecast?, Map<String, int>>((ref, infos) async {
//   final forecastInfos = ref.watch(forecastWeatherResponse(infos));
//   return await forecastInfos.value?.forecast;
// });

// //Condition() provider
// final conditionInfos =
//     FutureProvider.family<Condition?, Map<String, int>>((ref, infos) async {
//   final forecastInfos = ref.watch(forecastWeatherResponse(infos));
//   return await forecastInfos.value?.current?.condition;
// });

//Location() provider
final locationProvider = Provider.family((ref, Map<String, int> infos) {
  final forecastInfos = ref.watch(forecastWeatherResponse(infos));
  log('location: ${forecastInfos.value?.location!.name}');
  return forecastInfos.value?.location;
});

//Current() provider
final currentProvider = Provider.family((ref, Map<String, int> infos) {
  final forecastInfos = ref.watch(forecastWeatherResponse(infos));
  log('current: ${forecastInfos.value?.current}');
  return forecastInfos.value?.current;
});

//Current() provider
final forecastProvider = Provider.family((ref, Map<String, int> infos) {
  final forecastInfos = ref.watch(forecastWeatherResponse(infos));
  return forecastInfos.value?.forecast;
});

//Condition() provider
final conditionProvider = Provider.family((ref, Map<String, int> infos) {
  final forecastInfos = ref.watch(forecastWeatherResponse(infos));
  return forecastInfos.value?.current?.condition;
});

//Todays data
final todayData = Provider.family((ref, Map<String, int> infos) {
  final forecastInfos = ref.watch(forecastProvider(infos));
  return forecastInfos!.forecastday!.first;
});

//UV Provider
final uvProvider = Provider.family((ref, Map<String, int> infos) {
  final currentInfo = ref.watch(currentProvider(infos));
  return currentInfo!.uv;
});

//Sunrise provider
final sunRiseProvider = Provider.family((ref, Map<String, int> infos) {
  final currentInfo = ref.watch(todayData(infos));
  return currentInfo.astro!.sunrise;
});

//Sunset provider
final sunSetProvider = Provider.family((ref, Map<String, int> infos) {
  final todayResponse = ref.watch(todayData(infos));
  return todayResponse.astro!.sunset;
});

//Feels like C
final feelsLikeCProvider = Provider.family((ref, Map<String, int> infos) {
  final currentInfo = ref.watch(currentProvider(infos));
  return currentInfo!.feelslikeC;
});

//Feels like F
final feelsLikeFProvider = Provider.family((ref, Map<String, int> infos) {
  final currentInfo = ref.watch(currentProvider(infos));
  return currentInfo!.feelslikeF;
});

//visibility km
final visibilityKmProvider = Provider.family((ref, Map<String, int> infos) {
  final currentInfo = ref.watch(currentProvider(infos));
  return currentInfo!.visKm;
});

//visibility miles
final visibilityMilesProvider = Provider.family((ref, Map<String, int> infos) {
  final currentInfo = ref.watch(currentProvider(infos));
  return currentInfo!.visMiles;
});

//wind kph
final windKphProvider = Provider.family((ref, Map<String, int> infos) {
  final currentInfo = ref.watch(currentProvider(infos));
  return currentInfo!.windKph;
});

//TODO: windmph ekle

final windDirectionProvider = Provider.family((ref, Map<String, int> infos) {
  final currentInfo = ref.watch(currentProvider(infos));
  return currentInfo!.windDir;
});

//final textEditingControllerProvider = Provider((ref) => TextEditingController());

// AppPageController() provider
final appPageControllerProvider =
    ChangeNotifierProvider((ref) => AppPageController());

//FormController() provider
final formControllerProvider =
    ChangeNotifierProvider((ref) => FormController());

// city and day info
final cityAndDay = Provider((ref) => {'Berlin': 7});
