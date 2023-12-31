import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/models/product_model.dart';
import 'package:e_console_store/models/products.dart';
import 'package:e_console_store/screens/details/details_screen.dart';
import 'package:e_console_store/screens/favorite/components/product_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder<List<Product>>(
        future: Products.getFavoriteProducts(),
        builder: (context, snapshot) {
          final List<Product>? examQuestions = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Center(child: Text(snapshot.error.toString()));
              else if (examQuestions != null)
                return buildproduct(examQuestions);
              else
                return Text("null");
          }
        },
      ),
    ]);
  }

  Widget buildproduct(List<Product> list) {
    return SizedBox(
        height: 180,
        width: double.infinity,
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
