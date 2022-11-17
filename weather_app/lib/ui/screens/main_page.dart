import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/notifiers/app_page_notifier.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/provider.dart';
import 'package:weather_app/ui/screens/added_locations.dart';
import 'package:weather_app/ui/screens/current_location.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          children: const [CurrentLocationWeatherPage(), AddedLocation()],
        ),
      ),
    );
  }
}
