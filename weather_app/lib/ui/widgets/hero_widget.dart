import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  String tag;
  Widget widget;
  HeroWidget({super.key, required this.tag, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tag,
        child: Material(type: MaterialType.transparency, child: widget));
  }
}
