import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';

class LocationPageLoading extends StatelessWidget {
  const LocationPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.blueGrey,
      child: Align(
        alignment: Alignment.center,
        child: AutoSizeText('Yükleniyor..', style: sfPro500Weight.copyWith(fontSize: 40))),
    );
  }
}