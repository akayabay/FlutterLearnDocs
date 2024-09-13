import 'package:flutter/material.dart';

class StatefullLifeSycleLearn extends StatefulWidget {
  const StatefullLifeSycleLearn({super.key, required this.message});
  final String message;
  @override
  State<StatefullLifeSycleLearn> createState() => _StatefullLifeSycleLearnState();
}

class _StatefullLifeSycleLearnState extends State<StatefullLifeSycleLearn> {
  String _message = '';
  late final bool _isOdd;

  // initState'ler class içerisindeki constructor metodlar olarak düşünülebilir.
  // Statefull widgetlar çizilmeye başlamadan önce başlayıp, çizilmeden önce biter
  // Yani build metodu çağrılmadan evvel burası çalışır
  // Constructor gibi buda yanlızca 1 kez çalışır
  // Potansiyel late hataları alınırsa tekrardan derlemek sorunu çözebilir
  // Değişiklikleri görebilmek içinde tekrardan derlemek gerekebilir
  @override
  void initState() {
    super.initState();
    print("initState() çağırıldı.");
    _message = widget.message;
    _isOdd = _message.length.isOdd;
    _computeName();
  }

  // Yine initState gibi draw işleminden önce çalışır
  // Ancak initState'ten sonra çalışır
  // Sayfanın içerisinde elementler veya widgetlarda bir değişiklik, içerideki statelerde update edildiğinde çalışır
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies() çağırıldı.");
  }

  // Üst sınıftan yollanan parametrede bir değişiklik olduğunda
  // Yani örneğin servisten gelen datada değişiklik olduğunda çalışır
  @override
  void didUpdateWidget(covariant StatefullLifeSycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget() çağırıldı.");
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(
          () {}); // Eğitmen set state elle verdi ancak set state verilmese bile çağrı yapılan yerden parametre değişince değer yinede güncellendi.
    }
  }

  // Farklı sayfaya vs. geçildiği zaman yani kısaca sayfadan çıkıldığı zaman çağrılan metoddur
  // Sayfa içerisinde kullanılan değerleri sıfırlamak/temizlemek için yazılan kodlar buraya yazılır
  // Bazı componentler dispose olduğunda ölmeyebiliyor veya lifecycle dolayısıyla benzer sorunlar yaşanabiliyor
  @override
  void dispose() {
    super.dispose();
    _message = "";
  }

  void _computeName() {
    if (_isOdd) {
      _message += " tek";
    } else {
      _message += " çift";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(
              onPressed: () {
                setState(() {
                  _message = "a";
                });
              },
              child: Text(_message)),
    );
  }
}
