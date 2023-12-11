import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/screens/cart/cart_screen.dart';
import 'package:e_console_store/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ControllerAndAcessoryScreen extends StatefulWidget {
  const ControllerAndAcessoryScreen({super.key});

  @override
  State<ControllerAndAcessoryScreen> createState() =>
      _ControllerAndAcessoryScreenState();
}

class _ControllerAndAcessoryScreenState
    extends State<ControllerAndAcessoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: barColor,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Center(
              child: Text(
            'Controller & Accessory',
            textAlign: TextAlign.center,
            style: TextStyle(color: primaryColor),
          )),
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: iconColor,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            //logic here
          ],
        ));
  }
}
