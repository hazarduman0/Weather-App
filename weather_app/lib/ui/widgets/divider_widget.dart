import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  DividerWidget({super.key, required this.intent});

  double intent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.blueGrey,
      thickness: 0.6,
      height: 1.0,
      indent: intent,
      endIndent: intent,
    );
  }
}
