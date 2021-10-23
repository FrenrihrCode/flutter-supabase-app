import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final double pricePerProduct;
  final int quantity;

  CartItem(
      {required this.id,
      required this.name,
      required this.pricePerProduct,
      required this.quantity});
}

class Cart with ChangeNotifier {
  final Map<int, CartItem> _cart = {};

  Map<int, CartItem> get cart {
    return {..._cart};
  }

  void addItemToCart(int productId, String name, double price, int quantity) {
    if (_cart.containsKey(productId)) {
      _cart.update(
          productId,
          (value) => CartItem(
              id: value.id,
              name: value.name,
              pricePerProduct: value.pricePerProduct,
              quantity: quantity));
    } else {
      _cart.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              name: name,
              pricePerProduct: price,
              quantity: quantity));
    }
  }
}
