import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';

class PanelWidget extends ConsumerWidget {
  final ScrollController controller;
  final PanelController panelController;

  const PanelWidget({super.key, required this.controller, required this.panelController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 12.0),
        buildDragHandle(),
        const SizedBox(height: 12.0),
      ],
    );
  }

  Widget buildDragHandle() => GestureDetector(
    onTap: tooglePanel,
        child: Center(
          child: Container(
            width: 30.0,
            height: 5.0,
            decoration: dragHandleDecoration,
          ),
        ),
      );

  void tooglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open();    
}
