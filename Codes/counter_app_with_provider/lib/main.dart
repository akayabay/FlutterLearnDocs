import 'package:counter_app_with_provider/pages/my_home_page.dart';
import 'package:counter_app_with_provider/provider/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider'ı widget ağacında müdahale etmek istediğimiz sayfaları kapsayan bir üst scope'a yerleştiriyoruz.
    // Bu durumda MateriallApp uygundur.
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CounterModel();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}