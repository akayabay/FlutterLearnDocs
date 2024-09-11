// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:city_app_with_provider_instead_callback/pages/my_home_page.dart';
import 'package:city_app_with_provider_instead_callback/provider_models/city_model.dart';
import 'package:city_app_with_provider_instead_callback/provider_models/container_color_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CityModel()),
        ChangeNotifierProvider(
          create: (context) => ContainerColorModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
