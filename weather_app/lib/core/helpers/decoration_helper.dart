import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_colors.dart';

BoxDecoration get backgroundDecoration =>
    const BoxDecoration(gradient: linearColor1);

BoxDecoration get weatherWidgetDecoration =>
    const BoxDecoration(gradient: linearColor2);

BoxDecoration get mainPageDecoration => const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/background_night.png'),
        fit: BoxFit.cover));
BoxDecoration get dragHandleDecoration => BoxDecoration(
    color: Colors.grey, borderRadius: BorderRadius.circular(12.0));
