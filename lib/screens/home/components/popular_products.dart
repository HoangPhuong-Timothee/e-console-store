import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/models/product_model.dart';
import 'package:e_console_store/models/products.dart';
import 'package:e_console_store/screens/details/details_screen.dart';
import 'package:e_console_store/screens/favorite/components/product_card.dart';
import 'package:e_console_store/screens/home/components/section_title.dart';
import 'package:e_console_store/screens/product/popular_screen.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular",
            pressSeeAll: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopularScreen(),
                  ));
            },
          ),
        ),
        FutureBuilder<List<Product>>(
          future: Products.getProductsHot(),
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
      ],
    );
  }

  Widget buildproduct(List<Product> list) {
    return SizedBox(
        height: 180,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: defaultPadding),
            child: ProductCard(
              title: list[index].name,
              image: list[index].image[0],
              price: list[index].price,
              bgColor: bgColor,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(product: list[index]),
                    ));
              },
            ),
          ),
        ));
  }
}
