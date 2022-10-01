import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/data/providers/providers.dart';

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
        child: Center(
          child: Text('İkinci Sayfa',
              style: sfPro700Weight.copyWith(fontSize: 30)),
        ));
  }
}
