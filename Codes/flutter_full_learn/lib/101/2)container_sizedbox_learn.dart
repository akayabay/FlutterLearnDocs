import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Text("a" * 500),
          ),
          const SizedBox.shrink(), //boş kutu
          SizedBox.square(
            dimension: 60,
            child: Text('b' * 50),
          ),
          Container(
            constraints: const BoxConstraints(
                maxWidth: 200, minWidth: 100, minHeight: 60, maxHeight: 120),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: ProjectUtility.boxDecoration,
            child: Text("aa" * 50, maxLines: 2,),
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.red,
    border: Border.all(
      width: 10,
      color: Colors.black38,
    ),
    gradient: const LinearGradient(
      colors: [Colors.red, Colors.blue],),
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(color: Colors.white, blurRadius: 12, offset: Offset(0.1, 2))
    ],
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      boxShadow: const [BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)],
      border: Border.all(width: 10, color: Colors.white12));
}