import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppPageController extends ChangeNotifier {
  final PanelController _panelController = PanelController();
  final PageController _pageViewController = PageController();
  // late PanelController _panelController;
  // late PageController _pageViewController;
  //  bool _isPanelOpen = false;

  // AppPageController() {
  //   _panelController = PanelController();
  //   _pageViewController = PageController();
  // }

  PanelController get panelController => _panelController;
  PageController get pageViewController => _pageViewController;
  //  bool get isPanelOpen => _isPanelOpen;

  disablePageViewController() {}

  tooglePanel() {
    _panelController.isPanelOpen ? closePanel() : openPanel();
  }

  closePanel() {
    _panelController.close();
    log('Kapandı');
    log('_panelController.isAttached: ${_panelController.isAttached}');
    notifyListeners();
  }

  openPanel() {
    _panelController.open();
    log('Açıldı');
    log('_panelController.isAttached: ${_panelController.isAttached}');
    notifyListeners();
  }

  // setPanelBool(){

  // }
}
