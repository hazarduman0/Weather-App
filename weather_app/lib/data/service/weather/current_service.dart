import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/data/models/main_models/weather_current.dart';

class CurrentWeatherService {
  static String _baseUrl(String apiKey, String city) =>
      'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no';

   Future<CurrentWeather?> getCurrentWeather(String city) async {
    try {
      var response =
          await Dio().get(_baseUrl('67ff3fafbd214bb3b3b94739222809', city));
      if (response.statusCode == 200) {
        if (response.data != null) {
          return CurrentWeather.fromJson(response.data);
        }
      }
    } catch (e) {
      log('get current weather error : $e');
    }
    return null;
  }
}
