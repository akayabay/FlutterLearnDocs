import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              // onpressed karşılığı userın ekranda butona bastığında yapacağı işlemi ifade eder
              // servise istek at
              // sayfanın rengini düzenle
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.red;
            })),
            child: const Text("Press"),
          ),
          ElevatedButton(
            onPressed: () {}, // null'da verilebilir onPressed: null
            child: const Text("Press"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.access_alarm_outlined),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {},
              child: const SizedBox(width: 200, child: Text("data"))),
          OutlinedButton.icon(
            // Çoğu butonun belkide hepsinin .icon versiyonu vardır.
            onPressed: () {},
            icon: const Icon(Icons.abc),
            label: const Text("data"),
          ),
          InkWell(
            child: const Text("data"),
            onTap: () {},
          ),
          Container(
            height: 100,
            color: Colors.white,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: Text(
              "Place Bid",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}


// Borders:
// CircleBorder(), RoundedRectangleBorder()