import 'package:flutter/material.dart';
import 'package:supabase_store/widgets/product_list.dart';

class ProductOverviewScreeen extends StatelessWidget {
  const ProductOverviewScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Product List"),
        ),
        body: const ProductList());
  }
}
