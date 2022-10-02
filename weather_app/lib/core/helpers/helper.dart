 import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/hour.dart';

List<Hour>? forecastHourFormar(List<Forecastday>? forecastday) {
  int hour = DateTime.now().hour;
  List<Hour>? hourList = [];
  for(int i = 0; i < forecastday!.first.hour!.length; i++){
    if(DateTime.parse(forecastday.first.hour![i].time!).hour >= hour){
      hourList.add(forecastday.first.hour![i]);
    }
  }

  for(int i = 0; i < forecastday[1].hour!.length; i++){
    hourList.add(forecastday[1].hour![i]);
  }

  return hourList;
}