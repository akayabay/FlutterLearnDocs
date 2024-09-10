import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});
  final imageNetworkLink =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Apple-book.svg/800px-Apple-book.svg.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: PngImage(
              nameWithPath: ImageItems().appleWithBooksPng,
            ),
          ),
          Image.network(
            imageNetworkLink,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.abc_outlined),
          )
        ],
      ),
    );
  }
}

class PngImage extends StatelessWidget {
  const PngImage({
    super.key,
    required this.nameWithPath,
  });

  final String nameWithPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageItems().appleWithBooksPng,
      fit: BoxFit.cover,
    );
  }
}

class ImageItems {
  final String appleWithBooksPng = "assets/png/ic_apple_with_school.png";
}
