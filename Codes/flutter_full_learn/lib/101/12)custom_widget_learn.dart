import 'package:flutter/material.dart';

//  Stateless Widget Üzerinden Core Component Yapma
// --------------------------------------------------
// Core component yapmakla widget'ı parçalamak farklı şeyler
// Core component her yerde kullanılabilmesi lazım ve durumlardan vs. herhangi bir şekilde etkilenmiyor olması lazım
// Daha özelliştilebilir custom widgetlar için parametre callback yapılacak(farklı renk vs.). Bu konu ileride konuşulacak.
// Sayfanın büyümesine bağlı olarak customcomponent dışarı çıkarılacak
// Yapılmak istenilen UI'a bakıcaksın, bu component birden fazla yerde var mı?
// O zaman bunu en primitive şekilde çıkaracaksın

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});
  final String title = "Food";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomFoodButton(
                onPressed: () {},
                title: title,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomFoodButton(
              onPressed: () {},
              title: title,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: pink),
        onPressed: onPressed,
        child: Padding(
          padding: normal2xPadding,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: white,
                ),
          ),
        ));
  }
}

mixin _ColorsUtility {
  final Color pink = Colors.pinkAccent;
  final Color white = Colors.white;
}

mixin _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}
