import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/models/product.dart';
import 'package:supabase_store/providers/product_provider.dart';
import 'package:supabase_store/widgets/product_item.dart';

class ProductsCarousel extends StatelessWidget {
  const ProductsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> productList = context.watch<ProductProvider>().products;

    return CarouselSlider.builder(
        options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 2 / 1.5,
            viewportFraction: 0.55,
            height: 250),
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ProductItem(product: productList[itemIndex]),
            ));
  }
}
