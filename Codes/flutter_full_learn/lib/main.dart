import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/note_demos_view.dart';

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
      // theme: ThemeData.dark().copyWith(
      //   appBarTheme: const AppBarTheme(
      //       centerTitle: true,
      //       systemOverlayStyle: SystemUiOverlayStyle.light,
      //       backgroundColor: Colors.red,
      //       elevation: 0,),
      // ),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const NoteDemosView(),
    );
  }
}

// Paddingler sayfanın solundan ve solundan aynı verilmelidir