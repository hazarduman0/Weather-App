import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/data/models/main_models/weather_current.dart';
import 'package:weather_app/data/service/weather/current_service.dart';

// CurrentWeatherService() provider
final currentWeatherService = Provider((ref) => CurrentWeatherService());

// Current weather response
final currentWeatherResponse =
    FutureProvider.family<CurrentWeather?, String>((ref, city) async {
  final currentDio = ref.watch<CurrentWeatherService>(currentWeatherService);
  return currentDio.getCurrentWeather(city);
});

// AppPageController() provider
final appPageController = ChangeNotifierProvider((ref) => AppPageController());

