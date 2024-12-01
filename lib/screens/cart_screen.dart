import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text('Your cart is empty.'),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartItems[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        cartController.removeFromCart(product);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
