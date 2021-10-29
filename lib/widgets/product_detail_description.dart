import 'package:flutter/material.dart';
import 'package:supabase_store/widgets/colors_button_selector.dart';

class ProductDetailDescription extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  const ProductDetailDescription(
      {Key? key,
      required this.category,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(category,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 16)),
              const ColorsButtonSelector()
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-1, 5),
                  blurRadius: 5.0,
                  color: Colors.black12),
              BoxShadow(
                  offset: Offset(-5, -5),
                  blurRadius: 5.0,
                  color: Colors.white70),
            ],
          ),
          child: Text("S/. ${price.toStringAsFixed(2)}",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 24)),
        )
      ],
    );
  }
}
