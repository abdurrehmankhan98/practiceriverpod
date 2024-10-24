import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: allProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blueGrey.withOpacity(0.05),
                child: Column(children: [
                  Image.asset(
                    allProducts[index].image,
                    width: 60,
                    height: 60,
                  ),
                  Text(allProducts[index].title),
                  Text('${allProducts[index].price}'),
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeProduct(allProducts[index]);
                                 print(" jb remove hoti h allProducts[index]===== ${allProducts[index].title}");
                                    print(" jb remove hoti h allProducts[index]===== ${allProducts[index].price}");
                                       print(" jb remove hoti h allProducts[index]===== ${allProducts[index].id}");
                        },
                        child: Text("Remove")),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProduct(allProducts[index]);
                          print(
                              "cartNotifierProvider.notifier=== ${cartNotifierProvider.notifier}");
                          print("allProducts[index]== ${allProducts[index].title}");
                        },
                        child: Text("Add to Cart")),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
