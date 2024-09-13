import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _buttonValue = 1;
  //final String _hello = "Merhaba";

  void _updateCounterValue() {
    return setState(() {
      _buttonValue++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _updateCounterValue(),
      child: Text("${LanguageItems.welcomeTitle} $_buttonValue"),
    );
  }
}
