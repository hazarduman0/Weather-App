import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/widgets/weather_widget.dart';

class AddedLocation extends ConsumerWidget {
  const AddedLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('ikinci sayfa çalıştı');
    final controllerWatch = ref.watch<AppPageController>(appPageController);
    final controllerRead = ref.read<AppPageController>(appPageController);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height,
        width: size.width,
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
          return const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: WeatherWidget(),
          );
        },));
  }
}
