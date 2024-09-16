// Bir ekran olacak
// Bu ekranda 3 botton ve bunlara basınca renk değişimi olacak
// Secili olan button selected icon olsun

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backGroundColor;

  _changeBackgruondColor(Color color) {
    setState(() {
      _backGroundColor = color;
    });
  }

  @override
  void initState() {
    super.initState();
    _backGroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Debug için print kullanılabilir
    // Printler relase versiyonunda kaldırılmadılır
    print(widget.initialColor != _backGroundColor && widget.initialColor != null);
    // Inspect kullanılabilir
    inspect(widget); // Gelen widget değerini inceler ve consola bir rapor gönderir, bir çeşit debug yöntemidir
    // Debug modunda çalıştırılabilir
    if (widget.initialColor != _backGroundColor && widget.initialColor != null) {
      _changeBackgruondColor(widget.initialColor!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red), label: "Red"),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow), label: "Red"),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: "Red"),
      ]),
    );
  }

  void _colorOnTap(value) {
    if (value == _Colors.red.index) {
      _changeBackgruondColor(Colors.red);
    } else if (value == _Colors.yellow.index) {
      _changeBackgruondColor(Colors.yellow);
    } else if (value == _Colors.blue.index) {
      _changeBackgruondColor(Colors.blue);
    }
  }
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({super.key, required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10);
  }
}

enum _Colors { red, yellow, blue }
