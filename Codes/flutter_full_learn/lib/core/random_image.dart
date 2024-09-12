import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  RandomImage({super.key, this.height = 100, this.picURL = "https://picsum.photos/500"});
  final String picURL;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(picURL, height: 100, fit: BoxFit.cover);
  }
}
