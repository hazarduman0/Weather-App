import 'package:riverpod/riverpod.dart';
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
final searchServiceProvider = Provider.autoDispose((ref) => SearchService());
