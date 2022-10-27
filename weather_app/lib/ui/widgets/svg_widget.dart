import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  SvgWidget({super.key, required this.svgPath, this.boxSize});

  String svgPath;
  double? boxSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double _boxSize = boxSize ?? size.width * 0.07;
    return SizedBox(
      width: _boxSize,
      height: _boxSize,
      child: SvgPicture.asset(svgPath),
    );
  }
}
