import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themedata_rvrpod/pages/homepage.dart';
import 'package:themedata_rvrpod/providers/general_providers.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        brightness: ref.watch(themeDataNotiferProvider).theme,
        seedColor: Colors.deepPurple,
      )),
      home: const HomePage(),
    );
  }
}
