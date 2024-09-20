import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int counter;
  CounterModel({required this.counter});

  int get getcounter => counter;

  void inc() {
    counter++;
    notifyListeners();
  }

  void dec() {
    counter--;
    notifyListeners();
  }
}
