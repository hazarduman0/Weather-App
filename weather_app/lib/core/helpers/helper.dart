import 'package:weather_app/core/enums.dart';
import 'package:weather_app/core/extensions.dart';
import 'package:weather_app/data/models/day.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/hour.dart';
import 'package:intl/intl.dart';

List<Hour>? forecastHourFormar(List<Forecastday>? forecastday) {
  int hour = DateTime.now().hour;
  List<Hour>? hourList = [];
  for (int i = 0; i < forecastday!.first.hour!.length; i++) {
    if (DateTime.parse(forecastday.first.hour![i].time!).hour >= hour) {
      hourList.add(forecastday.first.hour![i]);
    }
  }

  for (int i = 0; i < forecastday[1].hour!.length; i++) {
    hourList.add(forecastday[1].hour![i]);
  }

  return hourList;
}

List<Map<String, Day>>? forecastWeekFormar(List<Forecastday>? forecastday) {
  List<Map<String, Day>>? dayList = [];
  for (int i = 1; i <= 7; i++) {
    dayList.add({forecastday![i].date!: forecastday[i].day!});
  }
  return dayList;
}

String dayOfWeek(String date) =>
    DateFormat('EEEE').format(DateTime.parse(date));

String uvStatus(num index) {
  switch (index) {
    case 1:
    case 2:
      return UvExtension(UvIndex.low).uvString();
    case 3:
    case 4:
    case 5:
      return UvExtension(UvIndex.medium).uvString();
    case 6:
    case 7:
      return UvExtension(UvIndex.high).uvString();
    case 8:
    case 9:
    case 10:
      return UvExtension(UvIndex.veryhigh).uvString();
    case 11:
      return UvExtension(UvIndex.extremelyhigh).uvString();
    default:
      return UvExtension(UvIndex.extremelyhigh).uvString();
  }
}
