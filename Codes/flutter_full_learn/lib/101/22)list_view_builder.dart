import 'package:flutter/material.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Her kart sonrası ek birşey olacaksa ListView.seperated kullanılabilir
      body: ListView.builder(
        itemBuilder: (context, index) {
          print("$index");
          // Bu kısımda servisten gelen bir datanın gecikmesi sebebiyle ve ListView mantığında ekrana sığdığı kadar çizdirildiği için
          // Biz sizedbox içerisine alıp heigth belirttiğimizde ekrana kaç 200 piksel sığıyorsa o kadar item çizdirir
          // Bunu vermediğimde 62 tane itemın resimler gelmeden çizdirildiğini gözlemledim çünkü resimsiz halinden ekrana 62 tane sığıyordu
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(child: Image.network("https://picsum.photos/200")),
                Text("$index"),
              ],
            ),
          );
        },
      ),
    );
  }
}
