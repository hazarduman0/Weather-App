import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/providers/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late SharedPreferences preferences;

  initPreferences()async{
    preferences = await SharedPreferences.getInstance();
    final items = await preferences.getStringList('locations');
    // final success = await preferences.remove('locations');
    log(items.toString());
    // log(success.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPreferences();
  }
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
