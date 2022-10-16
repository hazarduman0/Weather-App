import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/data/models/main_models/weather_current.dart';
import 'package:weather_app/data/models/main_models/weather_forecast.dart';
import 'package:weather_app/data/service/weather/current_service.dart';
import 'package:weather_app/data/service/weather/forecast_service.dart';

// CurrentWeatherService() provider
final currentWeatherService = Provider((ref) => CurrentWeatherService());

// ForecastWeatherService() provider
final forecastWeatherService = Provider((ref) => ForecastWeatherService());

// Current weather response
final currentWeatherResponse =
    FutureProvider.family<CurrentWeather?, String>((ref, city) async {
  final currentDio = ref.watch<CurrentWeatherService>(currentWeatherService);
  return await currentDio.getCurrentWeather(city);
});

// Forecast weather response
final forecastWeatherResponse =
    FutureProvider.family<ForecastWeather?, Map<String, int>>(
        (ref, forecastInfos) async {
  final forecastDio = ref.watch<ForecastWeatherService>(forecastWeatherService);
  return await forecastDio.getForecastWeather(
      forecastInfos.values.first, forecastInfos.keys.first);
});

// AppPageController() provider
final appPageController = ChangeNotifierProvider((ref) => AppPageController());

// city and day info
final cityAndDay = Provider((ref) => {'Bursa' : 7});
