import 'package:flutter/material.dart';

class ContainerColorModel extends ChangeNotifier {
  Color sagWidgetContainerColor = Colors.green;
  Color solWidgetContainerColor = Colors.yellow;

  switchContainerColor() {
    if (sagWidgetContainerColor == Colors.green &&
        solWidgetContainerColor == Colors.yellow) {
      sagWidgetContainerColor = Colors.yellow;
      solWidgetContainerColor = Colors.green;
    } else {
      sagWidgetContainerColor = Colors.green;
      solWidgetContainerColor = Colors.yellow;
    }
    notifyListeners();
  }
}
