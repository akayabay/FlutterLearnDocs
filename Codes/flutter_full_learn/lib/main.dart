import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/20)text_field_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          iconColor: Colors.red,
          border: OutlineInputBorder(),
          floatingLabelStyle: TextStyle(color: Colors.amber, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TextFieldLearn(),
    );
  }
}
