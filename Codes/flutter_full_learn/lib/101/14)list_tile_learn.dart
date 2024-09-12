import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: RandomImage(),
                  /*
                  dense bir boolean (true/false) değeri alır.
                  Amacı, listede yer alan öğenin daha sıkı (kompakt) bir şekilde görünmesini sağlamaktır.
                  dense: true olduğunda, yazı tipi boyutu, simgeler ve genel olarak ListTile'ın yüksekliği daha küçük hale gelir.
                  Bu, özellikle daha küçük alanlarda veya yoğun içerik listelerinde faydalı olabilir.
                  dense: false veya dense özelliği belirtilmezse, varsayılan (daha geniş) boyut kullanılır.
                   */
                  dense:
                      true, // Componenti olabildiğince sıkıştırmaya yarar, bunu kendi paddinglerini sildirerek sağlar
                  /*
                  contentPadding, EdgeInsets türünde bir değer alır ve ListTile içindeki içeriğin (başlık, alt başlık, simgeler vs.) kenarlardan ne kadar boşluk bırakacağını belirtir.
                  Örneğin, contentPadding: EdgeInsets.all(16.0) tüm kenarlardan 16 piksel boşluk bırakır.
                  Bu özellik, ListTile öğelerinin içindeki içeriği kenarlardan uzaklaştırmak veya yaklaştırmak için kullanılır.
                  Padding varsayılan olarak belirli bir boşluk ile gelir, ancak siz bu değeri değiştirerek görsel düzeni özelleştirebilirsiniz.
                   */
                  //contentPadding: EdgeInsets.zero,// Bunu ilk başta themedata içinde yapmak mantıklıdır
                  minVerticalPadding: 0,
                  subtitle: const Text("data"),
                  onTap: () {},
                  leading: const Icon(Icons.abc),
                  trailing: const Icon(Icons.chevron_right_rounded),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
