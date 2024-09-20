import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_rvrpod/providers/cart_provider.dart';
import '../../providers/products_provider.dart';
import '../../shared/cart_icon.dart';

// ConsumerWidget => sadece StatelessWidget için
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // read provider data, watch provider data for changes
    // get the updated data, refresh the provider state
    // watch metodu 1 kez okur ve değişiklikleri izlemeye başlar, data değişirse build metodunu tetikler ve state güncellenmiş olur
    // read 1 kez okur ve çağırılmadığı sürece tekrar çalışmaz

    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(allProducts[index].image, width: 60, height: 60),
                  Text(allProducts[index].title),
                  Text("\$ ${allProducts[index].price}"),
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref.read(cartNotifierProvider.notifier).removeProduct(allProducts[index]);
                      },
                      child: Text('Remove'),
                    ),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref.read(cartNotifierProvider.notifier).addProduct(allProducts[index]);
                      },
                      child: Text('Add'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
