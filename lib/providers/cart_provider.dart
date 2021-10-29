import 'package:flutter/material.dart';

class CartItem {
  final int productId;
  final String name;
  final double pricePerProduct;
  final int quantity;
  final String img;

  CartItem(
      {required this.productId,
      required this.name,
      required this.pricePerProduct,
      required this.quantity,
      required this.img});
}

class CartProvider with ChangeNotifier {
  final Map<int, CartItem> _cart = {};

  Map<int, CartItem> get cart {
    return {..._cart};
  }

  int get itemCount {
    int count = 0;
    _cart.forEach((key, value) {
      count += value.quantity;
    });
    return count;
  }

  void addItemToCart(
      int productId, String name, double price, int quantity, String img) {
    if (_cart.containsKey(productId)) {
      _cart.update(
          productId,
          (value) => CartItem(
              productId: value.productId,
              name: value.name,
              pricePerProduct: value.pricePerProduct,
              quantity: value.quantity + quantity,
              img: value.img));
    } else {
      _cart.putIfAbsent(
          productId,
          () => CartItem(
              productId: productId,
              name: name,
              pricePerProduct: price,
              quantity: quantity,
              img: img));
    }
    notifyListeners();
  }

  void updateQuantity(int productId, int quantity) {
    _cart.update(
        productId,
        (value) => CartItem(
            productId: value.productId,
            name: value.name,
            pricePerProduct: value.pricePerProduct,
            quantity: quantity,
            img: value.img));
    notifyListeners();
  }

  void removeItem(int productId) {
    _cart.remove(productId);
    notifyListeners();
  }
}
