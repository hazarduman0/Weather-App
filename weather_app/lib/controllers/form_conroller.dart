import 'dart:developer';

import 'package:flutter/material.dart';

class FormController extends ChangeNotifier {
  final TextEditingController _textEditingController = TextEditingController();

  TextEditingController get textEditingController => _textEditingController;

  update() {
    notifyListeners();
  }
}
