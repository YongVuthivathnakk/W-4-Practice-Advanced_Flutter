import 'package:flutter/material.dart';

class ColorService extends ChangeNotifier {
  int _redCount = 0;
  int _blueCount = 0;

  int get redCount => _redCount;
  int get blueCount => _blueCount;

  void implementBlueCount() {
    _blueCount++;
    notifyListeners();
  }

  void implementRedCount() {
    _redCount++;
    notifyListeners();
  }
}
