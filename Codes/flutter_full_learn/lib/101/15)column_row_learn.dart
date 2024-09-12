import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Flex değeri verilmez ise sadece expanded widgetlar olan bir seneryoda
          // 4 expanded üzerinden düşünürsek 
          // Ekranın tamamı 10 piksel olsa expanded başına 2.5 piksel olarak eşit şekilde böler
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.blue)),
                  Expanded(child: Container(color: Colors.green)),
                  Expanded(child: Container(color: Colors.yellow)),
                ],
              )),
          const Spacer(flex: 2),
          const Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,// İçindeki datanın kapladığı alanı boşluksuz kapla(yan yana), defaultu maxtır min verilince spaceevenly gibi özellikler çalışmaz
              children: [
                Text("a1"),
                Text("a2"),
                Text("a3"),
              ],
            ),
          ),
          const Spacer(flex: 2),
          // Expanded widgetları haricinde bir widgeta heigth propertysi tanımlanırsa
          // Bu widget en öne çıkartılır
          // Bu sebeple başta yaptığımızı 4+2+2+2 matematiği bozulur(10 pikselden)
          // 1000 pikselden düşünürsek container 200lük alanı alır
          // Expanded widgetler 800lük alan üzerinden 4+2+2+2 şeklinde bölünür
          // BU YANLIŞ BİR KULLANIMDIR.
          // Bunu yapmak yerine sınırlandırılmış bir widgetin içeriği expandedlarla ayarlandığında
          // Daha dinamik bir yaklaşım olur ve responsive olur
          Container(
            color: Colors.red,
            height: ProjectContainerSizes.cardHeight,
            child: const Column(children: [
              // SizedBox(height: 50, child: Text("aaa")),
              // SizedBox(height: 50, child: Text("aaa")),
              // SizedBox(height: 50, child: Text("aaa")),
              // SizedBox(height: 50, child: Text("aaa")),
              Expanded(child: SizedBox(height: 50, child: Text("aaa"))),
              Expanded(child: SizedBox(height: 50, child: Text("aaa"))),
              Expanded(child: SizedBox(height: 50, child: Text("aaa"))),
              Spacer(),
              Expanded(child: SizedBox(height: 50, child: Text("aaa"))),
            ]),
          )
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}
