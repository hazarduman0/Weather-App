
import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';

class EmptyInfoWidget extends StatelessWidget {
  const EmptyInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.42,
      width: size.width * 0.42,
      decoration: curretDataWidgetsDecorations,
    );
  }
}