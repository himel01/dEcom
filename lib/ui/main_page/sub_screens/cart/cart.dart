import 'package:demo_ecom/ui/main_page/sub_screens/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Consumer<CartProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Colors.yellow,
            body: Container(),
          );
        },
      ),
    );
  }
}
