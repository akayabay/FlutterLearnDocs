import 'package:flutter/material.dart';

class IndicatorLearnn extends StatelessWidget {
  const IndicatorLearnn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CenterCircularProgress(),
            SizedBox(
              height: 15,
            ),
            LinearProgressIndicator()
          ],
        ),
      ),
    );
  }
}

class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Uygulamanın genelde tek bir tip progress indicatorı olur
    // Bu yüzden theme üzerinde progressIndicatorTheme propertysinden 1 kez özelleştirmek mantıklıdır
    return const CircularProgressIndicator(
      color: Colors.red,
      strokeWidth: 10,
      value: 0.7, // Örneğin servisten data çektin yüzde kaç yüklendiğini bu propertyle gösterebilirsi
      backgroundColor: Colors.white, // Bu da yüklenmemin kalan kısmının rengi
    );
  }
}
