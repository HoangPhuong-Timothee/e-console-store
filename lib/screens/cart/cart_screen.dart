import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/screens/cart/components/body.dart';
import 'package:e_console_store/screens/cart/components/check_out_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: primaryColor,
            size: 30.0,
          ),
          onPressed: null,
        ),
      ],
    );
  }
}
