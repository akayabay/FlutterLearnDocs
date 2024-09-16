import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Lisview lazy loading ile çalışır.
      // Lazy Loading: Kaydırma işlemi sırasında, sadece ekrana yaklaşan öğeler hafızaya yüklenir, diğerleri yüklenmez.
      // Her ne kadar lazy çalışsada, bütün elemanlar tek seferde verildiği için tehlikeli bir kullanımdır.
      // Örnek vermek gerekirse lazyde renderlandıkça çizildiği için eleman boyutlarının ekrana sığdığı ve çok fazla eleman olduğu zaman çeşitli performans sorunlarına yol açabilir.
      body: ListView(
        shrinkWrap:
            false, // Bu true olduğunda içerideki component sayısına göre ne kadar alan kaplayacağını hesaplayıp sıkıştırıyor. Render problemlerinde bir çözüm yolu sunabilir ama kullanırken dikkat edilmelidir.
        padding: EdgeInsets.zero,
        children: [
          FittedBox(
            // widget boyutunu ekrana göre sıkıştırır
            child: Text(
              "Merhaba",
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          const Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.green, width: 300),
                Container(color: Colors.white, width: 300),
                Container(color: Colors.green, width: 300),
                Container(color: Colors.white, width: 300),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          FittedBox(
            // widget boyutunu ekrana göre sıkıştırır
            child: Text(
              "bay",
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
            ),
          ),
          const _ListViewItem(), // Lazy loading kontrolü yapılan widget
        ],
      ),
    );
  }
}

class _ListViewItem extends StatefulWidget {
  const _ListViewItem({super.key});

  @override
  State<_ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<_ListViewItem> {
  @override
  void initState() {
    super.initState();
    print("Girdi");
  }

  @override
  void dispose() {
    super.dispose();
    print("çıktı");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
