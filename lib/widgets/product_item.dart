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
          padding: const EdgeInsets.only(bottom: 70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).colorScheme.background,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(3, 3), blurRadius: 5.0, color: Colors.black12),
              BoxShadow(
                  offset: Offset(-3, -3),
                  blurRadius: 5.0,
                  color: Colors.white70),
            ],
          ),
          child: GestureDetector(
            onTap: () => {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id)
            },
            child: Image.network(
              product.img,
              fit: BoxFit.contain,
            ),
          )),
      footer: GridTileBar(
        backgroundColor: Colors.transparent,
        title: Text(
          product.name,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline2,
        ),
        subtitle: Text("S/. ${product.price.toStringAsFixed(2)}",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline1),
        trailing: IconButton(
          color: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => {},
        ),
      ),
    );
  }
}
