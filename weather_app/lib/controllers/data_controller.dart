import 'package:flutter/material.dart';

class DataController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  changeLoadingStatus() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}
