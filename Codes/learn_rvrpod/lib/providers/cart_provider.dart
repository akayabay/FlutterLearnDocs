import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_rvrpod/models/product.dart';

// List yerine seti kullanmamızın sebebi aynı productların birden fazla kez olmasını engellemek
class CartNotifier extends Notifier<Set<Product>> {
  // initial value
  @override
  Set<Product> build() {
    return {};
  }

  // methods to uptdate state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(
  () {
    return CartNotifier();
  },
);
