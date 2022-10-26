import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/routes/transitions/bouncy_page_transition.dart';
import 'package:weather_app/routes/transitions/fade_page_transition.dart';
import 'package:weather_app/ui/screens/search_page.dart';
import 'package:weather_app/ui/widgets/hero_widget.dart';
import 'package:weather_app/ui/widgets/weather_widget.dart';

class AddedLocation extends StatelessWidget {
  const AddedLocation({super.key});

  @override
  Widget build(BuildContext context) {
    log('ikinci sayfa çalıştı');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
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
          //TODO: Form da değer varsa aranan değer ile eşleşenleri sırala yoksa weatherWidgetler görüntülensin
          //TODO: fake searchbar yap, search page hazırla, akıcı geçiş, bu sayfayı eski haline getir
          SliverList(
              delegate: SliverChildBuilderDelegate(addRepaintBoundaries: true,
                  (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: addedWeathers[index],
            );
          }, childCount: addedWeathers.length))
        ],
      ),
    );
  }
}

Widget fakeSearchBar(Size size, BuildContext context) => GestureDetector(
      //TODO: route paketlerini öğren ve uygula

      onTap: () =>
          Navigator.push(context, FadePageTransition(widget: const SearchPage())),

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             const SearchPage())), //GoRouter.of(context).go('/searchpage'),

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
              Text('Search..',
                  style: sfPro400Weight.copyWith(fontSize: size.width * 0.04))
            ]),
          ),
        ),
      ),
    );

List<Widget> get addedWeathers =>
    List.generate(7, (index) => const WeatherWidget());

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


