import 'dart:math';

import 'package:flutter/material.dart';

const lightPrimary = Color.fromRGBO(0, 0, 0, 1.0);
const lightSecondary = Color.fromRGBO(60, 60, 67, 0.6);
const lightTertiary = Color.fromRGBO(60, 60, 67, 0.3);
const lightQuaternary = Color.fromRGBO(60, 60, 67, 0.18);

const darkPrimary = Color.fromRGBO(255, 255, 255, 1.0);
const darkSecondary = Color.fromRGBO(235, 235, 245, 0.6);
const darkTertiary = Color.fromRGBO(235, 235, 245, 0.3);
const darkQuaternary = Color.fromRGBO(235, 235, 245, 0.18);

const linearColor1 = LinearGradient(
    colors: [Color.fromRGBO(46, 51, 90, 1.0), Color.fromRGBO(28, 27, 51, 1.0)]);
const linearColor2 = LinearGradient(colors: [
  Color.fromRGBO(89, 54, 180, 1.0),
  Color.fromRGBO(54, 42, 132, 1.0)
]);
const linearColor3 = LinearGradient(colors: [
  Color.fromRGBO(66, 123, 209, 1.0),
  Color.fromRGBO(193, 89, 236, 1.0)
]);
const linearColor4 = LinearGradient(colors: [
  Color.fromRGBO(174, 201, 255, 1.0),
  Color.fromRGBO(174, 201, 255, 1.0),
  Color.fromRGBO(8, 48, 114, 1.0)
]);

LinearGradient weatherInfoGradient() => const LinearGradient(
      colors: [
        Color.fromRGBO(72, 49, 157, 0.2),
        Color.fromRGBO(72, 49, 157, 0.01),
      ],
      stops: [0.8, 1.0],
      // transform: const GradientRotation(pi / 4)
    );

LinearGradient weatherInfoNowGradient() => const LinearGradient(
      colors: [
        Color.fromRGBO(72, 49, 157, 1.0),
        Color.fromRGBO(72, 49, 157, 0.01),
      ],
      stops: [0.7, 1.0],
    );

const slideUpGradient = LinearGradient(
    colors: [Color.fromRGBO(46, 51, 90, 0.5), Color.fromRGBO(28, 27, 51, 0.5)]);

const tabIndicatorGradient = LinearGradient(colors: [
  Colors.transparent,
  Color.fromRGBO(119, 88, 209, 0.6),
  Color.fromRGBO(247, 203, 253, 0.6),
  Colors.transparent
]);

const radialColor = RadialGradient(colors: [
  Color.fromRGBO(247, 203, 253, 1.0),
  Color.fromRGBO(119, 88, 209, 1.0)
]);
const angularColor = LinearGradient(colors: [
  Color.fromRGBO(97, 47, 171, 0.0),
  Color.fromRGBO(97, 47, 171, 1.0),
  Color.fromRGBO(97, 47, 171, 0.0),
  Color.fromRGBO(97, 47, 171, 1.0)
], transform: GradientRotation(pi / 4));

const solidColor1 = Color.fromRGBO(72, 49, 157, 1.0);
const solidColor2 = Color.fromRGBO(31, 29, 71, 1.0);
const solidColor3 = Color.fromRGBO(196, 39, 251, 1.0);
const solidColor4 = Color.fromRGBO(224, 217, 255, 1.0);
const solidColor5 = Color.fromRGBO(29, 27, 49, 1.0);

Color blackWithOpacity(double opacity) {
  double op = opacity;
  if (opacity >= 1.0) op = 1.0;
  if (opacity <= 0.0) op = 0.0;
  return Color.fromRGBO(255, 255, 255, op);
}

Color whiteWithOpacity(double opacity) {
  double op = opacity;
  if (opacity >= 1.0) op = 1.0;
  if (opacity <= 0.0) op = 0.0;
  return Color.fromRGBO(0, 0, 0, op);
}
