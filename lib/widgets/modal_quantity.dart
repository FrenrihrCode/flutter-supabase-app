import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/providers/cart_provider.dart';
import 'package:supabase_store/widgets/numeric_stepper.dart';

class ModalQuantity extends StatefulWidget {
  final int productId;
  final String name;
  final double price;
  final String img;
  const ModalQuantity({
    Key? key,
    required this.productId,
    required this.name,
    required this.price,
    required this.img,
  }) : super(key: key);

  @override
  State<ModalQuantity> createState() => _ModalQuantityState();
}

class _ModalQuantityState extends State<ModalQuantity> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            "Estás solicitando: ${widget.name}",
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 10),
          Text(
            "Ingrese una cantidad",
            style: Theme.of(context).textTheme.headline2,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: NumericSetepper(
                onChanged: (value) {
                  quantity = value;
                },
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<CartProvider>().addItemToCart(widget.productId,
                    widget.name, widget.price, quantity, widget.img);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Producto añadido a tu lista de pedidos.")));
              },
              child: const Text("Añadir al carrito")),
          const SizedBox(height: 20),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
        ],
      ),
    );
  }
}
