import 'package:flutter/material.dart';
import 'package:grid_selector/grid_selector_item.dart';

class BaseGridSelectorItem implements GridSelectorItem<int> {
  BaseGridSelectorItem({
    @required this.key,
    @required this.label,
    this.isEnabled = true,
  });

  @override
  bool isSelected(selectedKey) {
    if (selectedKey == null) {
      return false;
    }
    return this.key == selectedKey;
  }

  @override
  int key;

  @override
  String label;

  @override
  bool isEnabled;
}
