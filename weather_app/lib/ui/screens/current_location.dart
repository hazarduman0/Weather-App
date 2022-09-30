import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/ui/widgets/panel_widget.dart';

class CurrentLocationWeatherPage extends ConsumerStatefulWidget {
  const CurrentLocationWeatherPage({super.key});

  @override
  ConsumerState<CurrentLocationWeatherPage> createState() =>
      _CurrentLocationWeatherPageState();
}

class _CurrentLocationWeatherPageState
    extends ConsumerState<CurrentLocationWeatherPage> {
  
  final panelController = PanelController(); // ayrı katmanda oluştur.

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SlidingUpPanel(
        body: Column(
          children: [
            SizedBox(height: size.height * 0.2),
            weatherInformationTexts(size)
          ],
        ),
        color: Colors.white.withOpacity(0.3),
        controller: panelController,
        
        backdropTapClosesPanel: true,
        minHeight: size.height * 0.3,
        maxHeight: size.height * 0.8,
        parallaxEnabled: true,
        parallaxOffset: .5,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        panelBuilder: (sc) => PanelWidget(
          controller: sc,
          panelController: panelController,    
        ),
      ),
    );
  }
}

Widget weatherInformationTexts(Size size) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Montreal',
            style: sfPro400Weight.copyWith(fontSize: size.width * 0.07)),
        Text(
          '19°',
          style: sfPro200Weight.copyWith(fontSize: size.width * 0.16),
        ),
        Text(
          'Mostly Clear',
          style: sfPro600Weight.copyWith(fontSize: size.width * 0.04),
        ),
        Text(
          'H:24° L:18°',
          style: sfPro600Weight.copyWith(fontSize: size.width * 0.05),
        )
      ],
    );
