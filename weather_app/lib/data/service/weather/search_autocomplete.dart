import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/data/models/search.dart';

class SearchService {
  static String _baseUrl(String apiKey, String search) =>
      'http://api.weatherapi.com/v1/search.json?key=$apiKey &q=$search';

  Future<List<SearchModel>?> getAutoCompleteResult(String search) async {
    try {
      var response =
          await Dio().get(_baseUrl('67ff3fafbd214bb3b3b94739222809', search));
      if (response.statusCode == 200) {
        if (response.data != null) {
          List<SearchModel>? searchs = [];
          for (int i = 0; i < response.data.length; i++) {
            final singleSearch = SearchModel.fromJson(response.data[i]);
            searchs.add(singleSearch);
          }
          log(response.data.toString());
          //return ForecastWeather.fromJson(response.data);
          return searchs;
        }
      }
    } catch (e) {
      log('get forecast weather error : $e');
    }
    return null;
  }
}
