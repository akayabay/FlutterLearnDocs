// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:city_app_with_provider_instead_callback/provider_models/city_model.dart';
import 'package:city_app_with_provider_instead_callback/provider_models/container_color_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SagWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 160,
      width: 160,
      child: Column(children: [
        Text(
          'SagWidget C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Sehir: ${context.watch<CityModel>().getCity}",
          style: TextStyle(fontSize: 20),
        ),
        TextField(
          onChanged: (value) {
            context.read<CityModel>().changeCityName(value);
            context.read<ContainerColorModel>().switchContainerColor();
          },
        ),
        ElevatedButton(
            onPressed: () {
              context.read<ContainerColorModel>().switchContainerColor();
            },
            child: Text("Renk değiş"))
      ]),
    );
  }
}
