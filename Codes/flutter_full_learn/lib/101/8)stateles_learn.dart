import 'package:flutter/material.dart';

// Bir stateless widget kullanırken bilinmesi gereken ana noktalar;
// 1) Karışıklık arttığında widgetlar extract edilip parçalanmalı.
// 2) Extract edilen widgetlar dışarıdan parametre alabilir halde olmalı.
// 3) Tek sayfada kullanılacaksa private olarak entegre edilmeli.

class StaltessLearn extends StatelessWidget {
  final String text2 = "veli";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TitleTextWidget(text: text2),
          const TitleTextWidget(text: "veli2"),
          _emptyBox(),
          const TitleTextWidget(text: "veli3"),
          _emptyBox(),
          const TitleTextWidget(text: "veli4"),
          const _CustomContainer(),
          _emptyBox()
        ],
      ),
    );
  }

  SizedBox _emptyBox() => const SizedBox(height: 10);
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}