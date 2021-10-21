import 'package:flutter/material.dart';
import 'package:supabase_store/models/product.dart';
import 'package:supabase_store/widgets/product_item.dart';

class ProductOverviewScreeen extends StatelessWidget {
  ProductOverviewScreeen({Key? key}) : super(key: key);
  final List<Product> productList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Product List"),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (ctx, i) => ProductItem(
                product: productList[i],
              )),
    );
  }
}
