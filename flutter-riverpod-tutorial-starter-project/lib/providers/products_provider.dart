import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'jeans',
    price: 50,
    image: 'assets/products/backpack.png',
  ),
  Product(
    id: '2',
    title: 'shorts',
    price: 60,
    image: 'assets/products/jeans.png',
  ),
  Product(
    id: '3',
    title: 'karati',
    price: 40,
    image: 'assets/products/guitar.png',
  ),
  Product(
    id: '4',
    title: 'guitar',
    price: 10,
    image: 'assets/products/skates.png',
  ),
  Product(
    id: '5',
    title: 'drum',
    price: 20,
    image: 'assets/products/drum.png',
  ),
  Product(
    id: '6',
    title: 'suitcase',
    price: 30,
    image: 'assets/products/shorts.png',
  ),
  Product(
    id: '7',
    title: 'suitcase',
    price: 30,
    image: 'assets/products/shorts.png',
  ),
  Product(
    id: '8',
    title: 'suitcase',
    price: 30,
    image: 'assets/products/shorts.png',
  ),
];

final productsProvider = Provider((ref) {
  return allProducts;
});

final reducedProductProvider = Provider((ref) {
  // ignore: non_constant_identifier_names
  return allProducts.where((Products) => Products.price < 50).toList();
});


//Future<List<Product>> fetchProducts() async {
// final response = wait http.get(Uri.parse());
// if(response.json== 200){}
//
//}