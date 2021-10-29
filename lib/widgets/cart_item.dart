import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  const CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.productId),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) =>
          {context.read<CartProvider>().removeItem(item.productId)},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Theme.of(context).colorScheme.background,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: Image.network(item.img),
            title: Text(
              item.name,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 17.25),
            ),
            subtitle: Text(
                "${item.quantity} ${(item.quantity > 1 ? 'unidades' : 'unidad')}."),
            trailing: Text(
              "S/. ${(item.pricePerProduct * item.quantity).toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
