import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';
import 'package:weather_app/ui/widgets/custom_linear_progress_widget.dart';

class UvIndexWidget extends StatelessWidget {
  const UvIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.42,
      width: size.width * 0.42,
      decoration: curretDataWidgetsDecorations,
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer(
            builder: (context, ref, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/weather_icons/uv-index.svg',
                        height: 30.0,
                        width: 30.0,
                      ),
                      Text(
                        'UV INDEX',
                        style: sfPro600Weight.copyWith(
                            color: Colors.grey, fontSize: size.width * 0.04),
                      )
                    ],
                  ),
                  Text('4',
                      style: sfPro400Weight.copyWith(
                          color: Colors.white, fontSize: size.width * 0.09)),
                  Text('Moderate',
                      style: sfPro400Weight.copyWith(
                          color: Colors.white, fontSize: size.width * 0.05)),
                  CustomLinearProgress(uv: 4)
                ],
              );
            },
          )),
    );
  }
}
