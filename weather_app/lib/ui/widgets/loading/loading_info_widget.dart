import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_paddings.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';

class LoadingInfoWidget extends StatelessWidget {
  const LoadingInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      //tabview
      height: size.height * 0.15,
      width: size.width,
      child: ListView.builder(
        padding: weatherWidgetInformationHorizontalPadding(size),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
              padding: forecastInfoWidgetHorizontalPadding(size),
              child: Container(
                height: size.height * 0.15,
                width: size.width * 0.15,
                decoration: forecastInfoDecoration(false),
              ));
        },
      ),
    );
  }
}
