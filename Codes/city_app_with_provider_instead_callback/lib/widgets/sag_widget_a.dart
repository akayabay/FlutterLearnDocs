// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:city_app_with_provider_instead_callback/widgets/sag_widget_b.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider_models/container_color_model.dart';

class SagWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<ContainerColorModel>().sagWidgetContainerColor,
      child: Column(children: [
        Text(
          'SagWidget A',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB()
      ]),
    );
  }
}
