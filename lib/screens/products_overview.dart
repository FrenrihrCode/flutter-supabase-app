import 'package:flutter/material.dart';
import 'package:supabase_store/widgets/product_list.dart';

enum MenuOptions { filter, shop, other }

class ProductOverviewScreeen extends StatelessWidget {
  const ProductOverviewScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Product List"),
          actions: [
            PopupMenuButton(
              onSelected: (MenuOptions value) => {print(value)},
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text("Filters"),
                  value: MenuOptions.filter,
                ),
                const PopupMenuItem(
                  child: Text("Shopping"),
                  value: MenuOptions.shop,
                ),
                const PopupMenuItem(
                  child: Text("Other"),
                  value: MenuOptions.other,
                ),
              ],
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        body: const ProductList());
  }
}
