import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_colors.dart';

class CustomLinearProgress extends StatelessWidget {
  CustomLinearProgress({super.key, required this.uv});
  int uv;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.0,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 5.0,
            width: double.infinity,
            decoration: const BoxDecoration(gradient: linearColor3),
          ),
          SizedBox(
              height: 5.0,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(flex: uv, child: const SizedBox()),
                  Container(
                    height: 5.0,
                    width: 5.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside)),
                  ),
                  Expanded(
                      flex: uv >= 11 ? 0 : 11 - uv, child: const SizedBox())
                ],
              ))
        ],
      ),
    );
  }
}
