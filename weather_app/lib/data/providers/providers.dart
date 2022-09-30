import 'package:riverpod/riverpod.dart';
import 'package:weather_app/data/models/main_models/weather_current.dart';
import 'package:weather_app/data/service/weather/current_service.dart';

// CurrentWeatherService() provider
final currentWeatherService = Provider((ref) => CurrentWeatherService());

// current weather response
final currentWeatherResponse = FutureProvider.family<CurrentWeather,String>((ref, city) async{
  final currentDio = ref.watch<CurrentWeatherService>(currentWeatherService);
  return 
},);