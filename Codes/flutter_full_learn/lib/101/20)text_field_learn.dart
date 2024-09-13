import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              maxLength: 20, // Girilebilecek max karakter sayısı
              //buildCounter: ,
              keyboardType: TextInputType.emailAddress, // Klavyeyi verilen formata göre özelleştirir
              autofillHints: const [
                AutofillHints.email
              ], // Klavyenin üzerinde ipucu kısmında nasıl bir ipucu tarzı verileceğini ayarlamayı sağlar
              inputFormatters: [
                TextProjectInputFormatter()._formatter
              ], // belirli keywordleri engellemeye yarar, hazır paketi varmış onu kullanmak mantıklı olabilir
              textInputAction: TextInputAction.next,
              decoration: _InputDecarotor().emailInput,
            ),
            TextField()
          ],
        ),
      ),
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue == ";") {
      return oldValue;
    } else {
      return oldValue;
    }
  });
}

class _InputDecarotor {
  final emailInput =  const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    labelText: LanguageItems.mailTitle,
  );
}
