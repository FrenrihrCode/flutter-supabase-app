import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_store/providers/product_provider.dart';
import 'package:supabase_store/screens/product_detail.dart';
import 'package:supabase_store/screens/products_overview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: MaterialApp(
        title: 'shopApp',
        theme: ThemeData(
          splashColor: const Color(0xffcdb4db),
          colorScheme: const ColorScheme(
              primary: Color(0xffcdb4db),
              primaryVariant: Color(0xffffafcc),
              secondary: Color(0xffbde0fe),
              secondaryVariant: Color(0xffa2d2ff),
              error: Color(0xffb00020),
              background: Colors.white,
              surface: Colors.white,
              brightness: Brightness.light,
              onPrimary: Colors.black,
              onSecondary: Colors.black,
              onBackground: Colors.black,
              onSurface: Colors.black,
              onError: Colors.white),
          cardColor: const Color(0xffe9e9e9),
        ),
        home: const ProductOverviewScreeen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen()
        },
      ),
    );
  }
}
