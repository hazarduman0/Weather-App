import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/helpers/decoration_helper.dart';

class DetailPageLoading extends StatelessWidget {
   DetailPageLoading({super.key, required this.height, required this.search});

  double height;
  bool search;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: size.width,
      decoration: showModalDecoration(size),
      child: Align(
        alignment: Alignment.topCenter,
        child: search ? addCancelRow(context) : const SizedBox.shrink(),
      ),
    );
  }

  Widget addCancelRow(BuildContext context) => Row(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const AutoSizeText('Cancel')),
          const Spacer(),
          const TextButton(onPressed: null, child: AutoSizeText('Add'))
        ],
      );
}