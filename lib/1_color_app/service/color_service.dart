import 'package:flutter/material.dart';
import 'package:week4_advance_flutter/1_color_app/model/color_type.dart';

class ColorService extends ChangeNotifier {
  final Map<ColorType, int> _counts = {
    for (var type in ColorType.values) type: 0,
  };

  Map<ColorType, int> get counts => _counts;

  void implementCount(ColorType type) {
    // Make it aware of null values when adding a new color with (no hot reload)

    _counts[type] = (_counts[type] ?? 0) + 1;
    notifyListeners();
  }
}
