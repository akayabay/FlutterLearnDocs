// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider_models/city_model.dart';
import '../provider_models/container_color_model.dart';

class SolWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: context.watch<ContainerColorModel>().solWidgetContainerColor,
        child: Column(
          children: [
            Text(
              'Sol Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Sehir: ${context.watch<CityModel>().getCity}",
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}
