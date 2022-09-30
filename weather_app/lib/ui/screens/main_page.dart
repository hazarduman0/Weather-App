import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/providers.dart';
import 'package:weather_app/ui/screens/added_locations.dart';
import 'package:weather_app/ui/screens/current_location.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final controller = ref.watch<AppPageController>(appPageController);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: mainPageDecoration,
        child: PageView(
          physics: controller.panelController.isAttached && (controller.panelController.isPanelOpen ||
                  controller.panelController.isPanelAnimating)
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
          children: const [CurrentLocationWeatherPage(), AddedLocation()],
        ),
      ),
    );
  }
}
