import 'package:flutter/material.dart';

//weather widget inner padding
EdgeInsets weatherWidgetInnerPadding(Size size) =>
     EdgeInsets.only(bottom: size.height * 0.01, left: size.width * 0.05, right: size.width * 0.05);

// weather widget information horizontal padding
EdgeInsets weatherWidgetInformationHorizontalPadding(Size size) =>
     EdgeInsets.symmetric(horizontal: size.width * 0.05);

// weather widget padding
EdgeInsets weatherWidgetPadding(Size size) =>
     EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.02);
