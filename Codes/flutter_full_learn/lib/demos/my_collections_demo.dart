import 'package:flutter/material.dart';

class MyCollectionsDemo extends StatefulWidget {
  const MyCollectionsDemo({super.key});

  @override
  State<MyCollectionsDemo> createState() => _MyCollectionsDemoState();
}

class _MyCollectionsDemoState extends State<MyCollectionsDemo> {
   late final List<CollectionModel> _items;
  
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: PaddingUtility().paddingHorizantal,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return _CategoryCard(model: _items[index]);
      },
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    super.key,
    required CollectionModel model,
  }) : _model = model;

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingGeneral,
        child: Column(
          children: [
            Image.asset(
              _model.imagePath,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: PaddingUtility().paddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(_model.title), Text("${_model.price} eth")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({required this.imagePath, required this.title, required this.price});
}

class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingGeneral = const EdgeInsets.all(20);
  final paddingHorizantal = const EdgeInsets.symmetric(horizontal: 20);
}

class CollectionItems {
  late final List<CollectionModel> items;

  CollectionItems() {
    items.addAll([
      CollectionModel(imagePath: ProjectImages.collectionImage, title: 'Abstract Art1', price: 3.4),
      CollectionModel(imagePath: ProjectImages.collectionImage, title: 'Abstract Art2', price: 3.4),
      CollectionModel(imagePath: ProjectImages.collectionImage, title: 'Abstract Art3', price: 3.4),
      CollectionModel(imagePath: ProjectImages.collectionImage, title: 'Abstract Art4', price: 3.4),
      CollectionModel(imagePath: ProjectImages.collectionImage, title: 'Abstract Art5', price: 3.4),
    ]);
  }
}

class ProjectImages {
 static const String collectionImage  = 'assets/png/img_collection.png';
}
