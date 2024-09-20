import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_rvrpod/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  // Statelessta verdiğimiz WidgetRef ref parametresini burada vermemize gerek yok
  @override
  Widget build(BuildContext context) {
    //final cartProducts = ref.watch(reducedProductProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(
          children: cartProducts.map((product) {
            return Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Image.asset(product.image, width: 60, height: 60,),
                  const SizedBox(width: 10),
                  Text("${product.title}..."),
                  const Expanded(child: SizedBox()),
                  Text('\$ ${product.price}'),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
