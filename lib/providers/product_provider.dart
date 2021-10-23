import 'package:flutter/material.dart';
import 'package:supabase_store/models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
        id: 1,
        name: "Product 1",
        description: "Description of Product 1",
        category: "test",
        price: 90,
        available: true,
        img:
            "https://cdn0.iconfinder.com/data/icons/business-and-finance-31/244/icon-208-512.png"),
    Product(
        id: 2,
        name: "Product 2",
        description: "Description of Product 2",
        category: "test",
        price: 12.5,
        available: true,
        img:
            "https://cdn0.iconfinder.com/data/icons/business-and-finance-31/244/icon-208-512.png"),
    Product(
        id: 3,
        name: "Product 3",
        description: "Description of Product 3",
        category: "test",
        price: 73.235,
        available: true,
        img:
            "https://cdn0.iconfinder.com/data/icons/business-and-finance-31/244/icon-208-512.png"),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product findById(int id) {
    return _products.firstWhere((element) => element.id == id);
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
