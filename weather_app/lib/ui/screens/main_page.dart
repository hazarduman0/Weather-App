import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/ui/screens/added_locations.dart';
import 'package:weather_app/ui/screens/current_location.dart';
import 'package:weather_app/ui/screens/test_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //log('MainPage çizildi');
    Size size = MediaQuery.of(context).size;
    final controller = ref.watch<AppPageController>(appPageControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: mainPageDecoration,
        child: PageView(
              controller: controller.pageViewController,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                CurrentLocationWeatherPage(),
                const AddedLocation(),
                const TestPage()
              ],
            ),
      ),
      
    );
  }
}

// Stack(
//           children: [
//             PageView(
//               controller: controller.pageViewController,
//               physics: const BouncingScrollPhysics(
//                   parent: AlwaysScrollableScrollPhysics()),
//               children: [
//                 CurrentLocationWeatherPage(),
//                 const AddedLocation(),
//                 const TestPage()
//               ],
//             ),
//             Positioned(
//               bottom: 0.0,
//               child: Container(
//                 height: size.height * 0.05,
//                 width: size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.8)
//                 ),
//                 child: Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Spacer(),
//                       Icon(Icons.navigation_outlined,color: Colors.white, size: 15.0,),
//                       SizedBox(width: 7.0),
//                       Container(
//                         height: 7.0,
//                         width: 7.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                           color: Colors.white
//                         ),
//                       ),
//                       SizedBox(width: 7.0),
//                       Container(
//                         height: 7.0,
//                         width: 7.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                           color: Colors.white
//                         ),
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),

// BottomNavigationBar(items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: 'label1'),
//         BottomNavigationBarItem(icon: Icon(Icons.access_time_filled_outlined), label: 'label2')
//       ])