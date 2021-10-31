import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/providers/product_provider.dart';

class CategoriesButtons extends StatelessWidget {
  const CategoriesButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextButton(
            onPressed: () =>
                {context.read<ProductProvider>().changeCategory("test")},
            child: const Text("test")),
        TextButton(
            onPressed: () =>
                {context.read<ProductProvider>().changeCategory("lana")},
            child: const Text("lana")),
      ],
    );
  }
}
