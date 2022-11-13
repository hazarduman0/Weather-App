import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_paddings.dart';
import 'package:weather_app/core/helpers/helper.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/hour.dart';
import 'package:weather_app/ui/widgets/forecast/forecast_info_widget.dart';

class HourlyForecastWidget extends StatelessWidget {
   HourlyForecastWidget({super.key, required this.today, required this.tomorrow});

  Forecastday? today;
  Forecastday? tomorrow;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Hour>? hourList = forecastHourFormar([today!, tomorrow!]);
      int currentHour = DateTime.now().hour;
    return SizedBox(
        //tabview
        height: size.height * 0.15,
        width: size.width,
        child: ListView.builder(
          //padding: weatherWidgetInformationHorizontalPadding(size),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemCount: hourList!.length, //tabbar controllerine göre değer ver
          itemBuilder: (context, index) {
            DateTime dt = DateTime.parse(hourList[index].time!);
            TimeOfDay formarHour = TimeOfDay(
                hour: int.parse(dt.hour.toString()), minute: int.parse('0'));

            return Padding(
                padding: forecastInfoWidgetHorizontalPadding(size),
                child: ForecastInfoWidget(
                  condition: hourList[index].condition!.text!,
                  hour: formarHour.format(context).replaceAll(':00', ''),
                  temp: hourList[index].tempC!.floor(),
                  isDay: hourList[index].isDay == 1,
                  isNow: dt.hour == currentHour,
                ));
          },
        ),
      );
  }

  // CustomCosumerWidget(
  //       widget: hourlyForecastWidget(size), loadingWidget: const LoadingInfoWidget());

  // Widget hourlyForecastWidget(Size size){
  //   List<Hour>? hourList = forecastHourFormar([today!, tomorrow!]);
  //     int currentHour = DateTime.now().hour;
  //     return SizedBox(
  //       //tabview
  //       height: size.height * 0.15,
  //       width: size.width,
  //       child: ListView.builder(
  //         //padding: weatherWidgetInformationHorizontalPadding(size),
  //         physics: const BouncingScrollPhysics(
  //             parent: AlwaysScrollableScrollPhysics()),
  //         scrollDirection: Axis.horizontal,
  //         itemCount: hourList!.length, //tabbar controllerine göre değer ver
  //         itemBuilder: (context, index) {
  //           DateTime dt = DateTime.parse(hourList[index].time!);
  //           TimeOfDay formarHour = TimeOfDay(
  //               hour: int.parse(dt.hour.toString()), minute: int.parse('0'));

  //           return Padding(
  //               padding: forecastInfoWidgetHorizontalPadding(size),
  //               child: ForecastInfoWidget(
  //                 condition: hourList[index].condition!.text!,
  //                 hour: formarHour.format(context).replaceAll(':00', ''),
  //                 temp: hourList[index].tempC!.floor(),
  //                 isDay: hourList[index].isDay == 1,
  //                 isNow: dt.hour == currentHour,
  //               ));
  //         },
  //       ),
  //     );
  // }

  //TODO: Custom consumer widgeti ana panel açıldığında çalıştır sadece
}


