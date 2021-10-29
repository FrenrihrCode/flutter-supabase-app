import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/models/product.dart';
import 'package:supabase_store/providers/product_provider.dart';
import 'package:supabase_store/widgets/add_cart_bottom.dart';
import 'package:supabase_store/widgets/product_detail_description.dart';

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
                    ProductDetailDescription(
                        category: product.category,
                        name: product.name,
                        price: product.price),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        product.description,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    const Spacer(),
                    AddToCartBottom(
                      productId: product.id,
                      name: product.name,
                      price: product.price,
                      img: product.img,
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
