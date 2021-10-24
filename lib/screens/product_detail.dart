import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/models/product.dart';
import 'package:supabase_store/providers/product_provider.dart';
import 'package:supabase_store/widgets/add_cart_bottom.dart';
import 'package:supabase_store/widgets/colors_button_selector.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product-detail";
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    final Product product = context.read<ProductProvider>().findById(productId);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            product.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        product.img,
                        height: 240,
                        width: 240,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(product.category,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(fontSize: 16)),
                              const ColorsButtonSelector()
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 35),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25)),
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
                          child: Text("S/. ${product.price.toStringAsFixed(2)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(fontSize: 24)),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        product.description,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    const Spacer(),
                    AddToCartBottom(productId: productId)
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
