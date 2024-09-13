// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/counter_hello_button.dart';

// Bu kısım değişmez bir widgettır (Statfull widget ile extend edilen class)
// Sadece dışarıdan parametre alır (Dışarıdan data al ver kısmı)
// Bu kapsamda aslında stateless widget gibi çalışır
class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

// State(Hayat)'ı belirleyen kısım burasıdır
class _StatefullLearnState extends State<StatefullLearn> {
  int _value = 1;

  // setState() çalıştığı anda build metodu tetiklenir
  // Bu sayede ekranda son value son değerini alır
  // Fakat bu doğru bir kullanım şekli değildir

  void _valueChanger(bool isIncrement) {
    setState(() {
      isIncrement == true ? _value++ : _value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              _value.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Placeholder(),
            // Burada yazmış olduğumuz elevatedbuttonu ayrı bir sayfada statefull olarak yazdık
            // Bu sayede bu butonun içindeki değer her değiştiğinde sadece bu buton tekrardan çizildi
            // FloatingAction buttonlara her bastığımızda diğer componentleride etkiliyor ve onlar yeniden çiziliyor
            // Bu yüzden bu tarz değişen componentleri ayrı bir statfull widget haline getirip sayfalarımızda yönetimlerini sağlıyoruz
            // Flutterda en dikkat etmemiz gereken nokta budur.
            // SADECE BU COMPONENTLE İLGİLİ COMPONENTLER BİRBİRİNİ KONUŞTURMALI.
            const CounterHelloButton(),
          ],
        ),
      ),
    );
  }

  Padding _incrementButton() {
    print("_incrementButton çalıştı.");
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FloatingActionButton(
        onPressed: () {
          _valueChanger(true);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Padding _deincrementButton() {
    print("_deincrementButton çalıştı.");
    return Padding(
      padding: const EdgeInsets.all(8),
      child: FloatingActionButton(
        onPressed: () {
          _valueChanger(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
