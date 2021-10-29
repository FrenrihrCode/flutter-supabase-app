import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/providers/cart_provider.dart';
import 'package:supabase_store/widgets/cart_item.dart';

class CartDetailScreen extends StatelessWidget {
  static const String routeName = "/cart";
  const CartDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<CartItem> cart = context.watch<CartProvider>().cart.values.toList();

    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              text: 'Lista de ',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontWeight: FontWeight.normal),
              children: <TextSpan>[
                TextSpan(
                  text: 'pedidos',
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
        ),
        body: cart.isNotEmpty
            ? ListView.builder(
                itemCount: cart.length,
                itemBuilder: (ctx, i) => CartItemWidget(item: cart[i]))
            : const Card(
                child: Text("Tú lista de pedidos esta vacía."),
              ));
  }
}
