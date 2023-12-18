import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/models/product_model.dart';
import 'package:e_console_store/models/products.dart';
import 'package:e_console_store/screens/cart/cart_screen.dart';
import 'package:e_console_store/screens/details/details_screen.dart';
import 'package:e_console_store/screens/favorite/components/product_card.dart';
import 'package:e_console_store/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.searchName}) : super(key: key);
  final String searchName;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> productSearchList = [];

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
            widget.searchName,
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
            FutureBuilder<List<Product>>(
              future: Products.getProducts(),
              builder: (context, snapshot) {
                final List<Product>? examQuestions = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError)
                      return Center(child: Text(snapshot.error.toString()));
                    else if (examQuestions != null) {
                      productSearchList.clear();
                      for (int i = 0; i < examQuestions.length; i++) {
                        if (widget.searchName.toLowerCase() ==
                            examQuestions[i].name.toLowerCase()) {
                          productSearchList.add(examQuestions[i]);
                        } else if (examQuestions[i]
                            .name
                            .toLowerCase()
                            .contains(widget.searchName.toLowerCase())) {
                          productSearchList.add(examQuestions[i]);
                        }
                      }
                      return buildproduct(productSearchList);
                    } else
                      return Text("null");
                }
              },
            ),
          ],
        ));
  }

  Widget buildproduct(List<Product> list) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(color: barColor),
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                list.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: ProductCard(
                    title: list[index].name,
                    image: list[index].image[0],
                    price: list[index].price,
                    bgColor: bgColor,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(product: list[index]),
                          ));
                    },
                  ),
                ),
              ),
            )));
  }
}
