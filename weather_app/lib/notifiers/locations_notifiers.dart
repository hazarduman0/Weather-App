import 'package:flutter/material.dart';
import 'package:weather_app/data/models/main_models/weather_current.dart';

class LocationsNotifier extends ChangeNotifier{
  List<CurrentWeather> _addedLocations = [];

  List<CurrentWeather> get addedLocations => _addedLocations;

  updateList(List<CurrentWeather> locations){
    _addedLocations = locations;
    notifyListeners();
  }
}