import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/models/product.dart';
import 'package:supabase_store/providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product-detail";
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    final Product product = context
        .watch<ProductProvider>()
        .products
        .firstWhere((product) => product.id == productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
    );
  }
}
