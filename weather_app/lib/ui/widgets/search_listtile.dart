import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_text_styles.dart';
import 'package:weather_app/data/models/search.dart';

class SearchListtile extends StatelessWidget {
  SearchListtile({super.key, required this.searchModel});

  SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        '${searchModel.name}, ${searchModel.region}',
        style: sfPro500Weight.copyWith(fontSize: 20.0),
      ),
      subtitle: AutoSizeText(
        '${searchModel.country}',
        style: sfPro400Weight.copyWith(fontSize: 15.0),
      ),
    );
  }
}
