// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String city = "İstanbul";

  void changeCityName(String? newCity) {
    setState(() {
      if (newCity != null) {
        city = newCity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: SolWidgetA(solWidgetCityA: city)),
            Expanded(
              // changeCityName() çağrısı fonksiyonu çağırmaya çalışır
              // changeCityName ise fonksiyonun bellekte tutulan adresine erişir
              // Bu sayede referans değeri pass edilebiliyor ve callback olarak kullanılabiliyor
                child: SagWidgetA(
                    sagWidgetCityA: city, callback: changeCityName))
          ],
        ),
      ),
    );
  }
}

class SolWidgetA extends StatelessWidget {
  SolWidgetA({super.key, required this.solWidgetCityA});
  String solWidgetCityA;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Text(
              'Sol Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Sehir: $solWidgetCityA",
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

class SagWidgetA extends StatelessWidget {
  SagWidgetA({super.key, required this.sagWidgetCityA, required this.callback});
  String sagWidgetCityA;
  Function callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(children: [
        Text(
          'SagWidget A',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB(
          sagWidgetCityB: sagWidgetCityA,
          callback: callback,
        )
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {
  SagWidgetB({super.key, required this.sagWidgetCityB, required this.callback});
  String sagWidgetCityB;
  Function callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: [
        Text(
          'SagWidget B',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetC(
          sagWidgetCityC: sagWidgetCityB,
          callback: callback,
        ),
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  SagWidgetC(
      {super.key,
      required this.sagWidgetCityC,
      required,
      required this.callback});
  String sagWidgetCityC;
  Function callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(children: [
        Text(
          'SagWidget C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Sehir: $sagWidgetCityC",
          style: TextStyle(fontSize: 20),
        ),
        TextField(
          onChanged: (value) {
            callback(value.toString());
          },
        )
      ]),
    );
  }
}