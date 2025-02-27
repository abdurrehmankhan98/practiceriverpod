import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';


class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    // final cartProducts = ref.watch(reducedProductProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: cartProducts.map((Product) {
                    return Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Image.asset(Product.image, width: 60, height: 60),
                          SizedBox(width: 10),
                          Text("${Product.title}"),
                          Expanded(child: SizedBox()),
                          Text("${Product.price}"),
                         
                        ],
                      ),
                    );
                  }).toList(),
                )
              ], // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
