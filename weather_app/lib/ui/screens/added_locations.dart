import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/searchbar.dart';
import 'package:weather_app/ui/widgets/weather_widget.dart';

class AddedLocation extends ConsumerWidget {
  const AddedLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('ikinci sayfa çalıştı');
    final controllerWatch =
        ref.watch<AppPageController>(appPageControllerProvider);
    final controllerRead =
        ref.read<AppPageController>(appPageControllerProvider);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(child: SearchBar()),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: size.height * 0.05),
          ),
          //TODO: Form da değer varsa aranan değer ile eşleşenleri sırala yoksa weatherWidgetler görüntülensin
          //TODO: fake searchbar yap, search page hazırla, akıcı geçiş, bu sayfayı eski haline getir
          Consumer(
            builder: (context, ref, child) {
              final textController = ref.watch(formControllerProvider);
              final textEditingController =
                  textController.textEditingController;
              return textEditingController.text.isEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        addRepaintBoundaries: true,
                        (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        child: addedWeathers[index],
                      );
                    }, childCount: addedWeathers.length))
                  : const SliverToBoxAdapter(
                      child: Center(
                        child: Text('Buradayım', style: sfPro500Weight),
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}

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


