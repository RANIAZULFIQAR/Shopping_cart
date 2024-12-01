import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  // Observable list for cart items
  var cartItems = <Product>[].obs;

  // Add product to cart
  void addToCart(Product product) {
    cartItems.add(product);
  }

  // Remove product from cart
  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  // Get total price of items in the cart
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}
