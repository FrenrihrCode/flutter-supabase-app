import 'package:flutter/material.dart';
import 'package:supabase_store/models/product.dart';

class ProductProvider with ChangeNotifier {
  String _currentCategory = "test";
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
    Product(
        id: 4,
        name: "Product 4",
        description: "Description of Product 4",
        category: "lana",
        price: 73.25,
        available: true,
        img:
            "https://cdn0.iconfinder.com/data/icons/business-and-finance-31/244/icon-208-512.png"),
    Product(
        id: 5,
        name: "Product 5",
        description: "Description of Product 5",
        category: "lana",
        price: 7.35,
        available: true,
        img:
            "https://cdn0.iconfinder.com/data/icons/business-and-finance-31/244/icon-208-512.png"),
  ];

  List<Product> get products {
    var productsFromCategory =
        _products.where((product) => product.category == _currentCategory);
    return [...productsFromCategory];
  }

  String get categorySelected {
    return _currentCategory;
  }

  Product findById(int id) {
    return _products.firstWhere((element) => element.id == id);
  }

  void changeCategory(String newCategory) {
    _currentCategory = newCategory;
    notifyListeners();
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
