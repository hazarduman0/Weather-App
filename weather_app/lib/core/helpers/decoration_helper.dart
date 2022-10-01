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

BoxDecoration get slideUpDecoration =>
    const BoxDecoration(gradient: slideUpGradient);

BoxDecoration forecastInfoDecoration(double opacity1, double opacity2) =>
    BoxDecoration(
        gradient: weatherInfoGradient(opacity1, opacity2),
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
              color: whiteWithOpacity(0.25),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              blurStyle: BlurStyle.outer),
          BoxShadow(
              color: blackWithOpacity(0.25),
              blurRadius: 100.0,
              spreadRadius: 2.0,
              blurStyle: BlurStyle.inner)
        ],
        border: Border.all(
            color: blackWithOpacity(0.2),
            width: 1.0,
            strokeAlign: StrokeAlign.inside));
