import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
 ProductListScreen({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(id: 1, name: 'Utensils', price: 800.0),
    Product(id: 2, name: 'iphone', price: 500.0),
    Product(id: 3, name: 'Cosmetics', price: 100.0),
  ];


  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Product List',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => const CartScreen());
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar(
                  'Added to Cart',
                  '${product.name} added to cart!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}
