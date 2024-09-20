import 'package:learn_rvrpod/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//part 'products_provider.g.dart' // Bu bu dosyanın bir generated file olduğunu gösterir ve riverpod generator için kullanılacağını söyler.

const List<Product> allProducts = [
  Product(id: '1', title: 'Groovy Shorts', price: 12, image: 'assets/products/shorts.png'),
  Product(id: '2', title: 'Karati Kit', price: 34, image: 'assets/products/karati.png'),
  Product(id: '3', title: 'Denim Jeans', price: 54, image: 'assets/products/jeans.png'),
  Product(id: '4', title: 'Red Backpack', price: 14, image: 'assets/products/backpack.png'),
  Product(id: '5', title: 'Drum & Sticks', price: 29, image: 'assets/products/drum.png'),
  Product(id: '6', title: 'Blue Suitcase', price: 44, image: 'assets/products/suitcase.png'),
  Product(id: '7', title: 'Roller Skates', price: 52, image: 'assets/products/skates.png'),
  Product(id: '8', title: 'Electric Guitar', price: 79, image: 'assets/products/guitar.png'),
];

List<Product> addedItemsList = [];

// Read-Only provider
// En basit yapıdaki provider türü, consumer olan widgeta read only veri sağlar

// #1
final productsProvider = Provider((ref) {
  return allProducts;
});

// #2
final reducedProductProvider = Provider((ref) {
  // List<Product> reducedProduct = [];
  // for (var product in allProducts) {
  //   if (product.price < 50) {
  //     reducedProduct.add(product);
  //   }
  // }
  // return reducedProduct;

  // Yukarıda ki kodun aynısını yapan farklı bir notasyon
  return allProducts.where((p) => p.price < 50).toList();
});

// GENERATED PROVİDERS

// #1.1
// Bu @riverpod bidirimi rivepoda kod generator ile provider generate etmek istediğimizi söylüyor.
// Generator çağırıldığında bizim için productsProvider şeklinde bir provider oluşturur.
@riverpod
List<Product> products(ref) {
  return allProducts;
}
