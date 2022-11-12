import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/providers/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      height: size.height,
      width: size.width,
      color: Colors.brown,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          Consumer(
            builder: (context, ref, child) {
              final info = ref.watch(cityAndDay);
              final response = ref.watch(forecastWeatherResponse(info));
              return response.map(
                data: (data) => Text(response
                    .value!.forecast!.forecastday!.first.day!.avgtempC
                    .toString()),
                error: (error) => Text('Hata $error'),
                loading: (loading) =>
                    const Center(child: CircularProgressIndicator()),
              );
            },
          )
        ],
      ),
    ),
    );
  }
}
