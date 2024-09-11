// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CityModel extends ChangeNotifier{
  String _city = "İstanbul";

  String get getCity => _city;

  void changeCityName(String? newCity) {
    if (newCity != null) {
        _city = newCity;
        notifyListeners();
      }
  }
}
