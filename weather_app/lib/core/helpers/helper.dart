import 'dart:developer';

import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/hour.dart';

List<Hour>? forecastHourFormar(List<Forecastday>? forecastday) {
  int hour = DateTime.now().hour;
  List<Hour>? hourList = [];
  log('hour: $hour');
  for (int i = 0; i < forecastday!.first.hour!.length; i++) {
    log('DateTime.parse(forecastday.first.hour![i].time!).hour : ${DateTime.parse(forecastday.first.hour![i].time!).hour}');
    if (DateTime.parse(forecastday.first.hour![i].time!).hour >= hour) {
      hourList.add(forecastday.first.hour![i]);
    }
  }

  for (int i = 0; i < forecastday[1].hour!.length; i++) {
    hourList.add(forecastday[1].hour![i]);
  }

  return hourList;
}

// double panelMinHeightFormar(PageController pageController, Size size, Function func) {
//   if(!pageController.position.haveDimensions){return size.height * 0.3;}
//   if (CustomNumFunctions(pageController.page).between(min: 0.0, max: 1.0)) {
//     log('height: ${(size.height * 0.3) - (pageController.page! * size.height * 0.3)}');
//     func;
//     return (size.height * 0.3) - (pageController.page! * size.height * 0.3);
//   } else {
//     return size.height * 0.3;
//   }
// }
