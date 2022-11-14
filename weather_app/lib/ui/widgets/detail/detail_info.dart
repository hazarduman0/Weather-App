import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';

class DetailInfoWidget extends StatelessWidget {
  DetailInfoWidget({super.key, required this.status, required this.value});

  String status;
  String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      width: size.width / 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(status,
                style:
                    sfPro500Weight.copyWith(color: Colors.grey, fontSize: 10.0)),
            AutoSizeText(value,
                style:
                    sfPro600Weight.copyWith(color: Colors.white, fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
