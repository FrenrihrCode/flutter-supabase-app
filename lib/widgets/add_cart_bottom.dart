import 'package:flutter/material.dart';

class AddToCartBottom extends StatelessWidget {
  final int productId;
  const AddToCartBottom({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-5, -5),
                    blurRadius: 5.0,
                    color: Colors.black12),
                BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 5.0,
                    color: Colors.white70),
              ],
            ),
            child: TextButton(
              onPressed: () => {},
              child: Text(
                "+ Añadir al carrito",
                style: Theme.of(context).textTheme.button,
              ),
            )),
        Positioned(
          top: -35,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.elliptical(15, 15)),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(-2, 2),
                    blurRadius: 5.0,
                    color: Colors.black12),
                BoxShadow(
                    offset: Offset(2, -2),
                    blurRadius: 5.0,
                    color: Colors.white70),
              ],
            ),
            child: IconButton(
                onPressed: () => {},
                iconSize: 36,
                padding: const EdgeInsets.all(12),
                color: Theme.of(context).colorScheme.background,
                icon: const Icon(Icons.shopping_cart)),
          ),
        )
      ],
    );
  }
}
