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
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              const BoxShadow(
                color: Colors.white,
                blurRadius: 7.5,
                offset: Offset(-2, -2),
              ),
              BoxShadow(
                color: Theme.of(context).cardColor,
                blurRadius: 7.5,
                offset: const Offset(2, 2),
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
              fit: BoxFit.contain,
            ),
          )),
      footer: GridTileBar(
        backgroundColor: Colors.transparent,
        title: Text(
          product.name,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        subtitle: Text(
          "S/. ${product.price.toStringAsFixed(2)}",
          textAlign: TextAlign.start,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          color: Theme.of(context).colorScheme.secondaryVariant,
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => {},
        ),
      ),
    );
  }
}
