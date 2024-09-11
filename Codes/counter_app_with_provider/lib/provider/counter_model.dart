import 'package:flutter/material.dart';

// ChangeNotifier is a simple class included in the Flutter SDK which provides change notification to its listeners.
// In other words, if something is a ChangeNotifier, you can subscribe to its changes. (It is a form of Observable, for those familiar with the term.)
// In provider, ChangeNotifier is one way to encapsulate your application state.
// For very simple apps, you get by with a single ChangeNotifier. In complex ones, you'll have several models, and therefore several ChangeNotifiers.
// (You don't need to use ChangeNotifier with provider at all, but it's an easy class to work with.)

// Genel olarak uygulamanın içerisinde değişikliklerini dinlemek istediğimiz widgetın logiclerini ayrı bir classta topluyoruz.
// İlgili değişiklikleri gözlemleyebilmek için ChangeNotifier sınıfından türetiyoruz.
// İlgil fonksiyonlarda UI üzerinde değişim sağlayacak mantıksal değişiklikler yapıldıktan sonra,
// notifyListeners(); çağırısı bu modeli dinleyen widget'lara yeniden inşa etmelerini söyler. Widget yeni değerlerle tekrar build edilir.

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get getCounter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
