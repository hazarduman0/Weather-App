import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppPageController extends ChangeNotifier {
  final PanelController _panelController = PanelController();
  final PageController _pageViewController = PageController();

  PanelController get panelController => _panelController;
  PageController get pageViewController => _pageViewController;

  AppPageController() {
    _pageViewController.addListener(_pageViewListener);
  }

  _pageViewListener() {
    if (_panelController.isAttached &&
        (_panelController.isPanelAnimating ||
            _panelController.panelPosition != 0)) {
      _pageViewController.jumpToPage(_pageViewController.initialPage);
    }
  }

  tooglePanel() {
    _panelController.isPanelOpen ? closePanel() : openPanel();
  }

  closePanel() {
    _panelController.close();
    notifyListeners();
  }

  openPanel() {
    _panelController.open();
    notifyListeners();
  }

  update() {
    notifyListeners();
  }
}
