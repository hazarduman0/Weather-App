import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/models/main_models/weather_current.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/routes/transitions/fade_page_transition.dart';
import 'package:weather_app/ui/screens/search_page.dart';
import 'package:weather_app/ui/widgets/hero_widget.dart';
import 'package:weather_app/ui/widgets/weather_widget.dart';

class AddedLocation extends StatelessWidget {
  const AddedLocation({super.key});

  @override
  Widget build(BuildContext context) {
    //log('ikinci sayfa çalıştı');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer(builder: (context, ref, child) {
        final addedLocations = ref.watch(addedProvider);
        log('addedLocations: ${addedLocations.value.toString()}');
        return CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                  child: HeroWidget(
                      tag: 'search', widget: fakeSearchBar(size, context))),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: size.height * 0.05),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(addRepaintBoundaries: true,
                  (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: addedWeathers(addedLocations: addedLocations.value)[index],
            );
          }, childCount: addedLocations.value?.length))
        ],
      );
      }),
    );
  }
}

Widget fakeSearchBar(Size size, BuildContext context) => GestureDetector(
      //TODO: route paketlerini öğren ve uygula

      onTap: () =>
          Navigator.push(context, FadePageTransition(widget: const SearchPage())),

      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.9,
        decoration: searchBarDecoration,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(children: [
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(width: size.width * 0.01),
              AutoSizeText('Search..',
                  style: sfPro400Weight.copyWith(fontSize: 17.0))
            ]),
          ),
        ),
      ),
    );

List<Widget>  addedWeathers({List<CurrentWeather>? addedLocations}) => List.generate(addedLocations!.length, (index) =>  Consumer(builder: (context, ref, child) {
  final isDay = addedLocations[index].current?.isDay == 1;
  final name = addedLocations[index].location?.name.toString();
  final temp = "${addedLocations[index].current?.tempC?.floor()}°";
  final condition = addedLocations[index].current?.condition?.text.toString();
 return WeatherWidget(isDay: isDay, name: name!, temp: temp, condition: condition!); 
}));

// Widget addedWeathers() => Consumer(builder: (context, ref, child) {
//   final addedLocations = ref.watch(addedProvider);
//   // final isDay = addedLocations.value?[index].current?.isDay == 1;
//   // final name = addedLocations.value?[index].location?.name.toString();
//   // final temp = "${addedLocations.value?[index].current?.tempC?.floor()}°";
//   // final condition = addedLocations.value?[index].current?.condition?.text.toString();
//   return ListView.builder(
//     itemCount: addedLocations.value?.length,
//     itemBuilder: (context, index) {
//     final addedLocations = ref.watch(addedProvider);
//   final isDay = addedLocations.value?[index].current?.isDay == 1;
//   final name = addedLocations.value?[index].location?.name.toString();
//   final temp = "${addedLocations.value?[index].current?.tempC?.floor()}°";
//   final condition = addedLocations.value?[index].current?.condition?.text.toString();
// return WeatherWidget(isDay: isDay, name: name!, temp: temp, condition: condition!); 
//   });
// });


    

// SizedBox(
//           height: size.height,
//           width: size.width,
//           child: Column(
//             children: [
//               const SearchBar(),
//               SizedBox(height: size.height * 0.05),
//               Expanded(
                  // child: ListView.builder(
                  //     itemCount: 7,
                  //     itemBuilder: (context, index) {
                  //       return const Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 20.0),
                  //         child: WeatherWidget(),
                  //       );
                  //     }))
//             ],
//           ))

// SliverToBoxAdapter(
//             child: SizedBox(
//                 height: size.height,
//                 width: size.width,
//                 child: ListView.builder(
//                     itemCount: 7,
//                     itemBuilder: (context, index) {
//                       return const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.0),
//                         child: WeatherWidget(),
//                       );
//                     })),
//           )


