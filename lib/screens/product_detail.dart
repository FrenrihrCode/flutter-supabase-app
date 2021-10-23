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
    final Product product = context.read<ProductProvider>().findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.img,
              height: 240,
              width: 240,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  children: [Text(product.name), Text(product.category)],
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25)),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 2.5,
                        offset: Offset(2, -2),
                      ),
                      BoxShadow(
                        color: Theme.of(context).cardColor,
                        blurRadius: 2.5,
                        offset: const Offset(-2, 2),
                      )
                    ],
                  ),
                  child: Text("S/. ${product.price.toStringAsFixed(2)}"),
                )
              ],
            ),
            Text(product.description),
            Container(
              color: Colors.grey,
              child: Stack(
                children: [
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(Icons.shopping_cart)),
                  const Text("+ Añadir al carrito")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
