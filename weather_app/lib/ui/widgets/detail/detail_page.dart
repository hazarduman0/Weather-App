import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_colors.dart';
import 'package:weather_app/ui/widgets/detail/detail.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: solidColor5,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 168, 50, 41),
              ))
        ],
      ),
      body: WeatherDetail(
          name: name,
          decoration: _decoration,
          header: const SizedBox.shrink(),
          search: false,
          height: size.height),
    );
  }

  BoxDecoration get _decoration => const BoxDecoration(color: solidColor5);
}
