import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});
  final String _name = "Ali";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _CustomCard(
            child: SizedBox(
              height: 100,
              width: 300,
              child: Center(
                  child: Text(
                _name,
                style: Theme.of(context).textTheme.headlineLarge,
              )),
            ),
          )
        ],
      ),
    );
  }
}

// Borders
//  StadiumBorder(),CircleBorder(),RoundedRectangeBorder()

class _CustomCard extends StatelessWidget {
  const _CustomCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      shape: ProjectMargins.roundedRectangleBorder,
      color: Colors.amber,
      child: child,
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
  static const roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));
}
