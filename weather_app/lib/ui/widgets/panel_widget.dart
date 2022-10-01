import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/controllers/app_page_controller.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/core/constants/app_keys.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/data/providers/providers.dart';

class PanelWidget extends ConsumerWidget {
  final ScrollController controller;
  final PanelController panelController;

  const PanelWidget(
      {super.key, required this.controller, required this.panelController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            decoration: slideUpDecoration,
            child: ListView(
              controller: controller,
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: size.height * 0.02),
                buildDragHandle(),
                SizedBox(height: size.height * 0.02),
                tabBarBuild(size),
                Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabBarBuild(Size size) => TabBar(
          labelStyle: sfPro600Weight.copyWith(fontSize: size.width * 0.04),
          labelColor: darkSecondary,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const BoxDecoration(
            gradient: tabIndicatorGradient,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          indicatorWeight: 0,
          indicatorPadding: EdgeInsets.only(top: size.height * 0.055),
          tabs: const [
            Tab(text: hourlyForecast),
            Tab(
              text: weeklyForecast,
            )
          ]);

  Widget buildDragHandle() => Consumer(
        builder: (context, ref, child) {
          final controllerRef = ref.watch<AppPageController>(appPageController);
          return GestureDetector(
            onTap: () {
              controllerRef.tooglePanel();
            },
            child: Center(
              child: Container(
                width: 30.0,
                height: 5.0,
                decoration: dragHandleDecoration,
              ),
            ),
          );
        },
      );

  // void tooglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();
}
