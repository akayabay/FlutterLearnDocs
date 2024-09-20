import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themedata_rvrpod/providers/general_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Button2(),
          ],
        ),
      ),
    );
  }
}

// İLK OLARAK İÇERİSİNDEKİ YAZI DEĞİŞTİĞİ İÇİN ConsumerStatefulWidget KULLANARAK YAPTIM.
// FAKAT SONRASINDA BUNA GEREK OLMADIĞINI FARKETTİM VE CONSUMER WİDGET TERCİH ETTİM.
// BURADA ANLAMADIĞIM NOKTA PROVİDER KULLANIRKEN HANGİ SENERYOLARDA ConsumerStatefulWidget KULLANMA İHTİYACI DUYULUYOR?

// class _ThemeElevatedButton extends ConsumerStatefulWidget {
//   const _ThemeElevatedButton({super.key});

//   @override
//   ConsumerState<_ThemeElevatedButton> createState() => _ThemeElevatedButtonState();
// }

// class _ThemeElevatedButtonState extends ConsumerState<_ThemeElevatedButton> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () {
//           ref.read(themeDataNotiferProvider).changeTheme();
//         },
//         child: Text(ref.watch(themeDataNotiferProvider).theme == Brightness.light ? "Ligth" : "Dark"));
//   }
// }

class _Button2 extends ConsumerWidget {
  const _Button2({super.key});

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          ref.read(themeDataNotiferProvider).changeTheme();
        },
        child: Text(ref.watch(themeDataNotiferProvider).theme == Brightness.light ? "Ligth" : "Dark"));
  }
}
