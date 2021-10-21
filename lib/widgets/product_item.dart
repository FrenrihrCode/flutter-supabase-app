import 'package:flutter/material.dart';
import 'package:supabase_store/models/product.dart';
import 'package:supabase_store/screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.5, 2.5), // shadow direction: bottom right
                )
              ],
            ),
            child: GestureDetector(
              onTap: () => {
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                    arguments: product.id)
              },
              child: Image.network(
                product.img,
                fit: BoxFit.cover,
              ),
            )),
        footer: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.name,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              color: Theme.of(context).colorScheme.primaryVariant,
              icon: const Icon(Icons.favorite),
              onPressed: () => {},
            ),
            trailing: IconButton(
              color: Theme.of(context).colorScheme.secondaryVariant,
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => {},
            ),
          ),
        ));
  }
}
