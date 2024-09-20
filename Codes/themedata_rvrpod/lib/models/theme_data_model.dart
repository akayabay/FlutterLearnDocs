import 'package:flutter/material.dart';

class ThemeDataModel extends ChangeNotifier {
  Brightness theme;
  ThemeDataModel({this.theme = Brightness.light});

  void changeTheme() {
    theme == Brightness.light ? theme = Brightness.dark : theme = Brightness.light;
    notifyListeners();
  }
}
