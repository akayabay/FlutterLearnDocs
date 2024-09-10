import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.userName});

  final String name = "Adem";
  final String? userName;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //Version 1
          const Text(
            ("Buy the best one"),
            // Maksimum satır sayısı.
            maxLines: 2,
            // Taşan metni kırpar ve ellipsis sayesinde 3 nokta atar.
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            style: TextStyle(
                wordSpacing: 2,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                color: Colors.lime,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          //Version 2
          Text(
            ("Welcome $name ${name.length}"),
            // Maksimum satır sayısı.
            maxLines: 2,
            // Taşan metni kırpar ve ellipsis sayesinde 3 nokta atar.
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            style: ProjectStyles.welcomeStyle,
          ),
          //Version 3
          Text(
            ("Welcome $name ${name.length}"),
            // Maksimum satır sayısı.
            maxLines: 2,
            // Taşan metni kırpar ve ellipsis sayesinde 3 nokta atar.
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            // https://m3.material.io/styles/typography/type-scale-tokens
            // Her defasında ayrı ayrı style yazmak yerine hazır style kullanıp istenilen özellikler değiştirilebilir
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ProjectColor.welcomeColor1,
                ),
          ),
          // Null olabilecek değerde nullcheck yapılmalıdır
          Text(userName ?? ''),
          //Text(userName!),// Bu kullanım yanlıştır, kodu patlatabilir
          Text(keys.welcome),
        ]),
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    fontSize: 16,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
    color: Colors.deepPurple,
    wordSpacing: 2,
    letterSpacing: 2,
    fontWeight: FontWeight.w600,
  );
}

class ProjectColor {
  static Color welcomeColor1 = Colors.amber;

  static Color get welcomeColor2 => Colors.blue;
}

class ProjectKeys {
  final String welcome = "Welcome";
}
