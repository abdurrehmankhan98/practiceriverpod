import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  //initilize value
  @override
  Set<Product> build() {
    return const {
      Product(
          id: '4',
          title: 'red Backpack',
          image: 'assets/products/backpack.png',
          price: 40),
    };
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id !=product.id).toSet();
    }
  }

  //methods too update state
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
