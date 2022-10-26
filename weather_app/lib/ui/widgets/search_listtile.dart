import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/data/models/search.dart';

class SearchListtile extends StatelessWidget {
  SearchListtile({super.key, required this.searchModel});

  SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      title: Text(
        '${searchModel.name}, ${searchModel.region}',
        style: sfPro500Weight.copyWith(fontSize: size.width * 0.05),
      ),
      subtitle: Text(
        '${searchModel.country}',
        style: sfPro400Weight.copyWith(fontSize: size.width * 0.04),
      ),
    );
  }
}
