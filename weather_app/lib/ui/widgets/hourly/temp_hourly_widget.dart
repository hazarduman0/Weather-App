

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:weather_app/core/constants/app_paddings.dart';
// import 'package:weather_app/core/helpers/helper.dart';
// import 'package:weather_app/data/models/forecast.dart';
// import 'package:weather_app/data/models/hour.dart';
// import 'package:weather_app/data/providers/temp_provider.dart';
// import 'package:weather_app/ui/widgets/forecast_info_widget.dart';

// class TempHourlyWidget extends StatelessWidget {
//    TempHourlyWidget({super.key, required this.name});

//   String name;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     //return TempConsumerWidget(widget: _hourlyForecastWidget(size), loadingWidget: const LoadingInfoWidget(), name: name);
//     return hourlyForecastWidget(size);
//   }

//   Widget hourlyForecastWidget(Size size) => Consumer(builder: (context, ref, child) {
//     log('burası !!! $name');
//       final today = ref.watch<Forecastday?>(tempTodayData(name));
//       final tomorrow = ref.watch<Forecastday?>(tempTomorrowData(name));
//       List<Hour>? hourList = forecastHourFormar([today!, tomorrow!]);
//       int currentHour = DateTime.now().hour;
//       return SizedBox(
//         //tabview
//         height: size.height * 0.15,
//         width: size.width,
//         child: ListView.builder(
//           //padding: weatherWidgetInformationHorizontalPadding(size),
//           physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics()),
//           scrollDirection: Axis.horizontal,
//           itemCount: hourList!.length, 
//           itemBuilder: (context, index) {
//             DateTime dt = DateTime.parse(hourList[index].time!);
//             TimeOfDay formarHour = TimeOfDay(
//                 hour: int.parse(dt.hour.toString()), minute: int.parse('0'));

//             return Padding(
//                 padding: forecastInfoWidgetHorizontalPadding(size),
//                 child: ForecastInfoWidget(
//                   condition: hourList[index].condition!.text!,
//                   hour: formarHour.format(context).replaceAll(':00', ''),
//                   temp: hourList[index].tempC!.floor(),
//                   isDay: hourList[index].isDay == 1,
//                   isNow: dt.hour == currentHour,
//                 ));
//           },
//         ),
//       );
//     });
// }