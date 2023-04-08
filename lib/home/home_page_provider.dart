// a provider for homepage to handle the state of the page
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  bool isExpanded = false;
  bool showText = false;

  // set the current page index
  void setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void expandDrawer() {
    isExpanded = true;
    notifyListeners();
  }

  void collapseDrawer() {
    isExpanded = false;
    showText = false;
    notifyListeners();
  }

  void manageShowText() {
    if (showText == false) {
      showText = true;
    }
    notifyListeners();
  }
}
