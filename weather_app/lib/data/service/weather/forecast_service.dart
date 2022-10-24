import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/data/models/main_models/weather_forecast.dart';

class ForecastWeatherService {
  static String _baseUrl(String apiKey, String city, int day) =>
      'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=$day&aqi=no&alerts=no';

  Future<ForecastWeather?> getForecastWeather(int day, String city) async {
    try {
      log('sorguya girildi');
      var response = await Dio()
          .get(_baseUrl('67ff3fafbd214bb3b3b94739222809', city, day));
      if (response.statusCode == 200) {
        if (response.data != null) {
          return ForecastWeather.fromJson(response.data);
        }
      }
    } catch (e) {
      log('get forecast weather error : $e');
    }
    return null;
  }
}
