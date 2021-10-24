import 'package:flutter/material.dart';
import 'package:supabase_store/widgets/product_list.dart';
import 'package:supabase_store/widgets/products_carousel.dart';

enum MenuOptions { filter, shop, other }

class ProductOverviewScreeen extends StatelessWidget {
  const ProductOverviewScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              text: 'Nuestros ',
              style: Theme.of(context).textTheme.headline1,
              children: <TextSpan>[
                TextSpan(
                    text: 'productos',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          actions: [
            PopupMenuButton(
              color: Theme.of(context).colorScheme.background,
              onSelected: (MenuOptions value) => {},
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
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductsCarousel(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.only(bottom: 2.5),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                color: Theme.of(context).colorScheme.background,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 5.0,
                      color: Colors.black12),
                  BoxShadow(
                      offset: Offset(-3, -3),
                      blurRadius: 5.0,
                      color: Colors.white70),
                ],
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Productos ',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'recientes',
                        style: Theme.of(context).textTheme.headline1),
                  ],
                ),
              ),
            ),
            const Expanded(child: ProductList())
          ],
        )));
  }
}
