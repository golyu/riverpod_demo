import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});
}

final _products = [
  Product(name: "iPhone", price: 999),
  Product(name: "iPad", price: 2),
  Product(name: "MacBook", price: 3),
];

final productsProvider = Provider<List<Product>>((ref) => _products);

class ProductWidget extends ConsumerWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("${product.price} \$"),
          );
        },
      ),
    );
  }
}

void demo9() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: ProductWidget(),
        ),
      ),
    ),
  );
}
