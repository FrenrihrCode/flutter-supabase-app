import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/models/product.dart';
import 'package:supabase_store/providers/product_provider.dart';
import 'package:supabase_store/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> productList = context.watch<ProductProvider>().products;

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ProductItem(
              product: productList[i],
            ));
  }
}
